package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import dao.MypageDAO;
import dao.OnlineActionDAO;
import vo.BoardBean;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;

public class MypageEmoneyService {

	public int setEmoney(String id,int emoney) throws Exception{
		// TODO Auto-generated method stub	

		Connection con = getConnection();	
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		int r = mypageDAO.updateEmoney(id,emoney);
		
		if(r > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);		
		return r;
	}

}
