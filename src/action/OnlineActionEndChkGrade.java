package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionEndChkGrade implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int action_num=Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");	
		String sell_id = request.getParameter("sell_id");
		String buy_id=  request.getParameter("buy_id");
		
		
		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		onlineActionClickService.updateEndGradeBuy(buy_id);
		onlineActionClickService.updateEndGradeSell(sell_id);
		
		ActionForward forward = null;
   		return forward;
	 }
	 
}