<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>메인</title>
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
MemberVO mvo = null;
if (session.getAttribute("mvo")!=null){
	mvo = (MemberVO)session.getAttribute("mvo");
	session.setAttribute("mvo", mvo);
}
   String loginYN = "login.jsp?page=";
   if (mvo!=null){loginYN = "";}
   String selflink = "main.jsp";
%>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>
   <!-- Header section -->
   <header class="header-section clearfix">
      <div class="container-fluid">
         <a href="main.jsp" class="site-logo" style="font-family : ImcreSoojin; font-size:40px;">
            nroad
         </a>
         <%if(mvo==null){%>
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="login.jsp?page=<%=selflink%>" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="login.jsp?page=<%=selflink%>"  class="site-btn">로그인</a>
         <%}else{ %> 
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="Logout.do?page=<%=selflink%>" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="Logout.do?page=<%=selflink%>" class="site-btn">로그아웃</a>
         <%} %>

         <nav class="main-menu">
            <ul class="menu-list">
               <div class="dropdown">
                  <button class="dropbtn"><b>About us&nbsp;</b></button>
                  <div class="dropdown-content">
                    <a href="about.jsp">개발의도</a>
                    <a href="gide.jsp">사용방법</a>
                  </div>
                 </div>
               <div class="dropdown">
                  <button class="dropbtn"><b>Community&nbsp;</b></button>
                  <div class="dropdown-content">
                    <a href="<%=loginYN%>Bo_Reviewboard.jsp">리뷰게시판</a>
                    <a href="<%=loginYN%>Bo_Freeboard.jsp">자유게시판</a>
                  </div>
                 </div>
               <div class="dropdown">
                  <button class="dropbtn"><b>Service</b></button>
                  <div class="dropdown-content">
                    <a href="<%=loginYN%>contact.jsp">공유하기</a>
                    <a href="<%=loginYN%>one.jsp">1:1문의</a>
                    <a href="<%=loginYN%>Q_QNA.jsp">Q&A</a>
                    <a href="<%=loginYN%>mypage.jsp">마이페이지</a>
                  </div>
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
					<h2><span>길은 비우고,</span><br>주차장은 채운다!</h2>
					<h4>Clear the road, Let's fill up the parking lot !</h4>
				<%if(session.getAttribute("mvo")!=null){ %>
					<% if (mvo.getAdmin_yn() == 1) {%>
					<form class="hero-subscribe-from">
						<button type="button" class="site-btn sb-gradients" onclick="location.href='<%=loginYN%>UserMap.jsp';">시작하기</button>
						<button type="button" class="site-btn sb-gradients" onclick="location.href='LandLord.jsp';">공유현황</button>
						<button type="button" class="site-btn sb-gradients" onclick="location.href='oneboard.jsp';">관리자페이지</button>
						</form>
					<%} else { %>
					<form class="hero-subscribe-from">
						<button type="button" class="site-btn sb-gradients" onclick="location.href='<%=loginYN%>MapTest.jsp';">시작하기</button>
						<button type="button" class="site-btn sb-gradients" onclick="location.href='LandLord.jsp';">공유현황</button>
						</form>
					<%} %>
				<%} else{%>
				<form class="hero-subscribe-from">
					<button type="button" class="site-btn sb-gradients" onclick="location.href='LandLord.jsp';">공유현황</button>
					</form>
				<%} %>
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
				
					<h2>원하는 곳 어디서나</h2>
					<h5>Nullroad는 어디서든 쉽게 사용 가능한 편리한 주차공간 공유 앱입니다.</h5>
					<p class = "mv moveit">NullRoad에서는 QR코드만 스캔하면 사용할 수 있는 주차장이 전국에 80여개나 있습니다. NullRoad를 통해 전국 어디서든 편하게 주차해보세요. </p>
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
					<h2>필요한 시간만큼</h2>
					<h5>원하는 시간만큼 주차하세요.</h5>
					<p class = "mv moveit">NullRoad는 예약시간을 정해두지 않습니다. 당신이 들어오는 시간과 나가는 시간만이 중요할 뿐입니다. </p>
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
					<h2>누구나 이용 가능한</h2>
					<h5></h5>
					<p class = "mv moveit">NullRoad에서는 QR코드 하나로 누구나 쉽고 편리하게 사용할 수 있습니다. 어디서도 경험해보지 못한 빠른 주차, NullRoad에서 느껴보세요!</p>
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
					<h2>내 주차장 활용하기</h2>
					<h5></h5>
					<p class = "mv moveit">남는 주차장 자리를 공유하여 부가 수익을 창출해보세요! NullRoad가 당신의 재테크를 도와드립니다!</p>
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
