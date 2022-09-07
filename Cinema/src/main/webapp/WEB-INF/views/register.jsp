<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="profile" href="#">
<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<!-- CSS files -->
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="../template/sign_up.css">

    
<style>
	#kakaoLogin {
		width: 180px;
		height: 40px;
		background-color: rgb(254, 229, 0);
		border-radius: 5px;
	}
</style>
</head>
<body>
	<!-- begin header -->
	<jsp:include page="mainCustom/login.jsp"></jsp:include>
	<!-- END | Header -->
	<jsp:include page="mainCustom/register.jsp"></jsp:include>
	<!-- footer v2 section-->
	<jsp:include page="mainCustom/footer.jsp"></jsp:include>
	<!-- end of footer v2 section-->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/plugins2.js"></script>
	<script src="js/custom.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        }
    </script>
</body>
</html>