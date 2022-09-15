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
		<h2>비회원 예매</h2>
		<form action="guestLogin.do">
			<label for="gEmail">이메일</label>
			<input type="text" name="gEmail">
			<label for="gName">이름</label>
			<input type="text" name="gName">
			<button>비회원 로그인</button>
		</form>
	</section>
</body>
</html>