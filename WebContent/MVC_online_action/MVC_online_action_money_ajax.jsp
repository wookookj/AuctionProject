<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.OnlineActionNowBean"%>
<%@ page import = "java.text.NumberFormat" %>


<% 	String id = (String)session.getAttribute("id");
	OnlineActionNowBean actionbean_dto = (OnlineActionNowBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
	int price = actionbean_dto.getAction_end_money();
	//String commaprice = NumberFormat.getInstance().format(price);
	out.println(price);
%>
