<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.OnlineActionBean"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.concurrent.TimeUnit" %>

<% 	String id = (String)session.getAttribute("id");
	String action_time = (String)request.getAttribute("action_time");
	String nowPage = (String)request.getAttribute("page");
	int action_buy = (int)request.getAttribute("action_buy");
	String action_end = (String)request.getAttribute("action_end");
	
	if(id == null) {
		out.print("<script>location.href='nologin.jsp';</script>");
	}
	
	long mill;
	long hours;
	long minutes;
	long seconds;
		
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Calendar nowcal = Calendar.getInstance(); // 현재 날짜 시간
	
	Calendar lastcal = Calendar.getInstance(); // 현재 날짜 시간 + 판매등록시 지정했던 경매시간
	Date last = format.parse(action_time);
	lastcal.setTime(last);
	
	mill = (lastcal.getTimeInMillis() - nowcal.getTimeInMillis()); // 경매시간(밀리초) - 현재 시간(밀리초)
	// 밀리초를 시간으로 변환
	hours = TimeUnit.MILLISECONDS.toHours(mill); 
	// 밀리초를 분으로 변환
	minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours); 
	// 밀리초를 초로 변환
	seconds = TimeUnit.MILLISECONDS.toSeconds(mill) - TimeUnit.HOURS.toSeconds(hours) - TimeUnit.MINUTES.toSeconds(minutes);
	
	if(seconds < 0 || minutes < 0 || hours < 0) { // 시간이 전부 지나갔을떄 조건문
		if(action_buy > 0) { // 한명이라도 입찰 한 사람이 있을때 조건
			if(action_end.equals("wow")){ // DB에 접근시 처음 값이 null값 존재 > null값 대체 출력 
				out.println("로딩 중");
			}
			else if(action_end.equals("end")) { // 거래 대기 중 경매 정상 종료시 출력
				out.println("경매 종료"); 		
			}
			else if(action_end.equals("start")){ // 시간이 지나고 한명이라도 입찰 한 사람이 있을시 출력
				out.println("거래 대기");
			}
			else if(action_end.equals("cancel")){ // 거래 대기 중 경매 취소시 출력
				out.println("경매 취소");
			}
		}
		else {
			out.println("경매 종료"); // 입찰 한 인원이 한명도 없으면 출력
		}	
	}
	else {
		out.println(hours + "시 " + minutes + "분 " + seconds + "초"); // 시간이 남았을떄 출력
	}
	
%>