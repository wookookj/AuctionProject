package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageEmoneyService;
import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.OnlineActionBean;


 public class MypageEmoneyProAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int emoney = Integer.parseInt(request.getParameter("emoney"));
		String id = request.getParameter("id");

		MypageEmoneyService mypageEmoneyService = new MypageEmoneyService();
		int result = mypageEmoneyService.setEmoney(id,emoney);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
   		forward.setPath("mypage.jung?id="+id);
   		return forward;
	 }
	 
}