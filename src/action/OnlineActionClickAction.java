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


 public class OnlineActionClickAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		ActionForward forward = null;
		int action_num = Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");
		String id = request.getParameter("buy_id");
		int action_money =  Integer.parseInt(request.getParameter("action_buy_money"));
			
		//System.out.println(action_num);
		//System.out.println(page);
		//System.out.println(id);
		//System.out.println(action_money);
		
		OnlineActionNowBean dto = new OnlineActionNowBean();
		MypageBean bean = new MypageBean();
		dto.setAction_num(action_num);
		dto.setAction_buyid(id);
		dto.setAction_end_money(action_money);
		
		OnlineActionClickActionService onlineActionClickActionService = new OnlineActionClickActionService();	  	
		bean = onlineActionClickActionService.getbean(id);
		if(bean.getMy_point() >= action_money) {
			boolean isWriteSuccess = onlineActionClickActionService.registArticle(dto);
			if(!isWriteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('입찰실패')");
				out.println("history.back();");
				out.println("</script>");
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
				forward = new ActionForward();
		   		forward.setPath("online_action_click.wookook?action_num="+action_num+"&page="+page);
		   		//forward.setPath("online_action_list.wookook?&page="+page);		
			}
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("emoney_out");
		}
		return forward;
	 }
	 
	 
}