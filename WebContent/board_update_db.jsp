<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Action_projcet.Board_DTO"%>
<% String id = (String)session.getAttribute("id");
	if(id == null) {
		out.print("<script>location.href='nologin.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판수정DB_update</title>
</head>
<body>
	<jsp:useBean id ="board" class ="Action_projcet.Member_Board_DAO" />
	<script>
	<% 
		request.setCharacterEncoding("UTF-8");;
		String title = (String)request.getParameter("title");
		String main = (String)request.getParameter("main");
		int num = Integer.parseInt(request.getParameter("num"));
		
		Board_DTO dto = new Board_DTO();
		
		dto.setTitle(title);
		dto.setMain(main);
		dto.setNum(num);
		
		int update_result = board.board_db_update(dto);
		
		if(update_result > 0) { %> 
			alert("수정완료");
			location.href = "board_click.jsp?num="+ <%=num %> 
		<%}%>
	</script>
</body>
</html>