<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

</head>
<body>
<section>
	<h2>로그인</h2>
	<form action="login.do" method="post">
		<input type="text" name="userEmail" id="email" placeholder="이메일을 입력하세요">
		<input type="password" name="userPasswd" id="passwd" placeholder="비밀번호를 입력하세요">
		<button>로그인</button>
	</form>
	<a href="registerView.do">회원가입</a>
</section>
</body>
</html>