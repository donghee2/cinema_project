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
		<h2>아이디 찾기</h2>
		<form action="findId.do">
			<label for="userName">이름</label>
			<input type="text" name="userName">
			<label for="userTel">핸드폰 번호</label>
			<input type="text" name="userTel">
			<button>아이디 찾기</button>
		</form>
		<div>
			<input type="text" name="userEmail" placeholder="${requestScope.find.userEmail }">
		</div>
	</section>
</body>
</html>