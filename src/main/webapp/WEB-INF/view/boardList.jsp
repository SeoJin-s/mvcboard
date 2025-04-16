<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mvcboard.dto.Board" %>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");

	Integer currentPageObj = (Integer) request.getAttribute("currentPage");
	Integer lastPageObj = (Integer) request.getAttribute("lastPage");

	int currentPage = (currentPageObj != null) ? currentPageObj : 1;
	int lastPage = (lastPageObj != null) ? lastPageObj : 1;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Custom Style -->
	<style>
		body {
			background-color: #ffffff;
			color: #212529;
			font-family: 'Segoe UI', sans-serif;
			padding: 30px;
		}
		.container {
			max-width: 800px;
			margin: auto;
		}
		.card {
			background-color: #f8f9fa;
			color: #212529;
			border: 1px solid #dee2e6;
			border-radius: 8px;
		}
		.card:hover {
			background-color: #e9ecef;
			transition: 0.2s;
		}
		a {
			color: #212529;
			text-decoration: none;
		}
		a:hover {
			color: #495057;
			text-decoration: underline;
		}
		.btn-custom {
			background-color: #495057;
			color: #ffffff;
			border: none;
		}
		.btn-custom:hover {
			background-color: #343a40;
		}
		.page-link {
			color: #495057;
			background-color: #f8f9fa;
			border: 1px solid #ced4da;
		}
		.page-item.active .page-link {
			background-color: #495057;
			color: #ffffff;
			border-color: #495057;
		}
	</style>
</head>
<body>
<div class="container">
	<h2 class="mb-4 text-center">📋</h2>

	<!-- 글쓰기 버튼 -->
	<div class="d-flex justify-content-end mb-3">
		<a href="${pageContext.request.contextPath}/addBoard" class="btn btn-sm btn-custom">+ 글쓰기</a>
	</div>

	<!-- 게시글 카드 리스트 -->
	<% if (list != null && list.size() > 0) {
		for (Board b : list) {
	%>
		<div class="card mb-3 shadow-sm">
			<div class="card-body">
				<h5 class="card-title mb-1">
					<a href="boardOne?boardNo=<%= b.getBoardNo() %>"><%= b.getBoardTitle() %></a>
				</h5>
				<p class="mb-1 text-muted">👤 <%= b.getBoardUser() %></p>
				<p class="mb-0 text-muted small">🕓 <%= b.getBoardDate() %></p>
			</div>
		</div>
	<% }
	} else { %>
		<div class="text-center text-muted">게시글이 없습니다.</div>
	<% } %>

	<!-- 페이징 -->
	<nav class="mt-4 d-flex justify-content-center">
		<ul class="pagination">
			<% if (currentPage > 1) { %>
				<li class="page-item"><a class="page-link" href="boardList?currentPage=1">처음</a></li>
				<li class="page-item"><a class="page-link" href="boardList?currentPage=<%= currentPage - 1 %>">이전</a></li>
			<% } %>

			<% for (int i = 1; i <= lastPage; i++) {
				boolean active = i == currentPage;
			%>
				<li class="page-item <%= active ? "active" : "" %>">
					<a class="page-link" href="boardList?currentPage=<%= i %>"><%= i %></a>
				</li>
			<% } %>

			<% if (currentPage < lastPage) { %>
				<li class="page-item"><a class="page-link" href="boardList?currentPage=<%= currentPage + 1 %>">다음</a></li>
				<li class="page-item"><a class="page-link" href="boardList?currentPage=<%= lastPage %>">마지막</a></li>
			<% } %>
		</ul>
	</nav>
</div>
</body>
</html>