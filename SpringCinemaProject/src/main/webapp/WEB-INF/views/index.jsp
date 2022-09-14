<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html lang="en" class="no-js">
<head>
<!-- Basic need -->
<title>Main Page</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<link rel="profile" href="#">
<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<!-- CSS files -->
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
	
.reserve-container {
    margin-top: 20px;
    margin-bottom: 20px;
    display: flex;
    width: 100%;
    justify-content: center;
    height: 800px;
    /* border: 1px solid #dddddd; */
}

.reserve-container>div {
    border: 1px solid #dddddd;
}

.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: rgb(7,24,41);
    text-align: center;
    color: #CCE2FF;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.movie-part {
    width: 284px;
}

.theater-part {
    width: 264px;
}

.day-part {
    width: 91px;
}

.time-part {
    width: 384px;
}

.sort-wrapper {
    margin: 10px 6px 6px 10px;
    /* padding: 3px; */
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}

.sort-wrapper>div {
    padding: 3px;
}

.sort-wrapper>div:hover {
    border-bottom: 1px solid #111111;
}

.sort-selected {
    font-weight: bold;
    border-bottom: 1px solid #111111;
}

.sort-korean {
    margin-left: 6px;
}

.reserve-date {
    padding-top: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 770px;
    overflow: hidden;
    overflow-x: hidden;
}

.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
    color: #abb7c4;
    background-color: rgb(7,24,41);
}

.movie-week-of-day {
    margin-left: 5px;
    font-size: 10px;
    width: 12px;
    height: 22px;
    line-height: 22px;
}

.movie-day {
    text-align: center;
    width: 34px;
    height: 22px;
    font-size: 17px;
    font-weight: bold;
}

.saturday {
    color: #31597E;
    font-weight: bold;
}

.sunday {
    color: #AF2D2D;
    font-weight: bold;
}

.movie-date-wrapper-active {
    background-color: rgb(7,24,41);
    border: 2px solid rgb(220,248,54);
}

.movie-date-wrapper-active>* {
    color: rgb(220,248,54);

}

.age-limit{
	width: 25px;
	height: 25px;
}

.movie-list {
	margin: 10px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    border: 2px solid rgb(2,13,24);
}

.movie-list-active {
    background-color: rgb(7,24,41);
    border: 2px solid rgb(220,248,54);
}

.movie-list-active > input {
    color: rgb(220,248,54);
    font-weight: bold;
}

.movie-list-wrapper {
    padding: 5px 2px;
    color: #abb7c4;
    background-color: rgb(2,13,24);
    border: none;
    margin-left: 10px;
}

.screen-list {
	margin: 10px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    border: 2px solid rgb(2,13,24);
}

.screen-list-active {
    background-color: rgb(7,24,41);
    border: 2px solid rgb(220,248,54);
}

.screen-list-wrapper {
    padding: 5px 2px;
    color: #abb7c4;
    background-color: rgb(2,13,24);
    border: none;
    margin-left: 10px;
}

.screen-list-active > input {
    color: rgb(220,248,54);
    font-weight: bold;
    border-radius: 10px;
}

.time-title{
    margin: 20px;
}

.time-title-wrapper{
	color: #abb7c4;
    background-color: rgb(2,13,24);
}

.time-list{
	margin-left: 10px;
}

