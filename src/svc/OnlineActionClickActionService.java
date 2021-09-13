package svc;

import java.sql.Connection;
import dao.BoardDAO;
import dao.MypageDAO;
import dao.OnlineActionDAO;
import vo.BoardBean;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;

import static db.JdbcUtil.*;

public class OnlineActionClickActionService {
	
	public boolean registArticle(OnlineActionNowBean onlineActionNowBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		int insertCount = onlineActionDAO.insertArticle(onlineActionNowBean);
		
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
	
	public MypageBean getbean(String id) throws Exception{
		// TODO Auto-generated method stub	
			
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		
		MypageBean mypagebean = null;
		mypagebean = mypageDAO.selectEmoney(id);
		close(con);		
		return mypagebean;
	}
}
