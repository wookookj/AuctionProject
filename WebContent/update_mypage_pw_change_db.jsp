<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호수정 DB_update</title>
</head>
<body>		
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getParameter("id");
		String sign_pw = (String)request.getParameter("passwd");
		
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
			String command = "update signup set sign_pw ='"+sign_pw+"' where id ='"+id+"';";
			int rowNum = stmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}	
			response.sendRedirect("update_mypage_success.jsp");
		}
		catch(Exception yee) {
			response.sendRedirect("nologin.jsp");
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
</body>
</html>