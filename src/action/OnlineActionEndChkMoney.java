package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionEndChkMoney implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int action_num=Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");	
		String sell_id = request.getParameter("sell_id");
		String buy_id=  request.getParameter("buy_id");
		int end_money=  Integer.parseInt(request.getParameter("end_money"));
		
		OnlineActionTotalBean action_end = new OnlineActionTotalBean();
		action_end.setAction_buyid(buy_id);
		action_end.setAction_sellid(sell_id);
		action_end.setAction_end_money(end_money);
		
		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		onlineActionClickService.updateEndMoney(action_end);
		onlineActionClickService.updateEndMoneyty(action_end);
		
		ActionForward forward = null;
   		return forward;
	 }
	 
}