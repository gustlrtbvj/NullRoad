   
<%@page import="Model.CustomerCenterVO"%>
<%@page import="Model.FilesVO"%>
<%@page import="java.util.Date"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.CommunityRepVO"%>
<%@page import="Model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<%
   MemberVO mvo = null;

   if (session.getAttribute("mvo") != null) {
      mvo = (MemberVO) session.getAttribute("mvo");
   } else {
   %>
   
   <script type="text/javascript">
      if (confirm("로그인이 필요한 서비스입니다.")) {
         window.location.href = "./login.jsp?page=oneboard.jsp"
      } else {
         window.location.href = "./main.jsp"
      }
   </script>
   <%
   }
   %>
   <%
   String loginYN = "login.jsp?page=";
   String selflink = "oneboardview.jsp";
   if (mvo!=null){loginYN = "";}
   %>
      <%
   Date date = new Date();
   DAO dao = new DAO();
   ArrayList<CustomerCenterVO> boards = dao.CsCenterSel();
   CustomerCenterVO csvo = (CustomerCenterVO) request.getAttribute("csvo");
   int b = csvo.getCs_art_seq();
   System.out.println("음?>>"+b);
   FilesVO files =null;


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
            <%if(mvo==null){%>
            <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
            <a href="login.jsp?page=<%=selflink%>"  class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
            <a href="login.jsp?page=<%=selflink%>" class="site-btn">로그인</a>
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
                          <a href="<%=loginYN%>mypage.jsp">>마이페이지</a>
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
            <span class="bo_v_tit"><%=csvo.getCs_art_subject()%></span>
        </h2>
    </header>


    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <div class="profile_info">

           <div class="profile_info_ct">
              <span class="sound_only">작성자</span> <strong><span class="sv_member"><%=csvo.getM_id()%></p></span></strong><br><br>
                 <span class="sound_only">댓글</span><strong><i class="fa fa-commenting-o" aria-hidden="true"></i> 0건</strong>
              <span class="sound_only">조회</span><strong><i class="fa fa-eye" aria-hidden="true"></i> 27회</strong>
              <strong class="if_date"><span class="sound_only">작성일</span><i class="fa fa-clock-o" aria-hidden="true"></i><% if(csvo.getCs_art_reg_date()!=null){%> 
                  <span class="date"><%=csvo.getCs_art_reg_date()%></span>
                  <% } else {%>
                  <span class="date"><%=date.getTime() %></span>
                  <%} %></strong>
          </div>
       </div>

    </section>

    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>
 
      <div id="bo_v_con">

                <%=csvo.getCs_art_content()%></p>
       </div>


        </section>

          
                <ul class="bo_v_nb">

                    <li class="prev">
                        <span class="txt"><a
                     href="CsSelectOne.do?cs_art_seq=<%=csvo.getCs_art_seq() - 1%>">이전글</a></span>
                        
                        
                        <a class="tit" href="#"></a>
                        <span class="date"></span>
                        
                      </li>
                      <li class="next">
                        <span class="txt"><a
                     href="CsSelectOne.do?cs_art_seq=<%=csvo.getCs_art_seq() + 1%>">다음글</a></span>


                        
     
                        <a class="tit" href="#"></a>
                        <span class="date"></span>
                        
                      </li></ul>
    


   <script src="js/jquery-3.2.1.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/main.js"></script>
    <script src= "js/alert3.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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





</body></html>