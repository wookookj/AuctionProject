<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "Action_projcet.Signup_DTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		Connection conn = null;
		Statement stmt = null;
		ArrayList<Signup_DTO> arr = new ArrayList<Signup_DTO>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8", "root", "1234"); 
			stmt = conn.createStatement(); 
			ResultSet rs = stmt.executeQuery("select id,sign_tell,sign_email from signup");	
			while(rs.next()) { 
				Signup_DTO dto = new Signup_DTO();
				
				String id = rs.getString("id");
				String tell = rs.getString("sign_tell");
				String email = rs.getString("sign_email");
				dto.setId(id);
				dto.setSign_tell(tell);
				dto.setSign_email(email);
				
				arr.add(dto);
			}
			request.setAttribute("arr", arr);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		dispatcher.forward(request,response);
	%>
</body>
</html>