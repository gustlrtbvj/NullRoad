<%@page import="Model.MemberVO"%>
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
<style>

	.spad{
		padding-top: 50px;
	}
		.user_name{
	text-align:center;
	}
	.widget-title{
	text-align:center;
	}
	#myp_section_wrap .section01 .user_wrap .user_info .user_name {
	font-size:1.8rem;
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
				<a href="login.html" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
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



							<%
session = request.getSession();
ParkingVO pvo = null;
if (session.getAttribute("pvo")!=null){
	pvo = (ParkingVO)session.getAttribute("pvo");
	session.setAttribute("pvo", pvo);
}
MemberVO mvo = null;
if (session.getAttribute("mvo")!=null){
	mvo = (MemberVO)session.getAttribute("mvo");
	session.setAttribute("mvo", mvo);
}else{
	response.sendRedirect("Pay1LoginCheck.jsp");
}
%>

	<p>&nbsp;</p><p>&nbsp;</p>
	<section class="blog-page spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">

			<div class="col-lg-4 col-md-6 sideber pt-5 pt-lg-0">
			</div>
		</div>
		<div class="widget-area" >
			<h4 class="widget-title">사용하기</h4>
			<div id="myp_section_wrap" class="clear-fix">
				<div class="section01">
					<div class="user_wrap bgfff">

						<div class="user_info">
							<div class="user_name">
								 주차장 정보 : <%=pvo.getPrk_seq() %> 
							</div>
							<p>&nbsp;</p>
							<div class="user_class" style="font-size:18px;">주차장 사용상태 : <%=pvo.getPrk_status()%></div>
							<p>&nbsp;</p>
							<div class="user_mail" style="font-size:18px;">주차장 요금 : <%=pvo.getPrk_fee()%></div>
						</div>
						
					</div>
						<div class="user_wrap bgfff">
						<div class="user_info">
							<div class="user_name">
						<form action="PayUseService.do">
						<button class="login100-form-btn" type="submit">결제하기</button>
						</form>
							</div>
						</div>

					</div>
					
				</div>


</div>
</div>
</div>
</div>
</div>

</section>
				


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
