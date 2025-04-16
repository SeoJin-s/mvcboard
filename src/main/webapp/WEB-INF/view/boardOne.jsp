<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvcboard.dto.Board" %>
<%
	Board board = (Board) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>상세보기</h1>
	<p><strong>번호:</strong> <%= board.getBoardNo() %></p>
	<p><strong>제목:</strong> <%= board.getBoardTitle() %></p>
	<p><strong>작성자:</strong> <%= board.getBoardUser() %></p>
	<p><strong>작성일:</strong> <%= board.getBoardDate() %></p>
	<p><strong>내용:</strong> <%= board.getBoardContent().replace("\n", "<br>") %></p>
	
	<a href="<%= request.getContextPath() %>/modifyBoard?boardNo=<%= board.getBoardNo() %>">수정</a>
	<a href="<%= request.getContextPath() %>/removeBoard?boardNo=<%= board.getBoardNo() %>">삭제</a>
	<a href="<%= request.getContextPath() %>/boardList">← 목록으로</a>
</body>
</html>