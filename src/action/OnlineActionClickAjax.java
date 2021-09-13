package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;


 public class OnlineActionClickAjax implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		// int action_num = Integer.parseInt(request.getParameter("action_num"));
		String action_time = (String)request.getParameter("action_time");
		int action_buy = Integer.parseInt(request.getParameter("action_buy"));
		String page = request.getParameter("page");
		String action_end = request.getParameter("action_end");	
		//System.out.println(action_buy);
		if(request.getParameter("action_end") == null) {
			action_end = "wow";
		}
		//OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		//OnlineActionBean article = onlineActionClickService.getArticle(action_num);
		
		ActionForward forward = new ActionForward();
		//request.setAttribute("article", article);
		// request.setAttribute("action_num", action_num);
	   	request.setAttribute("page", page);
	   	request.setAttribute("action_time", action_time);
	   	request.setAttribute("action_buy", action_buy);
		request.setAttribute("action_end", action_end);

   		forward.setPath("/MVC_online_action/MVC_online_action_ajax.jsp");
   		return forward;

	 }
	 
}