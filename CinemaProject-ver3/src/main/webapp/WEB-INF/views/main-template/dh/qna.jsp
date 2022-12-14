<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
window.onload = function(){
    var area = document.querySelector('#area');
            var theater = document.querySelector('#theater');
            var gg = document.querySelectorAll('.gg');
            var sl = document.querySelectorAll('.sl');
            area.onchange = () => {
                theater.disabled = false;                    
                if(area.value == 0) {
                    theater.disabled = true;
                }else if(area.value == 'seoul') {
                    for(i=0;i<gg.length;i++) {
                        gg[i].style.display = 'none';
                        for(j=0;j<sl.length;j++) {
                            sl[j].style.display = 'initial';
                        }
                    }      
                }else if(area.value == 'gyunggi') {
                    for(i=0;i<sl.length;i++) {
                        sl[i].style.display = 'none';
                        for(j=0;j<gg.length;j++) {
                            gg[j].style.display = 'initial';
                        }
                    }
                }
            }
            

            var mail = document.querySelector('#mail');
            var direct = document.querySelector('#direct');
            
            mail.onchange = () => {
                if(mail.value == 4) {
                    direct.style.display = 'initial';
                }else {
                    direct.style.display = 'none';
                }
            }
            function contentLength() {
                var content = document.querySelector('#content');
                var ct_length = document.querySelector('.length');
                if(content.value.length > 2000) {
                    content.value = content.value.substr(0,2000);
                    return false;
                }
                ct_length.innerHTML = `${content.value.length} / 2000`;
                return true;
            }
            
            content.onkeyup = contentLength;

            frm.onsubmit = (e) => {
                if(!contentLength()) {
                    e.preventDefault();
                }
            }

}
</script>
</head>
<body>
	<section>
	<article>
	<div class="slider sliderv2">
		<div class="qna-container">
	 	 	<h2>??????</h2>
                <form action="qnaWrite.do" method="post">
                    <table>
                        <caption>* ??????</caption>
                        <tr>
                            <th>???????????? <span>*</span></th>
                            <td colspan="3">
                                <input type="radio" name="qnaPoint" id="point" checked >
                                <label for="point">????????????</label>
                                <select name="qnaArea" id="area">
                                    <option value="0" selected>????????????</option>
                                    <option value="seoul">??????</option>
                                    <option value="gyunggi">??????</option>
                                </select>
                                <select name="theater" id="theater" disabled>
                                    <option value="0" selected>????????????</option>
                                    <option value="1" class="sl">??????</option>
                                    <option value="2" class="sl">??????</option>
                                    <option value="3" class="sl">??????</option>
                                    <option value="4" class="gg">??????</option>
                                    <option value="5" class="gg">??????</option>
                                </select>
                                <input type="radio" name="point" id="etc">
                                <label for="etc">????????????</label>
                            </td>
                        </tr>
                        <tr>
                            <th>???????????? <span>*</span></th>
                            <td colspan="3">
                                <select name="qnaQuiryType" id="quiryType">
                                    <option value="0" selected>???????????? ??????</option>
                                    <option value="1">????????????</option>
                                    <option value="2">??????</option>
                                    <option value="3">??????</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>?????? <span>*</span></th>
                            <td><input type="text" name="userName" id="name" value="${sessionScope.userName }" readonly></td>
                            <th>????????? <span>*</span></th>
                            <td>
                                <input type="text" name="userEmail" id="email" value="${sessionScope.userEmail }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>???????????? <span>*</span></th>
                            <td colspan="3">
                                <input type="text" name="userTel" id="firstnum" required>
                            </td>
                        </tr>
                        <tr>
                            <th>?????? <span>*</span></th>
                            <td colspan="3"><input type="text" name="qnaTitle" id="title" required></td>
                        </tr>
                        <tr>
                            <th>?????? <span>*</span></th>
                            <td colspan="3">
                                <div class="textarea_container">
                                    <textarea name="qnaContent" id="content" cols="30" rows="10" placeholder="??? ?????????????????? ??????????????? ??????????????? ????????? ???????????? ????????????????????????                        ??? ?????? ????????? ????????????(??????, ?????????, ???????????? ???)??? ???????????? ????????? ??????????????? ????????????." required></textarea>
                                    <div class="length_container">
                                        <p><span class="length">0 / 2000</span></p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="btn">
                                <button>??????</button>
                                <button type="reset">?????????</button>
                            </td>
                        </tr>
                    </table>
                </form>
               </div>
               </div>
               </article>
               </section>
</body>
</html>