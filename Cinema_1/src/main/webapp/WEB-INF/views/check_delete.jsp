<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h2>회원탈퇴</h2>
		<form action="delete.do" method="post">
			<label for="userEmail">이메일</label>
			<input type="text" name="userEmail">
			<label for="userPasswd">비밀번호</label>
			<input type="password" name="userPasswd">
			<button>회원탈퇴</button>
		</form>
	</section>
</body>
</html>