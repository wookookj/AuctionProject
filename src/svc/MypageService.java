package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import dao.MypageDAO;
import dao.OnlineActionDAO;
import vo.BoardBean;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionBuyBean;
import vo.OnlineActionNowBean;

public class MypageService {

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

	
	public ArrayList<OnlineActionBean> getarticle(String id) throws Exception{
		ArrayList<OnlineActionBean> articleList = null;
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		articleList = mypageDAO.selectArticleList(id);
		close(con);
		return articleList;
	}
	
	public ArrayList<OnlineActionNowBean> getNowArticleList(String id) throws Exception{
		ArrayList<OnlineActionNowBean> articleList = null;
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		articleList = mypageDAO.selectNowMoneyArticleList(id);
		close(con);
		return articleList;	
	}


	public ArrayList<OnlineActionBuyBean> getarticlebuy(String id) {
		ArrayList<OnlineActionBuyBean> articleList = null;
		Connection con = getConnection();
		MypageDAO mypageDAO = MypageDAO.getInstance();
		mypageDAO.setConnection(con);
		articleList = mypageDAO.selectArticleBuyList(id);
		close(con);
		return articleList;
	}
	
	

}
