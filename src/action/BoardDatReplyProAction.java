package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardDatReplyProService;
import svc.BoardReplyProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.BoardDatBean;

public class BoardDatReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
			ActionForward forward=null;
		    String page = request.getParameter("page");
		    BoardDatBean article = new BoardDatBean();	
		    article.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		    article.setDat_id(request.getParameter("id"));
		    article.setDat_content(request.getParameter("board_content"));
		    article.setDat_re_ref(Integer.parseInt(request.getParameter("board_re_ref")));
		    article.setDat_re_lev(Integer.parseInt(request.getParameter("board_re_lev")));
		    article.setDat_re_seq(Integer.parseInt(request.getParameter("board_re_seq")));
		    String id = request.getParameter("dat_id");
		    BoardDatReplyProService boardDatReplyProService = new BoardDatReplyProService();
		    
		 	boolean isReplySuccess = boardDatReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("boardDetail.bo?board_num="+Integer.parseInt(request.getParameter("board_num"))+"&page=" + page + "&dat_id=" + id);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('답장실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}