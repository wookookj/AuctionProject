package action;



import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionChatBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionChatSelect implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		ActionForward forward = new ActionForward();
		ArrayList<OnlineActionChatBean> onlineActionChatBeanArticle = new ArrayList<OnlineActionChatBean>();
		
			int action_num=Integer.parseInt(request.getParameter("action_num"));

			OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
			onlineActionChatBeanArticle = onlineActionClickService.selectOnlineChat(action_num);
			
			/*for(int i =0; i< onlineActionChatBeanArticle.size(); i++) {			
				System.out.println(onlineActionChatBeanArticle.get(i).getAction_num());
				System.out.println(onlineActionChatBeanArticle.get(i).getId());
				System.out.println(onlineActionChatBeanArticle.get(i).getMsg());
			}*/
	   	request.setAttribute("article", onlineActionChatBeanArticle);

   		forward.setPath("/MVC_online_action/MVC_online_action_chat_ajax.jsp");
   		return forward;

	 }
	 
}