package mvcboard.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvcboard.dto.Board;
import mvcboard.dto.Page;
import mvcborad.dao.BoardDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	
	
	// view forward 해야한다 : boardList.jsp
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1) 파라미터 요청 (기본값 설정)
		int currentPage = 1;
		int rowPerPage = 5;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		// 2) 페이징 계산
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		
		// 3) DAO 호출
		BoardDao dao = new BoardDao();
		ArrayList<Board> list = dao.selectBoardList(page); // 현재 페이지
		int totalCount = dao.selectBoardCount(); // 총 게시글
		
		// 4) 전체 페이지 계싼
		int lastPage = totalCount / rowPerPage;
		if (totalCount % rowPerPage !=0) {
			lastPage += 1;
			
		}
		
		// 5) View 로 데이터 전달
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("lastPage", lastPage);
		
		// 6) 목록으로 포워딩
		request.getRequestDispatcher("/WEB-INF/view/boardList.jsp").forward(request, response);
	}

}
