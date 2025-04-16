<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvcboard.dto.Board" %>
<%
	String error = (String) request.getAttribute("error");
	int boardNo = (int) request.getAttribute("boardNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	body { background: #fff; color: #212529; font-family: 'Segoe UI'; padding: 30px; }
	.container { max-width: 600px; margin: auto; }
	.card { background: #f8f9fa; border: 1px solid #ced4da; border-radius: 8px; padding: 20px; }
	.btn-custom { background: #495057; color: white; }
	.btn-custom:hover { background: #343a40; }
</style>
</head>
<body>
<div class="container">
	<h2 class="mb-4">🗑️</h2>
	<div class="card">
		<% if ("1".equals(error)) { %>
			<p class="text-danger">비밀번호가 일치하지 않습니다.</p>
		<% } %>
		<form method="post" action="${pageContext.request.contextPath}/removeBoard">
			<input type="hidden" name="boardNo" value="<%= boardNo %>">
			<div class="mb-3">
				<label class="form-label">비밀번호 입력</label>
				<input type="password" name="boardPw" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-custom">삭제</button>
			<a href="${pageContext.request.contextPath}/boardOne?boardNo=<%= boardNo %>" class="btn btn-secondary">취소</a>
		</form>
	</div>
</div>
</body>
</html>
</html>