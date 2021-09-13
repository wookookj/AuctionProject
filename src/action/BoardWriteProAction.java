package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward=null;
		BoardBean boardBean = null;
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
		boardBean = new BoardBean();
		boardBean.setBOARD_TITLE(multi.getParameter("title"));
		boardBean.setBOARD_CONTENT(multi.getParameter("content"));
		boardBean.setBOARD_FILE(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boardBean.setBOARD_ID(multi.getParameter("id"));
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('작성실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardList.bo");
		}

		return forward;
		
	}  	
	
}