<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 DB_insert</title>
</head>
<body>		
	<%
		String id_chk = request.getParameter("id");
		String pw_chk = request.getParameter("pw");
		ArrayList<Signup_DTO> arr = new ArrayList<Signup_DTO>();
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","1234");
			if(conn == null) {
				throw new Exception("webdb 데이터베이스로 연결할 수 없습니다.<br>");
			}
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select id,sign_pw,sign_name,sign_birth from signup");
			while(rs.next()) {
				Signup_DTO dto = new Signup_DTO();

				String id = rs.getString("id");
				String pw = rs.getString("sign_pw");
				String name = rs.getString("sign_name");
				String birth = rs.getString("sign_birth");
				dto.setId(id);
				dto.setSign_pw(pw);
				dto.setSign_name(name);
				dto.setSign_birth(birth);
				arr.add(dto);
				
			}
			
			request.setAttribute("arr", arr);
			request.setAttribute("id",id_chk);
			request.setAttribute("pw",pw_chk);
			
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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login_chk.jsp");
		dispatcher.forward(request,response);
	%>
</body>
</html>