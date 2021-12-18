<%@page import="Model.MemberVO"%>
<%@page import="Model.ParkableVO"%>
<%@page import="Model.ReservationVO"%>
<%@page import="Model.ParkingVO"%>
<%@page import="Model.DAO"%>
<%@page import="Model.BuildingVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>메인</title>
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
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>


<style>
img {
        max-width: 100%;
      }
        .spad{
            padding-top:50px;
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



.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff; display:none;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

.overlaybox {position:relative;width:360px;height:350px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
        .overlaybox li {list-style: none;}
        .overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
        .overlaybox .first {position:relative;width:247px;height:136px;margin-bottom:8px;}
        .first .text {color:#fff;font-weight:bold;}
        
        .first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
        .overlaybox ul {width:247px;}
        .overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
        .overlaybox li span {display:inline-block;}
        
        .overlaybox li .title {font-size:13px;}
         
        .overlaybox li .up {background-position:0 -40px;}
        .overlaybox li .down {background-position:0 -60px;}
        
        .overlaybox li:hover {color:#fff;background:#d24545;}
        .overlaybox li:hover .up {background-position:0 0px;}
        .overlaybox li:hover .down {background-position:0 -20px;}   
         .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .close {position: absolute;top: 17px;right: 124px;color: rgb(238, 31, 31);width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
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
#ressel {
  margin-top:20px;
  margin-left:70px;
  font-family: Montserrat-Bold;
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;
  height: 40px;
  border-radius: 5px;
  background: #7e3bc3;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;


  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

#ressel:hover {
  background: #484748;
}

.login100-form-btn {
  font-family: Montserrat-Bold;
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;
  height: 40px;
  border-radius: 5px;
  background: #7e3bc3;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  background: #484748;
}
li.sj{
background:none;}
    
</style>
</head>
<body>
<%
   MemberVO mvo=(MemberVO)session.getAttribute("mvo");
   String loginYN = "login.jsp?page=";
   String selflink = "MapTest.jsp";
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

   
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
	
    <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        <p>
        <div class="container-login100-form-btn">
            <button onclick="setOverlayMapTypeId('traffic')" class="login100-form-btn">교통정보 보기</button> &nbsp;
            <button id="navi" href="#" onclick="myKakaoNavi1()" class="login100-form-btn">내비</button>&nbsp;
            <button onclick="onDisplay()" class="login100-form-btn">검색창 보이기</button>&nbsp;
            <button onclick="offDisplay()" class="login100-form-btn">검색창 숨기기</button>
            </p>
        </div>
        <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" value="제주" id="keyword" size="15"> 
                        <button type="submit">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f10bde5d4f1ce8537df658a268a51e2&libraries=services,clusterer"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
    var markers = [];
    var marker=[];
    <%
    	DAO dao = new DAO();
		// 나중에 고쳐서 쓸것
		//ArrayList<BuildingVO> positions = new ArrayList<BuildingVO>();
		ArrayList<BuildingVO> bldlist=dao.BldSel();
		ArrayList<ParkingVO> prklist=dao.PrkSel();
		ArrayList<ReservationVO> reslist=dao.ResSel();
		ArrayList<BuildingVO> bldhidon=dao.BldHidOn();
		ArrayList<ParkableVO> prkablelist=dao.Prkable();
		//임시 데이터
		
    %>
    var overlay=[];
    var positions = [];
    
    
    //내용 집어 넣기
    <%for(int i = 0; i < bldhidon.size(); i++){%>
	    var content = '<div class="overlaybox">' +
	    '    <div class="boxtitle"><%=bldhidon.get(i).getBld_name()%></div>' +
	            '            <div class="close" onclick="closeOverlay(<%=i %>)" title="닫기"></div>' +
	    '    <div class="first" style="background:url(./img/<%=bldhidon.get(i).getBld_picture1()%>)">' +
	    
	    '        <div class="movietitle text">사용가능한 주차장수 <%for(int j=0; j<prkablelist.size();j++){if(bldhidon.get(i).getBld_seq()==prkablelist.get(j).getBld_seq()){%><%=prkablelist.get(j).getBld_prkable()%><%}}%></div>' +
	    '    </div>' +
	    '    <ul>' +
	    '        <li>' +
	    '            <span class="title"><%=bldhidon.get(i).getSigungu()%> <%=bldhidon.get(i).getEmdong()%> <%=bldhidon.get(i).getDetail_addr()%></span>' +
	    '        </li>' +
	    '        <li>' +
	    				
	    '            <span class="title">시간당 <%=dao.PrkFeeSelect(bldhidon.get(i).getBld_seq())%> 원</span>' +
	    

	    '        </li>' +
	    '        <li class = "sj">' +
	    			
	    '            <button id="ressel" onclick = "clickFunction(<%=bldhidon.get(i).getBld_seq()%>)">예약</button>' +
    			
	    
	    '        </li>' +
	    
	    '    </ul>' +
	    '</div>';
    	
    	positions.push({
    		title : '<%=bldhidon.get(i).getBld_name() %>',
    		latlng: new kakao.maps.LatLng(<%=bldhidon.get(i).getBld_lati() %>, <%=bldhidon.get(i).getBld_longi() %>),
        	content:content
    	});
    <%}%>
    
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    }); 
    
    for (let i = 0; i < positions.length; i ++) {
        
        // 마커를 생성합니다
            marker[i] = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            // image : markerImage // 마커 이미지 
        });
        overlay[i] = new kakao.maps.CustomOverlay({
            content: positions[i].content,
            map: map,
            position:positions[i].latlng,
            xAnchor: 0.3,
            yAnchor: 0.99         
        });
        
            kakao.maps.event.addListener(marker[i], 'click', function() {
            return function() {
             overlay[i].setMap(map);
             
            
         };
        }(overlay));
                
        overlay[i].setMap(null);
        
    };
    
    
    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(marker);
    
        function openOverlay(overlay) {
        overlay.setMap(map);     
    }
    
    function closeOverlay(k) {

            overlay[k].setMap(null);     
        
        
    }
    function selectRes(i){
    	bldhidon[i]
    }
    
    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();  
    
    
    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    
    // 키워드로 장소를 검색합니다
    searchPlaces();
    
    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {
    
        var keyword = document.getElementById('keyword').value;
    
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
    
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }
    
    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
    
            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);
    
            // 페이지 번호를 표출합니다
            displayPagination(pagination);
    
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
    
            alert('검색 결과가 존재하지 않습니다.');
            return;
    
        } else if (status === kakao.maps.services.Status.ERROR) {
    
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
    
        }
    }
    
    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {
    
        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);
    
        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {
    
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i), 
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
    
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);
    
            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });
    
                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
    
                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };
    
                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);
    
            fragment.appendChild(itemEl);
        }
    
        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
    
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }
    
    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {
    
        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';
    
        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           
    
        el.innerHTML = itemStr;
        el.className = 'item';
    
        return el;
    }
    
    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });
    	
        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    	
        return marker;
    }
    
    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }
    
    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 
    
        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }
    
        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;
    
            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }
    
            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }
    
    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
    
     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
    //Kakao.init('6f10bde5d4f1ce8537df658a268a51e2');
    function myKakaoNavi1() {
        Kakao.Navi.start({
            name:"목적지명",
            x:127.026581,
            y:37.49887,
            coordType:'wgs84'
        })
    }
    // 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
