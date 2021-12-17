<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<title>게시판</title>
<meta charset="UTF-8">
<meta name="description" content="Cryptocurrency Landing Page Template">
<meta name="keywords" content="cryptocurrency, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon"/>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

<link rel="stylesheet" href="./css/font-awesome.min.css">
<link rel="stylesheet" href="./css/styleboard.css">
<link rel="stylesheet" href="./css/style(1).css">
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/themify-icons.css"/>
<link rel="stylesheet" href="css/owl.carousel.css"/>
<link rel="stylesheet" href="css/style.css"/>

<body>

<style>
#bo_v_title{

    color:#561499;


}
ul{
   list-style:none;
   }
.cd-logo{padding-top: 10px;}
/*#bo_list{margin-top:0px;}*/
/*#bo_v_title{display:none;}*/
#bo_cate_ul{margin-bottom: 0px;} /*카테고리 테두리 bottom 여백제거*/
.cd-main-nav.moves-out > li > ul li a:link { color: #fff; text-decoration: none; }
.cd-main-nav.moves-out > li > ul li a:hover{color: #03fdfa !important;text-decoration: none; } 
.cd-main-nav.moves-out > li > ul li a:visited { color: #fff; text-decoration: none; }
.cd-main-nav.moves-out > li > ul li a:active { color: #fff; text-decoration: none; }

.cd-main-nav a:link { color: #fff; text-decoration: none; }
.cd-main-nav a:hover{color: #03fdfa !important;text-decoration: none; } 
.cd-main-nav a:visited { color: #fff; text-decoration: none; }
.cd-main-nav a:active { color: #fff; text-decoration: none; }
.cd-main-nav { height:auto; }
.cd-main-content{background:#fff !important;}
#bo_v header {
	position: relative !important;
    font-size: 1.5rem !important;
    background: unset !important;
}
#bo_v_title {
    font-size: 1.5rem;
    background: unset !important;
}
.cd-main-content {
    padding-top: 40px !important;
}
.news-headline {
    position: relative;
    border-top: 2px solid #3c3c3c;

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

       <!-- Page Preloder -->
       <div id="preloder">
        <div class="loader"></div>
    </div>
<%
	MemberVO mvo=(MemberVO)session.getAttribute("mvo");

%>
		<!-- Header section -->
		<header class="header-section clearfix">
			<div class="container-fluid">
				<a href="main.jsp" class="site-logo" style="font-family: ImcreSoojin; font-size:40px;">
					nroad
				</a>
					<%if(mvo==null){ %>
					<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
					<a href="login.jsp?page=boards.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
					<a href="login.jsp?page=boards.jsp" class="site-btn">로그인</a>
					<%}else{ %> 
					<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
					<a href="Logout.do?page=boards.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
					<a href="Logout.do?page=boards.jsp" class="site-btn">로그아웃</a>
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
							  <a href="#">리뷰게시판</a>
							  <a href="boardreal.jsp">자유게시판</a>
	
							</div>
						  </div>
						<div class="dropdown">
							<button class="dropbtn"><b>Service</b></button>
							<div class="dropdown-content">
							  <a href="contact.jsp">공유하기</a>
							  <a href="one.jsp">1:1문의</a>
							  <a href="qNa.jsp">Q&A</a>
							  <a href="mypage.jsp">마이페이지</a>
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
<article id="bo_v" style="width:95%">
    <div class="news-headline full"></div>
    <header>
        <h2 id="bo_v_title">
            <br>
            <span class="bo_v_tit">이거 하고 집에 간다</span>
        </h2>
    </header>


    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <div class="profile_info">

        	<div class="profile_info_ct">
        		<span class="sound_only">작성자</span> <strong><span class="sv_member">관리자</span></strong><br><br>
       		 	<span class="sound_only">댓글</span><strong><i class="fa fa-commenting-o" aria-hidden="true"></i> 0건</strong>
        		<span class="sound_only">조회</span><strong><i class="fa fa-eye" aria-hidden="true"></i> 27회</strong>
        		<strong class="if_date"><span class="sound_only">작성일</span><i class="fa fa-clock-o" aria-hidden="true"></i> 21-11-13 10:10</strong>
    		</div>
    	</div>

    </section>

    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>
 
		<div id="bo_v_con">
		<p>안녕여러분 저는 승지에요</p>
        <p><br></p>
        <p>프로젝트가 끝나도 시험이 있어서 아주 빡쳐요</p>
        <p><br></p>
        <p>그러니까 모두 pull 한번씩 해주세요 ~~_!~</p>
        <p><br></p>
        <p>망하면 자결할거에요~!!</p>	
    	</div>


        </section>

    
    
    
        
        
        <button type="button" class="cmt_btn"><span class="total"><b>댓글</b> 0</span><span class="cmt_more"></span></button>
        <!-- 댓글 시작 { -->
            <section id="bo_vc">
                <h2>댓글목록</h2>
                <p id="bo_vc_empty">등록된 댓글이 없습니다.</p>
            </section>
            <!-- } 댓글 끝 -->
            
            <!-- 댓글 쓰기 시작 { -->
                <aside id="bo_vc_w" class="bo_vc_w">
                    <h2>댓글쓰기</h2>
                    
                    
                    
                    <span class="sound_only">내용</span>
                    <textarea id="wr_content" name="wr_content" maxlength="10000" required="" class="required" title="내용" placeholder="댓글내용을 입력해주세요"></textarea>
                    
  
                
                
                    <div class="container-login100-form-btn">
                        <a id="alertStart" class="login100-form-btn">
                          <b style="color: #fff;">등록</b>
                        </a>
                      </div>
                
                <ul class="bo_v_nb">
                    <li class="prev">
                        <span class="txt">이전글</span>
                        
                        
                        <a class="tit" href="#"></a>
                        <span class="date"></span>
                        
                      </li>
                      <li class="next">
                        <span class="txt">다음글</span>
                        
                        
                        <a class="tit" href="#"></a>
                        <span class="date"></span>
                        
                      </li></ul>
    </form></aside>

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
    <script src= "js/alert3.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>





</body></html>