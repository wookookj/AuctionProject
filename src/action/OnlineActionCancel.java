package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionCancel implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 	
			int action_num=Integer.parseInt(request.getParameter("action_num"));
			String page = request.getParameter("page");	
			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
				
			onlineActionClickService.onlineActionCancel(action_num);
		   
			ActionForward forward = null;
	   		return forward;

	 }
	 
}