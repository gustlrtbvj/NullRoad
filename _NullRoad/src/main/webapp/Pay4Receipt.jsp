<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.DAO"%>
<%@page import="Model.ReservationVO"%>
<%@page import="Model.ParkingVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>결제하기</title>
	<meta charset="UTF-8">
	<meta name="description" content="Cryptocurrency Landing Page Template">
	<meta name="keywords" content="cryptocurrency, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/themify-icons.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/mypage.css"/>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; // 생략 가능
        IMP.init("imp50823523"); // 예: imp00000000
    </script>
	
<style>
	.user_wrap{
		height: 1000px;
	}
	.spad{
		padding-top: 50px;
	}
</style>

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

		<!-- Header section -->
		<header class="header-section clearfix">
			<div class="container-fluid">
				<a href="main.html" class="site-logo" style="font-family: ImcreSoojin; font-size:40px;">
					nroad
				</a>
				<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
				<a href="" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
				<a href="login.html" class="site-btn">로그인</a>
				<nav class="main-menu">
					
					<ul class="menu-list">
						<div class="dropdown">
							<button class="dropbtn"><b>About us&nbsp;</b></button>
							<div class="dropdown-content">
							  <a href="about.html">개발의도</a>
							  <a href="gide.html">사용방법</a>
							  
	
							</div>
						  </div>
						<div class="dropdown">
							<button class="dropbtn"><b>Community&nbsp;</b></button>
							<div class="dropdown-content">
							  <a href="#">리뷰게시판</a>
							  <a href="board.html">자유게시판</a>
	
							</div>
						  </div>
						<div class="dropdown">
							<button class="dropbtn"><b>Service</b></button>
							<div class="dropdown-content">
							  <a href="contact.html">공유하기</a>
							  <a href="one.html">1:1문의</a>
							  <a href="qNa.html">Q&A</a>
							  <a href="mypage.html">마이페이지</a>
							</div>
						  </div>
	
					</ul>
				</nav>
			</div>
		</header>
		<!-- Header section end -->


	<!-- Page info section -->
	<div class = "mobile">
	<section class="page-info-section">
		<div class="container">
		</div>
	</section>
	</div>
	<!-- Page info end -->


	<!-- About section -->
	<p>&nbsp;</p>
	<section class="about-section spad">
		<div class="container">
<!-- Blog section -->
<section class="blog-page spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">

			<div class="col-lg-4 col-md-6 sideber pt-5 pt-lg-0">
			</div>
		</div>
		<div class="widget-area" >
			<h4 class="widget-title">결제하기</h4>
			<div id="myp_section_wrap" class="clear-fix">
				<!-- 유저정보,미납금 -->
				<div class="section01">
					<div class="user_wrap bgfff">

						<div class="user_info">
							<div class="user_name">
<%
session = request.getSession();
ParkingVO pvo = null;
if (session.getAttribute("pvo")!=null){
	pvo = (ParkingVO)session.getAttribute("pvo");
	session.setAttribute("pvo", pvo);
}
ReservationVO resvo = null;
if (session.getAttribute("resvo")!=null){
	resvo = (ReservationVO)session.getAttribute("resvo");
	session.setAttribute("resvo", resvo);
}

//DB에서 로그인 받아오기
DAO dao = new DAO();
MemberVO mvo = null;
MemberVO mvo_temp = null;
if (session.getAttribute("mvo")!=null){
	mvo_temp = (MemberVO)session.getAttribute("mvo");
	mvo = dao.Login(mvo_temp.getM_id(), mvo_temp.getM_pw());
}else{
	response.sendRedirect("Pay1LoginCheck.jsp");
}
String Systime = dao.Sysdate();
SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
Date Start = format.parse(resvo.getChk_in_time());
Date End = format.parse(Systime);
long UseTime = (End.getTime() - Start.getTime())/60000;
%>
<%
long price = UseTime*(pvo.getPrk_fee()/60);
%>
<h1>사용중인 주차장 : <%=pvo.getPrk_seq() %> </h1>
<p>주차장 사용상태 : <%=pvo.getPrk_status()%></p>
<p>주차장 요금 : <%=pvo.getPrk_fee()%></p>
<p>사용시작 : <%=resvo.getChk_in_time()%></p>
<p>사용종료 : <%=Systime%></p>
<p>사용시간(분) : <%=UseTime%></p>
<p>주차장 사용요금 : <%=price%></p>
<p>보유자금 : <%=mvo.getM_point() %></p>

