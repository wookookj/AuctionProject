package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;


 public class OnlineActionClickMoneyAjax implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int action_num=Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");	
					
		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		OnlineActionNowBean article = onlineActionClickService.getmoneyArticle(action_num);
		
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
	   	request.setAttribute("page", page);

   		forward.setPath("/MVC_online_action/MVC_online_action_money_ajax.jsp");
   		return forward;

	 }
	 
}