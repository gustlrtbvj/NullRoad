<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.DAO"%>
<%@page import="Model.ReservationVO"%>
<%@page import="Model.ParkingVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>�����ϱ�</title>
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
	<link rel="stylesheet" href="css/mypage.css"/>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; // ���� ����
        IMP.init("imp50823523"); // ��: imp00000000
    </script>
	
<style>
	.user_wrap{
		height: 1000px;
	}
	.spad{
		padding-top: 50px;
	}
</style>

</head>
<body>
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
				<a href="login.html" class="site-btn">�α���</a>
				<nav class="main-menu">
					
					<ul class="menu-list">
						<div class="dropdown">
							<button class="dropbtn"><b>About us&nbsp;</b></button>
							<div class="dropdown-content">
							  <a href="about.html">�����ǵ�</a>
							  <a href="gide.html">�����</a>
							  
	
							</div>
						  </div>
						<div class="dropdown">
							<button class="dropbtn"><b>Community&nbsp;</b></button>
							<div class="dropdown-content">
							  <a href="#">����Խ���</a>
							  <a href="board.html">�����Խ���</a>
	
							</div>
						  </div>
						<div class="dropdown">
							<button class="dropbtn"><b>Service</b></button>
							<div class="dropdown-content">
							  <a href="contact.html">�����ϱ�</a>
							  <a href="one.html">1:1����</a>
							  <a href="qNa.html">Q&A</a>
							  <a href="mypage.html">����������</a>
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


	<!-- About section -->
	<p>&nbsp;</p>
	<section class="about-section spad">
		<div class="container">
<!-- Blog section -->
<section class="blog-page spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">

			<div class="col-lg-4 col-md-6 sideber pt-5 pt-lg-0">
			</div>
		</div>
		<div class="widget-area" >
			<h4 class="widget-title">�����ϱ�</h4>
			<div id="myp_section_wrap" class="clear-fix">
				<!-- ��������,�̳��� -->
				<div class="section01">
					<div class="user_wrap bgfff">

						<div class="user_info">
							<div class="user_name">
<%
session = request.getSession();
ParkingVO pvo = null;
if (session.getAttribute("pvo")!=null){
	pvo = (ParkingVO)session.getAttribute("pvo");
	session.setAttribute("pvo", pvo);
}
ReservationVO resvo = null;
if (session.getAttribute("resvo")!=null){
	resvo = (ReservationVO)session.getAttribute("resvo");
	session.setAttribute("resvo", resvo);
}

//DB���� �α��� �޾ƿ���
DAO dao = new DAO();
MemberVO mvo = null;
MemberVO mvo_temp = null;
if (session.getAttribute("mvo")!=null){
	mvo_temp = (MemberVO)session.getAttribute("mvo");
	mvo = dao.Login(mvo_temp.getM_id(), mvo_temp.getM_pw());
}else{
	response.sendRedirect("Pay1LoginCheck.jsp");
}
String Systime = dao.Sysdate();
SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
Date Start = format.parse(resvo.getChk_in_time());
Date End = format.parse(Systime);
long UseTime = (End.getTime() - Start.getTime())/60000;
%>
<%
long price = UseTime*(pvo.getPrk_fee()/60);
%>
<h1>������� ������ : <%=pvo.getPrk_seq() %> </h1>
<p>������ ������ : <%=pvo.getPrk_status()%></p>
<p>������ ��� : <%=pvo.getPrk_fee()%></p>
<p>������ : <%=resvo.getChk_in_time()%></p>
<p>������� : <%=Systime%></p>
<p>���ð�(��) : <%=UseTime%></p>
<p>������ ����� : <%=price%></p>
<p>�����ڱ� : <%=mvo.getM_point() %></p>

<%if (mvo.getM_point()>price) { %>
<form action="PaymentService.do">
<input type="text" value="<%=price%>" name="price" style = "display:none">
<input type="submit" value="�����ϱ�">
</form>
<%}%>

	<input id="cashBox" type="text" placeholder="������ �ݾ��� �Է��ϼ���">
    <button onclick="requestPay()">�����ϱ�</button>
    <script>
      function requestPay() {
    	let cash = Number(document.getElementById("cashBox").value)
    	
    	if (cash>=1000){
        // IMP.request_pay(param, callback) ����â ȣ��
        IMP.request_pay({ // param
            //�Ķ���� ���� https://docs.iamport.kr/sdk/javascript-sdk?lang=ko#request_pay
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "ORD20180131-0000016",//���� �ֹ� ��ȣ �ߺ����� ����
            name: "�븣���� ȸ�� ����",//�ֹ��� ������ ���� 16�� �̳� �ۼ�
            amount: cash,//���� �ݾ�
            buyer_email: "gildong@gmail.com",//�ֹ��� �̸���
            buyer_name: "ȫ�浿",//�ֹ��� ��
            buyer_tel: "010-4242-4242",//�ֹ��� �ּ�
            buyer_addr: "����Ư���� ������ �Ż絿",//�ֹ��� �ּ�
            buyer_postcode: "01181"//�ֹ��� ������ȣ
        }, function (rsp) { // callback
            if ( rsp.success ) {
            //������ȯ ���� https://docs.iamport.kr/sdk/javascript-sdk?lang=ko#request_pay-rsp 
        var msg = '������ �Ϸ�Ǿ����ϴ�.';
        msg += '����ID : ' + rsp.imp_uid;
        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
        msg += '���� �ݾ� : ' + rsp.paid_amount;
        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
        alert(msg);
        } else {
        var msg = '������ �����Ͽ����ϴ�.';
        msg += '�������� : ' + rsp.error_msg;
        alert(msg);
        $.ajax({
        	  url:'Pay0MoneyBase.jsp', //�����������ϴ� ���������� �ּҸ� �ִ´�.
        	  type:'post', //�����͸� ������ �����ϰ� �ȴ�.
        	  data:{
        	         name: 1234,  //�����͹ڽ��� ���̵� ������ �ش� �����͹ڽ��� �����͸� �����ش�.
        	         money: cash
        	  } ,
        	  success : function(t){ 
        	                alert('����!');
        	                location.reload();
        	  } ,
        	  error : function(){
        	            alert('���� �Ф�');
        	            location.reload();
        	  }
        	});
        }
        });
    	}else{
    		alert("�����ݾ��� 1000���� �Ѿ���մϴ�.")
    	}
      }

    </script>
							</div>
							<div></div>
							<div></div>
						</div>
						
					</div>
					
				</div>
			

		</div>
	</div>

</div>
</section>

	
</div>
</section>

<!-- Blog section end -->

	<!-- Fact section -->
	<section class="about-section spad gradient-bg">
		<div class="container text-white">
			<div class="row"  data-aos="slide-up" data-aos-duration="2500">
				<div class="col-lg-6 offset-lg-6 about-text">
					<br>
					<h2 style="font-size: 48px;">���� ���� �����ϰ� 
						<br>������ ������!</h2>

				
				</div>
			</div>
			<div class="about-img" style="text-align: center;">
				<ul>
					<a>�������</a><div class="memberCountCon1" style="font-size: 30px;"></div>
					<a>�̿��� ��</a><div class="memberCountCon2" style="font-size: 30px;"></div>
				</ul>
			</div>
		</div>
	</section>
	<!-- Fact section end -->







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
	<script src ="js/count.js"></script>

</body>
</html>