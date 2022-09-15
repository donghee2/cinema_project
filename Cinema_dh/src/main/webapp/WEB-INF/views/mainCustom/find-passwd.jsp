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
			var d = "userEmail=" + $("#id").val() + $("#email").val() + "&userName=" + $("#userName").val() + "&userTel=" + $("#userTel").val();
			console.log(d);
			$.ajax({
				url: "findPasswd.do",
				data: d,
				dataType: "json",
				success: function(r){
					console.log(r);
					console.log(r[0].userEmail);
					var tag = "";
					tag += '<form action="updatePasswd.do" method="post"><input type="text" name="userEmail" value="'+ r[0].userEmail +'"><br>';
					tag += '<input type="password" name="userPasswd" placeholder="새 비밀번호 입력"><br>';
					tag += '<input type="password" name="userPasswdChk" placeholder="비밀번호 확인"><br>';
					tag += '<button type="submit">비밀번호 변경</button></form>';
					$(".find_result").html(tag);
				}
			})
		})
	});
</script>
</head>
<body>
	<div class="slider sliderv2">
		<div class="find-container">
		<h2>비밀번호 찾기</h2>
		<div class="input_wrap">
			<div class="semi_title">가입정보를 입력하시면 아이디를 확인하실 수 있습니다.</div>
			<div class="login_area">
				<div class="input_area">
					<div>
						<input type="text" name="id" id="id" placeholder="아이디(이메일)" />
						<select name="email" id="email">
							<option value="@gmail.com">@gmail.com</option>
							<option value="@naver.com">@naver.com</option>
							<option value="@nate.com">@nate.com</option>
							<option value="@hanmail.net">@hanmail.net</option>
						</select>
					</div>
					<div><input type="text" name="userName" id="userName" placeholder="이름" /></div>
					<div><input type="text" name="userTel" id="userTel" placeholder="휴대폰번호는 -를 제외하고 입력하세요" /></div>
					<div class="find_result"></div>
				</div>
				<div class="btn_area">
					<button id="btn_find">비밀번호 찾기</button>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>