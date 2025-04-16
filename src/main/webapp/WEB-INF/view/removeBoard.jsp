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
<title></title>
</head>
<body>
	<h2>글 삭제</h2>
	
	<% if ("1".equals(error)) { %>
		<p style="color:red;">비밀번호가 일치하지 않습니다.</p>
	<% } %>
	
		<form method="post" action="<%= request.getContextPath() %>/removeBoard">
			<input type="hidden" name="boardNo" value="<%= boardNo %>">
		
			<p>비밀번호: <input type="password" name="boardPw" required></p>
		
			<p>
			<button type="submit">삭제</button>
			<a href="<%= request.getContextPath() %>/boardOne?boardNo=<%= boardNo %>">취소</a>
		</p>
	</form>

</body>
</html>