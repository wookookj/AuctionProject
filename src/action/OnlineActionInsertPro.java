package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardWriteProService;
import svc.OnlineActionInsertProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.OnlineActionBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class OnlineActionInsertPro implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward=null;
		OnlineActionBean onlineActionBean = null;
		String realFolder="";
		String saveFolder="/onlineactionfileupload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		onlineActionBean = new OnlineActionBean();
		onlineActionBean.setAction_date(multi.getParameter("action_date"));
		onlineActionBean.setAction_start_money(Integer.parseInt(multi.getParameter("action_start_money")));
		onlineActionBean.setAction_kind(multi.getParameter("action_kind"));
		onlineActionBean.setAction_quick(multi.getParameter("action_quick"));
		onlineActionBean.setAction_adult(multi.getParameter("action_adult"));
		onlineActionBean.setAction_sellid(multi.getParameter("action_sellid"));
		onlineActionBean.setAction_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		onlineActionBean.setAction_name(multi.getParameter("action_name"));
		onlineActionBean.setAction_content(multi.getParameter("action_content"));
		
		OnlineActionInsertProService onlineActionInsertProService = new OnlineActionInsertProService();
		boolean isInsertSuccess = onlineActionInsertProService.registArticle(onlineActionBean);

		if(!isInsertSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("online_action_list.wookook");
		}

		return forward;
		
	}  	
	
}