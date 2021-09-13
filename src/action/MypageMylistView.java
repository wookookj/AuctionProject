package action;




import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageMylistService;
import svc.MypageMylistViewService;
import svc.OnlineActionListService;
import vo.ActionForward;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;


 public class MypageMylistView implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception { 
		 
		 	ActionForward forward = new ActionForward();
			String id = request.getParameter("id");
			MypageMylistViewService mypageMylistViewService = new MypageMylistViewService();
			ArrayList<OnlineActionBean> article = mypageMylistViewService.getArticle(id);
			
			ArrayList<OnlineActionNowBean> articleNowMoneyList = new ArrayList<OnlineActionNowBean>();
			OnlineActionListService onlineActionListService = new OnlineActionListService();
			articleNowMoneyList = onlineActionListService.getNowArticleList();
			
			request.setAttribute("mypagelist",article); 
			request.setAttribute("articleMoneyList", articleNowMoneyList);
	   		forward.setPath("/MVC_mypage/MVC_mypage_mylist.jsp");
	   		return forward;

	 }
	 
}