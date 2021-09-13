package Action_projcet;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class Member_Board_DAO {
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project?characterEncoding=utf8";
	private static final String USER = "root";
	private static final String PASSWD = "1234";

	private Connection con = null;
	private Statement stmt = null;

	public Member_Board_DAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public void connect() {
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public ArrayList<Board_DTO> board_db_select() {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id !='admin' order by num desc");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_admin_db_select() {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id = 'admin' order by num desc");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public int board_db_insert(Board_DTO dto) {
		connect();
		int insert_result = 0;
		try {
			stmt = con.createStatement();
			String command = "insert into board values(default,'"+dto.getTitle() + "','" + dto.getMain() + "','" + dto.getId() + "','0',default);";
			insert_result = stmt.executeUpdate(command);
		} catch (SQLException e) {
		}
		disconnect();
		return insert_result;
	}
	
	public Board_DTO board_db_select_num(int num) {
		connect();
		Board_DTO dto = new Board_DTO();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select title,main,id,hits,date from board where num ='" + num + "';");	
			if(rs.next()) {
				dto.setTitle(rs.getString("title"));
				dto.setMain(rs.getString("main"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
			}
		} catch (SQLException e) {
		}
		disconnect();
		return dto;
	}
	public void board_db_update_hits(int num,int hits) {
		int hits_chk = hits++;
		connect();
		try {
			stmt = con.createStatement();
			String command = "update board set hits ='" + hits + "' where num ='" + num + "';"; 
			stmt.executeUpdate(command);
		} catch (SQLException e) {
		}
		disconnect();
	}	
	
	public int board_db_delete(int num,String id) {
		connect();
		int delete_result = 0;
		try {
			stmt = con.createStatement();
			String command = "delete from board where num='"+ num +"'and id='" + id + "'";
			delete_result = stmt.executeUpdate(command);
		} catch (SQLException e) {
		}
		disconnect();
		return delete_result;
	}
	
	public int board_db_update(Board_DTO dto) {
		connect();
		int update_result = 0;
		try {
			stmt = con.createStatement();
			String command = "update board set title='"+ dto.getTitle() +"',main='" + dto.getMain() +"' where num = '" + dto.getNum() + "';";
			update_result = stmt.executeUpdate(command);
		} catch (SQLException e) {
		}
		disconnect();
		return update_result;
	}	
	
	public int board_delete(String id) {
		connect();
		int delete_result = 0;
		try {
			stmt = con.createStatement();
			String command = "delete from board where id='"+ id +"';";
			delete_result = stmt.executeUpdate(command);
		} catch (SQLException e) {
		}
		disconnect();
		return delete_result;
	}
	
	public ArrayList<Board_DTO> board_db_search_id(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' and id like '%" + search + "%' order by num desc;");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_search_title(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' and title like '%" + search + "%' order by num desc;");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_search_num(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' and num = '" + search + "' order by num desc;");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_search_main(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' and main like '%" + search + "%' order by num desc;");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}	
	
	public ArrayList<Board_DTO> board_db_array_hitsup() {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' order by hits desc");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_array_hitsdown() {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' order by hits asc");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_array_numup() {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' order by num desc");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_array_numdown() {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id != 'admin' order by num asc");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}		

	public ArrayList<Board_DTO> board_db_search_num_admin(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where num = '" + search + "' and id='admin' order by num desc;");	
			while(rs.next()) {	
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}
	
	public ArrayList<Board_DTO> board_db_search_title_admin(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id = 'admin' and title like '%" + search + "%' order by num desc;");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}	
	
	public ArrayList<Board_DTO> board_db_search_main_admin(String search) {
		connect();
		ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board where id = 'admin' and main like '%" + search + "%' order by num desc;");	
			while(rs.next()) {
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setHits(rs.getInt("hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("date").toString().equals(date.toString())) {		
					if(rs.getTime("date").getHours() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					else if(rs.getTime("date").getMinutes() < 10){
						dto.setDate(rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
					else {
						dto.setDate(rs.getTime("date").getHours()+":"+rs.getTime("date").getMinutes());
					}
					
					if(rs.getTime("date").getHours() < 10 && rs.getTime("date").getMinutes() < 10) {
						dto.setDate("0"+rs.getTime("date").getHours()+":0"+rs.getTime("date").getMinutes());
					}
				}
				else {
					dto.setDate(rs.getDate("date")+"");
				}		
				arr.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return arr; 	
	}	
}
