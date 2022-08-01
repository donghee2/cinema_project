<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<section>
		<form action="register.do" method="post">
			<label for="userEmail">아이디</label>
			<input type="text" name="userEmail">
			<label for="userPasswd">비밀번호</label>
			<input type="text" name="userPasswd">
			<label for="userPasswd_chk">비밀번호확인</label>
			<input type="text" name="userPasswd_chk">
			<label for="userName">이름</label>
			<input type="text" name="userName">
			<label for="userNick">닉네임</label>
			<input type="text" name="userNick">
			<label for="userTel">핸드폰 번호</label>
			<input type="text" name="userTel">
			<label for="address">주소</label>
			<input type="text" name="address">
			<button>회원가입</button>
			<button>취소</button>
		</form>
	</section>
</body>
</html>