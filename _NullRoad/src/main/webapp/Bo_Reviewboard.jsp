
<%@page import="Model.ReviewVO"%>
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
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/styleboard.css">
<link rel="stylesheet" href="css/resetboard.css">
<link rel="stylesheet" href="css/owl.carousel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/width.css">
<script src="https://url.kr/g5/js/html5.js"></script>
<style>
b {
	font-weight: bolder;
}
.ico-notice {
    display: inline-block;
    width: 60px;
    height: 24px;
    background: #7e3bc3;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    line-height: 23px;
    color: #fff;
    text-align: center;
}
.container-fluid {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
</style>

</head>

<body>
	<%
	ReviewVO cvo = null;
	if (session.getAttribute("cvo") != null) {
		cvo = (ReviewVO) session.getAttribute("cvo");
	}
	BoardDAO dao = new BoardDAO();
	ArrayList<ReviewVO> arr = dao.RevSel();
	ArrayList<ReviewVO> Barr = dao.RevSelBest();
	%>
	
<% 
MemberVO mvo = null;

if (session.getAttribute("mvo")!=null){
	mvo = (MemberVO)session.getAttribute("mvo");
}else{%>

<script type="text/javascript">
if(confirm("로그인이 필요한 서비스입니다.")) {
    window.location.href = "./login.jsp?page=Bo_Reviewboard.jsp"
}else{
	window.location.href = "./main.jsp"
}
</script>
<%


}
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



<%
   String loginYN = "login.jsp?page=";
   String selflink = "Bo_Reviewboard.jsp";
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
         <a href="login.jsp?page="+<%=selflink%> class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="login.jsp?page="+<%=selflink%> class="site-btn">로그인</a>
         <%}else{ %> 
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="Logout.do?page="+<%=selflink%> class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="Logout.do?page="+<%=selflink%> class="site-btn">로그아웃</a>
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
                    <a href="<%=loginYN%>Q_Q&A.jsp">Q&A</a>
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


<p>&nbsp;</p><p>&nbsp;</p>

<main class="cd-main-content">
	<!-- Page info end -->
	<p>&nbsp;</p>
	<h3 style="text-align:center; letter-spacing: 5px; font-weight: 700;">리뷰게시판</h3>
	<div id="bo_list" style="width: 95%">
		<!-- 게시판 페이지 정보 및 버튼 시작 { -->
		<div id="bo_btn_top">
			<div id="bo_list_total"></div>

		</div>
		<!-- } 게시판 페이지 정보 및 버튼 끝 -->
		<div class="bo_reslist_hd">
			<ul>
				<li>
					<div class="s-number">번호</div>
					<div class="s-subject">제목</div>
					<div class="s-right">
						<div class="s-day">조회수</div>
						<div class="s-view">날짜</div>
						<div class="s-user">　글쓴이</div>
					</div>
				</li>
			</ul>
		</div>


		<%
		for (int i = 0; i < 3; i++) {
		%>
		<div class="bo_reslist">
			<ul>
				<li>
					<%
					String result = arr.get(i + (pageno - 1) * 5).getRev_reg_date().substring(5, 11);
					%>
					<div class="s-number">
						<span class="ico-notice">인기글</span>
					</div>
					
					<div class="s-subject" style="padding-left: 0px">
						<div class="bo_tit">
							<a class="main_a"
								href="SelectRBoard.do?rev_seq=<%=Barr.get(i).getRev_seq()%>">　<%= Barr.get(i).getRev_subject()%></a>
								<%System.out.print("게시판 기능"+Barr.get(i).getRev_seq()); %>
						</div>
					</div>
					<div class="s-right">
						<div class="s-user">
							<span class="sv_member"><a class="main_a"
								href="SelectRBoard.do?rev_seq=<%=Barr.get(i).getRev_seq()%>">　　<%=Barr.get(i).getM_id()%></a></span>
						</div>
						<div class="s-view">
							<i class="fa fa-eye" aria-hidden="true"></i><a class="main_a"
								href="SelectRBoard.do?rev_seq=<%=Barr.get(i).getRev_seq()%>"><%=result%></a>
						</div>
						<div class="s-day">
						
							</i><a class="main_a"
								href="SelectRBoard.do?rev_seq=<%=Barr.get(i).getRev_seq()%>"><%=Barr.get(i).getRev_cnt()%></a>
						</div>
					</div>
				</li>

				<%
				}
				%>
			
		</div>



			<%
			ArrayList<ReviewVO> boards = dao.RevSel();
			%>
			
				<%
				if (arr.size() >= (pageno) * 5) {
				%> <%
 for (int i = 0; i < 5; i++) {
 %>
  <div class="bo_reslist">
  <li>
  <%
 String result = arr.get(i + (pageno - 1) * 5).getRev_reg_date().substring(5, 11);
 %>
				<div class="s-number">
					<a class="main_a"
						href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getRev_seq()%></a>
				</div>

				<div class="s-subject" style="padding-left: 0px">
					<div class="bo_tit">
						<a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>">　<%=arr.get(i + (pageno - 1) * 5).getRev_subject()%></a>
					</div>
				</div>

				<div class="s-right">
					<div class="s-user">
						<span class="sv_member"><a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>">　　<%=arr.get(i + (pageno - 1) * 5).getM_id()%></a></span>
					</div>

					<div class="s-view">
						<i class="fa fa-eye" aria-hidden="true"></i><a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=result%></a>
					</div>
					<div class="s-day">
						</i><a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getRev_cnt()%></a>
					</div>
				</div>
				</li>
		
		
		<%
		}
		%>
</div>
</div>



		<%
		} else if (arr.size() < (pageno) * 5) {
		%>
		<div class="bo_reslist">
			<li>
			
				<%
				for (int i = 0; i < 5 - ((pageno) * 5 - arr.size()); i++) {
				%> <%
 String result = arr.get(i + (pageno - 1) * 5).getRev_reg_date().substring(5, 11);
 %>
				<div class="s-number">
					<a class="main_a"
						href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getRev_seq()%></a>
				</div>
				<div class="s-subject" style="padding-left: 0px">
					<div class="bo_tit">
						<a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getRev_subject()%></a>
					</div>
				</div>
				<div class="s-right">
					<div class="s-user">
						<span class="sv_member"><a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getM_id()%></a></span>
					</div>
					<div class="s-view">
						<i class="fa fa-eye" aria-hidden="true"></i><a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=result%></a>
					</div>
					<div class="s-day">
						</i><a class="main_a"
							href="SelectRBoard.do?rev_seq=<%=arr.get(i + (pageno - 1) * 5).getRev_seq()%>"><%=arr.get(i + (pageno - 1) * 5).getRev_cnt()%></a>
					</div>
				</div> <%
 }
 %>		</div>
			</li>

		<%
		}
		%>
</div>
</div>



	</div>

        <div class="bo_fx">
                <ul class="btn_bo_user">
            <li><a href="Bo_writeReviewboard.jsp" class="btn_b03 btn"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li>        </ul>	
            </div>
            

 <div class="paginate" style="text-align:center; letter-spacing:10px;">
 <a href="Bo_Freeboard.jsp?pageno=<%=prev_pageno%>"> < </a>
	<%
	for (int i = page_sno; i <= page_eno; i++) {
	%>
	<a href="Bo_Freeboard.jsp?pageno=<%=i%>"> <%
 if (pageno == i) {
 %> <strong class="s-active" title="현재위치"><%=i%></strong> <%
 } else {
 %> <%=i%> <%
 }
 %>
	</a>
	<%
	if (i < page_eno) {
	%>
	<%
	}
	%>
	<%
	}
	%>

	<a href="Bo_Freeboard.jsp?pageno=<%=next_pageno%>">></a>
</div>


	<!-- Footer section -->



	<!--====== Javascripts & Jquery ======-->

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/alert3.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>