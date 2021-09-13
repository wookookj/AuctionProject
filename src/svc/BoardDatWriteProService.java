package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import vo.BoardDatBean;

import static db.JdbcUtil.*;
public class BoardDatWriteProService {

	public boolean registArticle(BoardDatBean boardBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.boarddat_insertArticle(boardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
