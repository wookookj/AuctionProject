package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardListArrService {

	public ArrayList<BoardBean> getArticleList(int page, int limit,String arr) throws Exception{
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);

			
		if(arr.equals("조회수↑")) {
			articleList = boardDAO.selectArrHitsdesc(page,limit);
		}
		else if(arr.equals("조회수↓")){	
			articleList = boardDAO.selectArrHitsasc(page,limit);
		}
		else if(arr.equals("번호↑")){
			articleList = boardDAO.selectArrNumdesc(page,limit);
		}
		else if(arr.equals("번호↓")){
			articleList = boardDAO.selectArrNumasc(page,limit);
		}
		close(con);
		return articleList;
	}
}
