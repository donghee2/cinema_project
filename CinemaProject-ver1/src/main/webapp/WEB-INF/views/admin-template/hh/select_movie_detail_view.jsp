<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script>
$(function(){
	$(document).on("change", "#imageFile1",function() {
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview1").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$(document).on("change", "#imageFile2",function() {
	console.log("asdasd")
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview2").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$(document).on("change", "#imageFile3",function() {
	console.log("asdas123d")
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview3").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
});
$(document).on("change", "#imageFile4",function() {
	
    var file = event.target.files[0];

    var reader = new FileReader(); 
    reader.onload = function(e) {

        $("#preview4").attr("src", e.target.result);
    }

    reader.readAsDataURL(file);
}); 
$(document).on("change", "#imageFile5",function() {

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
	var count = ${fn:length(Filepath)};
		 $(document).on("click","button[id=plus]",function(){
		console.log(count);
		if(count == 5) return;
		count++;
		$(".setimgcontainer").append("<div><img id=preview"+count+"><br><input type='file' id=imageFile"+count+" name=newfile><input type='hidden' name='newfileindex' value="+count+"></div>");
	});
	$("#minus").click(function(){
		console.log(count);
		if(count == 1) return;
			$("#preview"+count).remove();
			$("#imageFile"+count).remove();
		count--;
	});
});
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
  </style>
</head>
<body>
<h2>영화 상세 설정 페이지</h2>
		<form action="uploadmovie.do" method="post" enctype="multipart/form-data">
		<p>영화 제목(한)
		<input type="text" name="title" value="${requestScope.movie.title }" placeholder="영화 제목(한)"> 영화 제목(영)<input type="text" name="titleEng" value="${requestScope.movie.titleEng }"placeholder="영화 제목(영)"></p>
		<p>감독(한)<input type="text" name="directorNm" value="${requestScope.movie.directorNm }"placeholder="감독(한)">
		감독(영)<input type="text" name="directorEnNm" value="${requestScope.movie.directorEnNm }"placeholder="감독(영)"></p>
		<p>배우(한)<input type="text" name="actorNm" value="${requestScope.movie.actorNm }"placeholder="배우(한)"></p>
		<p>배우(영)<input type="text" name="actorEnNm" value="${requestScope.movie.actorEnNm }"placeholder="배우(영)"></p>
		<p>제작사<input type="text" name="company" value="${requestScope.movie.company }"placeholder="제작사"></p>
		<p>국가<input type="text" name="nation" value="${requestScope.movie.nation }"placeholder="국가"></p>
		<p>장르<input type="text" name="genre" value="${requestScope.movie.genre }"placeholder="장르"></p>
		<p>관람 등급<input type="text" name="rating" value="${requestScope.movie.rating }"placeholder="관람 등급"></p>
		<p>상영시간<input type="text" name="runtime" value="${requestScope.movie.runtime }"placeholder="상영시간"></p>
		<p>개봉일<input type="text" name="repRlsDate" value="${requestScope.movie.repRlsDate }"placeholder="개봉일"></p>
		<p>키워드<input type="text" name="keywords" value="${requestScope.movie.keywords }"placeholder="키워드"></p>
		<p>줄거리<textarea rows="5" cols="50" name="plotText"placeholder="줄거리">${requestScope.movie.plotText }</textarea></p>
		<p>상세보기 페이지<input type="text" name="kmdbUrl" value="${requestScope.movie.kmdbUrl }"placeholder="상세보기 페이지"></p>
		<p>예고편 링크<input type="text" name="trailer" value="${requestScope.movie.trailer }"placeholder="예고편 링크"><br><a href="${requestScope.movie.trailer }">${requestScope.movie.trailer }</a></p>
		 <p>상영날짜<input type="text" name="startdate" value="${requestScope.scdto.startdate }"placeholder="상영 시작 날짜"> ~ 
	<input type="text" name="enddate" value="${requestScope.scdto.enddate }"placeholder="상영 종료 날짜"> 
		<br>
		<div class="setimgcontainer">
		<c:forEach var="f" items="${requestScope.Filepath }">
		<div>
		<img id="preview${f.fno}" src="fileDown.do?fno=${f.fno}&mcode=${f.mcode}"><br>
		<input type="file" id="imageFile${f.fno}" name="file">
		<input type="hidden" value="${f.fno}" name="oldfile">
		</div>
		</c:forEach> 
		</div>
		<br>
		<button type="button" id="plus">+</button> <button type="button" id="minus">-</button>
		<p><input type="hidden" name="update" value=${requestScope.movie.mcode }></p>
		<p><button>저장</button></p><p><button>뒤로가기</button></p>
	</form>
</body>
</html>