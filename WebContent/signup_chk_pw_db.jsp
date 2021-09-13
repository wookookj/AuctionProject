<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기DB_select</title>
</head>
<body>		
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getParameter("id");
		String sign_tell = "0" + (String)request.getParameter("tel1") + (String)request.getParameter("tel2") + (String)request.getParameter("tel3");
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","1234");
			if(conn == null) {
				throw new Exception("project 데이터베이스로 연결할 수 없습니다.<br>");
			}
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select sign_pw from signup where id='"+id +"'and sign_tell ='" + sign_tell +"';");
			if(rs.next()) {		
				String pw_chk = rs.getString("sign_pw");
				request.setAttribute("pw_chk", pw_chk);
				request.setAttribute("id_chk", id);
				RequestDispatcher dispatcher = request.getRequestDispatcher("signup_chk_pw_result.jsp");
				dispatcher.forward(request,response);
			}
			else{
				response.sendRedirect("signup_chk_pw_fail.jsp");
			}
		
		}
		catch(Exception yee) {
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