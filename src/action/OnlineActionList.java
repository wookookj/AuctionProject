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

 public class OnlineActionList implements Action {
	 
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

		int listCount = onlineActionListService.getListCount(); //총 리스트 수를 받아옴.
		articleList = onlineActionListService.getArticleList(page,limit); //리스트를 받아옴.
		articleNowMoneyList = onlineActionListService.getNowArticleList();	
   		int maxPage=(int)((double)listCount/limit+0.95); //총 페이지 수.

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		request.setAttribute("articleMoneyList", articleNowMoneyList);		
   		forward.setPath("/MVC_online_action/MVC_online_action.jsp");
   		return forward;
   		
	 }
	 
 }