var currentTypeId;

    // 예약버튼 눌렀을때 정보 전송
	
var test=0;
	function clickFunction(data){
    		
    	
			//1. 보내줄 데이터 정리하기
			<%-- <% 
			System.out.print("들어오닝");

			HttpSession session2 = request.getSession();
			session2.setAttribute("bldhidon", bldhidon.get(data));
			%> --%>
			
			console.log("test"+data);
			test=data;
			

			//2. 이동
			location.href = "booking.jsp?data="+data;
			sessionStorage.setItem("bldhidon", test);
		
	}
    

// 버튼이 클릭되면 호출되는 함수입니다
function setOverlayMapTypeId(maptype) {
    var changeMaptype;
    
    // maptype에 따라 지도에 추가할 지도타입을 결정합니다
    if (maptype === 'traffic') {            
        
        // 교통정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.TRAFFIC;     
        
    } 
    
    // 이미 등록된 지도 타입이 있으면 제거합니다
    if (currentTypeId) {
        map.removeOverlayMapTypeId(currentTypeId);    
    }
    
    // maptype에 해당하는 지도타입을 지도에 추가합니다
    map.addOverlayMapTypeId(changeMaptype);
    
    // 지도에 추가된 타입정보를 갱신합니다
    currentTypeId = changeMaptype;        
}
	function onDisplay() {
		$('.bg_white').show();
	}
	function offDisplay() {
		$('.bg_white').hide();
		removeMarker();
	}
    </script>
    <!-- Footer section -->
    <p>&nbsp;</p><p>&nbsp;</p>
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
	
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
    </body>    
</html>