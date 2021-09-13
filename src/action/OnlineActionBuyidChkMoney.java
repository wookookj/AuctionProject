package action;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OnlineActionClickActionService;
import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;


 public class OnlineActionBuyidChkMoney implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		ActionForward forward = null;
		MypageBean bean = new MypageBean();
		String page = request.getParameter("page");
		String id = request.getParameter("buy_id");
		int action_money =  Integer.parseInt(request.getParameter("end_money"));		
		
		OnlineActionClickActionService onlineActionClickActionService = new OnlineActionClickActionService();	  	
		bean = onlineActionClickActionService.getbean(id);
		if(bean.getMy_point() >= action_money) {
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("emoney_out");
		}
		return forward;
	 }
	 
	 
}