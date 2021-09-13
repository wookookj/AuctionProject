package action;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageEmoneyService;
import svc.MypageService;
import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionBuyBean;
import vo.OnlineActionNowBean;


 public class MypageProAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		String id = request.getParameter("id");
		MypageBean mypagebean = new MypageBean();
		MypageService mypageService = new MypageService();
		ArrayList<OnlineActionBean> articleListsell = new ArrayList<OnlineActionBean>();
		ArrayList<OnlineActionBuyBean> articleListbuy = new ArrayList<OnlineActionBuyBean>();
		ArrayList<OnlineActionNowBean> articleNowList = new ArrayList<OnlineActionNowBean>();
		mypagebean = mypageService.getbean(id);
		articleListsell = mypageService.getarticle(id);
		articleListbuy = mypageService.getarticlebuy(id);
		articleNowList = mypageService.getNowArticleList(id);
		ActionForward forward = new ActionForward();
		request.setAttribute("mypagebean",mypagebean); // 이머니, 구매등급, 판매등급
		request.setAttribute("mypagesellarticle",articleListsell); // 판매현황 
		request.setAttribute("mypagesellNowarticle", articleNowList); // 판매현황 현재가격
		request.setAttribute("mypagebuyarticle", articleListbuy); // 입찰현황

   		forward.setPath("/MVC_mypage/MVC_mypage.jsp");
   		return forward;

	 }
	 
}