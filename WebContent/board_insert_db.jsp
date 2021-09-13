<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Action_projcet.Board_DTO"%>
<% String id_chk = (String)session.getAttribute("id");
	if(id_chk == null) {
		out.print("<script>location.href='nologin.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판등록DB_insert</title>
</head>
<body>
	<jsp:useBean id ="board" class ="Action_projcet.Member_Board_DAO" />
	<script>
	<% 
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getParameter("id");
		String title = (String)request.getParameter("title");
		String main = (String)request.getParameter("main");
		
		Board_DTO dto = new Board_DTO();
		
		dto.setId(id);
		dto.setTitle(title);
		dto.setMain(main);
		
		int insert_result = board.board_db_insert(dto);
		
		if(insert_result > 0) { %> 
			alert("작성완료");
			location.href="community.jsp";
		<%}%>
	</script>
</body>
</html>