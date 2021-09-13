package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionBuyidCancel implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 
			String page = request.getParameter("page");	
			String buy_id = request.getParameter("buy_id");
			
			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
			onlineActionClickService.updatebuyidgrd(buy_id);
			
			ActionForward forward = null;
	   		return forward;

	 }
	 
}