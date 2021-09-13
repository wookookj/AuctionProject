<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 DB_update2</title>
</head>
<body>		
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getParameter("id");
		String sign_pw = (String)request.getParameter("passwd");
		String sign_name = (String)request.getParameter("name");
		String sign_tell = "0" + (String)request.getParameter("tel1") + (String)request.getParameter("tel2") + (String)request.getParameter("tel3");
		String sign_email = (String)request.getParameter("email") + (String)request.getParameter("email2");
		String sign_addr = (String)request.getParameter("addr1")+"/"+(String)request.getParameter("addr2")+"/"+(String)request.getParameter("addr3");
		String sign_birth = (String)request.getParameter("year") + (String)request.getParameter("birth") + (String)request.getParameter("days");
		
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
			String command = "update signup set sign_name ='"+sign_name+"', sign_tell ='" + sign_tell + "', sign_email ='" + sign_email + "', sign_addr ='" + sign_addr + "', sign_birth ='" + sign_birth + "' where id = '"+ id+"';";
			int rowNum = stmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}	
			session.setAttribute("name",sign_name);
			response.sendRedirect("update_mypage_success.jsp");
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
</body>
</html>