.time-list-wrapper{
	color: #abb7c4;
    background-color: rgb(2,13,24);
    margin-left: 5px;
    border: 1px solid white;
    padding: 5px;
}
.time-list-hidden{
	color: #abb7c4;
    background-color: rgb(2,13,24);
    margin-left: 5px;
    border: 1px solid white;
    padding: 5px;
}
.today-word{
	color: white;
}
.today{
	margin-top: 20px;
	color: white;
	font-size: 70px;
}
.box_layer{
	position:absolute;
	width:350px;
	height:150px;
	overflow:auto;
	background:#eaeaea;
	right:0px;
	top:0px;
	z-index:999;
	border:2px solid #0084dc;
	-webkit-border-radius:10px;
	-moz-border-radius:10px;
	border-radius:10px;
}
</style>
</head>
<body>
	
	<!--signup/login 및 preload form popup 시작 부분-->
	<jsp:include page="template/loading_sign.jsp" flush="false"></jsp:include>
	<!--signup/login 및 preload form popup 시작 부분-->
	<!-- Header 시작 부분 -->
	<jsp:include page="template/header.jsp" flush="false"></jsp:include>
	<!-- Header 끝 부분 -->
	
	<!-- content section 시작 부분 -->
	
	<div class="buster-light">
		<div class="hero common-hero">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="hero-ct">
							<h1>Movie Reservation - Special Experience</h1>
							<ul class="breadcumb">
								<li class="active"><a href="#">Home</a></li>
								<li><span class="ion-ios-arrow-right"></span>movie reservation</li>
							</ul>
							<h2 class="today-word">TODAY</h2>
							<h3 class="today"></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content test 시작 부분  -->
	<div class="page-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="topbar-filter fw">
						<div class="reserve-container">
					        <div class="movie-part">
					            <div class="reserve-title">영화</div>
					            <div class="sort-wrapper">
					                <div class="sort-rate sort-selected">예매율순</div>
					                <div class="sort-korean">가나다순</div>
					            </div>
					            <c:forEach var="c" items="${requestScope.movielist }">
									<div class="movie-list"><img class="age-limit" src="/images/19age.png"><input class="movie-list-wrapper" type="button" value="${c.title }"><input type="hidden" name="mcode" value="${c.mcode}"></div>
								</c:forEach>
					        </div>
					        <div class="theater-part">
					            <div class="reserve-title">극장</div>
					             <c:forEach var="c" items="${requestScope.screenlist }">
									<div class="screen-list"><input class="screen-list-wrapper" type="button" value="${c.cinemaName }"><input type=hidden name="screencode" value="${c.screenCode}"></div>
								</c:forEach>
					        </div>	
					        <div class="day-part">
					            <div class="reserve-title">날짜</div>
					            <div class="reserve-date"></div>
					        </div>
					        <div class="time-part">
					            <div class="reserve-title">시간</div>
					        </div>
				   		</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content test 끝 부분  -->
	
	<!-- content section 끝 부분 -->
	
	<!-- footer section 시작 부분 -->
	<jsp:include page="template/footer.jsp" flush="false"></jsp:include>
	<!-- footer section 끝 부분-->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/plugins2.js"></script>
	<script src="js/custom.js"></script>
	<script>
        const date = new Date();
        // console.log(date.getFullYear());
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        const reserveDate = document.querySelector(".reserve-date");
		console.log(date.getDate());
		console.log(lastDay.getDate());
		$(".today").html(date.getFullYear() +"/"+ date.getMonth() +"/"+ date.getDate());
		console.log(date.getFullYear() +"/"+ date.getMonth() +"/"+ date.getDate());
      
            const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
            const year = date.getFullYear();
            const month = date.getMonth() + 1;
            console.log(month);
            var count = 0;
            for (i = date.getDate(); i <= lastDay.getDate(); i++) {

                const button = document.createElement("button");
                const spanWeekOfDay = document.createElement("span");
                const spanDay = document.createElement("span");

                //class넣기
                button.classList = "movie-date-wrapper"
                spanWeekOfDay.classList = "movie-week-of-day";
                spanDay.classList = "movie-day";

                //weekOfDay[new Date(2020-03-날짜)]
                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                //요일 넣기
                if (dayOfWeek === "토") {
                    spanWeekOfDay.classList.add("saturday");
                    spanDay.classList.add("saturday");
                } else if (dayOfWeek === "일") {
                    spanWeekOfDay.classList.add("sunday");
                    spanDay.classList.add("sunday");
                }
                spanWeekOfDay.innerHTML = dayOfWeek;
                button.append(spanWeekOfDay);
                //날짜 넣기
                spanDay.innerHTML = i;
                button.append(spanDay);
                //button.append(i);
                reserveDate.append(button);
                count++;

            }
            if(count <= 20){
            	const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 1);
            	console.log(lastDay.getDate());
            	for (i = lastDay.getDate(); i <= lastDay.getDate() + 20 - count; i++) {
					
                    const button = document.createElement("button");
                    const spanWeekOfDay = document.createElement("span");
                    const spanDay = document.createElement("span");
                    const year = lastDay.getFullYear();
                    const month = lastDay.getMonth() + 1;
                    //class넣기
                    button.classList = "movie-date-wrapper"
                    spanWeekOfDay.classList = "movie-week-of-day";
                    spanDay.classList = "movie-day";

                    //weekOfDay[new Date(2020-03-날짜)]
                    const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                    //요일 넣기
                    if (dayOfWeek === "토") {
                        spanWeekOfDay.classList.add("saturday");
                        spanDay.classList.add("saturday");
                    } else if (dayOfWeek === "일") {
                        spanWeekOfDay.classList.add("sunday");
                        spanDay.classList.add("sunday");
                    }
                    spanWeekOfDay.innerHTML = dayOfWeek;
                    button.append(spanWeekOfDay);
                    //날짜 넣기
                    spanDay.innerHTML = i;
                    button.append(spanDay);
                    //button.append(i);
                    reserveDate.append(button);

                }
            	
            }
            
            var screenfirst = 0;
           	var moviefirst = 0;
            var datefirst = 0;
            
        $(document).on("click",".movie-date-wrapper",function(){
        	datefirst = 1;
        	if(moviefirst == 0){
        		alert("영화를 먼저 선택해주세요");
        		return;
        	}else if(screenfirst == 0){
        		alert("극장을 먼저 선택해주세요");
        		return;
        	}
        	$(".time-part").html("<div class='reserve-title'>시간</div>");
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                });
                $(this).addClass("movie-date-wrapper-active");
                var mcode = $(".movie-list-active").find("input[name='mcode']").val();
                var screencode = $(".screen-list-active").find("input[name='screencode']").val();
                var y = year.toString();
                var data = "mcode=" + mcode + "&screenCode=" + screencode + "&sdate=" + y.substring(2, 4) + '/0' + month + '/' + $(this).find(".movie-day").text();
                
                console.log(data);
                
                $.ajax({
    				url:"movieListView.do",
    				data : data,
    				dataType:"json",
    				success:function(r){
    					var tag = "<div class='reserve-title'>시간</div>";
    					for(i=0;i<r.length;i++){
    							
    							if(r[i].screenName.toString() == old){
    								tag += "<div class='time-list'><input class='time-list-wrapper' type='button' value='" + r[i].startTime + "'><input class='time-list-hidden' type='hidden' name='endTime' value='상영 종료 시간 : " + r[i].endTime + "'>";
    								tag += "<input type='hidden' name='screencode' value='" + r[i].screenCode + "'>";
    								tag += "<input type='hidden' name='timecode' value='" + r[i].timeCode + "'>";
    								tag += "<input type='hidden' name='mcode' value='" + r[i].mcode + "'></div>";
    							}
    							else{
    								tag += "<div class='time-title'><span class='time-title-wrapper'>" + r[i].screenName + "</span></div>";
    								tag += "<div class='time-list'><input class='time-list-wrapper' type='button' value='" + r[i].startTime + "'><input class='time-list-hidden' type='hidden' name='endTime' value='상영 종료 시간 : " + r[i].endTime + "'>";
    								tag += "<input type='hidden' name='screencode' value='" + r[i].screenCode + "'>";
    								tag += "<input type='hidden' name='timecode' value='" + r[i].timeCode + "'>";
    								tag += "<input type='hidden' name='mcode' value='" + r[i].mcode + "'></div>";
    							}
    							var old = r[i].screenName.toString();
    							console.log(old);
    					}
    					$(".time-part").html(tag);
    					}
    			});
                
                
        });
        
        $(document).on("click",".movie-list",function(){
        		moviefirst = 1;
        		screenfirst = 0;
        		datefirst = 0;
        		$(".time-part").html("<div class='reserve-title'>시간</div>");
            	const movieListActive = document.querySelectorAll(".movie-list-active");
        		movieListActive.forEach((list) => {
                    list.classList.remove("movie-list-active");
                });
    			$(this).addClass("movie-list-active");
    			
    			const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                });
    			
    			var d = "mcode=" + $(this).find("input[name='mcode']").val();
                console.log(d);
                $.ajax({
    				url:"screenListView.do",
    				data : d,
    				dataType:"json",
    				success:function(r){
    					var tag = "<div class='reserve-title'>극장</div>";
    					for(i=0;i<r.length;i++){
    						tag += "<div class='screen-list'><input class='screen-list-wrapper' type='button' value='"+r[i].cinemaName+"'><input type='hidden' name='screencode' value='" + r[i].screenCode + "'></div>";
    					}
    					$(".theater-part").html(tag);
    				}
    			});
        });
        
        $(document).on("click",".screen-list",function(){ 
        	screenfirst = 1;
        	if(moviefirst == 0){
        		alert("영화를 먼저 선택해주세요");
        		return;
        	}
        	screenfirst++;
        		const screenListActive = document.querySelectorAll("screen-list-active");
        		screenListActive.forEach((list) => {
                list.classList.remove("screen-list-active");
            })
				$(this).addClass("screen-list-active");
        });
        
        
        $(document).on("click",".time-list",function(){
        	
        	var d = "screenCode=" + $(this).find("input[name='screencode']").val();
        		d += "&timeCode=" + $(this).find("input[name='timecode']").val();
        		d += "&mcode=" + $(this).find("input[name='mcode']").val();
        		console.log(d);
        	$.ajax({
				url:"seatCreate.do",
				data : d,
				success:function(r){
					location.replace("seatView.do?tag=" + r);
				}
			});
        	
        });
        $(document).on("mouseover",".time-list",function(){
    		
			var obj = $(this);
			var tX = (obj.position().left + 30);
			var tY = (obj.position().top - 25);

	 		if($(this).find("input[name='endTime']").css("display") == "none"){
	 			$(this).find("input[name='endTime']").attr("type", "button");
	 				$(this).find("input[name='endTime']").css({
	 					"top" : tY
	 					,"left" : tX
	 					,"position" : "absolute"
	 				}).show();
	 		}
	 			
	 	});
     	$(document).on("mouseout",".time-list",function(){
			$(this).find("input[name='endTime']").attr("type", "hidden");
		});
				
    </script>
</body>
</html>