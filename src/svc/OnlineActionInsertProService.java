package svc;

import java.sql.Connection;
import dao.BoardDAO;
import dao.OnlineActionDAO;
import vo.BoardBean;
import vo.OnlineActionBean;

import static db.JdbcUtil.*;
public class OnlineActionInsertProService {

	public boolean registArticle(OnlineActionBean onlineActionBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		int insertCount = onlineActionDAO.insertArticle(onlineActionBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
