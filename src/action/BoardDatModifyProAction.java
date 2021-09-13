package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardDatModifyProService;
import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.BoardDatBean;

public class BoardDatModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		boolean isModifySuccess = false;
		ActionForward forward = new ActionForward();
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int dat_board_num = Integer.parseInt(request.getParameter("dat_board_num"));
		String board_content = request.getParameter("board_content");
		String page = request.getParameter("page");
		BoardDatBean article = new BoardDatBean();
		
		BoardDatModifyProService boarddatModifyProService = new BoardDatModifyProService();
			article.setDat_num(dat_board_num);
			article.setDat_content(board_content);
			isModifySuccess = boarddatModifyProService.modifyArticle(article);

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