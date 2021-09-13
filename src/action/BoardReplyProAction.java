package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardReplyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
			ActionForward forward=null;
			String realFolder="";
			String saveFolder="/boardfileupload";
			int fileSize=5*1024*1024;
			ServletContext context = request.getServletContext();
			realFolder=context.getRealPath(saveFolder);   		
			MultipartRequest multi=new MultipartRequest(request,
					realFolder,
					fileSize,
					"UTF-8",
					new DefaultFileRenamePolicy());
		 	
		    String nowPage = multi.getParameter("page");
		 	BoardBean article = new BoardBean();  		
		 	article.setBOARD_NUM(Integer.parseInt(multi.getParameter("BOARD_NUM")));
		 	article.setBOARD_TITLE(multi.getParameter("title"));
		 	article.setBOARD_CONTENT(multi.getParameter("content"));
		 	article.setBOARD_ID(multi.getParameter("id"));
		 	article.setBOARD_FILE(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		 	article.setBOARD_RE_REF(Integer.parseInt(multi.getParameter("BOARD_RE_REF")));
		 	article.setBOARD_RE_LEV(Integer.parseInt(multi.getParameter("BOARD_RE_LEV")));
		 	article.setBOARD_RE_SEQ(Integer.parseInt(multi.getParameter("BOARD_RE_SEQ")));	   		
		 	BoardReplyProService boardReplyProService = new BoardReplyProService();
		 	boolean isReplySuccess = boardReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("boardList.bo?page=" + nowPage);
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