<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">

</script>
<script>
$(function(){
	$(".search_btn").click(function() {
	    var s;
	    s = "&releaseDts"+'='+$("#releaseDts").val();
	    s += "&title"+'='+$("#title").val();
	    console.log(s);
	       $.ajax({
	          url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=94TY52485SP98PB338TU'+s,
	           type:'get',
	          dataType:'json',
	          success:function(r){
	             console.log(r);
	             console.log(r.totalcount);
	             if(r.TotalCount == 1)
	             var actorNm = "";
	             var actorEnNm = "";
	             var title = r.Data[0].Result[0].title.replace('!HS', '');
	             title = title.replace('!HE', '');
	             title = title.replace(/ /g, "");
	             $('#movie_title_kr').val(title);
	             $('#movie_title_eng').val(r.Data[0].Result[0].titleEng);
	             $('#directorNm').val(r.Data[0].Result[0].directors.director[0].directorNm);
	             $('#directorEnNm').val(r.Data[0].Result[0].directors.director[0].directorEnNm);
	             for(y=0;y<r.Data[0].Result[0].actors.actor.length;y++){
	                   if(y>8)break;
	                   actorNm += r.Data[0].Result[0].actors.actor[y].actorNm + " ,";
	                }
	             actorNm = actorNm.slice(0, -1);
	             $('#actorNm').val(actorNm);
	             for(y=0;y<r.Data[0].Result[0].actors.actor.length;y++){
	                   if(y>8)break;
	                   actorEnNm += r.Data[0].Result[0].actors.actor[y].actorEnNm + " ,";
	                }
	             actorEnNm = actorEnNm.slice(0, -1);
	             $('#actorEnNm').val(actorEnNm);
	             $('#company').val(r.Data[0].Result[0].company);
	             $('#nation').val(r.Data[0].Result[0].nation);
	             $('#genre').val(r.Data[0].Result[0].genre);
	             $('#rating').val(r.Data[0].Result[0].rating);
	             $('#runtime').val(r.Data[0].Result[0].runtime);
	             $('#repRlsDate').val(r.Data[0].Result[0].repRlsDate);
	             $('#keywords').val(r.Data[0].Result[0].keywords);
	             $('#kmdbUrl').val(r.Data[0].Result[0].kmdbUrl);
	             $('#plotText').val(r.Data[0].Result[0].plots.plot[0].plotText);
	             
	            
	          },
	          error:function(xhr, textStaus, errorThrow){
	             /* console.log("code : ",xhr.status);
	             console.log("message : ",xhr.responseText);
	             console.log("error : ",errorThrow);
	             console.log("textStaus : ",textStaus);
	             var tag = "<tr><td colspan='6' style='text-align:center'>"
	                                     +xhr.responseText+"</td></tr>";
	             $("tbody").html(tag); */
	          }
	       });
	    });
	
	
	
$("#imageFile1").on("change", function(event) {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview1").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$("#imageFile2").on("change", function(event) {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview2").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$("#imageFile3").on("change", function(event) {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview3").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$("#imageFile4").on("change", function(event) {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview4").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$("#imageFile5").on("change", function(event) {

    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview5").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
});
function isImageFile(file) {

    var ext = file.name.split(".").pop().toLowerCase(); 

    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}
function isOverSize(file) {

    var maxSize = 3 * 1024 * 1024; 

    return (file.size > maxSize) ? true : false;
}
$(function(){
	var count = 3;
	$("#plus").click(function(){
		console.log(count);
		if(count == 5) return;
		count++;
		$(".setimgcontainer").append("<div><img id=preview"+count+"><br><input type='file' id=imageFile"+count+" name=file></div>");
	});
	$("#minus").click(function(){
		console.log(count);
		if(count == 1) return;
			$("#preview"+count).remove();
			$("#imageFile"+count).remove();
		count--;
	});
});
	var flag = 0;
function search_hide_show(){
	if(flag == 0){
	document.getElementById("layout").style.display = "";
	document.getElementById("title").focus();
		flag=1;
	}
	else{
		document.getElementById("layout").style.display = "none";	
		flag=0;
	}
} 

</script>
  <style>
    li {
      list-style: none;
    }

    img {
      width: 200px;
      height: 200px;
    }

    .real-upload {
      display: none;
    }

    .upload {
      width: 200px;
      height: 200px;
      background-color: antiquewhite;
    }

    .image-preview {
      width: 200px;
      height: 200px;
      background-color: aquamarine;
      display: flex;
      gap: 20px;
    }
    .setimgcontainer{
   		display:flex;
    }
    
    
    .form-group {
	position: relative;
	width: 200px;
}
.form-input {
	position: relative;
	font-family: "Source Sans Pro", sans-serif;
	font-weight: 600;
	width: 100%;
	height: 40px;
	border: none;
	padding: 0 10px;
	box-shadow: none;
	outline: none;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
p{
	position: relative;
	font-family: "Source Sans Pro", sans-serif;
	font-weight: 600;
	width: 100%;
	height: 20px;
	border: none;
	box-shadow: none;
	outline: none;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
textarea{
position: relative;
	font-family: "Source Sans Pro", sans-serif;
	font-weight: 600;
	
}

/* Border bottom effects */
.form-input.border-bottom {
	position: relative;
	background: transparent;
	padding: 0;
	border-bottom: 2px solid rgba(0, 0, 0, .2);
}
.form-input.border-bottom ~ .border-bottom-animation {
	position: absolute;
	content: "";
	width: 0;
	background: rgba(0, 0, 0, .2);
	height: 2px;
	z-index: 99;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
/* Border bottom left */
.form-input.border-bottom ~ .border-bottom-animation.left {
	left: 0;
	bottom: 0;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.left {
	background: #4285F4;
	width: 100%;
}
/* Border bottom right */
.form-input.border-bottom ~ .border-bottom-animation.right {
	right: 0;
	bottom: 0;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.right {
	background: #4285F4;
	width: 100%;
}
/* Border bottom center */
.form-input.border-bottom ~ .border-bottom-animation.center {
	left: 0;
	right: 0;
	bottom: 0;
	margin: 0 auto;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.center {
	background: #4285F4;
	width: 100%;
}
/* Border bottom both side */
.form-input.border-bottom ~ .border-bottom-animation.both-side {
	height: 0px;
	width: 100%;
	left: 0;
	right: 0;
	bottom: 0;
}
.form-input.border-bottom ~ .border-bottom-animation.both-side:before,
.form-input.border-bottom ~ .border-bottom-animation.both-side:after {
	position: absolute;
	content: " ";
	bottom: 0;
	width: 0;
	height: 2px;
	-webkit-transition: all .5s ease;
	   -moz-transition: all .5s ease;
	    -ms-transition: all .5s ease;
	     -o-transition: all .5s ease;
	        transition: all .5s ease;
}
.form-input.border-bottom ~ .border-bottom-animation.both-side:before {
	left: 0;
}
.form-input.border-bottom ~ .border-bottom-animation.both-side:after {
	right: 0;
}
.form-input.border-bottom:focus ~ .border-bottom-animation.both-side:before,
.form-input.border-bottom:focus ~ .border-bottom-animation.both-side:after {
	background: #4285F4;
	width: 50%;
}
.layout {
  width: 500px;
  height: 100%px;

  display: flex;
  gap: 16px;
  align-items: center;
  flex-wrap: wrap;
  
}
.layout1 {
  width: 500px;
  height: 100%px;

  display: flex;
  gap: 16px;
  align-items: center;
  flex-wrap: wrap;
  
}
.layout2 {
  width: 1000px;
  height: 100%px;

  display: flex;
  gap: 16px;
  align-items: center;
  flex-wrap: wrap;
  
}
.search_btn{
	width: 40px;
	height: 30px;
}
.search_container{
	border: 2px solid rgba(0, 0, 0, .2);
	padding: 10px;
	margin-bottom: 20px;
	display: flex;
	flex-wrap: wrap;
	width: 100%;
}
.search_hide{
	display: flex;
	align-items: center;
}
.search_hide div{
	border: 2px solid rgba(0, 0, 0, .2);
	border-radius: 50%;
	font-size: 16px;
	width:30px;
	height:30px;
	text-align: center;
	line-height: 28px; 
	font-weight: bold;
	margin-left: 10px;
}

  </style>
</head>
<body>
		<form id="file_form" action="uploadmovie.do" method="post" enctype="multipart/form-data">
		<div class="search_container">
		<div class="search_hide" style="width: 100%">
		<h2>검색해서 정보 넣기</h2><div><a onclick="search_hide_show()" href="#">+</a></div>
		</div>
		<section id="layout" class="layout1" style="display: none">
		<div class="form-group">
		<input type="text" id="title" class="form-input border-bottom" placeholder="영화 제목">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="releaseDts" class="form-input border-bottom" placeholder="개봉연도">
		<span class="border-bottom-animation left"></span>
		</div>
		<a class="search_btn" href="#">검색</a>
		</section>
		</div>
		<div class="search_container">
		<section  class="layout">
		<div class="form-group">
		<input type="text" id="movie_title_kr" class="form-input border-bottom" placeholder="영화 제목(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="movie_title_eng" class="form-input border-bottom" placeholder="영화 제목(영)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="directorNm" class="form-input border-bottom" placeholder="감독(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="directorEnNm" class="form-input border-bottom" placeholder="감독(영)">
		<span class="border-bottom-animation left"></span>
		</div>
		<section  class="layout2">
		<div class="form-group" style="width: 83%">
		<input type="text" id="actorNm" class="form-input border-bottom" placeholder="배우(한)">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" id="actorEnNm" class="form-input border-bottom" placeholder="배우(영)">
		<span class="border-bottom-animation left"></span>
		</div>
		</section>
		<div class="form-group">
		<input type="text" id="company" class="form-input border-bottom" placeholder="제작사">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="nation" class="form-input border-bottom" placeholder="국가">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="genre" class="form-input border-bottom" placeholder="장르">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="rating" class="form-input border-bottom" placeholder="관람 등급">
		<span class="border-bottom-animation left"></span>
		</div>
		</section>
		<section  class="layout">
		<div class="form-group">
		<input type="text" id="runtime" class="form-input border-bottom" placeholder="상영시간">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="repRlsDate" class="form-input border-bottom" placeholder="개봉일">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" id="keywords" class="form-input border-bottom" placeholder="키워드">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" id="kmdbUrl" class="form-input border-bottom" placeholder="상세보기 페이지">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group" style="width: 83%">
		<input type="text" id="trailer" class="form-input border-bottom" placeholder="예고편 링크">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="startdate" class="form-input border-bottom" placeholder="상영 시작 날짜">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		<input type="text" id="enddate" class="form-input border-bottom" placeholder="상영 종료 날짜">
		<span class="border-bottom-animation left"></span>
		</div>
		<div class="form-group">
		</div>
		<div class="form-group">
		</div>
		<div class="form-group">
		</div>
		</section>
		<section  class="layout">
		<div class="form-group" >
		<p>줄거리</p>
		<textarea  id="plotText" rows="20" cols="60" name="plotText"placeholder=""></textarea>
		</div>
		</section>
			<section  class="layout">
			<div class="setimgcontainer">
		<div>
		<img id="preview1" ><br>
		<input type="file" id="imageFile1" name="file">
		</div>
		<div>
		<img id="preview2"><br>
		<input type="file" id="imageFile2" name="file">
		</div>
		<div>
		<img id="preview3"><br>
		<input type="file" id="imageFile3" name="file">
		</div>
		</div>
		<button type="button" id="plus">+</button> <button type="button" id="minus">-</button>
		<br>
		<p><button>업로드</button></p>
			</section>
		</div>
		
	</form>
</body>
</html>