<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id_chk = (String)session.getAttribute("id");
	if(id_chk == null) {
		out.print("<script>location.href='nologin.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판삭제</title>
</head>
<body>
	<jsp:useBean id ="board" class ="Action_projcet.Member_Board_DAO" />
	<script>
	<% 
		int num = Integer.parseInt(request.getParameter("num")); 
		String id =  request.getParameter("id");
		
		int delete_result = board.board_db_delete(num,id); 
		
		if(delete_result > 0) { %> 
		alert("삭제완료");
		location.href="community.jsp";
	<%}%>
	</script>
</body>
</html>