<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.OnlineActionTotalBean"%>

<% 	
	String id = (String)session.getAttribute("id");
	OnlineActionTotalBean action_end = (OnlineActionTotalBean)request.getAttribute("action_end");
	
		if(id == null) {
			out.print("<script>location.href='nologin.jsp';</script>");
		}
		if(action_end.getAction_end() == null ) {
			out.println(0);
		}
		else if(action_end.getAction_end().equals("end")) {
			out.println(0);
		}
		else if(action_end.getAction_end().equals("cancel")) {
			out.println(0);
		}
		else {
			out.println(action_end.getAction_buyid_chk()+action_end.getAction_sellid_chk());	
		}		
%>