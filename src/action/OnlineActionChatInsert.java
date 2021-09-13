package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionChatInsert implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		
			int action_num=Integer.parseInt(request.getParameter("action_num"));
			String page = request.getParameter("page");	
			String id = request.getParameter("id");
			String action_chat = request.getParameter("action_chat");
			
			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
			onlineActionClickService.insertOnlineChat(action_num,id,action_chat);
					
			ActionForward forward = null;
	   		return forward;

	 }
	 
}