<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<form action="update.do" method="post">
			<label for="userEmail">아이디</label>
			<input type="text" name="userEmail" value="${sessionScope.dto.userEmail }" readonly>
			<label for="userPasswd">비밀번호</label>
			<input type="password" name="userPasswd">
			<label for="userPasswd_chk">비밀번호확인</label>
			<input type="password" name="userPasswd_chk">
			<label for="userName">이름</label>
			<input type="text" name="userName" value="${sessionScope.dto.userName }">
			<label for="userNick">닉네임</label>
			<input type="text" name="userNick" value="${sessionScope.dto.userNick }">
			<label for="userTel">핸드폰 번호</label>
			<input type="text" name="userTel" value="${sessionScope.dto.userTel }">
			<label for="address">주소</label>
			<input type="text" name="address" value="${sessionScope.dto.address }">
			<button>정보수정</button><button type="button">취소</button>
		</form>
		<a href="deleteView.do">회원탈퇴</a>
	</section>
</body>
</html>