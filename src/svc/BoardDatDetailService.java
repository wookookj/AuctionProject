package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardDatBean;

import static db.JdbcUtil.*;

public class BoardDatDetailService {

	public ArrayList<BoardDatBean> getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		ArrayList<BoardDatBean> article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		article = boardDAO.boarddat_selectArticle(board_num);
		close(con);
		return article;
		
	}

}
