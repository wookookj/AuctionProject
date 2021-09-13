<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Action_projcet.Board_DTO"%>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색</title>
</head>
<body>
	<jsp:useBean id ="board" class ="Action_projcet.Member_Board_DAO" />
	<%
		request.setCharacterEncoding("UTF-8");
		String cho = (String)request.getParameter("cho_admin");
		String search = (String)request.getParameter("search_admin");
	
		if(cho.equals("제목")) {
			ArrayList<Board_DTO> arr = board.board_db_search_title_admin(search);
			request.setAttribute("arr", arr);
		}
		else if(cho.equals("번호")){
			ArrayList<Board_DTO> arr = board.board_db_search_num_admin(search);
			request.setAttribute("arr", arr);
		}
		else if(cho.equals("내용")){
			ArrayList<Board_DTO> arr = board.board_db_search_main_admin(search);
			request.setAttribute("arr", arr);
		}
		
		request.setAttribute("cho",cho);
		request.setAttribute("search",search);
		RequestDispatcher dispatcher = request.getRequestDispatcher("board_search_admin.jsp");
		dispatcher.forward(request,response);
	%>
</body>
</html>