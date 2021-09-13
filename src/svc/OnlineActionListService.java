package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import dao.OnlineActionDAO;
import vo.BoardBean;
import vo.OnlineActionBean;
import vo.OnlineActionNowBean;

public class OnlineActionListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		listCount = onlineActionDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<OnlineActionBean> getArticleList(int page, int limit) throws Exception{	
		ArrayList<OnlineActionBean> articleList = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		articleList = onlineActionDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
	}
	
	public ArrayList<OnlineActionNowBean> getNowArticleList() throws Exception{
		ArrayList<OnlineActionNowBean> articleList = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		articleList = onlineActionDAO.selectNowMoneyArticleList();
		close(con);
		return articleList;	
	}

	public int getListCount_Today() {
		int listCount = 0;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		listCount = onlineActionDAO.selectListCountToday();
		close(con);
		return listCount;
	}

	public ArrayList<OnlineActionBean> getArticleList_Today(int page, int limit) {
		ArrayList<OnlineActionBean> articleList = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		articleList = onlineActionDAO.selectArticleListToday(page,limit);
		close(con);
		return articleList;
	}

	public int getListCount_Random() {
		int listCount = 0;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		listCount = onlineActionDAO.selectListCountRandom();
		close(con);
		return listCount;
	}

	public ArrayList<OnlineActionBean> getArticleList_Random(int page, int limit) {
		ArrayList<OnlineActionBean> articleList = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		articleList = onlineActionDAO.selectArticleListRandom(page,limit);
		close(con);
		return articleList;
	}

	public int getListCount_Hot() {
		int listCount = 0;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		listCount = onlineActionDAO.selectListCountHot();
		close(con);
		return listCount;
	}

	public ArrayList<OnlineActionBean> getArticleList_Hot(int page, int limit) {
		ArrayList<OnlineActionBean> articleList = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		articleList = onlineActionDAO.selectArticleListHot(page,limit);
		close(con);
		return articleList;
	}

}
