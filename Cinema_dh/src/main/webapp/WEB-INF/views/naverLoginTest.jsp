<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	* {
  box-sizing: border-box;
	}
	
	body {
	  background-color: #c6cdd3;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  min-height: 100vh;
	  height: 100vh;
	}
	h3 {
	  margin: 5px;
	}
	
	.container {
	  background-color: #fff;
	  border-radius: 5px;
	  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
	  width: 450px;
	  height: 450px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  flex-direction: column;
	}
	.login-area {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  justify-content: center;
	  margin: 20px;
	  width: 400px;
	  height: 100%;
	  padding: 20px;
	}
	
	#message {
	  background-color: rgb(222, 233, 238);
	  border-radius: 10px;
	  padding: 10px;
	  text-align: center;
	  margin-bottom: 15px;
	  width: 95%;
	}
	
	#button_area {
	  background-color: rgb(222, 233, 238);
	  border-radius: 10px;
	  padding: 10px;
	  width: 95%;
	  display: flex;
	  justify-content: center;
	}
</style>

</head>
<body>
	<div class="container">
    <h1>Naver Login API 사용하기</h1>
    <div class="login-area">
      <div id="message">
        로그인 버튼을 눌러 로그인 해주세요.
      </div>
      <div id="button_area">
        <div id="naverIdLogin"></div>
      </div>
    </div>
  </div>
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <script type="text/javascript">
  
  const naverLogin = new naver.LoginWithNaverId(
   {
    clientId: "jgPU1Ccmjpw1Cg57ZBip",
    callbackUrl: "http://localhost:9999",
    loginButton: {color: "green", type: 2, height: 40}
    }
   );
  

    naverLogin.init();
    naverLogin.getLoginStatus(function (status) {
      if (status) {
          const nickName=naverLogin.user.getNickName();
          const age=naverLogin.user.getAge();
          const birthday=naverLogin.user.getBirthday();

         
          setLoginStatus();
         
	}
    });
    console.log(naverLogin);

    function setLoginStatus(){
    
      const message_area=document.getElementById('message');
      message_area.innerHTML=`
      <h3> Login 성공 </h3>
      <div>user Nickname : ${naverLogin.user.nickname}</div>
      <div>user Age(범위) : ${naverLogin.user.age}</div>
      <div>user Birthday : ${naverLogin.user.birthday}</div>
      `;
     
      const button_area=document.getElementById('button_area');
      button_area.innerHTML="<button id='btn_logout'>로그아웃</button>";

      const logout=document.getElementById('btn_logout');
      logout.addEventListener('click',(e)=>{
        naverLogin.logout();
	location.replace("http://localhost:9999");
      })
    }
   

  </script>
</body>
</html>