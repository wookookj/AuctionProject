package svc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MypageDAO;
import vo.OnlineActionBean;

public class MypageMylistService {

	public int setMylist(String id, OnlineActionBean article) {
		// TODO Auto-generated method stub	
		Connection con = getConnection();	
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		int r = 0;
		r = mypageDAO.insertMylist(id,article);
		
		if(r > 0){
			commit(con);
		}
		else{
		}
		close(con);		
		
		return r;
	}


}
