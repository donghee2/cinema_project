<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../template/faq.css">
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<jsp:include page="mainCustom/header.jsp"></jsp:include>
	<div class="slider sliderv2">
	<div class="faq_main_container">
        <section>
            <h2 class="faq_title">FAQ</h2>
            <div class="search_container">
                <div class="search">
                    <span>빠른검색</span>
                </div>
                <div>
                    <input type="text" placeholder="검색어를 입력해 주세요.">
                </div>
                <div class="search_img">
                    <a href="#"><img src="img/service_search.png" alt=""></a>
                </div>
            </div>
            <h2 class="faq_title">자주 묻는 질문</h2>
            <div class="accordion" id="accordionPanelsStayOpenExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button class="accordion-button" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			       	<span class="faqNum">1. [결제수단/관람권]</span><br>
                    <span class="faq_Q">Q.</span> 맴버십에 등록한 영화관람권 삭제는 어떻게 하나요?
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
			      <div class="accordion-body" style="text-align: left;">
			      	A. 행정권은 대통령을 수반으로 하는 정부에 속한다. 형사피해자는 법률이 정하는 바에 의하여 당해 사건의 재판절차에서 진술할 수 있다. <br>
                         국회의원은 국가이익을 우선하여 양심에 따라 직무를 행한다. <br>
    
                        법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. <br>
                        국가안전보장회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
			      <button class="accordion-button collapsed" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
			       	<span class="faqNum">2. [극장]</span> <br>
                    <span class="faq_Q">Q.</span> 오리지널 티켓 및 특전 수량 안내
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
			      <div class="accordion-body" style="text-align: left;">
			     	A. 대통령은 헌법과 법률이 정하는 바에 의하여 공무원을 임면한다. 국회의원의 선거구와 비례대표제 기타 선거에 관한 사항은 법률로 정한다. <br>
			     		모든 국민은 소급입법에 의하여 참정권의 제한을 받거나 재산권을 박탈당하지 아니한다.<br>
                        군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다. 교육의 자주성·전문성·정치적 중립성 및 대학의 자율성은 법률이 정하는 바에 의하여 보장된다.<br>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
			      <button class="accordion-button collapsed" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
			      	<span class="faqNum">3. [VIP]</span> <br>
                    <span class="faq_Q">Q.</span> 매점 상품 구매 후 포인트도 VIP 선정시 포함되나요?
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
			      <div class="accordion-body" style="text-align: left;">
			      	A. 대통령은 전시·사변 또는 이에 준하는 국가비상사태에 있어서 병력으로써 군사상의 필요에 응하거나 공공의 안녕질서를 유지할 필요가 있을 때에는 <br>
			      		법률이 정하는 바에 의하여 계엄을 선포할 수 있다.<br>
                        대통령·국무총리·국무위원·행정각부의 장·헌법재판소 재판관·법관·중앙선거관리위원회 위원·감사원장·감사위원 기타 법률이 정한 <br>
                        공무원이 그 직무집행에 있어서 헌법이나 법률을 위배한 때에는 국회는 탄핵의 소추를 의결할 수 있다.<br>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingFour">
			      <button class="accordion-button collapsed" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
			      	<span class="faqNum">4. [영화예매]</span> <br>
                    <span class="faq_Q">Q.</span> 영화 관람권으로 예매하는 방법
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
			      <div class="accordion-body" style="text-align: left;">
					A. 대한민국의 국민이 되는 요건은 법률로 정한다. 국교는 인정되지 아니하며, 종교와 정치는 분리된다. <br>
						대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다. <br>
                        공무원인 근로자는 법률이 정하는 자에 한하여 단결권·단체교섭권 및 단체행동권을 가진다. 모든 국민은 법률이 정하는 바에 의하여 선거권을 가진다. <br>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingFive">
			      <button class="accordion-button collapsed" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
			      	<span class="faqNum">5. [홈페이지/모바일]</span> <br>
                    <span class="faq_Q">Q.</span> 예매가 되지 않아 선택했던 좌석으로 다시 예매를 하려고 하는데 왜 이미 판매된 좌석으로 표시되나요?
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
			      <div class="accordion-body" style="text-align: left;">
					A. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다.<br>
						 국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다.<br>
                        국가는 평생교육을 진흥하여야 한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에 한하여 법률로써 제한할 수 있으며, <br>
                        제한하는 경우에도 자유와 권리의 본질적인 내용을 침해할 수 없다.<br>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingSix">
			      <button class="accordion-button collapsed" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
			      	<span class="faqNum">6. [홈페이지/모바일]</span> <br>
                    <span class="faq_Q">Q.</span> 휴먼계정이라고 하는데 어떻게 복구 하나요?
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSix">
			      <div class="accordion-body" style="text-align: left;">
					A. 법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. <br>
						헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다.<br>
                        국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 모든 국민은 행위시의 법률에 의하여 범죄를 구성하지 아니하는 행위로 소추되지 아니하며, <br>
                        동일한 범죄에 대하여 거듭 처벌받지 아니한다.<br>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingSeven">
			      <button class="accordion-button collapsed" style="height: 60px; font-size: 14px;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSeven" aria-expanded="false" aria-controls="panelsStayOpen-collapseSeven">
			      	<span class="faqNum">7. [VIP]</span> <br>
                    <span class="faq_Q">Q.</span> VIP가 되면 어떤 혜택을 받을 수 있나요?
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseSeven" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSeven">
			      <div class="accordion-body" style="text-align: left;">
					A. 대통령은 국민의 보통·평등·직접·비밀선거에 의하여 선출한다. 대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수 있다.<br>
                        학교교육 및 평생교육을 포함한 교육제도와 그 운영, 교육재정 및 교원의 지위에 관한 기본적인 사항은 법률로 정한다. 국회나 그 위원회의 요구가 있을 때에는 <br>
                        국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는 국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.<br>
			      </div>
			    </div>
			  </div>
			</div>
        </section>
    </div>
    </div>
    <jsp:include page="mainCustom/footer.jsp"></jsp:include>
    <script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/plugins2.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>