<%@page import="java.util.ArrayList"%>
<%@page import="Model.ChartFeeVO"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다각형에 이벤트 등록하기2</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.2"></script>
    <script src="jquery-3.6.0.min.js"></script>
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

.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 15px;
    top: -5px;
    left: 15px;
    padding:2px;
}

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}
.map_wrap {width:100%;height:800px; display: inline-block;}
.title {font-weight:bold;display:block;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

.mychart{display:none}
.mychart.on{display:block;}

.login100-form-btn {
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;
  height: 35px;
  border-radius: 5px;
  background: #7e3bc3;
  display: inline;
  justify-content: center;
  align-items: center;
  padding: 0 15px;
  float:right;
  margin-right:10px;
 

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  background: #484748;
}
.content-table{
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    min-width: 400px;
    border-radius: 5px 5px 0 0;
    overflow: hidden;
    box-shadow : 0 0 20px rgba(0,0,0,0.15);
    text-align:center;
    margin:auto;
}
.content-table thead tr{
    background-color: #7e3bc3;
    color: #fff;
    text-align: left;
    font-weight: bold;
    text-align:center;
}
.content-table th,
.content-table td {
    padding:12px 15px;
    border-right: 1px solid #dddddd;
}
.content-table tbody tr{
    border-bottom: 1px solid #dddddd;
}
.content-table tbody tr:nth-of-type(even){
    background-color: #f3f3f3;
}
.content-table tbody tr:last-of-type{
    border-bottom: 2px solid #7e3bc3;
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
			<a href="login.html" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
			<a href="login.html" class="site-btn">로그인</a>
			<nav class="main-menu">
				
				<ul class="menu-list">
					<div class="dropdown">
						<button class="dropbtn"><b>About us&nbsp;</b></button>
						<div class="dropdown-content">
						  <a href="about.html">개발의도</a>
						  <a href="gide.html">사용방법</a>

						</div>
					  </div>
					<div class="dropdown">
						<button class="dropbtn"><b>Community&nbsp;</b></button>
						<div class="dropdown-content">
						  <a href="#">리뷰게시판</a>
						  <a href="board.html">자유게시판</a>

						</div>
					  </div>
					<div class="dropdown">
						<button class="dropbtn"><b>Service</b></button>
						<div class="dropdown-content">
						  <a href="contact.html">공유하기</a>
						  <a href="one.html">1:1문의</a>
						  <a href="#">Q&A</a>
						  <a href="mypage.html">마이페이지</a>
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
    <div style="width:100%;height:100px;">

    </div>
<div class="map_wrap">
   <div id="map" style="width:100%;height:800px;"></div>
</div>

    
<div style="width:100% ;">
    
    <div id="chartBody" style="width:100% ;height:45%">
        
        <div class="mychart mychartsection2"> 
            <div class="col-md-12">
                <canvas id="myChartone" style="width:100vw ; height:30vh"></canvas>
            </div>
        </div>
        
        <div class="mychart on mychartsection1">
            <div class="col-md-12">
                <canvas id="myChartone1" style="width:100vw ; height:30vh"></canvas>
            </div>
        </div>

        <div class="chartTab">
                           
            <div>    
                <a href="#none"><button class="login100-form-btn" style="margin-right:40px">chart2</button></a>
                <a href="#none"><button class="login100-form-btn">chart1</button></a>
                <select name="1" id="1" style="float:right;">
                    <option selected>동 선택</option>
                    <option>동명동</option>
                    <option>양림동</option>
                    <option>송하동</option>
                </select>
            </div>
          
        </div>
        
        
    </div>
</div>
<br><br>   
    <div style="margin:10px"; id = "table";>
        <table class="content-table" id="data_table">
            <thead>
                <tr>
                    <th>총 수익</th>
                    <th>평균수익</th>
                    <th>이용 수</th>
                    <th>공유 수</th>
                    <th>행사 정보</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
               <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
                <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
             <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
          <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>

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


<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8445119eec91da7b79b3d483e7f2d21a"></script>
<script>
      var polygons=[];
   $(document).ready(function () {
       $.getJSON('GJ.json', function(geojson){
            
          var data = geojson.features;
          var coordinates = [];
          var type = '';
          var name = '';
          
          $.each(data, function(index, val){
             //if(val.properties.SIG_CD.substring(0,2) == '45') {
                type = val.geometry.type;
                coordinates = val.geometry.coordinates;
                name = val.properties.EMD_NM;

                if(type == "MultiPolygon"){
                    console.log(coordinates);
                    //멀티폴리곤 출력
                    displayArea(coordinates[0], name);                
                    displayArea(coordinates[1], name); 
                }else{
                    displayArea(coordinates, name);   
                }
            
             
          })
       });
   });  
   
       
       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(35.1595454, 126.8526012), // 지도의 중심좌표
          level: 8 // 지도의 확대 레벨
       };
       
       var map = new kakao.maps.Map(mapContainer, mapOption),
            customOverlay = new kakao.maps.CustomOverlay({}),
            infowindow = new kakao.maps.InfoWindow({removable: false});
       
       // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
       var mapTypeControl = new kakao.maps.MapTypeControl();

       // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
       // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
       map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

       // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
       var zoomControl = new kakao.maps.ZoomControl();
       map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    // 주소-좌표 변환 객체를 생성합니다
       var geocoder = new kakao.maps.services.Geocoder();

       var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
           infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

       function centroid(points){
         var i,j, len, p1, p2, f, area, x, y;
         
         area = x = y = 0;
         
         for(i=0, len = points.length, j = len - 1; i < len; j = i++){
            p1 = points[i];
            p2 = points[j];
            
            f = p1.y * p2.x - p2.y * p1.x;
            x += (p1.x + p2.x) * f;
            y += (p1.y + p2.y) * f;
            area += f * 3;
         }
         return new kakao.maps.LatLng(x/area, y/area);
      }
     
      
      function deletePolygon(polygons){
         for(var i=0; i<polygons.length; i++){
            polygons[i].setMap(null);
         }
         polygons = [];
      }
       
       function displayArea(coordinates, name){
          var path = [];
          var points = [];
          //console.log(coordinates[0]);
          $.each(coordinates[0], function(index, coordinate){     
             var point = new Object();
             point.x = coordinate[1];
             point.y = coordinate[0];
             points.push(point);
             path.push(new kakao.maps.LatLng(point.x,point.y));
          })

         
          var polygon = new kakao.maps.Polygon({
                map : map, // 그려질 다각형의 좌표 배열입니다
                path : path,
                strokeWeight: 1,
                strokeColor: '#004c80',
                strokeOpacity: 1,
                fillColor: '#fff',
                fillOpacity: 0.5
            });
       
           
        polygons.push(polygon);
        

        
        
        
        
    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
        // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
        kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
            polygon.setOptions({fillColor: '#50bcdf'});
         
            customOverlay.setContent('<div class="area">' + name + '</div>');
            
            customOverlay.setPosition(mouseEvent.latLng); 
            customOverlay.setMap(map);
        });

     // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
        kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
            
            customOverlay.setPosition(mouseEvent.latLng); 
        });
     
     // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
        // 커스텀 오버레이를 지도에서 제거합니다 
        kakao.maps.event.addListener(polygon, 'mouseout', function() {
            polygon.setOptions({fillColor: '#fff'});
            customOverlay.setMap(null);
        }); 
     
     // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 통계보기 인포윈도우에 표시합니다 
        kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
         var content = '<div class="info">' + 
            '<div class="title">' + name +'<br>'+ 
            '<a href="#fuck" onclick="callFunction()">통계 보러가기</a>'   +
            '</div>'
            ;
               
         
               infowindow.setContent(content); 
               infowindow.setPosition(mouseEvent.latLng); 
               infowindow.setMap(map, marker);
                    
        }); 
    }
                  
        function searchAddrFromCoords(coords, callback) {
            // 좌표로 행정동 주소 정보를 요청합니다
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
        }
               
        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
      

               

