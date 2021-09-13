<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	session.setAttribute("id",request.getParameter("id"));
	session.setAttribute("name",request.getParameter("name"));
	session.setAttribute("birth",request.getParameter("birth"));
	response.sendRedirect ("index.jsp");	
%>