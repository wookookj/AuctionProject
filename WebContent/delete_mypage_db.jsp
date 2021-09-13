<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보삭제 DB_delete</title>
</head>
<body>
<jsp:useBean id ="board" class ="Action_projcet.Member_Board_DAO" />
	<%
		String id = (String)request.getParameter("id");

		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
			if(conn == null) {
				throw new Exception("project 데이터베이스로 연결할 수 없습니다.<br>");
			}
			stmt = conn.createStatement();
			String command = "delete from signup where id = '" + id + "';";
			int rowNum = stmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
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
		// 회원탈퇴시 게시판글목록도 같이 삭제
		board.board_delete(id);
		response.sendRedirect("delete_mypage_success.jsp");
	%>

</body>
</html>