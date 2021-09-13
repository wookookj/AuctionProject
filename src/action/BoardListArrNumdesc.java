package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardListArrService;
import svc.BoardListService;
import svc.BoardSearchService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

 public class BoardListArrNumdesc implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
	  	int page=1;
		int limit=15;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String arr = (String)request.getParameter("array");
		BoardListService boardListService = new BoardListService();
		BoardListArrService boardListArrService = new BoardListArrService();
		int listCount = boardListService.getListCount(); //총 리스트 수를 받아옴.
		articleList = boardListArrService.getArticleList(page,limit,arr); //리스트를 받아옴.
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
		request.setAttribute("array", arr);
		ActionForward forward= new ActionForward();
   		forward.setPath("/MVC_board/MVC_community.jsp");
   		return forward;
   		
	 }
	 
 }