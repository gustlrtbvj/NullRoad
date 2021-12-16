<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>마이페이지</title>
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
						  <a href="boardreal.html">자유게시판</a>

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
			<h4 class="widget-title">가입정보</h4>
			<div id="myp_section_wrap" class="clear-fix">
				<!-- 유저정보,미납금 -->
				<div class="section01">
					<div class="user_wrap bgfff">

						<div class="user_info">
							<div class="user_name">
								 이승지
							</div>
							<div class="user_class">사용자</div>
							<div class="user_mail">lsj98627</div>
						</div>
						
					</div>
					
				</div>
				<!-- //유저정보,미납금 -->
				
				
				<!-- 포인트,이용내역,쿠폰친구추천 -->
				<div class="section02">
					<div class="top_wrap">
						<div class="left fwb" onclick="location.href='/mypage/plist.do'">
							<div class="title">포인트</div>
							<div class="title_icon"><img src="./img/pngegg.png" alt="포인트"></div>
							<div class="content">958P</div>
						</div>
						<div class="right fwb" onclick="location.href='/mypage/orderHistory/list.do?tabGubun=HISTORY'">
							<div class="title">이용내역</div>
							<div class="title_icon"><img src="./img/pngegg (1).png" alt="이용내역"></div>
							<div class="content">1건</div>
						</div>
					</div>
					<div class="bottom_wrap">
						<div class="left fwb" onclick="location.href='/mypage/clist.do'">
							<div class="title">쿠폰</div>
							<div class="title_icon"><img src="./img/pngegg (2).png" alt="쿠폰"></div>
							<div class="content">2장</div>
						</div>
						<div class="right fwb" onclick="location.href='/present/push.do'">
							<div class="title">문의내역</div>
							<div class="title_icon"><span><img src="./img/pngegg (3).png"></div>
							<div class="content">0건</div>
						</div>
					</div>

				</div>
				<!-- //포인트,이용내역,쿠폰친구추천 -->
				<!-- 개인정보,면허정보,회원카드-->
				<div class="section01">
					<div class="user_wrap bgfff">
						<div class="user_info">
							<div class="user_name">
								 <a href="cor.html">개인정보<br>수정</a>
							</div>
						
						</div>
						
					</div>
					
				</div>
						
				<div class="section01">
					<div class="user_wrap bgfff">
						<div class="user_info">
							<div class="user_name">
								<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
									수익확인
									</a><div style="DISPLAY: none; color: gray;">
									<br>
									공유면수 : <br>
									수익합계 : 
									</div></td>
							</div>
						
						</div>
						
					</div>
					
				</div>
						
		
					
				</div>
		
					
				</div>
				<!-- //개인정보,면허정보,회원카드-->

				
	</div>

</div>

</section>

	
<!-- Blog section end -->




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
<script>
	var x = document.getElementById("login");
	var y = document.getElementById("register");
	var z = document.getElementById("btn");
	
	
	function login(){
		x.style.left = "50px";
		y.style.left = "450px";
		z.style.left = "0";
	}

	function register(){
		x.style.left = "-400px";
		y.style.left = "50px";
		z.style.left = "110px";
	}
</script>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>

