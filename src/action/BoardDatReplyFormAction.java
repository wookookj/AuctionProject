package action;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDatDetailService;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;
import vo.BoardDatBean;

public class BoardDatReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String page = request.getParameter("page");	
			String id = request.getParameter("id");
			String dat_board_num;
			
			if(request.getParameter("dat_board_num") == null) {
				dat_board_num = null;
			}
			else {
				dat_board_num = request.getParameter("dat_board_num");
			}
			BoardDetailService boardDetailService = new BoardDetailService();
			BoardBean article = boardDetailService.getArticle(board_num);
				 	 		  
			  //쿠키변수를 만들어서 값을 저장. 쿠키변수에 값이 있으면 조회수 증가 실행 하지 않음
			  boolean isGet=false;
			  Cookie[] cookies=request.getCookies();
			  if(cookies!=null){   
			   for(Cookie c: cookies){//    
			    //num쿠키가 있는 경우
			    if(c.getName().equals(String.valueOf(board_num))){
			     isGet=true; 
			    }
			   }
			   // num쿠키가 없는 경우
			   if(!isGet) {
				boardDetailService.updateCount(board_num);
			    Cookie c1 = new Cookie(String.valueOf(board_num),String.valueOf(board_num));
			    c1.setMaxAge(1*24*60*60);//하루저장
			    response.addCookie(c1);    
			   }
			  }

			BoardDatDetailService boardDatDetailService = new BoardDatDetailService();
			ArrayList<BoardDatBean> dat_article = boardDatDetailService.getArticle(board_num);
			
			ActionForward forward = new ActionForward();
			request.setAttribute("page", page);
		   	request.setAttribute("article", article);
		   	request.setAttribute("dat_article", dat_article);
		   	request.setAttribute("dat_num",dat_board_num);
		   	request.setAttribute("dat_id", id);
	   		forward.setPath("/MVC_board/MVC_community_click_dat.jsp");
	   		return forward;
	   		
	}
	 
}