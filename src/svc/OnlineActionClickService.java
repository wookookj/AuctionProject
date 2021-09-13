package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import dao.MypageDAO;
import dao.OnlineActionDAO;
import vo.BoardBean;
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionChatBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;

import static db.JdbcUtil.*;

public class OnlineActionClickService {

	public OnlineActionBean getArticle(int action_num) throws Exception{
		// TODO Auto-generated method stub
		
		OnlineActionBean article = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		article = onlineActionDAO.selectArticle(action_num);
		close(con);
		return article;
		
	}
	
	public int updateCount(int action_num) throws Exception{
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		int updateCount = onlineActionDAO.updateReadCount(action_num);
	
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		close(con);
		return updateCount;
	}

	public OnlineActionNowBean getmoneyArticle(int action_num) {
		// TODO Auto-generated method stub
		
		OnlineActionNowBean article = null;
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		article = onlineActionDAO.selectAjaxMoneyArticle(action_num);
		close(con);
		return article;
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

	public OnlineActionTotalBean getTotalAction(int action_num) {
		OnlineActionTotalBean article = null;
		
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		article = onlineActionDAO.selectTotalAction(action_num);
		close(con);
		return article;
	}

	public OnlineActionTotalBean getSignupImf(String action_id) {
		OnlineActionTotalBean article = null;
		
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		article = onlineActionDAO.selectSignupId(action_id);
		close(con);
		return article;
	}

	public int setonlineActionEnd(OnlineActionTotalBean onlineActionTotalBean) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		int insertCount = onlineActionDAO.insertbuyidsellid(onlineActionTotalBean);
		
		if(insertCount > 0){
			commit(con);
		}
		close(con);
		return insertCount;
	}

	public int updatesellid(OnlineActionTotalBean onlineActionTotalBean) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		int updateCount = onlineActionDAO.updatesellid(onlineActionTotalBean);
		
		if(updateCount > 0){
			commit(con);
		}
		close(con);
		return updateCount;
	}

	public int updatebuyid(OnlineActionTotalBean onlineActionTotalBean) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		int updateCount = onlineActionDAO.updatebuyid(onlineActionTotalBean);
		
		if(updateCount > 0){
			commit(con);
		}
		close(con);
		return updateCount;
	}

	public OnlineActionTotalBean getActionEnd(int action_num) {
		OnlineActionTotalBean article = null;
		
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		article = onlineActionDAO.getActionEnd(action_num);
		close(con);
		return article;
	}

	public int updateEndDate(int action_num) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		int updateCount = onlineActionDAO.updateEndDate(action_num);
		
		if(updateCount > 0){
			commit(con);
		}
		close(con);
		return updateCount;
	}

	public void updateEndMoney(OnlineActionTotalBean action_end) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.updateEndMoney(action_end);
	
		commit(con);
		close(con);
	}
	
	public void updateEndMoneyty(OnlineActionTotalBean action_end) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.updateEndMoneyty(action_end);
	
		commit(con);
		close(con);
	}

	public void updateEndGradeBuy(String buy_id) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.updateEndGradeBuy(buy_id);
	
		commit(con);
		close(con);
		
	}

	public void updateEndGradeSell(String sell_id) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.updateEndGradeSell(sell_id);
	
		commit(con);
		close(con);
		
	}

	public void updatebuyidgrd(String buy_id) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.updateBuyIdGrd(buy_id);
	
		commit(con);
		close(con);
	}

	public void updatesellidgrd(String sell_id) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.updateSellIdGrd(sell_id);
	
		commit(con);
		close(con);
		
	}

	public void onlineActionCancel(int action_num) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.onlineActionCancel(action_num);
		
		commit(con);
		close(con);
	}

	public void insertOnlineChat(int action_num, String id, String action_chat) {
		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionDAO.insertOnlineChat(action_num,id,action_chat);
		
		commit(con);
		close(con);
	}

	public ArrayList<OnlineActionChatBean> selectOnlineChat(int action_num) {
		ArrayList<OnlineActionChatBean> onlineActionChatBeanArticle = new ArrayList<OnlineActionChatBean>();

		Connection con = getConnection();
		OnlineActionDAO onlineActionDAO = OnlineActionDAO.getInstance();
		onlineActionDAO.setConnection(con);
		
		onlineActionChatBeanArticle = onlineActionDAO.selectOnlineChat(action_num);
		close(con);
		return onlineActionChatBeanArticle;
	}


}
