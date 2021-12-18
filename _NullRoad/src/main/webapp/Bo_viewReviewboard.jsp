	
<%@page import="Model.RevCommentVO"%>
<%@page import="Model.ReviewVO"%>
<%@page import="Model.FilesVO"%>
<%@page import="java.util.Date"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.CommunityRepVO"%>
<%@page import="Model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="EUC-KR">

<head>
<title>게시판</title>
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
<style>
.section-box {
	width: 960px;
	margin: 0 auto;
	padding-bottom: 147px;
}

.news-headline {
	position: relative;
	padding: 24px 300px 30px 20px;
	border-top: 2px solid #3c3c3c;
	border-bottom: 1px solid #e2e2e2;
}

.news-list li {
	position: relative;
	height: 50px;
	padding: 0 186px 0 20px;
	border-bottom: 1px solid #e2e2e2;
	line-height: 50px;
}

ul {
	list-style: none;
}

.btn-default {
	width: 116px;
	padding: 13px 0 14px;
	background: #fff;
	font-size: 15px;
	text-align: center;
}

.u-btn {
	display: inline-block;
	background: #fff;
	border: 1px solid #3c3c3c;
	line-height: 1.0;
	color: #3c3c3c;
	letter-spacing: -0.05em;
	white-space: nowrap;
	overflow: visible;
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
	MemberVO mvo = null;

	if (session.getAttribute("mvo") != null) {
		mvo = (MemberVO) session.getAttribute("mvo");
	} else {
	%>
	
	<script type="text/javascript">
		if (confirm("로그인이 필요한 서비스입니다.")) {
			window.location.href = "./login.jsp?page=Bo_Freeboard.jsp"
		} else {
			window.location.href = "./main.jsp"
		}
	</script>
	<%
	}
	%>

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
			<a href="login.html" class="user" style="margin-top: 10px;"><i
				class="fa fa-user"></i></a> <a href="login.html" class="site-btn">로그인</a>
			<nav class="main-menu">

				<ul class="menu-list">
					<div class="dropdown">
						<button class="dropbtn">
							<b>About us&nbsp;</b>
						</button>
						<div class="dropdown-content">
							<a href="about.html">개발의도</a> <a href="gide.html">사용방법</a>

						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							<b>Community&nbsp;</b>
						</button>
						<div class="dropdown-content">
							<a href="#">리뷰게시판</a> <a href="board.html">자유게시판</a>

						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn">
							<b>Service</b>
						</button>
						<div class="dropdown-content">
							<a href="contact.html">공유하기</a> <a href="#">1:1문의</a> <a href="#">Q&A</a>
							<a href="mypage.html">마이페이지</a>
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
	<%
	String [] files1 = null;
	Date date = new Date();
	BoardDAO dao = new BoardDAO();
	ArrayList<ReviewVO> boards = dao.RevSel();
	ReviewVO bvo = (ReviewVO) request.getAttribute("bvo");
	int b = bvo.getRev_seq();
	System.out.println("음?>>"+b);
	ArrayList<RevCommentVO> reply =  dao.RevRepSel(b);;
	FilesVO files =null;
	if (dao.FilesRSel(b) != null) {
		files = dao.FilesRSel(b);
		files1 = files.getF_1().split("/");
	}

	%>

 



	<br>
	<br>
	<br>
	<div class="content-body">


		<div class="section">
			<div class="section-box first">
				<div class="news-contents">
					<div class="news-headline full">
						<h3 class="tit"><%=bvo.getRev_subject()%></h3>
						<% if(bvo.getRev_reg_date()!=null){%> 
						<span class="date"><%=bvo.getRev_reg_date()%></span>
						<% } else {%>
						<span class="date"><%=date.getTime() %></span>
						<%} %>
						<p><a href = "updateFreeboard.jsp">수정</a></p> <p><a href="Delete.do?comm_seq=<%= bvo.getRev_seq() %>">삭제</a></p>
					</div>
					<p style="text-align: right;">
						작성자 :
						<%=bvo.getM_id()%></p>
						
						
						<% if (files1 !=null) {%>
					<%  for (int i=0; i<files1.length; i++) { %>
					<% if (files1[i]!=null) { %>
					<img src="img/<%= files1[i]%>">
					<br>
					<% } %>
					<% 	} %>
						<% }%>
						
					 <%=bvo.getRev_content()%></p>
						
				</div>

				<p>&nbsp;</p>
				<div
					style="height: auto; width: 100%; border-bottom: 1px solid #e2e2e2;"></div>
				<p>&nbsp;</p>

				<%
				for (RevCommentVO rvo : reply) {
				%>
				<div>
					
					<%=rvo.getRev_ment_content()%><br>
					<p
						style="color: #b1b1b1; height: auto; width: 100%; border-bottom: 1px solid #b1b1b1;">
						<%=rvo.getM_id()%><br><%=rvo.getRev_ment_reg_date()%>
					</p>
				</div>
				<%
				}
				%>
				<br>
				
			<form action = "CommRepRCon.do?rev_seq=<%=bvo.getRev_seq()%>">
				<textarea name="message" rows="5" cols="110" type ="text"></textarea>
            	<input value="<%=bvo.getRev_seq()%>" name="num" style = "display:none">
            	<input value="<%=mvo.getM_id()%>" name="m_id" style = "display:none">
				<div class="container-login100-form-btn">

					<button id="alertStart" class="login100-form-btn">
						<a type="submit">등록</a>
					</button>

				</div>
									</form> 


				<ul class="news-list">
					<li class="prev"><span class="txt"><a
							href="SelectRBoard.do?rev_seq=<%=bvo.getRev_seq() - 1%>">이전글</a></span>
					<li class="prev"><span class="txt"><a
							href="SelectRBoard.do?rev_seq=<%=bvo.getRev_seq() + 1%>">다음글</a></span>
				</ul>
				<p>&nbsp;</p>
				<div class="btn-wrap" style="text-align: center;">
					<a class="u-btn btn-default"
						href="Bo_Reviewboard.jsp">목록</a>
				</div>
			</div>
		</div>

	</div>
	</div>
	</div>

	</div>



	<!-- Footer section -->


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
								<li><a href="">60, Songam-ro, Nam-gu, Gwangju, Republic
										of Korea</a></li>
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
		$().ready(function() {
			$("#alertStart").click(function() {
				Swal.fire({
					icon : 'success',
					confirmButtonColor : '#7e3bc3',
					title : '댓글이 등록되었습니다',
					closeOnClickOutside : false
				}).then(function() {
					location.href = "Bo_Freeboard.jsp"

				});
			});
		});
	</script>
	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/alert3.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</body>
</html>