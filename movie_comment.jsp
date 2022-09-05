<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".comment_form textarea").keyup(function() {
			$(this).next().text($(this).val().length+"/500");
		});
		$(".comment_form button").click(function(){
			var data = $("#comment").serialize();
			$.ajax({
				url : "insertComment.do",
				data : data,
				method:"get",
				success:function(d){
					if(d == 1){
						alert("댓글 등록 성공");
					}else{
						alert("댓글 등록 실패");
					}
					location.reload();	
				}
			});
		});
</script>
</head>
<body>
	<c:if test="${sessionScope.login == true }">
		<div class="comment_form">
			<form id="comment">
				<input type="hidden" name="writer" value="${sessionScope.userEmail }">
				<span class="writer">${sessionScope.userEmail }</span>
				<textarea name="content" maxlength="500"></textarea>
				<p class="length">0/500</p>
				<hr>
				<p style="text-align: right;">
					<button type="button">등록</button>
				</p>
			</form>
		</div>
	</c:if>

</body>
</html>