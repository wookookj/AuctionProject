package action;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MypageService;
import svc.OnlineActionClickService;
import vo.ActionForward;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionTotalBean;


 public class OnlineActionClick implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int action_num=Integer.parseInt(request.getParameter("action_num"));
		String page = request.getParameter("page");	
		
		MypageService mypageService = new MypageService();		
		OnlineActionClickService onlineActionClickService = new OnlineActionClickService();
		
		OnlineActionBean article = onlineActionClickService.getArticle(action_num);
		OnlineActionTotalBean onlineactiontotalbean = onlineActionClickService.getTotalAction(action_num);
		OnlineActionTotalBean buy_id = onlineActionClickService.getSignupImf(onlineactiontotalbean.getAction_buyid());
		OnlineActionTotalBean sell_id = onlineActionClickService.getSignupImf(onlineactiontotalbean.getAction_sellid());
		OnlineActionTotalBean action_end = onlineActionClickService.getActionEnd(action_num);
		MypageBean mypagebean = mypageService.getbean(article.getAction_sellid());
		
		  //쿠키변수를 만들어서 값을 저장. 쿠키변수에 값이 있으면 조회수 증가 실행 하지 않음
		  boolean isGet=false;
		  Cookie[] cookies=request.getCookies();
		  if(cookies!=null){  
			  // 쿠키값 모두 초기화
			  /*for(int i =0; i < cookies.length; i++) {
				  cookies[i].setMaxAge(0);
				  response.addCookie(cookies[i]);
			  }*/
		   for(Cookie c: cookies){//    
		    //action_num쿠키가 있는 경우
		    if(c.getName().equals(String.valueOf(action_num))){
		     isGet=true; 
		    }
		   }
		   // action_num쿠키가 없는 경우
		   if(!isGet) {
			onlineActionClickService.updateCount(action_num);
		    Cookie c1 = new Cookie(String.valueOf(action_num),String.valueOf(action_num));
		    c1.setMaxAge(1*24*60*60); //하루저장
		    response.addCookie(c1);   
		   }
		  }
		
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
	   	request.setAttribute("mypagebean",mypagebean);
	   	request.setAttribute("total", onlineactiontotalbean);
		request.setAttribute("buy_id", buy_id);
		request.setAttribute("sell_id", sell_id);
		request.setAttribute("action_end", action_end);

   		forward.setPath("/MVC_online_action/MVC_online_action_click.jsp");
   		return forward;

	 }
	 
}