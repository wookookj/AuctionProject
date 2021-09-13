package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.BoardBean;
import vo.BoardDatBean;
import dao.BoardDAO;

public class BoardDatModifyProService {

	public boolean modifyArticle(BoardDatBean article) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.boarddatupdate(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}
}
