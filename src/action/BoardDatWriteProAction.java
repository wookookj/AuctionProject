package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDatWriteProService;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;
import vo.BoardDatBean;

public class BoardDatWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
	 	ActionForward forward = new ActionForward();
   		BoardDatBean boardBean = new BoardDatBean();
   		int board_num=Integer.parseInt(request.getParameter("num"));
   		String id = request.getParameter("id");
   		String write = request.getParameter("write");
   		String page = request.getParameter("page");

   		boardBean.setBoard_num(board_num);
   		boardBean.setDat_id(id);
   		boardBean.setDat_content(write);
   		
   		BoardDatWriteProService boardDatWriteProService = new BoardDatWriteProService();
   		boolean isWriteSuccess = boardDatWriteProService.registArticle(boardBean);
		
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
			forward.setPath("boardDetail.bo?board_num="+board_num+"&page=" + page);
		}

		return forward;
		
	}  	
	
}