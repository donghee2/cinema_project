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
			console.log("dd");
			var d = "userEmail=" + $("#userEmail").val() + "&userName=" + $("#userName").val() + "&userTel=" + $("#userTel").val();
			console.log(d);
			$.ajax({
				url: "findPasswd.do",
				data: d,
				dataType: "json",
				success: function(r){
					console.log(r);
					var tag = "";
					tag += '<form aution="updetePasswd.do"><input type="hidden" name="userEmail" value="'+ r.userEmail +'"><br>';
					tag += '<input type="password" name="userPasswd" placeholder="새 비밀번호 입력"><br>';
					tag += '<input type="password" name="userPasswdChk" placeholder="비밀번호 확인"><br>';
					tag += '<button>비밀번호 변경<button></form>';
					$(".find_result").html(tag);
				}
			})
		})
	});
</script>
</head>
<body>
	<section>
		<h2>아이디 찾기</h2>
		<form action="findPasswd.do">
			<label for="userEmail">이메일</label>
			<input type="text" name="userEmail" id="userEmail">
			<label for="userName">이름</label>
			<input type="text" name="userName" id="userName">
			<label for="userTel">핸드폰 번호</label>
			<input type="text" name="userTel" id="userTel">
		</form>
			<button id="btn_find">비밀번호 찾기</button>
		<div class="find_result">
			
		</div>
	</section>
</body>
</html>