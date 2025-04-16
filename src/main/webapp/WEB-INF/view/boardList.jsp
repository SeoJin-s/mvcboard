<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvcboard.dto.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	a, strong {
		margin: 0 3px;
		text-decoration: none;
		font-weight: bold;
	}
</style>
</head>
<body>
	<h1>목록</h1>
	<a href="${pageContext.request.contextPath}/addBoard">글쓰기</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<%
			ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
			for (Board b : list) {
		%>
		<tr>
			<td><%= b.getBoardNo() %></td>
			<td><a href="boardOne?boardNo=<%= b.getBoardNo() %>"><%= b.getBoardTitle() %></a></td>
			<td><%= b.getBoardUser() %></td>
			<td><%= b.getBoardDate() %></td>
		</tr>
		<% } %>
	</table>

	<!-- 페이징 -->
	<div style="margin-top: 20px;">
	<%
		Integer currentPageObj = (Integer) request.getAttribute("currentPage");
		Integer lastPageObj = (Integer) request.getAttribute("lastPage");

		int currentPage = (currentPageObj != null) ? currentPageObj.intValue() : 1;
		int lastPage = (lastPageObj != null) ? lastPageObj.intValue() : 1;

		// [처음] 버튼
		if (currentPage > 1) {
	%>
		<a href="boardList?currentPage=1">[처음]</a>
	<%
		}

		// [이전] 버튼
		if (currentPage > 1) {
	%>
		<a href="boardList?currentPage=<%= currentPage - 1 %>">[이전]</a>
	<%
		}

		// 페이지 번호 출력
		for (int i = 1; i <= lastPage; i++) {
			if (i == currentPage) {
	%>
			<strong>[<%= i %>]</strong>
	<%
			} else {
	%>
			<a href="boardList?currentPage=<%= i %>">[<%= i %>]</a>
	<%
			}
		}

		// [다음] 버튼
		if (currentPage < lastPage) {
	%>
		<a href="boardList?currentPage=<%= currentPage + 1 %>">[다음]</a>
	<%
		}

		// [마지막] 버튼
		if (currentPage < lastPage) {
	%>
		<a href="boardList?currentPage=<%= lastPage %>">[마지막]</a>
	<%
		}
	%>
</div>
</body>
</html>