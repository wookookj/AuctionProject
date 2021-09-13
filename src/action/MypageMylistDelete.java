package action;




import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageMylistDeleteService;
import svc.MypageMylistService;
import svc.MypageMylistViewService;
import vo.ActionForward;
import vo.OnlineActionBean;


 public class MypageMylistDelete implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception { 
		 
		 	ActionForward forward = null;
			String id = request.getParameter("id");
			int action_num = Integer.parseInt(request.getParameter("action_num"));
			MypageMylistDeleteService mypageMylistDeleteService = new MypageMylistDeleteService();
			int deletecount = mypageMylistDeleteService.deletemylist(id,action_num);

			if(deletecount > 0) {
				forward = new ActionForward();
				forward.setPath("mypage_mylist_view.jung?id="+id);			
			}
			else {
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('삭제실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   			out.close();
			}
			return forward;
	 }
	 
}