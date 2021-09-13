<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.OnlineActionBean"%>
<%@ page import = "vo.OnlineActionNowBean"%>

<% 	String id = (String)session.getAttribute("id");
	OnlineActionBean actionbean_dto = (OnlineActionBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
	out.println(actionbean_dto.getAction_buy());
%>