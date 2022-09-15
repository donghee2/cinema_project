<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
<%
	boolean flag = false;
	if(session.getAttribute("login") != null)
		flag = (boolean)session.getAttribute("login");
	if(flag){
	%>
	${sessionScope.dto.userName }님이 로그인 하셨습니다.<br>
	<c:if test="${sessionScope.userEmail == 'test' }">
		<a href="logout.do">로그아웃</a> | <a href="allMemberView.do">전체회원관리</a>
	</c:if>
	<c:if test="${sessionScope.userEmail != 'test' }">
		<a href="logout.do">로그아웃</a> | <a href="updateView.do">회원정보수정</a> / <a href="qnaWriteView.do">글쓰기</a>		
	</c:if>
	<%
	} else {
%>	
		<form action="loginView.do">
			<button>로그인</button>
		</form>
		<form action="guestLoginView.do">
			<button>비회원 로그인</button>
		</form>
		<a href="findIdView.do">아이디 찾기</a> / <a href="findPasswdView.do">비밀번호 찾기</a> / <a href="registerView.do">회원가입</a>
	<%	
	}
%>

	</section>
</body>
</html>