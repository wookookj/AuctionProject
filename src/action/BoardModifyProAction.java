package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

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

		boolean isModifySuccess = false;
		
		int board_num=Integer.parseInt(multi.getParameter("num"));
		String page = multi.getParameter("page");
		BoardBean article=new BoardBean();
		BoardModifyProService boardModifyProService = new BoardModifyProService();
			article.setBOARD_NUM(board_num);
			article.setBOARD_TITLE(multi.getParameter("title"));
			article.setBOARD_CONTENT(multi.getParameter("main"));
			article.setBOARD_FILE(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num="+ board_num + "&page=" + page); 
			}


		return forward;
	}

}