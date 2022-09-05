<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../template/sign_up.css">
<script>
         window.onload = function(){
            var nav = document.querySelector('nav');
            console.log(nav.offsetHeight);       
            var sub_menu_container = document.querySelector('#sub_menu_container');         
            var sub_menu_height = sub_menu_container.scrollHeight;
            sub_menu_height += "px";
            console.log(sub_menu_height);

            nav.onmouseenter = () => {
                sub_menu_container.style.height = sub_menu_height;
            }
            nav.onmouseleave = () => {
                sub_menu_container.style.height = "0px";
            }
            var sub_menu_li = document.querySelectorAll('#sub_menu_container a');
            for(i=0;i<sub_menu_li.length;i++){
                sub_menu_li[i].onclick = () => {
                    sub_menu_container.style.height = "0px";
                }
            }
}   
    </script>
     <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                      
                    
                    } 
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
    <script>
        function idCheck(){
            var id = document.querySelector('#id');
            var id_result = document.querySelector('.id_result');

            if(id.value.length < 8 || id.value.length > 20){
                id_result.innerHTML = '아이디는 글자수가 8~20글자 사이로 사용하세요';
                if(id_result.classList.contains('true')) //true 클래스가 있는지?
                id_result.classList.remove('true'); //true 클래스 제거
                if(!id_result.classList.contains('false'))
                    id_result.classList.add('false'); // false 클래스 추가
                return false;
            }
            if(!isNaN(id.value)){
                id_result.innerHTML = '아이디는 숫자만 쓸수 없습니다.';
                if(id_result.classList.contains('true'))
                id_result.classList.remove('true'); 
                if(!id_result.classList.contains('false'))
                    id_result.classList.add('false');
                return false;
            }
            if(id_result.classList.contains('false'))
                id_result.classList.remove('false');
            if(!id_result.classList.contains('true'))
                id_result.classList.add('true');
            id_result.innerHTML = '아이디가 올바르게 입력되었습니다.';
            return true;
        }
        function passCheck(){
            var pass = document.querySelector('#pass');
            var pass_chk = document.querySelector('#pass_chk');
            var pass_check = document.querySelector('.pass_check');

            var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,20}$/;
            var flag = false;
            if(!reg.test(pass.value)){
                pass_check.innerHTML = '암호 형식에 일치하지 않습니다.'
                flag = true;
            }else if(pass.value != pass_chk.value){
                pass_check.innerHTML = '암호가 일치하지 않습니다.';
                flag = true;
            }
            if(flag){
                if(pass_check.classList.contains('true'))
                    pass_check.classList.remove('true');
                if(!pass_check.classList.contains('false'))
                    pass_check.classList.add('false');
                    return false;
            }
            pass_check.innerHTML = '암호가 정상적으로 입력되었습니다.';
            if(pass_check.classList.contains('false'))
                pass_check.classList.remove('false');
            if(!pass_check.classList.contains('true'))
                pass_check.classList.add('true');
                
            return true;
        }
        function checkNick(){
            var nick = document.querySelector('#nick');
            var nick_length = document.querySelector('#nick_length');
            if(nick.value.length > 20){
                nick.value = nick.value.substr(0,20);
                return false;
            }
            nick_length.innerHTML = `${nick.value.length}/20`;
            return true;
        }
        function checkTel(){
            var tel = document.querySelector("#tel");
            console.log(isNaN(tel.value),tel.value.length != 10, tel.value.length != 11)
            if(isNaN(tel.value)){
                if(tel.classList.contains('true'))
                    tel.classList.remove('true');
                if(!tel.classList.contains('false'))
                    tel.classList.add('false');
                return false;
            }
            if(tel.value.length != 10 && tel.value.length != 11){
                if(tel.classList.contains('true'))
                    tel.classList.remove('true');
                if(!tel.classList.contains('false'))
                    tel.classList.add('false');
                return false;
            }            
            if(tel.classList.contains('false'))
                    tel.classList.remove('false');
            if(!tel.classList.contains('true'))
                tel.classList.add('true');
            return true;
        }
        window.onload = () => {
            var frm = document.querySelector("#frm");
            var id = document.querySelector("#id");
            var pass = document.querySelector('#pass');
            var pass_chk = document.querySelector('#pass_chk');
            var nick = document.querySelector('#nick');
            var tel = document.querySelector("#tel");

            id.onkeyup = idCheck;
            pass.onkeyup = pass_chk.onkeyup = passCheck;
            nick.onkeyup = checkNick;
            tel.onkeyup = checkTel;

            frm.onsubmit = (e) => {
                if(!idCheck())
                    e.preventDefault();
                else if(!passCheck())
                    e.preventDefault();
                else if(!checkNick)
                    e.preventDefault();
                else if(!checkTel)
                    e.preventDefault();
            }
            
            $('.btn_next').click(function(){
            	console.log("dd");
                $('.popup_box').css('display', 'block');
                $('.blur').css('display', 'block');
            });
            
            $('.close').click(function(){
                $('.popup_box').css('display', 'none');
                $('.blur').css('display', 'none');
            });
            
            $('.popup_cancle').click(function(){
                $('.popup_box').css('display', 'none');
                $('.blur').css('display', 'none');
            });
            
            $('.popup_update').click(function(){
                $('.popup_box').css('display', 'none');
                $('.blur').css('display', 'none');
                alert('회원정보가 수정되었습니다.');
            });
        }
    </script>
</head>
<body>
	<section>
		<!-- <h1>HHNcinema</h1> -->
        <div class="container">
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
                   	<h4>우편번호</h4>
                    <span class="input_area"><input type="text" name="address1" class="postcodify_postcode5 border_bottom" id="sample6_postcode"></span>
                    <input type="button" id="address_btn" onclick="sample6_execDaumPostcode()" value="우편번호 검색"><br>
                    <h4>도로명주소</h4>
                    <span class="input_area"><input type="text" name="address2" id="sample6_address" class="postcodify_address border_bottom"></span>
                    <h4>상세주소</h4>
                    <span class="input_area"><input type="text" name="address3" id="sample6_detailAddress" class="postcodify_details border_bottom"></span>
                    
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