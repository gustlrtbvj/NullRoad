
<%@page import="Model.MemberVO"%>
<%@page import="Model.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="EUC-KR">
    <head>
        <title>글쓰기</title>
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
        <link rel="stylesheet" href="css/common.css"/>

<style>


  .footer-nav li a {
	color: #75849a;
	font-size: 14px;
	margin-left: 20px;
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
  height: 35px;
  border-radius: 5px;
  background: #7e3bc3;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 15px;

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
	\
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

<%
   String loginYN = "login.jsp?page=";
   String selflink = "Bo_viewFreeboard.jsp";
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


            <p>&nbsp;</p><p>&nbsp;</p>
            <p>&nbsp;</p><p>&nbsp;</p>
            <p>&nbsp;</p><p>&nbsp;</p>

				<form action="Bo_WriteFreeboard" method="post"
		enctype="multipart/form-data">		
                <table class="board-form">
                  <!-- <colgroup>
                    <col style="width:16%;">
                    <col style="width:84%;">
                  </colgroup> -->
                  <tbody>
                    
                    <tr>
                      <th scope="row"><label for="content">제목</label></th>
                      <td><input type="text" name="title2" style="width:100%;"></td>
                    </tr>
     
    
                      
                    <tr>
                      <th scope="row"><label for="content">내용</label></th>
                      <td>
                        <textarea id="content" name="content2" rows="10" cols="90" style="width:100%;height:100%;"></textarea>
                        <input type="text" name="writer" style="display:none" value="<%=mvo.getM_id()%>">
                      </td>
                    </tr>
                    <tr>
                      <th scope="row"><label>첨부파일1</label></th>
                      <td class="file-upload">
                        <div id="photoUpload">
                          <div class="file-wrap">
                            <div class="one-file">
  
                              <input type="file" name="imgPath1" id="imgPath1" onclick="addfile()">
                              <div class="file-item hide">
                              </div>
                            </div>
                          </div>
                        </div>
    
                        <p class="guide">
                          - 이미지 파일만 첨부할수 있습니다.(확장자 : jpg, jpeg, gif, png, bmp)<br>
                          - 파일 크기가 10MB 이하인 경우만 업로드 가능합니다.<br>

                        </p>
                      </td>
                    </tr>

                    
                  </tbody>
                </table>
    			<input type="text" name="giri" id="letai" value="0" style="display:none">
                <div class="btn-wrap" style="text-align: right;">
                    <div class="container-login100-form-btn">
                        <input  type="submit" id="alertStart" class="login100-form-btn" style="color:#fff" value="확인">
                    </div>
                </div>
</form>

	<!-- //1:1 문의 -->


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
   <script type="text/javascript">
	  let ai = 0;
   function addfile(){
      ai = Number(document.getElementById('letai').value);
      document.getElementById('letai').value = ai+1;
        let table = document.getElementsByClassName('board-form');
        let t_length = document.getElementsByClassName('file-wrap').length+1;
        let newRow = table[0].insertRow();
        let newCell1 = newRow.insertCell(0);
        let newCell2 = newRow.insertCell(1);
      newCell1.innerHTML ='<th scope="row"><label>첨부파일'+t_length+'</label></th>'
      newCell2.innerHTML ='<td class="file-upload">'+
    '       <div id="photoUpload">'+
    '   <div class="file-wrap">'+
    '     <div class="one-file">'+
    '       <input type="file" name="imgPath'+t_length+'" id="imgPath1" onclick="addfile()">'+
    '       <div class="file-item hide">'+
    '       </div>'+
    '     </div>'+
    '   </div>'+
    '  </div>'+
    ' <p class="guide">'+
    '   - 이미지 파일만 첨부할수 있습니다.(확장자 : jpg, jpeg, gif, png, bmp)<br>'+
    '   - 파일 크기가 10MB 이하인 경우만 업로드 가능합니다.<br>'+
    '</p>'+
    '</td>'
   }
   </script>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script>
		$().ready(function() {
			$("#alertStart").click(function() {
				Swal.fire({
					icon : 'success',
					confirmButtonColor : '#7e3bc3',
					title : '게시글이 등록되었습니다',
					closeOnClickOutside : false
				}).then(function() {
					location.href = "Bo_Freeboard.jsp"

				});
			});
		});
	</script>

	</script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>