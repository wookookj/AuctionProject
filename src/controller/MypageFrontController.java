package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.BoardDatDeleteProAction;
import action.BoardDatModifyProAction;
import action.BoardDatReplyFormAction;
import action.BoardDatReplyProAction;
import action.BoardDatWriteProAction;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardListArrNumdesc;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardSearchProAction;
import action.BoardWriteProAction;
import action.MypageEmoneyProAction;
import action.MypageMylist;
import action.MypageMylistDelete;
import action.MypageMylistView;
import action.MypageProAction;
import vo.ActionForward;

@WebServlet("*.jung")
public class MypageFrontController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");  	
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/mypage.jung")){
			action = new MypageProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		else if(command.equals("/mypage_emoney.jung")){
			forward=new ActionForward();
			forward.setPath("/MVC_mypage/MVC_mypage_emoney.jsp");
		}
		else if(command.equals("/mypage_emoney_update.jung")){
			action = new MypageEmoneyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/mypage_mylist.jung")){
			action = new MypageMylist();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/mypage_mylist_view.jung")){
			action = new MypageMylistView();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/mypage_mylist_delete.jung")){
			action = new MypageMylistDelete();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		if(forward != null) {	
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}