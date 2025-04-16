<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>작성</h1>
	<form method="post" action="<%= request.getContextPath() %>/addBoard">
		<div>
			<label>작성자</label><br>
			<input type="text" name="boardUser" required>
		</div>
			<div>
			<label>비밀번호</label><br>
			<input type="password" name="boardPw" required>
		</div>
			<div>
			<label>제목</label><br>
			<input type="text" name="boardTitle" required>
		</div>
			<div>
			<label>내용</label><br>
			<textarea name="boardContent" rows="5" cols="40" required></textarea>
		</div>
		<div>
			<button type="submit">작성완료</button>
		</div>
	</form>
</body>
</html>