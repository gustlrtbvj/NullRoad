<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>주차장 등록하기</title>
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
<style>
.button {
    display: flex;
    justify-content: center;
	color:#7e3bc3;
}
label {
    cursor: pointer;
    font-size: 1em;
}


#chooseFile {
    visibility: hidden;
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

	MemberVO mvo=(MemberVO)session.getAttribute("mvo");
%>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>

	<!-- Header section -->
	<header class="header-section clearfix">
		<div class="container-fluid">
			<a href="main.jsp" class="site-logo" style="font-family: ImcreSoojin; font-size:40px;">
				nroad
			</a>
			<%if(mvo==null){ %>
			<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
			<a href="login.jsp?page=contact.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
			<a href="login.jsp?page=contact.jsp" class="site-btn">로그인</a>
			<%}else{ %> 
			<div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
			<a href="Logout.do?page=contact.jsp" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
			<a href="Logout.do?page=contact.jsp" class="site-btn">로그아웃</a>
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


	


	<p>&nbsp;</p>
	<!-- Contact section -->
	<section class="contact-page spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<h2>주차장 공유하기</h2>
					<br><br>
					<form class="contact-form">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input class="check-form" type="text" placeholder="주차면수">
									<span><i class="ti-check"></i></span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="check-form" type="text" placeholder="소유주">
									<span><i class="ti-check"></i></span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="check-form" type="text" placeholder="연락처">
									<span><i class="ti-check"></i></span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input class="check-form" type="text" placeholder="건물명">
									<span><i class="ti-check"></i></span>
								</div>
							</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" id="sample6_address" placeholder="지번주소*"><br>
										<span><i class="ti-check"></i></span>
									</div>
								</div>
								<div class="col-md-6" >
									<div class="form-group" >
										</div>
									</div>

								<div class="col-md-6" >
									<div class="form-group" >
										<input type="text" name="sample6_detailAddress" placeholder="상세주소"/>
										<span><i class="ti-check"></i></span>
									</div>
								</div>
								<div class="col-md-6" >
									<div class="form-group" >
										</div>
									</div>

							<div class="col-md-12">
								<div class="form-group">
									
									<div class="container">
										<div class="image-upload" id="image-upload">
								
											<form method="post" enctype="multipart/form-data">
												<div class="button">
													<label for="chooseFile">
														 주차장 이미지 등록 
													</label>
												</div>
												<input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
											</form>
								
											<div class="fileContainer">
												<div class="fileInput">
													<p style="color:#20509e">FILE NAME: </p>
													<p id="fileName"></p>
												</div>
											</div>
										</div>
								</div>
								
								<div class="col-md-12">
									<div class="container-login100-form-btn">
										<a id="alertStart" class="login100-form-btn">
											<b style="color: #fff;">공유신청</b>
										</a>
									</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- Contact section end -->


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
    <script src= "js/alert4.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


	<!--====== adress ======-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
    	document.getElementById("sample6_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수

	
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					addr = data.jibunAddress;

	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.

					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.querySelector("input[name=sample6_detailAddress]").focus(); //상세입력 포커싱
				}
			}).open();
		});
	}
	</script>
	<script>
		function loadFile(input) {
    var file = input.files[0];	//선택된 파일 가져오기

    //미리 만들어 놓은 div에 text(파일 이름) 추가
    var name = document.getElementById('fileName');
    name.textContent = file.name;

  	//새로운 이미지 div 추가
    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    //이미지 source 가져오기
    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
    newImage.style.objectFit = "contain";

    //이미지를 image-show div에 추가
    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};
	</script>

	

</body>
</html>