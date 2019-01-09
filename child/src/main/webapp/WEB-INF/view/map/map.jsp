
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
<script>
$(function() {
           
        })
</script>
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

#map_wrap {
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
			<!-- <form action="search.child" method="post"> -->
			<div id="search">
				<div
					style="margin: 0 auto; vertical-align: middle; width: 100%; display: inline-block;">
					<div style="width: 100%; height: 30px; margin: 5px auto;">
						<div style="width: 33%; float: left;">
							구를 선택해주세요&nbsp;&nbsp; <select name="gu" id="gu">
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
								<option></option>
							</select>
						</div>
						<div style="width: 33%; float: left;">
							어린이집 유형&nbsp;&nbsp; <select name="type" id="type">
								<option value="">선택하세요</option>
								<option>가정</option>
								<option>국공립</option>
								<option>민간</option>
								<option>법인·단체등</option>
								<option>사회복지법인</option>
								<option>협동</option>
								<option></option>
							</select>
						</div>
						<div style="width: 33%; float: left;">
							통원 버스 유무&nbsp;&nbsp; <select name="bus" id="bus">
								<option value="">선택하세요</option>
								<option>운영</option>
								<option>미운영</option>
								<option></option>
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs"
								value="조회">
						</div>
					</div>
				</div>
			</div>
			<!-- </form> -->
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; margin: 15px auto; padding: 10px;"
					align="center"></div>
			</div>
			<!-- map_wrap의 끝 -->
		</div>
		<!-- SearchAndMap -->
	</div>


	<%-- 지도를 생성을 합니다. --%>
	<script type="text/javascript">	
		
		var mapContainer = document.getElementById('map');	
		
		var mapOptions = {									<%-- 지도의  기본 위치와 확대정도를 나타냄 --%>			
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		<%-- 맵객체 정의 --%>
		var map = new daum.maps.Map(mapContainer, mapOptions);		
		
		
		
		<%-- 현재 나의 위치를 찍는 구간 --%>
		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
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
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}

		
		
		<%--좌표 지정 --%>
		var geocoder = new daum.maps.services.Geocoder();
		
		
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
		
		// 마커표시
		var positions = new Array();
		   
		   window.onload = function() {
		      for (var i = 0; i < positions.length; i ++) {
		          // 마커를 생성합니다
		          var marker = new daum.maps.Marker({
		              map: map, // 마커를 표시할 지도
		              position: positions[i].latlng // 마커의 위치
		          });
		      
		          // 마커에 표시할 인포윈도우를 생성합니다 
		          var infowindow = new daum.maps.InfoWindow({
		              content: positions[i].content // 인포윈도우에 표시할 내용
		          });
		      
		          // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		          // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		          // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		          daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		          daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		      }
		   };
		   
		   
		   $("#searchs").click(
	                 function() {
	                    var gu = $("#gu").val();
	                    alert("gu"+gu)
	                    
	                    var type = $("#type").val();
	                    var bus = $("#bus").val();
	                    var data = {
	                       "gu" : gu,
	                       "type" : type,
	                       "bus" : bus
	                       }
	                    $.ajax({ 
	                       url : "search.child",
	                       type : "post",
	                       data : data,
	                       dataType : "html", // ajax 통신으로 받는 타입
	                       success : function(data) {
	                           for(var i=0; i<data.length; i++){
	 	                    	    content = {
	                                   content: data[i].name, 
	                                   latlng: new daum.maps.LatLng(data[i].lat, data[i].lon)
	                             }
	                             positions.push(content);
	                           }
	                       },
	                       error : function(xhr, status, error) { //서버응답 실패
	                          alert("서버오류 : " + xhr.status + ", error : "
	                                + error + ", status : " + status);
	                       }
	                    })
	                 })


// 지도에 마커와 인포윈도우를 표시하는 함수입니다 
// 단순히 마커를 표시하는 메서드
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>

</body>
</html>