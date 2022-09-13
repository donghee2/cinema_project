<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="template/header.jsp" flush="false"></jsp:include>
	<div id="container">
		<table class="screen">
			<tr>
				<th>영화관번호</th>
				<th>영화관명</th>
			</tr>
		<c:forEach var="c" items="${requestScope.list }">
			<tr>
				<td>${c.screenCode }</td>
				<td>${c.cinemaName }</td>
				<td><a href="movieListView.do?screenCode=${c.screenCode}">${c.screenName}</a></td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<jsp:include page="template/footer.jsp" flush="false"></jsp:include>
	
</body>
</html>







