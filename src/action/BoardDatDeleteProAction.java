package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDatDeleteProService;
import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDatDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int dat_board_num = Integer.parseInt(request.getParameter("dat_board_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardDatDeleteProService boardDatDeleteProService = new BoardDatDeleteProService();
		boolean isDeleteSuccess = boardDatDeleteProService.removeArticle(dat_board_num);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제할 권한이 없습니다');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num="+ board_num + "&page=" + page);		
			}
			
		return forward;
	}

}