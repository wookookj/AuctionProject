package svc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MypageDAO;
import vo.OnlineActionBean;

public class MypageMylistDeleteService {


	public int deletemylist(String id, int action_num) {
		Connection con = getConnection();	
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		int r = 0;
		r = mypageDAO.deleteMylist(id,action_num);
		
		if(r > 0){
		commit(con);
		}
		else{
		}
		close(con);		
		
		return r;
	}


}
