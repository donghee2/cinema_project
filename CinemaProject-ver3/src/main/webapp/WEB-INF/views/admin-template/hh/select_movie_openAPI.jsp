<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
h2 {
	text-align: center;
}

.container {
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
}

thead>tr {
	border-top: 1px solid black;
	border-bottom: 1px double black;
}

tbody>tr {
	border-bottom: 1px solid black;
}

td, th {
	padding: 5px 10px;
	overflow: hidden;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
	 console.log("sasdasd");
    $(".search").click(function() {
    var s;
    s = '&'+$("#kind").val()+'='+$("#search").val();
    console.log(s);
       $.ajax({
          url : 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=94TY52485SP98PB338TU'+s,
           type:'get',
          dataType:'json',
          success:function(r){
             console.log(r);
             var tag = "<div id=test1>";
                 tag += "<form id='form'  method='post' target=POP>";  
                 
             for(i=0;i<r.Data[0].Result.length;i++){
                 tag += "<tr id=Line>";
                tag += "<td name=title>"+r.Data[0].Result[i].title+"</td>";
                tag += "<td name='titleEng'>"+r.Data[0].Result[i].titleEng+"</td>";
                tag += "<td name='directorNm'>"+r.Data[0].Result[i].directors.director[0].directorNm+"</td>";
                tag += "<td name='directorEnNm'>"+r.Data[0].Result[i].directors.director[0].directorEnNm+"</td>";
                tag += "<td>";
                for(y=0;y<r.Data[0].Result[i].actors.actor.length;y++){
                   if(y>10)break;
                   tag += r.Data[0].Result[i].actors.actor[y].actorNm + " ,";
                }
                tag += "</td>";
                tag += "<td>";
                for(y=0;y<r.Data[0].Result[i].actors.actor.length;y++){
                   if(y>10)break;
                   tag += r.Data[0].Result[i].actors.actor[y].actorEnNm + " ,";
                }
                tag += "</td>";
                tag += "<td>"+r.Data[0].Result[i].company+"</td>";
                tag += "<td>"+r.Data[0].Result[i].nation+"</td>";
                tag += "<td>"+r.Data[0].Result[i].genre+"</td>";
                tag += "<td>"+r.Data[0].Result[i].rating+"</td>";
                tag += "<td>"+r.Data[0].Result[i].runtime+"</td>";
                tag += "<td>"+r.Data[0].Result[i].repRlsDate+"</td>";
                tag += "<td>"+r.Data[0].Result[i].keywords+"</td>";
                tag += "<td>"+r.Data[0].Result[i].plots.plot[0].plotText+"</td>";
                tag += "<td><button type=button class=window name=window1 >db??? ????????????</button></td>";
                tag += "</tr>";
          }
                  tag += "</form>"; 
                  tag += "</div>";  
             $("tbody").html(tag);
          },
          error:function(xhr, textStaus, errorThrow){
             console.log("code : ",xhr.status);
             console.log("message : ",xhr.responseText);
             console.log("error : ",errorThrow);
             console.log("textStaus : ",textStaus);
             var tag = "<tr><td colspan='6' style='text-align:center'>"
                                     +xhr.responseText+"</td></tr>";
             $("tbody").html(tag);
          }
       });
    });
    $(document).on('click', '.window', function() {
	  	$("#form").attr('action','insertMovie_pop.do');
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(0).text() + '" name=title>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(1).text() + '" name=titleEng>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(2).text() + '" name=directorNm>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(3).text() + '" name=directorEnNm>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(4).text() + '" name=actorNm>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(5).text() + '" name=actorEnNm>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(6).text() + '" name=company>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(7).text() + '" name=nation>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(8).text() + '" name=genre>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(9).text() + '" name=rating>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(10).text() + '" name=runtime>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(11).text() + '" name=repRlsDate>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(12).text() + '" name=keywords>')); 
		  $("#form").append($('<input type="hidden" class="t1" value="' + $(this).closest('tr').children().eq(13).text() + '" name=plotText>')); 
	  	window.open('','POP',"width=1400, height=1000, resizable=no, scrollbars=no, status=no;"); 
	  	$("#form").submit();
	  $(".t1").remove();
	});
 });
</script>
</head>
<body>
	<h2>?????? ?????? ?????????</h2>
	<div class="container">
		<select id="kind">
			<option value="title">?????? ??????</option>
			<option value="director">??????</option>
			<option value="releaseDts">????????????</option>
		</select> <input type="text" id="search" placeholder="????????? ???????????????">
		<button class="search">??????</button>
	</div>
	<hr>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" style="width:100%;cellspacing:0;"
						>
						<thead>
							<tr>
								<th>?????? ?????? ??????</th>
								<th>?????? ?????? ??????</th>
								<th>?????? ??????(???)</th>
								<th>?????? ??????(???)</th>
								<th>?????? ??????(???)</th>
								<th>?????? ??????(???)</th>
								<th>?????????</th>
								<th>??????</th>
								<th>?????? ??????</th>
								<th>?????? ??????</th>
								<th>?????? ??????</th>
								<th>?????????</th>
								<th>?????????</th>
								<th>?????????</th>
								<th>?????? ??????</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

</body>
</html>