<%if (mvo.getM_point()>price) { %>
<form action="PaymentService.do">
<input type="text" value="<%=price%>" name="price" style = "display:none">
<input type="submit" value="결제하기">
</form>
<%}%>

	<input id="cashBox" type="text" placeholder="충전할 금액을 입력하세요">
    <button onclick="requestPay()">충전하기</button>
    <script>
      function requestPay() {
    	let cash = Number(document.getElementById("cashBox").value)
    	
    	if (cash>=1000){
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            //파라미터 정보 https://docs.iamport.kr/sdk/javascript-sdk?lang=ko#request_pay
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "ORD20180131-0000016",//고유 주문 번호 중복결제 차단
            name: "노르웨이 회전 의자",//주문명 결제할 물건 16자 이내 작성
            amount: cash,//결제 금액
            buyer_email: "gildong@gmail.com",//주문자 이메일
            buyer_name: "홍길동",//주문자 명
            buyer_tel: "010-4242-4242",//주문자 주소
            buyer_addr: "서울특별시 강남구 신사동",//주문자 주소
            buyer_postcode: "01181"//주문자 우편번호
        }, function (rsp) { // callback
            if ( rsp.success ) {
            //결제반환 정보 https://docs.iamport.kr/sdk/javascript-sdk?lang=ko#request_pay-rsp 
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        alert(msg);
        } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
        $.ajax({
        	  url:'Pay0MoneyBase.jsp', //가져오고자하는 서버페이지 주소를 넣는다.
        	  type:'post', //데이터를 서버로 전송하게 된다.
        	  data:{
        	         name: 1234,  //에디터박스의 아이디를 넣으면 해당 에디터박스의 데이터를 보내준다.
        	         money: cash
        	  } ,
        	  success : function(t){ 
        	                alert('성공!');
        	                location.reload();
        	  } ,
        	  error : function(){
        	            alert('실패 ㅠㅠ');
        	            location.reload();
        	  }
        	});
        }
        });
    	}else{
    		alert("충전금액은 1000원을 넘어야합니다.")
    	}
      }

    </script>
							</div>
							<div></div>
							<div></div>
						</div>
						
					</div>
					
				</div>
			

		</div>
	</div>

</div>
</section>

	
</div>
</section>

<!-- Blog section end -->

	<!-- Fact section -->
	<section class="about-section spad gradient-bg">
		<div class="container text-white">
			<div class="row"  data-aos="slide-up" data-aos-duration="2500">
				<div class="col-lg-6 offset-lg-6 about-text">
					<br>
					<h2 style="font-size: 48px;">남는 공간 공유하고 
						<br>수익을 얻어보세요!</h2>

				
				</div>
			</div>
			<div class="about-img" style="text-align: center;">
				<ul>
					<a>예상수익</a><div class="memberCountCon1" style="font-size: 30px;"></div>
					<a>이용자 수</a><div class="memberCountCon2" style="font-size: 30px;"></div>
				</ul>
			</div>
		</div>
	</section>
	<!-- Fact section end -->







<!-- Footer section -->
<footer class="footer-section">
	<div class="container">
		<div class="row spad">


		<div class="footer-bottom">
			<div class="row">

				<div class="col-lg-8 text-center text-lg-right">
					<ul class="footer-nav">
						<li><a href=""></a></li>
						<li><a href="">King Jo</a></li>
						<li><a href="">60, Songam-ro, Nam-gu, Gwangju, Republic of Korea</a></li>
						<li><a href="">bszt123@naver.com</a></li>
						<li><a href="">010-3083-0491</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>


	<!--====== Javascripts & Jquery ======-->

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src ="js/count.js"></script>

</body>
</html>
