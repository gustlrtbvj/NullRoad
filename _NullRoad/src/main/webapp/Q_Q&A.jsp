<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>게시판</title>
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
        <link rel="stylesheet" href="css/style3.css"/>

    </head>
    <body>
<%
   MemberVO mvo=(MemberVO)session.getAttribute("mvo");
   String loginYN = "login.jsp?page=";
   String selflink = "Q_Q&A.jsp";
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
         <a href="login.jsp?page=main.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="login.jsp?page=main.jsp" class="site-btn">로그인</a>
         <%}else{ %> 
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="Logout.do?page=main.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="Logout.do?page=main.jsp" class="site-btn">로그아웃</a>
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
  
 
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
            <table class="board-list" style="margin:auto">
                <colgroup>
                    <col style="width:5%;">
                    <col style="width:85%;">
                    <col style="width:10%;">

                    
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" style="text-align: center;"></th>
                        <th scope="col" style="text-align: center;">자주묻는 질문</th>
                        <th scope="col" style="text-align: center;"></th>

                        
                    </tr>
                </thead>
                <tbody>
                    
                    <tr class="notice">
                        <td><b>Q.</b></td>
                        <td class="text-left" style="text-align: center;"><a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
                          <b>내가 예약 한 자리에 다른 차가 주차되어있으면 어떻게 하나요?</b>
                          </a><div style="DISPLAY: none; color: gray;">
                          <br>
                          고객센터 010-3083-0491로 문의 주시면 바로 다른 자리로 배정 도와드리겠습니다.<br>
                          이용에 불편 없도록 최선을 다하겠습니다.
                          </div></td>
                        <td style="color:silver">　　　　▼</td>
                    </tr>
                    <tr class="notice">
                        <td><b>Q.</b></td>
                        <td class="text-left" style="text-align: center;"><a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
                          <b>주차장 등록 방법을 알려주세요.</b>
                          </a><div style="DISPLAY: none; color: gray;">
                          <br>
                          홈페이지의 공유하기 버튼을 통해 주차장을 사진과 함께 등록신청해주시면,<br>
                          관리자가 검토 후 2-3일 이내에 주차장 등록 여부를 안내해드립니다.
                          </div></td>
                        <td style="color:silver">　　　　▼</td>
                    </tr>
                    <tr class="notice">
                        <td><b>Q.</b></td>
                        <td class="text-left" style="text-align: center;"><a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
                          <b>포인트 부족 시 어떻게 결제 처리되나요?</b>
                          </a><div style="DISPLAY: none; color: gray;">
                          <br>
                          포인트가 부족할 경우, 고객님이 연결하신 계좌에서 자동으로 필요한 만큼의 포인트가 충전됩니다.
                          </div></td>
                        <td style="color:silver">　　　　▼</td>
                    </tr>
                    <tr class="notice">
                        <td><b>Q.</b></td>
                        <td class="text-left" style="text-align: center;"><a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
                          <b>출차 QR을 찍지 못했어요.</b>
                          </a><div style="DISPLAY: none; color: gray;">
                          <br>
                          출차QR코드를 미인식의 경우 계속 요금이 부과되므로<br>
                          고객센터 010-3083-0491로 문의 주시기바랍니다.          
                          </div></td>
                        <td style="color:silver">　　　　▼</td>
                    </tr>
                    <tr class="notice">
                        <td><b>Q.</b></td>
                        <td class="text-left" style="text-align: center;"><a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
                          <b>요금 제도는 어떻게 되나요?</b>
                          </a><div style="DISPLAY: none; color: gray;">
                          <br>
                          시간당 요금은 어쩌고 저쩌고 내가 어떻게 알아 <br>
                          그리고 집에 너무 가고싶습니다 머리가 아파요 ^^_
                          </div></td>
                        <td style="color:silver">　　　　▼</td>
                    </tr>
                    <tr class="notice">
                        <td><b>Q.</b></td>
                        <td class="text-left" style="text-align: center;"><a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
                          <b>사용자/공유자 동시 이용은 불가능한가요?</b>
                          </a><div style="DISPLAY: none; color:gray">
                          <br>
                          사용자와 공유자 동시에 이용 가능합니다.<br>
                          사용사에는 예약하기를 통해 이용 해주시면되고, 공유시에는 공유하기를 통해 주차장 등록신청을 해주시면 됩니다.
                          </div></td>
                        <td style="color:silver">　　　　▼</td>
                    </tr>


                

                    
                

                    
                    
                
                
                </tbody>
            </table>



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
</body>
</html>