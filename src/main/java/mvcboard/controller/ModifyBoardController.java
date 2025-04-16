package mvcboard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvcboard.dto.Board;
import mvcborad.dao.BoardDao;

import java.io.IOException;


@WebServlet("/modifyBoard")
public class ModifyBoardController extends HttpServlet {

	// 수정폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDao dao = new BoardDao();
		Board board = dao.selectBoardOne(boardNo);
		
		if (board == null) {
			response.sendRedirect(request.getContextPath()+"/boardList");
			return;
		}
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("/WEB-INF/view/modifyBoard.jsp").forward(request, response);
	}

	// 수정액션
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardPw = request.getParameter("boardPw");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
	
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setBoardPw(boardPw);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		
		BoardDao dao = new BoardDao();
		int row = dao.updateBoard(board);
		
		if (row ==1) {
			response.sendRedirect(request.getContextPath() + "/boardOne?boardNo=" + boardNo);
		} else {
			// 비밀번호 틀렸거나 수정 실패 시 다시 수정 폼
			response.sendRedirect(request.getContextPath() + "/modifyBoard?boardNo=" + boardNo + "&error=1");
		}
	}

}
