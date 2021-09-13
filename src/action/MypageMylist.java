package action;




import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageEmoneyService;
import svc.MypageMylistService;
import svc.MypageService;
import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionBuyBean;
import vo.OnlineActionNowBean;


 public class MypageMylist implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception { 
		 
		ActionForward forward = null;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int action_num = Integer.parseInt(request.getParameter("action_num"));
		String id = request.getParameter("id");

		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		MypageMylistService mypageMylistService = new MypageMylistService();
		
		OnlineActionBean article = onlineActionClickService.getArticle(action_num);
		int insertcount = mypageMylistService.setMylist(id,article);
		
		if(insertcount > 0) {
			out.print("관심물품 등록완료");
		}else {		
			out.print("이미 관심물품 등록 되어 있습니다");
		}
   		return forward;

	 }
	 
}