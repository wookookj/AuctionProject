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
import vo.MypageBean;
import vo.OnlineActionBean;
import vo.OnlineActionBuyBean;
import vo.OnlineActionNowBean;

public class MypageDAO {

	DataSource ds;
	Connection con;
	private static MypageDAO MypageDAO;

	private MypageDAO() {
	}

	public static MypageDAO getInstance(){
		if(MypageDAO == null){
			MypageDAO = new MypageDAO();
		}
		return MypageDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	public int updateEmoney(String id, int emoney) {	
		PreparedStatement pstmt = null;
		int result = 0;
		try{		
			pstmt = con.prepareStatement("update mymenu set my_point=my_point+? where id=?");
			pstmt.setInt(1, emoney);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}		
		return result;
	}

	public MypageBean selectEmoney(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MypageBean mypagebean = new MypageBean();
		try{
			pstmt = con.prepareStatement(
					"select * from mymenu where id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();

			if(rs.next()){	
				mypagebean.setId(rs.getString("id"));
				mypagebean.setMy_point(rs.getInt("my_point"));
				mypagebean.setMy_buygrd(rs.getInt("my_buygrd"));
				mypagebean.setMy_sellgrd(rs.getInt("my_sellgrd"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return mypagebean;
	}

	public ArrayList<OnlineActionBean> selectArticleList(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from mvc_online_action where action_sellid=? order by action_num desc";
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		OnlineActionBean onlineActionBean = null;	
		long mill;
		long hours;
		long minutes;
		long seconds;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setString(1, id);
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
				Calendar nowcal = Calendar.getInstance();
				Calendar lastcal = Calendar.getInstance();
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis());
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

	public ArrayList<OnlineActionNowBean> selectNowMoneyArticleList(String id) {
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

	public ArrayList<OnlineActionBuyBean> selectArticleBuyList(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select action_end,s.action_num,action_buy,action_file,"
								+ "action_time,max(action_end_money),"
								+ "action_start_money,action_date,action_time "
								+ "from mvc_online_action m,mvc_online_action_action s "
								+ "where m.action_num=s.action_num and action_buyid=? "
								+ "group by s.action_num desc";
		ArrayList<OnlineActionBuyBean> articleList = new ArrayList<OnlineActionBuyBean>();
		OnlineActionBuyBean onlineActionBuyBean = null;	
		long mill;
		long hours;
		long minutes;

		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()){
				onlineActionBuyBean = new OnlineActionBuyBean();
				onlineActionBuyBean.setAction_num(rs.getInt("action_num"));
				onlineActionBuyBean.setAction_buy(rs.getInt("action_buy"));
				onlineActionBuyBean.setAction_file(rs.getString("action_file"));
				onlineActionBuyBean.setAction_start_money(rs.getInt("action_start_money"));
				onlineActionBuyBean.setAction_end_money(rs.getInt("max(action_end_money)"));
				onlineActionBuyBean.setAction_end(rs.getString("action_end"));
						
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar nowcal = Calendar.getInstance();
				Calendar lastcal = Calendar.getInstance();
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis());
				hours = TimeUnit.MILLISECONDS.toHours(mill);
				minutes = TimeUnit.MILLISECONDS.toMinutes(mill) - TimeUnit.HOURS.toMinutes(hours);

				//onlineActionBuyBean.setAction_date(format.format(rs.getTimestamp("action_date")));
				//onlineActionBuyBean.setSetAction_date_day(format.format(lastcal.getTime()));
				if(minutes < 0 || hours < 0) {
					if(onlineActionBuyBean.getAction_buy() > 0) {		
						if(onlineActionBuyBean.getAction_end().equals("end")) {
							onlineActionBuyBean.setAction_time("경매 종료");
						}
						else if(onlineActionBuyBean.getAction_end().equals("cancel")) {
							onlineActionBuyBean.setAction_time("경매 취소");
						}
						else {
							onlineActionBuyBean.setAction_time("거래 대기");
						}
					}
					else {
						onlineActionBuyBean.setAction_time("경매 종료");
					}	
				}
				else {
					onlineActionBuyBean.setAction_time(hours + "시 " + minutes + "분 ");
				}
				articleList.add(onlineActionBuyBean);
			}

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public int insertMylist(String id, OnlineActionBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkmylist = 0;
		int insertCount = 0;
		
		try{
			
			pstmt=con.prepareStatement("select * from mylist where mylist_id=? and action_num=?");
			pstmt.setString(1,id);
			pstmt.setInt(2, article.getAction_num());
			rs = pstmt.executeQuery();
			if(rs.next())
				checkmylist = 0;
			else
				checkmylist = 1;
			
			if(checkmylist == 1) {
				String sql="insert into mylist values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default)";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, article.getAction_num());	
				pstmt.setString(3, article.getAction_date());
				pstmt.setString(4, article.getAction_end());
				pstmt.setInt(5, article.getAction_start_money());
				pstmt.setString(6, article.getAction_kind());
				pstmt.setString(7, article.getAction_quick());
				pstmt.setString(8, article.getAction_adult());
				pstmt.setString(9, article.getAction_file());
				pstmt.setString(10, article.getAction_sellid());
				pstmt.setString(11, article.getAction_name());
				pstmt.setInt(12, article.getAction_hit());
				pstmt.setInt(13, article.getAction_buy());
				pstmt.setInt(14, article.getAction_end_time());
				pstmt.setString(15, article.getAction_content());
				
				insertCount=pstmt.executeUpdate();
			}


		}catch(Exception ex){
		}finally{
			close(pstmt);
		}
		return insertCount;
	}

	public ArrayList<OnlineActionBean> selectMylist(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String online_list_sql = "select * from mylist where mylist_id = ? "
								+ "order by action_regist_date desc";		
		ArrayList<OnlineActionBean> articleList = new ArrayList<OnlineActionBean>();
		long mill;
		long hours;
		long minutes;
		try{
			pstmt = con.prepareStatement(online_list_sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()){
				OnlineActionBean onlineActionBean = new OnlineActionBean();
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
				Calendar nowcal = Calendar.getInstance();
				Calendar lastcal = Calendar.getInstance();
				lastcal.setTime(rs.getTimestamp("action_date"));
				lastcal.add(Calendar.HOUR, rs.getInt("action_time"));
				
				mill = (lastcal.getTimeInMillis()- nowcal.getTimeInMillis());
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
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	public int deleteMylist(String id, int action_num) {
		PreparedStatement pstmt = null;
		int result = 0;
		try{		
			pstmt = con.prepareStatement("delete from mylist where mylist_id=? and action_num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, action_num);
			result = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}		
		return result;
	}









}