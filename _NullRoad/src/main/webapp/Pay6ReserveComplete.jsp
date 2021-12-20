<%@page import="Model.BuildingVO"%>
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
	
	<script src="./js/kakao.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f10bde5d4f1ce8537df658a268a51e2&libraries=services,clusterer"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">Kakao.init('11ee5630664d8eb60e7ce22fbf86ca31');</script>
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
	font-size:28px;
	}
</style>

</head>
<body>
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
BuildingVO bldvo = null;
if (session.getAttribute("bldvo")!=null){
	bldvo = (BuildingVO)session.getAttribute("bldvo");
	session.setAttribute("bldvo", bldvo);
}
%>

<%
   String loginYN = "login.jsp?page=";
   String selflink = "Pay6ReserveComplete.jsp";
   if (mvo!=null){loginYN = "";}
   
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
         <a href="login.jsp?page="<%=selflink%> class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="login.jsp?page="<%=selflink%> class="site-btn">로그인</a>
         <%}else{ %> 
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="Logout.do?page="<%=selflink%> class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="Logout.do?page="<%=selflink%> class="site-btn">로그아웃</a>
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
			<h4 class="widget-title">예약성공</h4>
			<div id="myp_section_wrap" class="clear-fix">
				<div class="section01">
					<div class="user_wrap bgfff">

						<div class="user_info">
							<div class="user_name">
								 주차장 정보 : <%=bldvo.getBld_name() %>
							</div>
							<p>&nbsp;</p>
							<div class="user_class" style="font-size:18px;">주차장 사용상태 : <%=pvo.getPrk_status()%></div>
							<p>&nbsp;</p>
							<div class="user_mail" style="font-size:18px;">주차장 요금 : <%=pvo.getPrk_fee()%></div><br>
							<input type="button" value="내비게이션" onclick="Navi()" class="login100-form-btn"><br>
							

						</div>
						
					</div>
	
					
				</div>
</div>
</div>
</div>
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
	<script type="text/javascript">
    function Navi() {
			alert("네비 안내를 시작합니다.");
		    Kakao.Navi.start({
		       name:<%=bldvo.getBld_name()%>,
 		       x:<%=bldvo.getBld_lati()%>,
 		       y:<%=bldvo.getBld_longi()%>,
 		       coordType:'wgs84'
 		   });
		}
	</script>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src ="js/count.js"></script>

</body>
</html>
