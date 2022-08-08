<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<section>
		<table>
			<tr>
				<th>이메일</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>핸드폰 번호</th>
				<th>주소</th>
				<th>포인트</th>
				<th>비고</th>
			</tr>
			<c:forEach var="m" items="${requestScope.list }">
				<tr>
					<td><input type="text" name="userEmail" value="${m.userEmail }" readonly></td>
					<td><input type="password" name="userPasswd" value="${m.userPasswd}"></td>
					<td><input type="text" name="userName" value="${m.userName}"></td>
					<td><input type="text" name="userNick" value="${m.userNick}"></td>
					<td><input type="text" name="userTel" value="${m.userTel}"></td>
					<td><input type="text" name="address" value="${m.address}"></td>
					<td><input type="text" name="point" value="${m.point}"></td>
					<td><button>수정</button> / <button>회원탈퇴</button></td>
				</tr>
			</c:forEach>
	</section>
</body>
</html>