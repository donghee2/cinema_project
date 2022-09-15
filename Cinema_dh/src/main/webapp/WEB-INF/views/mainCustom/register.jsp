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
	<div class="slider sliderv2">
		<div class="container1">
            <h2>HHNcinema의계정 정보를 입력해 주세요.</h2>
            <form action="register.do" method="post" id="frm">
                <ul>
                    <li><label for="id">이메일</label></li>
                    <li class="border_bottom">
                        <input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
                        <span class="sub_txt"><select name="email">
                        	<option value="@gmail.com">gmail.com</option>
                        	<option value="@naver.com">naver.com</option>
                        	<option value="@hanmail.net">hanmail.net</option>
                        	<option value="@nate.com">nate.com</option>
                        </select></span>
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
                        <input type="text" name="userName" id="name" placeholder="이름을 입력하세요">
                    </li>
                    <li><label for="nick">닉네임</label></li>
                    <li class="border_bottom">
                        <input type="text" name="userNick" id="nick" placeholder="닉네임을 입력하세요"><span class="sub_txt" id="nick_length">0/20</span>
                    </li>
                    <li class="border_bottom">
                        <input type="date" name="userBirth" id="brith">
                    </li>
                    <li class="member address">
                    <label>우편번호</label>
                    <div class="address_box">
                    <span class="input_area"><input type="text" name="address1" class="postcodify_postcode5 border_bottom" id="sample6_postcode"></span>
                    <input type="button" id="address_btn" onclick="sample6_execDaumPostcode()" value="우편번호 검색"><br>
                    </div>
                    <label>도로명주소</label>
                    <span class="input_area"><input type="text" name="address2" id="sample6_address" class="postcodify_address border_bottom"></span>
                    <label>상세주소</label>
                    <span class="input_area"><input type="text" name="address3" id="sample6_detailAddress" class="postcodify_details border_bottom"></span>
                    
                    </li>
                    <li><label for="tel">전화번호</label></li>
                    <li class="border_bottom">
                       <input type="text" name="userTel" id="tel" placeholder="전화번호 입력하세요 -는 빼고" class="left_border">
                    </li>
                    <!-- <li>
                        <button type="button" class="btn_send_no">인증번호 전송</button>
                    </li> -->
                   
                    <li>
                        <button class="btn_next" type="submit">회원가입</button>
                    </li>
    
                </ul>
            </form>
    
        </div>
		</div>
	<!--end of latest new v2 section-->
</body>
</html>