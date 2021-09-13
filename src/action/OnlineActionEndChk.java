package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionEndChk implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		ActionForward forward = new ActionForward();
		try {		
			int action_num=Integer.parseInt(request.getParameter("action_num"));
			String page = request.getParameter("page");	
			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
			OnlineActionTotalBean action_end = onlineActionClickService.getActionEnd(action_num);
		   	request.setAttribute("action_end", action_end);
		}
		catch(Exception e) {
			int action_num=Integer.parseInt(request.getParameter("action_num"));
			String page = request.getParameter("page");	
			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
			OnlineActionTotalBean action_end = onlineActionClickService.getActionEnd(action_num);
		   	request.setAttribute("action_end", action_end);
		}
   		forward.setPath("/MVC_online_action/MVC_online_action_end_ajax.jsp");
		
   		return forward;

	 }
	 
}