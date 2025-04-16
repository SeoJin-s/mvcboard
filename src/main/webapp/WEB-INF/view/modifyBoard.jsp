<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvcboard.dto.Board" %>
<%
	Board board = (Board) request.getAttribute("board");
	String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
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
<div class="container">
	<h2 class="mb-4">✏️</h2>
	<form method="post" action="${pageContext.request.contextPath}/modifyBoard">
		<input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>">
		<div class="mb-3">
			<label class="form-label">제목</label>
			<input type="text" name="boardTitle" class="form-control" value="<%= board.getBoardTitle() %>" required>
		</div>
		<div class="mb-3">
			<label class="form-label">내용</label>
			<textarea name="boardContent" class="form-control" rows="5" required><%= board.getBoardContent() %></textarea>
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호</label>
			<input type="password" name="boardPw" class="form-control" required>
		</div>
		<button type="submit" class="btn btn-custom">수정 완료</button>
		<a href="${pageContext.request.contextPath}/boardOne" class="btn btn-custom">뒤로</a>
	</form>
</div>
</body>
</html>