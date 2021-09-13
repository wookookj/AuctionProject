package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.BoardBean;
import vo.BoardDatBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from MVC_board");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public int selectDatList(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int selectcount = 0;
		String board_list_sql="select count(*) from mvc_board_dat d,mvc_board m where d.board_num=m.board_num and m.board_num=?;";

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if(rs.next()){
				selectcount = rs.getInt("count(*)");
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return selectcount;
	}
	public ArrayList<BoardBean> selectArticleList(int page,int limit){
		PreparedStatement pstmt = null; ResultSet rs = null; BoardBean board = null;
		String board_list_sql="select * from MVC_board order by BOARD_RE_REF desc,BOARD_RE_SEQ asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();	
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();
				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else { board.setBOARD_DATE(rs.getDate("board_date")+""); }			
				articleList.add(board);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	public int insertArticle(BoardBean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(board_num) from mvc_board");
			rs = pstmt.executeQuery();
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into mvc_board values(?,?,?,?,?,?,?,?,?,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_ID());
			pstmt.setString(3, article.getBOARD_TITLE());
			pstmt.setString(4, article.getBOARD_CONTENT());
			pstmt.setString(5, article.getBOARD_FILE());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
	
	public int updateReadCount(int board_num){
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update mvc_board set board_hits = "+
				"board_hits+1 where board_num = "+board_num;
		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}
		return updateCount;
	}	
	
	public BoardBean selectArticle(int board_num){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = new BoardBean();

		try{
			pstmt = con.prepareStatement(
					"select * from mvc_board where board_num = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				boardBean.setBOARD_NUM(rs.getInt("board_num"));
				boardBean.setBOARD_ID(rs.getString("board_id"));
				boardBean.setBOARD_TITLE(rs.getString("board_title"));
				boardBean.setBOARD_CONTENT(rs.getString("board_content"));
				boardBean.setBOARD_FILE(rs.getString("board_file"));
				boardBean.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				boardBean.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				boardBean.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				boardBean.setBOARD_READCOUNT(rs.getInt("board_hits"));
				boardBean.setBOARD_DATE(rs.getDate("board_date")+"");
			}
			
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return boardBean;
	}

	public int deleteArticle(int board_num){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from mvc_board where board_num=? or board_re_ref=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 실패 : "+ex);
		}	finally{
			close(pstmt);
		}
		return deleteCount;

	}
	public int boarddatdelete(int board_num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String board_delete_sql="delete from mvc_board_dat where board_num=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 실패 : "+ex);
		}	finally{
			close(pstmt);
		}
		return deleteCount;
	}
	public int boarddatupdate(BoardDatBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update mvc_board_dat set dat_content=? where dat_num=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getDat_content());
			pstmt.setInt(2, article.getDat_num());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}

		return updateCount;
	}
	public int updateArticle(BoardBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update mvc_board set board_title=?,board_content=?,board_file=? where board_num=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_TITLE());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setString(3, article.getBOARD_FILE());
			pstmt.setInt(4, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	
	public int insertReplyArticle(BoardBean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="select max(board_num) from mvc_board";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getBOARD_RE_REF();
		int re_lev=article.getBOARD_RE_LEV();
		int re_seq=article.getBOARD_RE_SEQ();

		try{
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else num=1;
			sql="update mvc_board set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
			sql+="and BOARD_RE_SEQ>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="insert into mvc_board values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_ID());
			pstmt.setString(3, article.getBOARD_TITLE());
			pstmt.setString(4, article.getBOARD_CONTENT());
			pstmt.setString(5, article.getBOARD_FILE());
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			pstmt.setInt(9, 0);
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public ArrayList<BoardBean> selectSearchId(int page, int limit, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board where board_id like '%" + search  + "%' order by BOARD_RE_REF desc,BOARD_RE_SEQ asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();
				
				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	public int selectSearchId(String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount= 0;
		String board_list_sql="select count(*) from MVC_board where board_id like '%" + search  + "%'";	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<BoardBean> selectSearchTitle(int page, int limit, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board where board_title like '%" + search  + "%' order by BOARD_RE_REF desc,BOARD_RE_SEQ asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public int selectSearchTitle(String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount= 0;
		String board_list_sql="select count(*) from MVC_board where board_title like '%" + search  + "%'";	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<BoardBean> selectSearchNum(int page, int limit, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board where board_num=? order by BOARD_RE_REF desc,BOARD_RE_SEQ asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public ArrayList<BoardBean> selectSearchContent(int page, int limit, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board where board_content like '%" + search  +"%' order by BOARD_RE_REF desc,BOARD_RE_SEQ asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	public int selectSearchContent(String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount= 0;
		String board_list_sql="select count(*) from MVC_board where board_content like '%" + search  + "%'";	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}


	public ArrayList<BoardBean> selectArrHitsdesc(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board order by board_hits desc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public ArrayList<BoardBean> selectArrHitsasc(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board order by board_hits asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public ArrayList<BoardBean> selectArrNumdesc(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board order by board_num desc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public ArrayList<BoardBean> selectArrNumasc(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board order by board_num asc limit ?,15";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*15; 	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_DAT_COUNT(selectDatList(board.getBOARD_NUM()));
				board.setBOARD_ID(rs.getString("board_id"));
				board.setBOARD_TITLE(rs.getString("board_title"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_hits"));
				LocalDate date = LocalDate.now();

				if(rs.getDate("board_date").toString().equals(date.toString())) {		
					if(rs.getTime("board_date").getHours() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					else if(rs.getTime("board_date").getMinutes() < 10){
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
					else {
						board.setBOARD_DATE(rs.getTime("board_date").getHours()+":"+rs.getTime("board_date").getMinutes());
					}
					
					if(rs.getTime("board_date").getHours() < 10 && rs.getTime("board_date").getMinutes() < 10) {
						board.setBOARD_DATE("0"+rs.getTime("board_date").getHours()+":0"+rs.getTime("board_date").getMinutes());
					}
				}
				else {
					board.setBOARD_DATE(rs.getDate("board_date")+"");
				}
			
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	public int boarddat_insertArticle(BoardDatBean boardBean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(dat_num) from mvc_board_dat");
			rs = pstmt.executeQuery();
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into mvc_board_dat values(?,?,?,?,?,?,?,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, boardBean.getBoard_num());
			pstmt.setString(3, boardBean.getDat_id());
			pstmt.setString(4, boardBean.getDat_content());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	public ArrayList<BoardDatBean> boarddat_selectArticle(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from MVC_board_dat where board_num =? order by dat_re_ref desc,dat_re_seq asc ";
		ArrayList<BoardDatBean> articleList = new ArrayList<BoardDatBean>();
		BoardDatBean board = null;
		
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardDatBean();
				board.setDat_num(rs.getInt("dat_num"));
				board.setBoard_num(rs.getInt("board_num"));
				board.setDat_id(rs.getString("dat_id"));
				board.setDat_content(rs.getString("dat_content"));
				board.setDat_re_ref(rs.getInt("dat_re_ref"));
				board.setDat_re_lev(rs.getInt("dat_re_lev"));
				board.setDat_re_seq(rs.getInt("dat_re_seq"));
	
					if(rs.getTime("dat_date").getHours() < 10) {
						board.setDat_date(rs.getDate("dat_date") + " 0"+rs.getTime("dat_date").getHours()+":"+rs.getTime("dat_date").getMinutes());
					}
					else if(rs.getTime("dat_date").getMinutes() < 10){
						board.setDat_date(rs.getDate("dat_date") + " " + rs.getTime("dat_date").getHours()+":0"+rs.getTime("dat_date").getMinutes());
					}
					else {
						board.setDat_date(rs.getDate("dat_date") + " " + rs.getTime("dat_date").getHours()+":"+rs.getTime("dat_date").getMinutes());
					}
					
					if(rs.getTime("dat_date").getHours() < 10 && rs.getTime("dat_date").getMinutes() < 10) {
						board.setDat_date(rs.getDate("dat_date") + " 0"+rs.getTime("dat_date").getHours()+":0"+rs.getTime("dat_date").getMinutes());
					}
				
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public int boarddat_deleteArticle(int dat_board_num) {
		PreparedStatement pstmt = null;
		String board_delete_sql="delete from mvc_board_dat where dat_num=? or dat_re_ref=?";
		int deleteCount=0;
		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, dat_board_num);
			pstmt.setInt(2, dat_board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 실패 : "+ex);
		}	finally{
			close(pstmt);
		}
		return deleteCount;
	}

	public int boarddat_insertReplyArticle(BoardDatBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="select max(dat_num) from mvc_board_dat";
		String sql="";
		int num=0;
		int insertCount=0;
		int re_ref=article.getDat_re_ref();
		int re_lev=article.getDat_re_lev();
		int re_seq=article.getDat_re_seq();

		try{
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else {num=1;}
			sql="update mvc_board_dat set dat_re_seq=dat_re_seq+1 where dat_re_ref=? ";
			sql+="and dat_re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev+1;
			sql="insert into mvc_board_dat values(?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, article.getBoard_num());
			pstmt.setString(3, article.getDat_id());
			pstmt.setString(4, article.getDat_content());
			pstmt.setInt(5, re_ref);
			pstmt.setInt(6, re_lev);
			pstmt.setInt(7, re_seq);
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}






















}
