<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "Action_projcet.Signup_DTO" %>
	<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 확인</title>
</head>
<body>
<script>
	var login_chk = false;
	var login_chk2 = false;
	var login_chk3 = false;
	var name;
	<% 
		ArrayList<Signup_DTO> arr = (ArrayList)request.getAttribute("arr");  
		String id = (String)request.getAttribute("id");
		String pw = (String)request.getAttribute("pw");
		
		if(arr.size() == 0) {%>
			login_chk3 = true;
		<%}
		for( int i = 0; i <arr.size(); i ++) {
			if(id.equals(arr.get(i).getId())){ 
				if(pw.equals(arr.get(i).getSign_pw())) {%>
					name = "<%=arr.get(i).getSign_name()%>";
					birth = "<%=arr.get(i).getSign_birth()%>";
					login_chk = true;	
				<%}
				else {%>
					login_chk2 = true;
				<%}
			}
			else {%>
				login_chk3 = true;
			<%}
		}%>
		if(login_chk == true) {
			location.href='login_loading.jsp?id='+"<%=id%>"+'&name='+name+'&birth='+birth;
		}
		else if(login_chk2 == true) {
			alert("비밀번호가 일치하지 않습니다");
			history.back();
		}
		else if(login_chk3 == true) {
			alert("아이디가 일치하지 않습니다");	
			history.back();
		}		
</script>
	
</body>
</html>