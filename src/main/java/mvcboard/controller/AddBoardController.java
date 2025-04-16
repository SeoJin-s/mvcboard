package mvcboard.controller;

import java.io.IOException;
import java.net.Authenticator.RequestorType;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvcboard.dto.Board;
import mvcborad.dao.BoardDao;

@WebServlet("/addBoard")
public class AddBoardController extends HttpServlet{
	
	// 입력폼을 처리	-  view 가 있음 - view forward
	@Override
	protected void doGet(HttpServletRequest Request, HttpServletResponse Response) throws ServletException, IOException {
		// 협업하겠다. 협업 방식은 포워드랑 인클루드가 있다
		Request.getRequestDispatcher("/WEB-INF/view/addBoard.jsp").forward(Request, Response);	
	}
	
	// 입력 액션 	- redirect
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 요청분석
		String boardPw = request.getParameter("boardPw");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardUser = request.getParameter("boardUser");
	
		Board board = new Board();
		board.setBoardPw(boardPw);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setBoardUser(boardUser);
		
		//디버깅
		System.out.println("AddBoardController.doPost: "+board.toString());
		
		// 2) 모델
		BoardDao dao = new BoardDao();
		int row = dao.insertBoard(board);
		
		if (row ==1) {
			System.out.println("게시글 입력 성공");
		} else {
			System.out.println("게시글 입력 실패");
		}
		
		// 3) 목록으로 리디렉트
		response.sendRedirect(request.getContextPath() + "/boardList");
	}
}
