<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.mypage-container {
		width: 1200px;
		margin: 100px auto;
		border: 1px solid white;
		display: flex;
		flex-direction: row;
	}
	.my-profile {
		width: 400px;
		margin: 50px auto;
		border: 1px solid white;
	}
	.member-content {
		width: 700px;
		margin: 50px auto;
		border: 1px solid white;
		
	}
</style>
</head>
<body>
<div class="slider sliderv2">
	<div class="mypage-container">
		<div class="my-profile">
		<div>
			<h2 style="color: white;">닉네임님의 마이페이지</h2>
		</div>
			<a href="#">회원정보수정</a> || <a href="#">회원탈퇴</a>
		</div>
		<div class="member-content">
			<p>사용가능 포인트 : 22222</p>
		</div>
	</div>
</div>
</body>
</html>