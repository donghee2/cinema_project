<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String titleEng = request.getParameter("titleEng");
	String directorNm = request.getParameter("directorNm");
	String directorEnNm = request.getParameter("directorEnNm");
	String actorNm = request.getParameter("actorNm");
	String actorEnNm = request.getParameter("actorEnNm");
	String company = request.getParameter("company");
	String nation = request.getParameter("nation");
	String genre = request.getParameter("genre");
	String rating = request.getParameter("rating");
	String runtime = request.getParameter("runtime");
	String repRlsDate = request.getParameter("repRlsDate");
	String keywords = request.getParameter("keywords");
	String plotText = request.getParameter("plotText");
	String kmdbUrl = request.getParameter("kmdbUrl");
	String startdate = request.getParameter("startdate");
	String enddate = request.getParameter("startdate");
	if(title == null)title="";
	if(titleEng == null)titleEng="";
	if(directorNm == null)directorNm="";
	if(directorEnNm == null)directorEnNm="";
	if(actorNm == null)actorNm="";
	if(actorEnNm == null)actorEnNm="";
	if(company == null)company="";
	if(nation == null)nation="";
	if(genre == null)genre="";
	if(rating == null)rating="";
	if(runtime == null)runtime="";
	if(repRlsDate == null)repRlsDate="";
	if(keywords == null)keywords="";
	if(plotText == null)plotText="";
	if(kmdbUrl == null)kmdbUrl="";
	if(startdate == null)startdate="";
	if(enddate == null)enddate="";
%>
</script>
<script>
$(function(){
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
		<form id="file_form" action="uploadmovie.do" method="post" enctype="multipart/form-data">
		<p>영화 제목(한)<input type="text" name="title" value="<%=title %>" placeholder="영화 제목(한)"></p>
		<p>영화 제목(영)<input type="text" name="titleEng" value="<%=titleEng %>"placeholder="영화 제목(영)"></p>
		<p>감독(한)<input type="text" name="directorNm" value="<%=directorNm %>"placeholder="감독(한)"></p>
		<p>감독(영)<input type="text" name="directorEnNm" value="<%=directorEnNm %>"placeholder="감독(영)"></p>
		<p>배우(한)<input type="text" name="actorNm" value="<%=actorNm %>"placeholder="배우(한)"></p>
		<p>배우(영)<input type="text" name="actorEnNm" value="<%=actorEnNm %>"placeholder="배우(영)"></p>
		<p>제작사<input type="text" name="company" value="<%=company %>"placeholder="제작사"></p>
		<p>국가<input type="text" name="nation" value="<%=nation %>"placeholder="국가"></p>
		<p>장르<input type="text" name="genre" value="<%=genre %>"placeholder="장르"></p>
		<p>관람 등급<input type="text" name="rating" value="<%=rating %>"placeholder="관람 등급"></p>
		<p>상영시간<input type="text" name="runtime" value="<%=runtime %>"placeholder="상영시간"></p>
		<p>개봉일<input type="text" name="repRlsDate" value="<%=repRlsDate %>"placeholder="개봉일"></p>
		<p>키워드<input type="text" name="keywords" value="<%=keywords %>"placeholder="키워드"></p>
		<p>줄거리<textarea rows="5" cols="50" name="plotText"placeholder="줄거리"><%=plotText %></textarea></p>
		<p>상세보기 페이지<input type="text" name="kmdbUrl" value="<%=kmdbUrl %>"placeholder="상세보기 페이지"></p>
		<p>예고편 링크<input type="text" name="trailer" value="" placeholder="예고편 링크"></p>
		<p>상영날짜<input type="text" name="startdate" value="<%=startdate %>"placeholder="상영 시작 날짜"> ~ 
				 <input type="text" name="enddate" value="<%=enddate %>"placeholder="상영 종료 날짜">
		</p>
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
	</form>
</body>
</html>