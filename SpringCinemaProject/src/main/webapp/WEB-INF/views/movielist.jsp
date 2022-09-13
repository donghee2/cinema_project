<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="template/header.jsp" flush="false"></jsp:include>
	<div id="container">
		<table class="board">
			<tr>
				<th>상영관</th>
				<th>영화관제목</th>
				<th>영화시간</th>
			</tr>
			<tr>
				<td colspan="3">1관</td>
			</tr>
		<c:forEach var="s" items="${requestScope.slist }">
			<c:choose>
			<c:when test="${s.screenName eq '1관' }">
			<tr>
				<td></td>
				<td>${s.title }</td>
				<td><a href="seatView.do?screenCode=${s.screenCode}&mcode=${s.mcode}&timeCode=${s.timeCode}">${s.startTime }</a></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
		</c:forEach>
			<tr>
				<td colspan="3">2관</td>
			</tr>
		<c:forEach var="s" items="${requestScope.slist }">
			<c:choose>
			<c:when test="${s.screenName eq '2관' }">
			<tr>
				<td></td>
				<td>${s.title }</td>
				<td><a href="seatView.do?screenCode=${s.screenCode}">${s.startTime }</a></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
		</c:forEach>
			
		</table>
	</div>
	<jsp:include page="template/footer.jsp" flush="false"></jsp:include>
</body>
</html>