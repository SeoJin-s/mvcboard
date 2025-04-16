package mvcboard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvcboard.dto.Board;
import mvcborad.dao.BoardDao;

import java.io.IOException;

@WebServlet("/boardOne")
public class BoardOneController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// view forward - boardOne.jsp
		
		try {
			// 1. 파라미터 요청
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			
			// 2. DAO 를 통해 게시글 조회
			BoardDao dao = new BoardDao();
			Board board = dao.selectBoardOne(boardNo);
			
			// 3. 조회 실패시 목록으로 리다이렉트
			if (board == null) {
				response.sendRedirect(request.getContextPath() + "/boardList");
				return;
			}
			
			// 4. jsp
			request.setAttribute("board", board);
			request.getRequestDispatcher("/WEB-INF/view/boardOne.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("예외발생");
			response.sendRedirect(request.getContextPath()+ "/boardList");
		}
	}

}
