<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btn_find").click(function(){
			console.log("dd");
			var d = "userName=" + $("#userName").val() + "&userTel=" + $("#userTel").val();
			console.log(d);
			$.ajax({
				url: "findId.do",
				data: d,
				dataType: "json",
				success: function(r){
					console.log(r);
					var tag = "";
					tag += '<input type="text" name="userEmail" placeholder="'+ r[0].userEmail +'">';
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
		<form id="frm">
			<label for="userName">이름</label>
			<input type="text" name="userName" id="userName">
			<label for="userTel">핸드폰 번호</label>
			<input type="text" name="userTel" id="userTel">
		</form>
			<button id="btn_find">아이디 찾기</button>
		<div class="find_result">
			<!--<input type="text" name="userEmail" placeholder="${requestScope.find.userEmail }">  -->
		</div>
	</section>
</body>
</html>