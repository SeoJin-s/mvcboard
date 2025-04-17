<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvcboard.dto.Board" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	body { background: #fff; color: #212529; font-family: 'Segoe UI'; padding: 30px; }
	.container { max-width: 700px; margin: auto; }
	.card { background: #f8f9fa; border: 1px solid #ced4da; border-radius: 8px; padding: 20px; }
	.btn-custom { background: #495057; color: white; }
	.btn-custom:hover { background: #343a40; }
</style>
</head>
<body>
<%
	Board board = (Board) request.getAttribute("board");
	// 확인코드는 중요하다
	// 실무에서는 밑에 오브젝트 타입의 코드가 좋다. ( 검사를 하기 때문에 )
	/* 
	 Object o = request.getPagameter("board");
		Board board = null;
		if(obj instanceof Board) {
			board = (board)obj;
		}
		if(board != null) {
		열고 닫기 해야한다	
			//	<%=board.toSting()
		}
	*/
%>
<div class="container">
	<h2 class="mb-4">📄</h2>
	<div class="card">
		<h5><%= board.getBoardTitle() %></h5>
		<p class="text-muted mb-1">👤 <%= board.getBoardUser() %></p>
		<p class="text-muted">🕓 <%= board.getBoardDate() %></p>
		<hr>
		<p><%= board.getBoardContent().replace("\n", "<br>") %></p>
	</div>

	<div class="mt-3 d-flex gap-2">
		<a href="${pageContext.request.contextPath}/modifyBoard?boardNo=<%= board.getBoardNo() %>" class="btn btn-sm btn-custom">수정</a>
		<a href="${pageContext.request.contextPath}/removeBoard?boardNo=<%= board.getBoardNo() %>" class="btn btn-sm btn-danger">삭제</a>
		<a href="${pageContext.request.contextPath}/boardList" class="btn btn-sm btn-secondary">목록</a>
	</div>
</div>
</body>
</html>