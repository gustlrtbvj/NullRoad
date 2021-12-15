

<%@page import="Model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>�Խ���</title>
<meta charset="UTF-8">
<meta name="description" content="Cryptocurrency Landing Page Template">
<meta name="keywords" content="cryptocurrency, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="css/owl.carousel.css" />
<link rel="stylesheet" href="css/style3.css" />

</head>

<body>



	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->

	<header class="header-section clearfix">
		<div class="container-fluid">
			<a href="main.html" class="site-logo"
				style="font-family: ImcreSoojin; font-size: 40px;"> nroad </a>
			<div class="responsive-bar" style="margin-top: 10px;">
				<i class="fa fa-bars"></i>
			</div>
			<a href="" class="user" style="margin-top: 10px;"><i
				class="fa fa-user"></i></a> <a href="login.html" class="site-btn">�α���</a>
			<nav class="main-menu">

				<ul class="menu-list">
					<div class="dropdown">
						<button class="dropbtn">
							<b>About us&nbsp;</b>
						</button>
						<div class="dropdown-content">
							<a href="about.html">�����ǵ�</a> <a href="gide.html">�����</a>

						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							<b>Community&nbsp;</b>
						</button>
						<div class="dropdown-content">
							<a href="#">����Խ���</a> <a href="board.html">�����Խ���</a>

						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							<b>Service</b>
						</button>
						<div class="dropdown-content">
							<a href="contact.html">�����ϱ�</a> <a href="#">1:1����</a> <a href="#">Q&A</a>
							<a href="mypage.html">����������</a>
						</div>
					</div>

				</ul>
			</nav>
		</div>
	</header>
	<!-- Header section end -->



	<!-- Page info section -->
	<section class="page-info-section">
		<div class="container">
			<h2></h2>
			<div class="site-beradcamb">
				<a href=""></a>

			</div>
		</div>
	</section>
	<!-- Page info end -->
			<div id = "board">
				<form action = "WriteFreeboard" method="post"
					enctype="multipart/form-data">
				<table id="list">
					<tr>
						<td>����</td>
						<td><input name ="title" type="text" > </td>
					</tr>
					<tr>
						<td>�ۼ���</td>
						<td><input name="writer" type="text" > </td>
					</tr>
					<tr>
						<td colspan="2">����</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content" rows="10" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="reset" value="�ʱ�ȭ">
							<input type="submit" value="�ۼ��ϱ�">
						</td>
					</tr>
				</table>
				</form>
			</div>





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
									<li><a href="">60, Songam-ro, Nam-gu, Gwangju,
											Republic of Korea</a></li>
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
</body>
</html>