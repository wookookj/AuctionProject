package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;
import vo.BoardBean;
import vo.BoardDatBean;
import vo.OnlineActionBean;
import vo.OnlineActionChatBean;
import vo.OnlineActionNowBean;
import vo.OnlineActionTotalBean;

public class OnlineActionDAO {

	DataSource ds;
	Connection con;
	private static OnlineActionDAO onlineActionDAO;

	private OnlineActionDAO() {
	}

	public static OnlineActionDAO getInstance(){
		if(onlineActionDAO == null){
			onlineActionDAO = new OnlineActionDAO();
		}
		return onlineActionDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	public int insertArticle(OnlineActionBean onlineActionBean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(action_num) from mvc_online_action");
			rs = pstmt.executeQuery();
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into mvc_online_action values(?,now(),'start',?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, onlineActionBean.getAction_start_money());	
			pstmt.setString(3, onlineActionBean.getAction_kind());
			pstmt.setString(4, onlineActionBean.getAction_quick());
			pstmt.setString(5, onlineActionBean.getAction_adult());
			pstmt.setString(6, onlineActionBean.getAction_file());
			pstmt.setString(7, onlineActionBean.getAction_sellid());
			pstmt.setString(8, onlineActionBean.getAction_name());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setString(11,onlineActionBean.getAction_date());
			pstmt.setString(12, onlineActionBean.getAction_content());
			
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	public int selectListCount() {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from mvc_online_action");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<OnlineActionBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from mvc_online_action"
								+ " order by action_num desc limit ?,12";
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		OnlineActionBean onlineActionBean = null;
		int startrow=(page-1)*12; 	
		long mill;
		long hours;
		long minutes;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				onlineActionBean = new OnlineActionBean();
				onlineActionBean.setAction_num(rs.getInt("action_num"));	
				onlineActionBean.setAction_date(rs.getString("action_date"));
				onlineActionBean.setAction_start_money(rs.getInt("action_start_money"));
				onlineActionBean.setAction_kind(rs.getString("action_kind"));
				onlineActionBean.setAction_quick(rs.getString("action_quick"));
				onlineActionBean.setAction_adult(rs.getString("action_adult"));
				onlineActionBean.setAction_file(rs.getString("action_file"));
				onlineActionBean.setAction_sellid(rs.getString("action_sellid"));
				onlineActionBean.setAction_name(rs.getString("action_name"));
				onlineActionBean.setAction_hit(rs.getInt("action_hit"));
				onlineActionBean.setAction_buy(rs.getInt("action_buy"));
				onlineActionBean.setAction_end(rs.getString("action_end"));

				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar nowcal = Calendar.getInstance(); // 현재 시간
				Calendar lastcal = Calendar.getInstance(); // 현재 시간 + 경매지정시간
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis()); // millis()로 변환후 계산
				hours = TimeUnit.MILLISECONDS.toHours(mill);
				minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours);

				onlineActionBean.setAction_date(format.format(rs.getTimestamp("action_date")));
				onlineActionBean.setSetAction_date_day(format.format(lastcal.getTime()));
				if(minutes < 0 || hours < 0) {
					if(onlineActionBean.getAction_buy() > 0) {	
						if(onlineActionBean.getAction_end().equals("end")) {
							onlineActionBean.setAction_time("경매 종료");
						}
						else if(onlineActionBean.getAction_end().equals("cancel")) {
							onlineActionBean.setAction_time("경매 취소");
						}
						else {
							onlineActionBean.setAction_time("거래 대기");
						}				
					}
					else {
						onlineActionBean.setAction_time("경매 종료");					
					}	
				}
				else {
					onlineActionBean.setAction_time(hours + "시 " + minutes + "분 ");
				}
				articleList.add(onlineActionBean);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public OnlineActionBean selectArticle(int action_num) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OnlineActionBean actionbean = new OnlineActionBean(); 
		long mill;
		long hours;
		long minutes;
		long seconds;
		
		try{						
			pstmt = con.prepareStatement(
					"select * from mvc_online_action where action_num = ?");
			pstmt.setInt(1, action_num);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				actionbean.setAction_num(rs.getInt("action_num"));
				actionbean.setAction_start_money(rs.getInt("action_start_money"));
				actionbean.setAction_kind(rs.getString("action_kind"));
				actionbean.setAction_quick(rs.getString("action_quick"));
				actionbean.setAction_adult(rs.getString("action_adult"));
				actionbean.setAction_file(rs.getString("action_file"));
				actionbean.setAction_sellid(rs.getString("action_sellid"));
				actionbean.setAction_name(rs.getString("action_name"));
				actionbean.setAction_hit(rs.getInt("action_hit"));
				actionbean.setAction_buy(rs.getInt("action_buy"));
				actionbean.setAction_content(rs.getString("action_content"));	
				actionbean.setAction_date(rs.getString("action_date"));
				actionbean.setAction_end(rs.getString("action_end"));
				actionbean.setAction_end_time(rs.getInt("action_time"));
				
				
				//System.out.println(actionbean.getAction_date());
				//System.out.println(actionbean.getAction_date_end());
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar nowcal = Calendar.getInstance();
				Calendar lastcal = Calendar.getInstance();
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				//System.out.println(format.format(nowcal.getTime()));
				//System.out.println(format.format(lastcal.getTime()));	
				//System.out.println(nowcal.getTimeInMillis());
				//System.out.println(lastcal.getTimeInMillis());'
				mill = Math.abs((lastcal.getTimeInMillis()- nowcal.getTimeInMillis()));
		
				hours = TimeUnit.MILLISECONDS.toHours(mill);
				minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours);
				seconds = TimeUnit.MILLISECONDS.toSeconds(mill) - TimeUnit.MINUTES.toSeconds(minutes);
				//System.out.println(mill);
				//System.out.println(hours);
				//System.out.println(minutes);
				//System.out.println(seconds);

				actionbean.setAction_date(format.format(rs.getTimestamp("action_date")));
				actionbean.setSetAction_date_day(format.format(lastcal.getTime()));
				//actionbean.setAction_time(hours + "시 " + minutes + "분 " + seconds + "초");
				actionbean.setAction_time(format.format(lastcal.getTime()));
			}			
			
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return actionbean;
	}

	public int updateReadCount(int action_num) {

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update mvc_online_action set action_hit = "+
				"action_hit+1 where action_num = " + action_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
			
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}
		return updateCount;
	}
	public int updateActionCount(int action_num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update mvc_online_action set action_buy = "+
				"action_buy+1 where action_num = " + action_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
			
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}
		return updateCount;
		
	}

	public int insertArticle(OnlineActionNowBean onlineActionNowBean) {
		PreparedStatement pstmt = null;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into mvc_online_action_action values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, onlineActionNowBean.getAction_num());
			pstmt.setString(2, onlineActionNowBean.getAction_buyid());
			pstmt.setInt(3, onlineActionNowBean.getAction_end_money());

			updateActionCount(onlineActionNowBean.getAction_num());
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(pstmt);
		}
		return insertCount;
	}

	public OnlineActionNowBean selectAjaxMoneyArticle(int action_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OnlineActionNowBean actionbean = new OnlineActionNowBean(); 

		try{
			pstmt = con.prepareStatement(
					"select max(action_end_money) from mvc_online_action_action where action_num = ?");
			pstmt.setInt(1, action_num);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				actionbean.setAction_end_money(rs.getInt("max(action_end_money)"));
			}
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return actionbean;
	}

	public ArrayList<OnlineActionNowBean> selectNowMoneyArticleList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OnlineActionNowBean> actionbean = new ArrayList<OnlineActionNowBean>();

		try{
			pstmt = con.prepareStatement("select action_num,max(action_end_money) from mvc_online_action_action group by action_num");
			rs= pstmt.executeQuery();

			while(rs.next()){	
				OnlineActionNowBean bean = new OnlineActionNowBean(); 
				bean.setAction_num(rs.getInt("action_num"));
				bean.setAction_end_money(rs.getInt("max(action_end_money)"));
		
				actionbean.add(bean);
			}
			
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return actionbean;
	}

	public OnlineActionTotalBean selectTotalAction(int action_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OnlineActionTotalBean actionbean = new OnlineActionTotalBean();

		try{
			pstmt = con.prepareStatement("select action_buyid,action_end_money,action_sellid from mvc_online_action m,mvc_online_action_action s where m.action_num = s.action_num and s.action_num=? and action_end_money = (select max(action_end_money) from mvc_online_action m,mvc_online_action_action s where m.action_num = s.action_num and s.action_num=?)");
			pstmt.setInt(1, action_num);
			pstmt.setInt(2, action_num);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				actionbean.setAction_buyid(rs.getString("action_buyid"));
				actionbean.setAction_end_money(rs.getInt("action_end_money"));
				actionbean.setAction_sellid(rs.getString("action_sellid"));
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return actionbean;
	}

	public OnlineActionTotalBean selectSignupId(String action_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OnlineActionTotalBean actionbean = new OnlineActionTotalBean();

		try{
			pstmt = con.prepareStatement("select * from mymenu m,signup s where s.id = m.id and s.id = ?");
			pstmt.setString(1, action_id);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				actionbean.setId(rs.getString("id"));
				actionbean.setMy_buygrd(rs.getInt("my_buygrd"));
				actionbean.setMy_sellgrd(rs.getInt("my_sellgrd"));
				actionbean.setSign_name(rs.getString("sign_name"));
				actionbean.setSign_tell(rs.getString("sign_tell"));
				actionbean.setSign_email(rs.getString("sign_email"));
				actionbean.setSign_addr(rs.getString("sign_addr"));
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return actionbean;
	}

	public int insertbuyidsellid(OnlineActionTotalBean onlineActionTotalBean) {
		PreparedStatement pstmt = null;
		int insertcount = 0;
		
		try {
			String sql="insert into mvc_online_action_end values(?,?,0,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, onlineActionTotalBean.getAction_num());
			pstmt.setString(2, onlineActionTotalBean.getAction_buyid());
			pstmt.setString(3, onlineActionTotalBean.getAction_sellid());
			
			insertcount = pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(pstmt);
		}	
		return insertcount;
	}

	public int updatesellid(OnlineActionTotalBean onlineActionTotalBean) {
		PreparedStatement pstmt = null;
		int updatecount = 0;
		
		try {
			String sql="update mvc_online_action_end set action_sellid_chk=1 where action_num=? and action_sellid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, onlineActionTotalBean.getAction_num());
			pstmt.setString(2, onlineActionTotalBean.getAction_sellid());
			
			updatecount = pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("1");
		}finally{
			close(pstmt);
		}	
		return updatecount;
	}

	public int updatebuyid(OnlineActionTotalBean onlineActionTotalBean) {
		PreparedStatement pstmt = null;
		int updatecount = 0;
		
		try {
			String sql="update mvc_online_action_end set action_buyid_chk=1 where action_num=? and action_buyid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, onlineActionTotalBean.getAction_num());
			pstmt.setString(2, onlineActionTotalBean.getAction_buyid());
			
			updatecount = pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("2");
		}finally{
			close(pstmt);
		}	
		return updatecount;
	}

	public OnlineActionTotalBean getActionEnd(int action_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OnlineActionTotalBean actionbean = new OnlineActionTotalBean();

		try{
			pstmt = con.prepareStatement("select * from mvc_online_action_end m,mvc_online_action s where m.action_num=s.action_num and s.action_num=?;");
			pstmt.setInt(1, action_num);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				actionbean.setAction_num(rs.getInt("s.action_num"));
				actionbean.setAction_buyid(rs.getString("action_buyid"));
				actionbean.setAction_buyid_chk(rs.getInt("action_buyid_chk"));
				actionbean.setAction_sellid(rs.getString("action_sellid"));
				actionbean.setAction_sellid_chk(rs.getInt("action_sellid_chk"));
				actionbean.setAction_end(rs.getString("action_end"));
			}
			else {
				actionbean.setAction_num(0);
				actionbean.setAction_buyid("널");
				actionbean.setAction_buyid_chk(0);
				actionbean.setAction_sellid("널");
				actionbean.setAction_sellid_chk(0);
				actionbean.setAction_end("start");
			}

		}catch(Exception ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}
		return actionbean;
	}

	public int updateEndDate(int action_num) {
		PreparedStatement pstmt = null;
		int updatecount = 0;
		
		try {
			String sql="update mvc_online_action set action_end='end' where action_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, action_num);
		
			updatecount = pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("3");
		}finally{
			close(pstmt);
		}	
		return updatecount;
	}

	public void updateEndMoney(OnlineActionTotalBean action_end) {
		PreparedStatement pstmt = null;
		
		try {
			String sql="update mymenu set my_point=my_point-? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, action_end.getAction_end_money());
			pstmt.setString(2, action_end.getAction_buyid());	
			pstmt.executeUpdate();	

		}catch(Exception ex){
			System.out.println("4");
		}finally{
			close(pstmt);
		}	
	}

	public void updateEndMoneyty(OnlineActionTotalBean action_end) {
		PreparedStatement pstmt = null;
		
		try {	
			String sql="update mymenu set my_point=my_point+? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, action_end.getAction_end_money());
			pstmt.setString(2, action_end.getAction_sellid());	
			pstmt.executeUpdate();		

		}catch(Exception ex){
			System.out.println("5");
		}finally{
			close(pstmt);
		}	
	}

	public void updateEndGradeBuy(String buy_id) {
		PreparedStatement pstmt = null;
		
		try {	
			String sql="update mymenu set my_buygrd=my_buygrd+1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, buy_id);
			pstmt.executeUpdate();		

		}catch(Exception ex){
			System.out.println("6");
		}finally{
			close(pstmt);
		}
		
	}

	public void updateEndGradeSell(String sell_id) {
		PreparedStatement pstmt = null;
		
		try {	
			String sql="update mymenu set my_sellgrd=my_sellgrd+1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sell_id);	
			pstmt.executeUpdate();		

		}catch(Exception ex){
			System.out.println("7");
		}finally{
			close(pstmt);
		}
		
	}

	public void updateBuyIdGrd(String buy_id) {
		PreparedStatement pstmt = null;
		
		try {	
			String sql="update mymenu set my_buygrd=my_buygrd-1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, buy_id);	
			pstmt.executeUpdate();		

		}catch(Exception ex){
			System.out.println("8");
		}finally{
			close(pstmt);
		}
	}

	public void updateSellIdGrd(String sell_id) {
		PreparedStatement pstmt = null;
		
		try {	
			String sql="update mymenu set my_sellgrd=my_sellgrd-1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sell_id);	
			pstmt.executeUpdate();	

		}catch(Exception ex){
			System.out.println("9");
		}finally{
			close(pstmt);
		}
	}

	public void onlineActionCancel(int action_num) {
		PreparedStatement pstmt = null;
		
		try {
			String sql="update mvc_online_action set action_end='cancel' where action_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, action_num);
		
			pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("10");
		}finally{
			close(pstmt);
		}	
	}

	public void insertOnlineChat(int action_num, String id, String action_chat) {
		PreparedStatement pstmt = null;
		
		try {
			String sql="insert into chat values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, action_num);
			pstmt.setString(2, id);
			pstmt.setString(3, action_chat);
			
			pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(pstmt);
		}	
	}

	public ArrayList<OnlineActionChatBean> selectOnlineChat(int action_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from chat where action_num=?";
		ArrayList<OnlineActionChatBean> articleList = new ArrayList<OnlineActionChatBean>();
		OnlineActionChatBean onlineActionChatBean = null;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setInt(1, action_num);
			rs = pstmt.executeQuery();

			while(rs.next()){
				onlineActionChatBean = new OnlineActionChatBean();
				onlineActionChatBean.setAction_num(rs.getInt("action_num"));
				onlineActionChatBean.setId(rs.getString("id"));
				onlineActionChatBean.setMsg(rs.getString("msg"));
				articleList.add(onlineActionChatBean);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public int selectListCountHot() {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select * from mvc_online_action where action_end='start' and date_add(action_date,interval action_time hour) > now()");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public int selectListCountRandom() {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from mvc_online_action where action_end='start' and date_add(action_date,interval action_time hour) > now()");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public int selectListCountToday() {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from mvc_online_action where action_end='start' and date_add(action_date,interval action_time hour) > now() and (date_add(action_date,interval action_time hour) - now()) < 1000000");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<OnlineActionBean> selectArticleListRandom(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from mvc_online_action where action_end='start' and date_add(action_date,interval action_time hour) > now() order by rand() limit ?,12";
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		OnlineActionBean onlineActionBean = null;
		int startrow=(page-1)*12; 	
		long mill;
		long hours;
		long minutes;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				onlineActionBean = new OnlineActionBean();
				onlineActionBean.setAction_num(rs.getInt("action_num"));	
				onlineActionBean.setAction_date(rs.getString("action_date"));
				onlineActionBean.setAction_start_money(rs.getInt("action_start_money"));
				onlineActionBean.setAction_kind(rs.getString("action_kind"));
				onlineActionBean.setAction_quick(rs.getString("action_quick"));
				onlineActionBean.setAction_adult(rs.getString("action_adult"));
				onlineActionBean.setAction_file(rs.getString("action_file"));
				onlineActionBean.setAction_sellid(rs.getString("action_sellid"));
				onlineActionBean.setAction_name(rs.getString("action_name"));
				onlineActionBean.setAction_hit(rs.getInt("action_hit"));
				onlineActionBean.setAction_buy(rs.getInt("action_buy"));
				onlineActionBean.setAction_end(rs.getString("action_end"));

				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar nowcal = Calendar.getInstance(); // 현재 시간
				Calendar lastcal = Calendar.getInstance(); // 현재 시간 + 경매지정시간
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis()); // millis()로 변환후 계산
				hours = TimeUnit.MILLISECONDS.toHours(mill);
				minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours);

				onlineActionBean.setAction_date(format.format(rs.getTimestamp("action_date")));
				onlineActionBean.setSetAction_date_day(format.format(lastcal.getTime()));
				if(minutes < 0 || hours < 0) {
					if(onlineActionBean.getAction_buy() > 0) {	
						if(onlineActionBean.getAction_end().equals("end")) {
							onlineActionBean.setAction_time("경매 종료");
						}
						else if(onlineActionBean.getAction_end().equals("cancel")) {
							onlineActionBean.setAction_time("경매 취소");
						}
						else {
							onlineActionBean.setAction_time("거래 대기");
						}				
					}
					else {
						onlineActionBean.setAction_time("경매 종료");					
					}	
				}
				else {
					onlineActionBean.setAction_time(hours + "시 " + minutes + "분 ");
				}
				articleList.add(onlineActionBean);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public ArrayList<OnlineActionBean> selectArticleListHot(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from mvc_online_action where action_end='start' and date_add(action_date,interval action_time hour) > now() order by action_buy desc,action_num desc limit ?,12";
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		OnlineActionBean onlineActionBean = null;
		int startrow=(page-1)*12; 	
		long mill;
		long hours;
		long minutes;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				onlineActionBean = new OnlineActionBean();
				onlineActionBean.setAction_num(rs.getInt("action_num"));	
				onlineActionBean.setAction_date(rs.getString("action_date"));
				onlineActionBean.setAction_start_money(rs.getInt("action_start_money"));
				onlineActionBean.setAction_kind(rs.getString("action_kind"));
				onlineActionBean.setAction_quick(rs.getString("action_quick"));
				onlineActionBean.setAction_adult(rs.getString("action_adult"));
				onlineActionBean.setAction_file(rs.getString("action_file"));
				onlineActionBean.setAction_sellid(rs.getString("action_sellid"));
				onlineActionBean.setAction_name(rs.getString("action_name"));
				onlineActionBean.setAction_hit(rs.getInt("action_hit"));
				onlineActionBean.setAction_buy(rs.getInt("action_buy"));
				onlineActionBean.setAction_end(rs.getString("action_end"));

				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar nowcal = Calendar.getInstance(); // 현재 시간
				Calendar lastcal = Calendar.getInstance(); // 현재 시간 + 경매지정시간
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis()); // millis()로 변환후 계산
				hours = TimeUnit.MILLISECONDS.toHours(mill);
				minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours);

				onlineActionBean.setAction_date(format.format(rs.getTimestamp("action_date")));
				onlineActionBean.setSetAction_date_day(format.format(lastcal.getTime()));
				if(minutes < 0 || hours < 0) {
					if(onlineActionBean.getAction_buy() > 0) {	
						if(onlineActionBean.getAction_end().equals("end")) {
							onlineActionBean.setAction_time("경매 종료");
						}
						else if(onlineActionBean.getAction_end().equals("cancel")) {
							onlineActionBean.setAction_time("경매 취소");
						}
						else {
							onlineActionBean.setAction_time("거래 대기");
						}				
					}
					else {
						onlineActionBean.setAction_time("경매 종료");					
					}	
				}
				else {
					onlineActionBean.setAction_time(hours + "시 " + minutes + "분 ");
				}
				articleList.add(onlineActionBean);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public ArrayList<OnlineActionBean> selectArticleListToday(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from mvc_online_action where action_end='start' "
								+ "and date_add(action_date,interval action_time hour) > now() "
								+ "and (date_add(action_date,interval action_time hour) "
								+ "- now()) < 1000000 "
								+ "order by (date_add(action_date,interval action_time hour) - now()) "
								+ "asc limit ?,12";
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		OnlineActionBean onlineActionBean = null;
		int startrow=(page-1)*12; 	
		long mill;
		long hours;
		long minutes;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				onlineActionBean = new OnlineActionBean();
				onlineActionBean.setAction_num(rs.getInt("action_num"));	
				onlineActionBean.setAction_date(rs.getString("action_date"));
				onlineActionBean.setAction_start_money(rs.getInt("action_start_money"));
				onlineActionBean.setAction_kind(rs.getString("action_kind"));
				onlineActionBean.setAction_quick(rs.getString("action_quick"));
				onlineActionBean.setAction_adult(rs.getString("action_adult"));
				onlineActionBean.setAction_file(rs.getString("action_file"));
				onlineActionBean.setAction_sellid(rs.getString("action_sellid"));
				onlineActionBean.setAction_name(rs.getString("action_name"));
				onlineActionBean.setAction_hit(rs.getInt("action_hit"));
				onlineActionBean.setAction_buy(rs.getInt("action_buy"));
				onlineActionBean.setAction_end(rs.getString("action_end"));

				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar nowcal = Calendar.getInstance(); // 현재 시간
				Calendar lastcal = Calendar.getInstance(); // 현재 시간 + 경매지정시간
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis()); // millis()로 변환후 계산
				hours = TimeUnit.MILLISECONDS.toHours(mill);
				minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours);

				onlineActionBean.setAction_date(format.format(rs.getTimestamp("action_date")));
				onlineActionBean.setSetAction_date_day(format.format(lastcal.getTime()));
				if(minutes < 0 || hours < 0) {
					if(onlineActionBean.getAction_buy() > 0) {	
						if(onlineActionBean.getAction_end().equals("end")) {
							onlineActionBean.setAction_time("경매 종료");
						}
						else if(onlineActionBean.getAction_end().equals("cancel")) {
							onlineActionBean.setAction_time("경매 취소");
						}
						else {
							onlineActionBean.setAction_time("거래 대기");
						}				
					}
					else {
						onlineActionBean.setAction_time("경매 종료");					
					}	
				}
				else {
					onlineActionBean.setAction_time(hours + "시 " + minutes + "분 ");
				}
				articleList.add(onlineActionBean);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}







}