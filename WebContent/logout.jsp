<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그아웃</title>
	<body>
		<%
			//session.invalidate();
			session.removeAttribute("id");
			session.removeAttribute("name");
			session.removeAttribute("birth");
			//response.sendRedirect ("index.jsp");
		%>
		<script>
			location.href="index.jsp";
		</script>
	</body>
</html>