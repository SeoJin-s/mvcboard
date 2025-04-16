package mvcboard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvcborad.dao.BoardDao;

import java.io.IOException;

@WebServlet("/removeBoard")
public class RemoveBoardController extends HttpServlet {
	@Override
	// 삭제폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String error = request.getParameter("error");
		
		request.setAttribute("boardNo", boardNo);
		request.setAttribute("error", error);
		
		request.getRequestDispatcher("/WEB-INF/view/removeBoard.jsp").forward(request, response);
	}
	
	// 삭제액션
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardPw = request.getParameter("boardPw");
		
		BoardDao dao = new BoardDao();
		int row = dao.deleteBoard(boardNo, boardPw);
		
		if (row ==1) {
			response.sendRedirect(request.getContextPath() + "/boardList");
		} else {
			// 비밀번호 틀렸거나 수정 실패 시 다시 수정 폼
			response.sendRedirect(request.getContextPath() + "/removeBoard?boardNo=" + boardNo + "&error=1");
		}
	}	
}
