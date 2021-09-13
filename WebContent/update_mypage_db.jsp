<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 DB_update</title>
</head>
<body>		
	<%
		String id_chk = (String)session.getAttribute("id");
		ArrayList<Signup_DTO> arr = new ArrayList<Signup_DTO>();
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","1234");
			if(conn == null) {
				throw new Exception("project 데이터베이스로 연결할 수 없습니다.<br>");
			}
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from signup where id='"+id_chk +"';");
			if(rs.next()) {
				Signup_DTO dto = new Signup_DTO();
				
				String id = rs.getString("id");
				String sign_pw = rs.getString("sign_pw");
				String sign_name = rs.getString("sign_name");
				String sign_tell = rs.getString("sign_tell");
				String sign_email = rs.getString("sign_email");
				String sign_addr = rs.getString("sign_addr");
				String sign_birth = rs.getString("sign_birth");
				
				dto.setId(id);
				dto.setSign_pw(sign_pw);
				dto.setSign_name(sign_name);
				dto.setSign_tell(sign_tell);
				dto.setSign_email(sign_email);
				dto.setSign_addr(sign_addr);
				dto.setSign_birth(sign_birth);
				arr.add(dto);
			}
			
			request.setAttribute("arr", arr);		
		}
		catch(Exception yee) {
			System.out.println(yee);
		}
		finally {
			try{
				stmt.close();
			}
			catch(Exception yee){
				
			}
			try {
				conn.close();
			}
			catch(Exception yee){
				
			}
		}	

	%>
	<% 
		ArrayList<Signup_DTO> arr2 = new ArrayList<Signup_DTO>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8", "root", "1234"); 
			stmt = conn.createStatement(); 
			ResultSet rs = stmt.executeQuery("select sign_tell,sign_email from signup");	
			while(rs.next()) { 
				Signup_DTO dto = new Signup_DTO();
				
				String tell = rs.getString("sign_tell");
				String email = rs.getString("sign_email");
				dto.setSign_tell(tell);
				dto.setSign_email(email);
				
				arr2.add(dto);
			}
			request.setAttribute("arr2", arr2);
		}
		catch(Exception a) {
			System.out.println(a);
		}
		finally {
			try {
				if(stmt!=null) {
					stmt.close();		
				}
			}
			catch (Exception e) {
				System.out.println("st close 실패");
			}
			try {
				if(conn!=null) {		
					conn.close();	
				}
			}
			catch (Exception e) {
				System.out.println("conn close 실패");
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("update_mypage_interface.jsp");
		dispatcher.forward(request,response);
	%>

</body>
</html>