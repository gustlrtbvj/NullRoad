<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>����</title>
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
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>



</head>
<body>
<%
	MemberVO mvo=(MemberVO)session.getAttribute("mvo");

%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section clearfix">
		<div class="container-fluid">
			<a href="main.html" class="site-logo" style="font-family : ImcreSoojin; font-size:40px;">
				nroad
			</a>

			<%if(mvo==null){ %>
			<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
			<a href="login.jsp?page=main.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
			<a href="login.jsp?page=main.jsp" class="site-btn">�α���</a>
			<%}else{ %> 
			<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
			<a href="" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
			<a href="Logout.do" class="site-btn">�α׾ƿ�</a>
			<%} %>

			
			<nav class="main-menu">
				
				<ul class="menu-list">
					<div class="dropdown">
						<button class="dropbtn"><b>About us&nbsp;</b></button>
						<div class="dropdown-content">
						  <a href="about.html">�����ǵ�</a>
						  <a href="gide.html">�����</a>

						</div>
					  </div>
					<div class="dropdown">
						<button class="dropbtn"><b>Community&nbsp;</b></button>
						<div class="dropdown-content">
						  <a href="#">����Խ���</a>
						  <a href="Bo_Freeboard.jsp">�����Խ���</a>

						</div>
					  </div>
					<div class="dropdown">
						<button class="dropbtn"><b>Service</b></button>
						<div class="dropdown-content">
						  <a href="contact.html">�����ϱ�</a>
						  <a href="one.html">1:1����</a>
						  <a href="#">Q&A</a>
						  <a href="mypage.html">����������</a>
						</div>
					  </div>

				</ul>
			</nav>
		</div>
	</header>
	<!-- Header section end -->


	<!-- Hero section -->
	<section class="hero-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 hero-text">
					<h2><span>���� ����,</span><br>�������� ä���!</h2>
					<h4>Clear the road, Let's fill up the parking lot !</h4>
					<form class="hero-subscribe-from">
						<button type="button" class="site-btn sb-gradients" onclick="location.href='booking.html';">�����ϱ�</button>

					</form>
				</div>
				<div class="col-md-6">
					<img src="img/house2.png" class="laptop-image" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- Hero section end -->


	<!-- About section -->
	<section id="target1" class="about-section spad">
		<div class="container">
			<div class="row"  data-aos="slide-up" data-aos-duration="2500">
				<div class="col-lg-6 offset-lg-6 about-text">
					<h2>���ϴ� �� ��𼭳�</h2>
					<h5>Nullroad�� ������ ��𼭵� ��� ������ ������ �������� ���� ���Դϴ�.</h5>
					<p class = "mv moveit">�׳� �׷��ٰ� �û���ߤ�</p>
					<p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p>
				
				</div>
			</div>
			<div class="about-img">
				<img src="img/111.jpg" alt="">
			</div>
		</div>
	</section>
	<!-- About section end -->


	<!-- Features section -->
		<section class="about-section spad gradient-bg">
		<div class="container text-white">
			<div class="row"  data-aos="slide-up" data-aos-duration="2500">
				<div class="col-lg-6 offset-lg-6 about-text">
					<h2>�ʿ��� �ð���ŭ</h2>
					<h5>����� �����ϰ� ���� ��ҿ� ���ϴ� �ð���ŭ �����ϼ���.</h5>
					<p class = "mv moveit">����?</p>
					<p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p>
				
				</div>
			</div>
			<div class="about-img">
				<img src="img/333.jpg" alt="">
			</div>
		</div>
	</section>
	<!-- Features section end -->


	<!-- Process section -->
	<section class="about-section spad">
		<div class="container">
			<div class="row"  data-aos="slide-up" data-aos-duration="2500">
				<div class="col-lg-6 offset-lg-6 about-text">
					<h2>������ �̿� ������</h2>
					<h5>������ �̿� �����ϴٰ�? �׷� �������� �α����� �ϰ� �س���? ��ģ������</h5>
					<p class = "mv moveit">����� ����? �Ұ�ĭ �������� </p>
					<p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p>
				
				</div>
			</div>
			<div class="about-img">
				<img src="img/444.jpg" alt="">
			</div>
		</div>
	</section>
	<!-- Fact section end -->


	<!-- Features section -->
	<section class="about-section spad gradient-bg">
		<div class="container text-white">
			<div class="row"  data-aos="slide-up" data-aos-duration="2500">
				<div class="col-lg-6 offset-lg-6 about-text">
					<h2>���� ������ ����</h2>
					<h5>������ �ʰ� ���������� ���� ����</h5>
					<p class = "mv moveit">����� ��???? </p>
					<p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p><p>&nbsp;<p>
				
				</div>
			</div>
			<div class="about-img">
				<img src="img/222.jpg" alt="">
			</div>
		</div>
	</section>
	<!-- Features section end -->


<!-- Footer -->

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
<script>

	jQuery(document).ready(function($) {
	
	$(".scroll").click(function(event){            
	
	event.preventDefault();
	
	$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
	
	});
	
	});
	
	</script>
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
	<script> AOS.init(); </script>


	
</body>
</html>