</script>

<script>

    // 차트 탭
    $(".chartTab a:nth-child(1)").click(
        function(){
            $(".mychartsection1").removeClass("on");
            $(".mychartsection2").removeClass("on");
            $(".mychartsection1").addClass("on");
        }
    );
    $(".chartTab a:nth-child(2)").click(
        function(){
            $(".mychartsection1").removeClass("on");
            $(".mychartsection2").removeClass("on");
            $(".mychartsection2").addClass("on");
        }
    );
    
        // 차트 생성
    var myChartone = document.getElementById('myChartone').getContext('2d');
    var myChartone1 = document.getElementById('myChartone1').getContext('2d');

    
    //이용자수, 수익구조
    var myChart = new Chart(myChartone, {
        type: 'line',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [122153, 192323, 32323, 52233, 22323, 232323],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            
            
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    var myChart = new Chart(myChartone1, {
        type: 'line',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [1200, 1900, 300, 500, 200, 300],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
    
            
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    </script>
    <script type="text/javascript">
    <%
	DAO dao = new DAO();
	ArrayList<ChartFeeVO> cfvo = dao.chartData();
	%>
	let emdong = "송하동";
	let static_data = <%=cfvo%>
	callFunction(emdong);
	
    $(function callFunction(let emdong) {
    let SQL = ["총수익","평균수익","이용 수","공유 수","행사 정보","날짜"];
    
    for (let statics : static_data){
    	console.log(statics[0]);
    	console.log(statics[1]);
    	console.log(statics[2]);
    	console.log(statics[3]);
    	console.log(statics[4]);
    	}
		var tr_length = $('#data_table tr').length;
		var td_length = $('#data_table td').length;
		var tab_td = $('#data_table td');//tb 테이블의 td들 불러오기
			for (var i = 0; i < tr_length; i++) {
    			for (var j = 0; j < td_length; j++) {
        			$("#data_table tr:eq("+i+") td:eq("+j+")").html(SQL[j]);
	    		}
			}
		});
    </script>

</body>
</html>