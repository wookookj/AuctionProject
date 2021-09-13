package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionSellidChk implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int action_num=Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");	
		String sell_id = request.getParameter("sell_id");

		OnlineActionTotalBean onlineActionTotalBean = new OnlineActionTotalBean();
		onlineActionTotalBean.setAction_num(action_num);
		onlineActionTotalBean.setAction_sellid(sell_id);

		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		int count = onlineActionClickService.updatesellid(onlineActionTotalBean);
		
		ActionForward forward = null;
   		return forward;

	 }
	 
}