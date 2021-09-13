<% 	String id = (String)session.getAttribute("id");
	ArrayList<OnlineActionChatBean> article = (ArrayList<OnlineActionChatBean>)request.getAttribute("article");
	if(id == null) {
		out.print("<script>location.href='nologin.jsp';</script>");
	}
	if(article.size() == 0) {
		out.print("");
	}
	for(int i = 0; i<article.size(); i++) {
		if(i == article.size()-1) {
			out.print(article.get(i).getId() + " : ");
			out.print(article.get(i).getMsg());
		}
		else {
			out.print(article.get(i).getId() + " : ");
			out.print(article.get(i).getMsg()+"\n");
		}
	}	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.OnlineActionChatBean"%>
<%@ page import = "java.util.*" %>
