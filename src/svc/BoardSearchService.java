package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardSearchService {

	public ArrayList<BoardBean> getArticleList(int page, int limit,String cho, String search) throws Exception{
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);

		if(cho.equals("작성자")) {
			articleList = boardDAO.selectSearchId(page,limit,search);
		}
		else if(cho.equals("제목")) {
			articleList = boardDAO.selectSearchTitle(page,limit,search);
		}
		else if(cho.equals("번호")){	
			articleList = boardDAO.selectSearchNum(page,limit,search);
		}
		else if(cho.equals("내용")){
			articleList = boardDAO.selectSearchContent(page,limit,search);
		}
		close(con);
		return articleList;
	}
	
	public int getListCount(String cho, String search) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		if(cho.equals("작성자")) {
			listCount = boardDAO.selectSearchId(search);
		}
		else if(cho.equals("제목")) {
			listCount = boardDAO.selectSearchTitle(search);
		}
		else if(cho.equals("번호")){	
			listCount = 1;
		}
		else if(cho.equals("내용")){
			listCount = boardDAO.selectSearchContent(search);
		}
	
		close(con);
		return listCount;
		
	}

}
