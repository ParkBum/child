<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>어린이집 검색</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ea2633155fc8b442f8cc095a5798ccf&libraries=services"></script>
<style type="text/css">
#SearchAndMap {
	width: 60%;
	height: 780px;
	text-align: center;
}

#search {
	width: 100%;
	height: 80px;
	background-color: white;
	margin: 0 10px;
	/* 	border: solid 1px black; */
	vertical-align: middle;
}

#wmap {
	width: 100%;
	height: 700px;
	border: solid 1px black;
	margin: 0 10px;
}

#map .buttons {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1000;
	padding: 5px;
}

#map .buttons .control-btn {
	margin: 0 5px 5px 0;
}

option {
	font-size: large;
}
</style>
</head>
<body>
	<div id="L" align="center">
		<div id="SearchAndMap">
			<form action="search.child" method="post">
				<div id="search">
					<div
						style="margin: 0 auto; /* vertical-align: middle; */ width: 100%; display: inline-block;">
						<div style="width: 100%; height: 30px; margin: 5px auto;">
							<div style="width: 33%; float: left;">
								구를 선택해주세요&nbsp;&nbsp; <select name="gu">
									<option>강남구</option>
									<option>강동구</option>
									<option>강북구</option>
									<option>강서구</option>
									<option>관악구</option>
									<option>광진구</option>
									<option>구로구</option>
									<option>금천구</option>
									<option>노원구</option>
									<option>도봉구</option>
									<option>동대문구</option>
									<option>동작구</option>
									<option>마포구</option>
									<option>서대문구</option>
									<option>서초구</option>
									<option>성동구</option>
									<option>성북구</option>
									<option>송파구</option>
									<option>양천구</option>
									<option>영등포구</option>
									<option>용산구</option>
									<option>은평구</option>
									<option>종로구</option>
									<option>중구</option>
									<option>중랑구</option>
								</select>
							</div>
							<div style="width: 33%; float: left;">
								어린이집 유형&nbsp;&nbsp; <select name="type">
									<option value="">선택하세요</option>
									<option>가정</option>
									<option>국공립</option>
									<option>민간</option>
									<option>법인·단체등</option>
									<option>사회복지법인</option>
									<option>협동</option>
								</select>
							</div>
							<div style="width: 33%; float: left;">
								통원 버스 유무&nbsp;&nbsp; <select name="bus">
									<option value="">선택하세요</option>
									<option>운영</option>
									<option>미운영</option>
								</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="조회">
							</div>
						</div>
						<!-- <div style="width:100%; height : 30px; margin : 5px auto;">
 				<input type="text" name="word" placeholder="검색할 단어를 입력해주세요"> 
				</div> -->
					</div>
				</div>

			</form>
			<div id="wmap" align="center">
				<div id="map"
					style="width: 95%; height: 95%; margin: 15px auto; padding: 10px;"
					align="center"></div>
				<!-- 지도 띄우는 창 -->
			</div>

<script type="text/javascript">	<%-- 지도를 생성을 합니다. --%>
		<%-- 지도 생성 --%>
		var container = document.getElementById('map');
		<%-- 지도의  기본 위치와 확대정도를 나타냄 --%>
		var options = {												
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		<%-- 맵객체 정의 --%>
		var map = new daum.maps.Map(container, options);			
</script>

<script type="text/javascript">
<%--좌표 지정 --%>
var geocoder = new daum.maps.services.Geocoder();		

// 마커표시
var positions = new Array();						<%-- 여러개의 , 포지션을 정하기 위해서.. --%>
 
window.onload = function() {
    for (var i = 0; i < positions.length; i ++) {		<%-- positions에 객체가 저장됨.. --%>
          // 마커를 생성합니다
          var marker = new daum.maps.Marker({
              map: map, 								// 마커를 표시할 지도
              position: positions[i].latlng 			// 마커의 위치
          });
      
          												// 마커에 표시할 인포윈도우를 생성합니다 
          var infowindow = new daum.maps.InfoWindow({
              content: positions[i].content 			// 인포윈도우에 표시할 내용
          });

          												
          // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
          // 이벤트 리스너로는 클로저를 만들어 등록합니다 
          // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
          daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
          daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
      }
   };



function mylocation(){
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">현재 위치 입니다.</div>'; // 인포윈도우에 표시될 내용입니다
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	      });
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
	        message = '현재 위치를 찾을 수 없습니다. '
	    displayMarker(locPosition, message);
	}
}

mylocation();

// 클릭시 정보나옴 
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
		   
var callback = function(result, status) {
    if (status === daum.maps.services.Status.OK) {
        console.log(result);
    }
};
</script>
			<c:forEach var="addrs" items="${addr}">
				<script>geocoder.addressSearch(${addrs}, callback);</script>
			</c:forEach>
<script>
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) { 	
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
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
</script>

		</div>
	</div>
</body>
</html>