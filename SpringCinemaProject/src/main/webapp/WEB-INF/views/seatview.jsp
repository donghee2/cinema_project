<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		display: inline-block;
	}
	input{
		display: inline-block;
		width: 50px;
		height: 50px;
		text-decoration: none;
		color: black;
		text-align: center;
	}
	.empty{
		width: 50px;
		height: 50px;
		background-color: lightgray;
	}
	.clicked {
            background-color: lightblue;
            color: white;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var seatList = new Array();
		seatList.push($("input[name=screenCode]").val());
		seatList.push($("input[name=timeCode]").val());
		seatList.push($("input[name=mcode]").val());
		$(".seat").click(function () {
			if($(this).hasClass("clicked")){
				$(this).removeClass("clicked");
				seatList.splice(seatList.indexOf($(this).val()), 1);
				console.log(seatList);
			}else{
				$(this).addClass("clicked");
				seatList.push($(this).val());
				console.log(seatList);
			}
		});
		$(".booking").click(function () {
			console.log(seatList);
			$.ajax({
				url:'booking.do',
				traditional : true,
				data : {"seatList" : seatList},
				dataType : "json",
				type : 'post',
				success:function(r){
					alert("예매 완료");
				}
			});
		});
	});
</script>
</head>
<body>
	<div>
		<form id="frm">
			${requestScope.tag }
			<button type="button" class="booking">예매하기</button>
		</form>
	</div>
	
</body>
</html>