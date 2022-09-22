<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.empty{
		display: inline-block;
	}
	.seat{
		display: inline-block;
		width: 50px;
		height: 50px;
		text-decoration: none;
		font-weight: bold;
		color: white;
		text-align: center;
		background-color: rgb(2,13,24);
		background-size: 50px;
		background-image: url("images/seaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(2,13,24);
	}
	.seat:disabled{
		color: gray;
		background-color: rgb(2,13,24);
		background-size: 50px;
		background-image: url("images/rseaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(2,13,24);
	}
	.empty{
		width: 50px;
		height: 50px;
		background-color: rgb(2,13,24);
	}
	.clicked {
        color: white;
		background-color: rgb(2,13,24);
		background-size: 50px;
		background-image: url("images/sseaticon.png");
		background-repeat: no-repeat;
		background-position: -2px 0px;
		box-sizing: border-box;
		border: 2px solid rgb(4, 57, 152);
		border-radius: 5px;
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
	<div class="buster-light">
		<div class="hero common-hero">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="hero-ct">
							<h1>Seat Selection</h1>
							<ul class="breadcumb">
								<li class="active"><a href="#">Home</a></li>
								<li><span class="ion-ios-arrow-right"></span>Seat Selection</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="topbar-filter fw">
						<div class="reserve-container">
							<form id="frm">
								${tag }
								<button type="button" class="booking">예매하기</button>
							</form>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	
</body>
</html>