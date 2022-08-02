<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<a href="logout.do">로그아웃</a> | <a href="updateView.do">회원정보수정</a>		
	<%
	} else {
%>	
		<form action="loginView.do">
			<button>로그인</button>
		</form>
		<form action="nonMemberLoginView.do">
			<button>비회원 로그인</button>
		</form>
	<%	
	}
%>

	</section>
</body>
</html>