<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("id");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정완료</title>
</head>
<body>
	<script>
		alert("수정완료");
		location.href = "mypage.jung?id=<%=id%>";
	</script>
</body>
</html>