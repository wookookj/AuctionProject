package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.OnlineActionBuyidCancel;
import action.OnlineActionBuyidChk;
import action.OnlineActionBuyidChkMoney;
import action.OnlineActionCancel;
import action.OnlineActionChatInsert;
import action.OnlineActionChatSelect;
import action.OnlineActionChk;
import action.OnlineActionClickAction;
import action.OnlineActionClickAjax;
import action.OnlineActionClickBuy;
import action.OnlineActionClickMoneyAjax;
import action.OnlineActionEndChk;
import action.OnlineActionEndChkGrade;
import action.OnlineActionEndChkMoney;
import action.OnlineActionEndDate;
import action.OnlineActionSellidCancel;
import action.OnlineActionSellidChk;
import vo.ActionForward;

@WebServlet("*.ajax")
public class AjaxController extends javax.servlet.http.HttpServlet 
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

		if(command.equals("/online_action_click.ajax")){
			action = new OnlineActionClickAjax();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_click_money.ajax")){
			action = new OnlineActionClickMoneyAjax();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_click_action.ajax")){
			action = new OnlineActionClickAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_click_Buy.ajax")){
			action = new OnlineActionClickBuy();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_chk.ajax")){
			action = new OnlineActionChk();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_sellid_chk.ajax")){
			action = new OnlineActionSellidChk();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
		else if(command.equals("/online_action_buyid_chk.ajax")){
			action = new OnlineActionBuyidChk();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
		else if(command.equals("/online_action_end_chk.ajax")){
			action = new OnlineActionEndChk();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
		else if(command.equals("/online_action_end.ajax")){
			action = new OnlineActionEndDate();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_end_chk_money.ajax")){
			action = new OnlineActionEndChkMoney();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_end_chk_grd.ajax")){
			action = new OnlineActionEndChkGrade();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_buyid_chk_money.ajax")){
			action = new OnlineActionBuyidChkMoney();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_buyid_cancel.ajax")){
			action = new OnlineActionBuyidCancel();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_sellid_cancel.ajax")){
			action = new OnlineActionSellidCancel();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_cancel.ajax")){
			action = new OnlineActionCancel();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_chat_insert.ajax")){
			action = new OnlineActionChatInsert();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/online_action_chat_select.ajax")){
			action = new OnlineActionChatSelect();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
			
		if(forward != null){	
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