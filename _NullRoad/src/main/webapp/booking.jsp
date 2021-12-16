<%@page import="Model.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.BuildingVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>예약하기</title>
	<meta charset="EUC-KR">
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

    <style>

        
      img {
        max-width: 100%;
      }
        .spad{
            padding-top:50px;
        }
      
        .jb-a {
            
          width: 400px;
          margin: 0px auto;
          position: relative
          
        }
        .jb-c {
          position: absolute;
          top: 0px;
          left: 0px;
          display: none;
        }
        .jb-a:hover .jb-c {
          display: block;
        }
        .jb-c {
          position: absolute;
           top: 0px;
          left: 0px;
          opacity: 0;
          transition: opacity 0.5s linear;
  }
      .jb-a:hover .jb-c {
           opacity: 1;
  }
  .container-login100-form-btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding-top: 20px;
}

.login100-form-btn {
  font-family: Montserrat-Bold;
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;
  height: 50px;
  border-radius: 5px;
  background: #7e3bc3;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 25px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  background: #484748;
}

      </style>
</head>
<body>

	<% 
	//HttpSession session2 = request.getSession();
	//String bvo = null;
	
	//if(session.getAttribute("bldhidon") != null){
	//	bvo=(String)session.getAttribute("bldhidon");
	//	System.out.println("testtest");
	//}
	
	DAO dao = new DAO();
	int bld_seq1 =Integer.parseInt(request.getParameter("data"));
	System.out.println("test파라미터"+bld_seq1);
	ArrayList<BuildingVO> bld_list = dao.BldSelOne(bld_seq1);
	
	//System.out.println("성공?>>"+bld_list.get(0).getBld_name());
	
	%>
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

<p>&nbsp;</p><p>&nbsp;</p>
	<!-- About section -->
	<section class="about-section spad">
		<div class="container">
			<div class="row">
                <div class="about-img">
                    <div class="jb-a">
                        <img src="img/주차도면3.png" alt="" class="jb-b" onclick=>
                        <img src="img/주차도면2.png" alt="" class="jb-c">
                      </div>
                </div>
				<div class="col-lg-6 offset-lg-6 about-text">
                    <br>
					<h2>예약하기</h2>
					<h5>Usable : A1, A2, A4, A5</h5>
					<p> 시간당 요금 0원<br>
                        주소 : <%=bld_list.get(0).getSigungu()%> <%=bld_list.get(0).getEmdong()%> <%=bld_list.get(0).getDetail_addr() %><br>
                        건물명 : <%=bld_list.get(0).getBld_name() %>
                        <br><br><br>
					</p>
					<div class="container-login100-form-btn">
						<button id="alertStart"class="login100-form-btn">
							<b>예약완료</b>
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About section end -->






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
    <script src= "js/alert.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>




</body>
</html>
