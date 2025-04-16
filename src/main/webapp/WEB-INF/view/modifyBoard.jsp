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
<title></title>
</head>
<body>
	<h2>글 수정</h2>

	<% if ("1".equals(error)) { %>
		<p style="color:red;">비밀번호가 일치하지 않습니다.</p>
	<% } %>
	
	<form method="post" action="<%= request.getContextPath() %>/modifyBoard">
	<input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>">
	
	<p>제목: <input type="text" name="boardTitle" value="<%= board.getBoardTitle() %>" required></p>
	<p>내용:<br>
		<textarea name="boardContent" rows="5" cols="50"><%= board.getBoardContent() %></textarea>
	</p>
	<p>비밀번호: <input type="password" name="boardPw" required></p>
	
	<p>
		<button type="submit">수정 완료</button>
		<a href="<%= request.getContextPath() %>/boardOne?boardNo=<%= board.getBoardNo() %>">취소</a>
	</p>
</form>
</body>
</html>