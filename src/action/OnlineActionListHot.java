package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardListService;
import svc.OnlineActionListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;
import vo.PageInfo;

 public class OnlineActionListHot implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		ArrayList<OnlineActionNowBean> articleNowMoneyList = new ArrayList<OnlineActionNowBean>();
		ActionForward forward= new ActionForward();
	  	int page=1;
		int limit=12;
		

		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		OnlineActionListService onlineActionListService = new OnlineActionListService();

		int listCount = onlineActionListService.getListCount_Hot(); //총 리스트 수를 받아옴.
		articleList = onlineActionListService.getArticleList_Hot(page,limit); //리스트를 받아옴.
		articleNowMoneyList = onlineActionListService.getNowArticleList();
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	        int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		request.setAttribute("articleMoneyList", articleNowMoneyList);		
   		forward.setPath("/MVC_online_action/MVC_online_action_Hot.jsp");
   		return forward;
   		
	 }
	 
 }