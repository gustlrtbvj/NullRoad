
<%@page import="Model.BoardDAO"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<title>게시판</title>
<meta charset="EUC-KR">
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
	<%
	CommunityVO cvo = null;
	if (session.getAttribute("cvo") != null) {
		cvo = (CommunityVO) session.getAttribute("cvo");
	}
	BoardDAO dao = new BoardDAO();
	ArrayList<CommunityVO> arr = dao.CommSel();
	%>
	<%
	MemberVO vo = null;
	String userID = null;
	%>


	<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
	<%
	int pageno = toInt(request.getParameter("pageno"));
	if (pageno < 1) {
		pageno = 1;
	}
	int total_record = arr.size();
	System.out.print(arr.size());
	int page_per_record_cnt = 5;
	int group_per_page_cnt = 5;
	int record_end_no = pageno * page_per_record_cnt;
	int record_start_no = record_end_no - (page_per_record_cnt - 1);
	if (record_end_no > total_record) {
		record_end_no = total_record;
	}
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
	if (pageno > total_page) {
		pageno = total_page;
	}
	int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
	int page_eno = group_no * group_per_page_cnt;
	int page_sno = page_eno - (group_per_page_cnt - 1);
	if (page_eno > total_page) {
		page_eno = total_page;
	}

	int prev_pageno = page_sno - group_per_page_cnt;
	int next_pageno = page_sno + group_per_page_cnt;
	if (prev_pageno < 1) {
		prev_pageno = 1;

	}
	if (next_pageno > total_page) {
		next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
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
			<a href="" class="user" style="margin-top: 10px;"><i
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

	<br>
	<br>
	<br>
	<table class="board-list" style="margin: auto">
		<colgroup>
			<col style="width: 10%;">
			<col style="width: 60%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">

		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="text-align: left;">번호</th>
				<th scope="col" style="text-align: left;">제목</th>
				<th scope="col" style="text-align: center;">아이디</th>
				<th scope="col" style="text-align: center;">등록일</th>
				<th scope="col" style="text-align: center;">조회수</th>

			</tr>
		</thead>
		<%
		ArrayList<CommunityVO> boards = dao.CommSel();
		%>



		<colgroup>
			<col style="width: 10%;">
			<col style="width: 60%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>

			<%
			
			if (arr.size() >= (pageno) * 5) {
			%>
			<%
			for (int i = 0; i < 5; i++) {
			%>
			<tr class="main_tr" style="height: 35px">
				<%
				String result = arr.get(i + (pageno - 1) * 5).getComm_reg_date().substring(5, 11);
				%>
				<td class="main_td" style="width: 100px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getComm_seq()%></a></td>
				<td class="main_td" style="width: 1200px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getComm_subj()%></a></td>
				<td class="main_td" style="width: 300px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getM_id()%></a></td>
				<td class="main_td" style="width: 100px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=result%></a></td>
				<td class="main_td" style="width: 200px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getComm_cnt()%></a></td>
			</tr>
			<%
			}
			%>
			<%
			} else if (arr.size() < (pageno) * 5) {
			%>
			<%
			for (int i = 0; i < 5 - ((pageno) * 5 - arr.size()); i++) {
			%>
			<tr class="main_tr">
				<%
				String result = arr.get(i + (pageno - 1) * 5).getComm_reg_date().substring(5, 11);
				%>
				<td class="main_td" style="width: 100px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getComm_seq()%></a></td>
				<td class="main_td" style="width: 1200px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getComm_subj()%></a></td>
				<td class="main_td" style="width: 300px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getM_id()%></a></td>
				<td class="main_td" style="width: 100px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=result%></a></td>
				<td class="main_td" style="width: 200px"><a class="main_a"
					href="SelectBoard.do?comm_seq=<%=arr.get(i + (pageno - 1) * 5).getComm_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getComm_cnt()%></a></td>
			</tr>
			<%
			}
			%>
			<%
			}
			%>
		
	</table>

	<a href="Freeboard.jsp?pageno=<%=prev_pageno%>">≪ 이전</a>
	<%
	for (int i = page_sno; i <= page_eno; i++) {
	%>
	<a href="Freeboard.jsp?pageno=<%=i%>"> <%
 if (pageno == i) {
 %> <span
		id="cho" align="center"><%=i%></span> <%
 } else {
 %> <%=i%> <%
 }
 %>
	</a>
	<%
	if (i < page_eno) {
	%>  <%
	}
	%>
	<%
	}
	%>
	<a href="Freeboard.jsp?pageno=<%=next_pageno%>">다음 ≫</a>


	<tr style="text-align: right;">
		<button>
			<a href="writeFreeboard.jsp">글쓰기 
		</button>
	</tr>

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

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/alert3.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


</body>
</html>