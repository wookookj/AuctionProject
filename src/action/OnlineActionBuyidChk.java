package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionBuyidChk implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int action_num=Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");	
		String buy_id = request.getParameter("buy_id");
		
		OnlineActionTotalBean onlineActionTotalBean = new OnlineActionTotalBean();
		onlineActionTotalBean.setAction_num(action_num);
		onlineActionTotalBean.setAction_buyid(buy_id);
		
		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		int count = onlineActionClickService.updatebuyid(onlineActionTotalBean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("online_action_click.wookook?action_num="+action_num+"&page="+page);
   		return forward;

	 }
	 
}