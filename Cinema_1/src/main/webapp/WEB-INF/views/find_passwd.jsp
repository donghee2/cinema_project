<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn_find").click(function(){
			$(".find_result").html("<input type='password' name='userPasswd'>");
		});	
	});
</script>
</head>
<body>
	<section>
		<h2>아이디 찾기</h2>
		<form action="findPasswd.do">
			<label for="userEmail">이메일</label>
			<input type="text" name="userEmail">
			<label for="userName">이름</label>
			<input type="text" name="userName">
			<label for="userTel">핸드폰 번호</label>
			<input type="text" name="userTel">
			<button id="btn_find">비밀번호 찾기</button>
		</form>
		<div class="find_result">
			
		</div>
	</section>
</body>
</html>