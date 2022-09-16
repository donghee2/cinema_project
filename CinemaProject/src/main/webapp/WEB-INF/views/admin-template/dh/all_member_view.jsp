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
	function add_event_update(){   
		$(".btn_update").click(function(){
			var arr = $(this).parent().parent().find("input");
			var d = "";
			$.each(arr,function(i,obj){
				d += $(obj).attr("name") + "=" + $(obj).val() + "&";
			});
			$.ajax({
				url:"memberUpdate.do",
				data : d,
				type: "post",
				success:function(r){
					console.log(d)
					if(r == 1)
						alert("회원 정보 수정 완료");
					else 
						alert("회원 정보 수정 실패");
					location.reload();
				}
			});
		});
	}
	function add_event_delete(){
		$(".btn_delete").click(function(){
			var d = "userEmail="+ $(this).parent().parent().find("input[name=userEmail]").val();
			$.ajax({
				url:"memberDelete.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("회원 정보 삭제 완료");
					else 
						alert("회원 정보 삭제 실패");
					location.reload();
				}
			});
		});
	}
	
	$(function(){
		add_event_update();
		add_event_delete();
	});
</script>
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
				<th>생년월일</th>
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
					<td><input type="text" name="userBirth" value="${m.userBirth}"></td>
					<td><button class="btn_update">수정</button> / <button class="btn_delete">회원탈퇴</button></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>