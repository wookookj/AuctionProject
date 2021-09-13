<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제완료</title>
</head>
<body>
	<script>
		alert("탈퇴완료");
		<%
			session.removeAttribute("id");
			session.removeAttribute("name");
			session.removeAttribute("birth");
		%>
		location.href="index.jsp";
	</script>
</body>
</html>