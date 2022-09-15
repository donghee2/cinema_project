<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<section>
		<!-- <h1>HHNcinema</h1> -->
		<div class="slider sliderv2">
        <div class="container1">
            <h2>HHNcinema의계정 정보를 입력해 주세요.</h2>
            <form action="update.do" method="post" id="frm">
                <ul>
                    <li><label for="id">이메일</label></li>
                    <li class="border_bottom">
                        <input type="text" name="userEmail" id="id" value="${sessionScope.dto.userEmail }" readonly>
                    </li>
                    <li class="id_result"></li>
                    <ul>
                        <li>입력한 이메일로 HHNcinema 계정에 로그인할 수 있습니다.</li>
                        <li>한번 만든  HHNcinema계정은 변경할 수 없으니, 오타가 없도록 신중히 확인해 주세요.</li>
                        <li>생성한 이메일로 HHNcinema계정과 관련한 알림을 받아볼 수 있습니다.</li>
                    </ul>
                    <li><label for="pass">비밀번호</label></li>
                    <li class="border_bottom">
                        <input type="password" name="userPasswd" id="pass" placeholder="비밀번호(8~32자리)">
                    </li>
                    <li class="border_bottom">
                        <input type="password" id="pass_chk" placeholder="비밀번호 재입력">
                    </li>
                    <li class="pass_check"></li>
                    <li><label for="name">이름</label></li>
                    <li class="border_bottom">
                        <input type="text" name="userName" id="name" value="${sessionScope.dto.userName }">
                    </li>
                    <li><label for="nick">닉네임</label></li>
                    <li class="border_bottom">
                        <input type="text" name="userNick" id="nick" value="${sessionScope.dto.userNick }"><span class="sub_txt" id="nick_length">0/20</span>
                    </li>
                    <li class="member address">
                   	 <label>우편번호</label>
                    <div class="address_box">
                    <span class="input_area"><input type="text" name="address1" class="postcodify_postcode5 border_bottom" id="sample6_postcode" value="${sessionScope.address1 }"></span>
                    <input type="button" id="address_btn" onclick="sample6_execDaumPostcode()" value="우편번호 검색"><br>
                    </div>
                    <label>도로명주소</label>
                    <span class="input_area"><input type="text" name="address2" id="sample6_address" class="postcodify_address border_bottom" value="${sessionScope.address2 }">></span>
                    <label>상세주소</label>
                    <span class="input_area"><input type="text" name="address3" id="sample6_detailAddress" class="postcodify_details border_bottom" value="${sessionScope.address3 }">></span>
                    
                    </li>
                    <li><label for="tel">전화번호</label></li>
                    <li class="border_bottom">
                       <input type="text" name="userTel" id="tel" value="${sessionScope.dto.userTel }" class="left_border">
                    </li>
                    <!-- <li>
                        <button type="button" class="btn_send_no">인증번호 전송</button>
                    </li> -->
                   
                    <li>
                        <button class="btn_next">회원정보수정</button>
                    </li>
    
                </ul>
            </form>
            </div>
            </div>
            <a href="deleteView.do">회원탈퇴</a>
	</section>
	<div class="blur"></div>
    <div class="popup_box">
        <div class="close_box">
            <a href="#" class="close">X</a>
        </div>
        <div>
            <p>회원정보를 수정하시겠습니까?</p>
        </div>
        <div class="popup_btn">
            <button class="popup_update">수정</button>
            <button class="popup_cancle">취소</button>
        </div>  
    </div>
</body>
</html>