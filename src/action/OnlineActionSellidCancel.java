package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionSellidCancel implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 
			String page = request.getParameter("page");	
			String sell_id = request.getParameter("sell_id");
			
			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
			onlineActionClickService.updatesellidgrd(sell_id);
			
			ActionForward forward = null;
	   		return forward;

	 }
	 
}