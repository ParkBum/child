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
<script src="https://d3js.org/d3.v4.min.js"></script>
<style type="text/css">
#main {
	width: 1600px;
	margin-left: 150px;
} 

#SearchAndMap {
	width: 100%;
	height: 800px;
	/* text-align: center; */
	display: table;
/* 	border : solid 1px black; */
}

#search {
	width: 100%;
	height: 80px;
	vertical-align: middle;
}

#map_wrap {
	width: 100%;
	height: 700px;
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
<%-- 반반 --%>
.half{
 float: left;
  width: 50%;
  padding: 15px;
}
.bar {
 /* 	border : solid 1px black; */
  padding: 15px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="SearchAndMap">
			<!-- <form action="search.child" method="post"> -->
			<div class="half">
			<div id="search">
				<div style="text-align: center; width: 100%; height: 80px; background: #FFF3F6;">
					<div style="width: 100%; height: 40px; margin:auto 0; display: inline-block;">
						<div style="width: 30%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">구를 선택해주세요&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="gu" id="gu">
								<option value="">선택하세요</option>
								<option onselect="">강남구</option>
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
						<div style="width: 30%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">어린이집 유형&nbsp;&nbsp;</font> <select  style="margin-top: 4px;" name="type" id="type">
								<option value="">선택하세요</option>
								<option>가정</option>
								<option>국공립</option>
								<option>민간</option>
								<option>법인·단체등</option>
								<option>사회복지법인</option>
								<option>협동</option>
								<option>직장</option>
							</select>
						</div>
						<div style="width: 39%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">통원 버스 유무&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="bus" id="bus">
								<option value="">선택하세요</option>
								<option>운영</option>
								<option>미운영</option>
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs" value="조회">
						</div>
					</div>
					<div style="width: 100%; height: 40px;">
					<button onclick="hideMarkers()">지도 초기화</button>
					</div>
				</div>
			</div>
			<!-- </form> -->
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; margin: 10px 0"
					align="center"></div>
			</div>
			</div>
			<!-- map_wrap의 끝 -->
			<div class="half" style="display: block;">
			<div class="bar" style="height:70%;">
			<svg style="width: 750; height:450; border:solid 1px black;"></svg> 
			</div>
			<div class="bar" style="height:30%;">
				<div style="width:750px; height : 270px; border:solid 1px black;"></div> 
			</div>
			</div>
		</div>
		<!-- SearchAndMap -->
		<!-- right side  시작-->
		<!-- <div id="rightside"><svg style="width:800; height:500; border:solid 1px black; float: right; "></svg></div> -->
	</div>


	<%-- 지도를 생성을 합니다. --%>
<script type="text/javascript">
		// 지동 생성에 필요한 값들
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
			level : 2, // 지도의 확대 레벨
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption);

		//지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		//생성된 마커 객체들을 실을 배열 객체
		var markers = [];
		$("#searchs").click(function() {
			var gu = $("#gu").val();
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
				dataType : "json", // ajax 통신으로 받는 타입
				success : function(data) {
					if (data.daycarelist.length == 0){
						alert("조건에 일치하는 어린이집이 없습니다.")
					}
					for (var i = 0; i < data.daycarelist.length; i++) {
						var Map = map;
						var coords = new daum.maps.LatLng(
            					data.daycarelist[i].lat,data.daycarelist[i].lon		
            					);
							
						var imageSrc = '';
						if(data.daycarelist[i].bus == '운영')
							 imageSrc = 'https://cdn.icon-icons.com/icons2/682/PNG/512/school-bus_icon-icons.com_61070.png';	
						else	 
							 imageSrc = 'https://cdn.icon-icons.com/icons2/469/PNG/128/Christmas_2015-32_44374.png'; // 마커이미지의 주소입니다 	
							 
					    var imageSize = new daum.maps.Size(45, 45); // 마커이미지의 크기입니다
					    var imageOption = {offset: new daum.maps.Point(27, 27)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords,
    						image : markerImage 
    					});
    					marker.setMap(map);
    					markers.push(marker);

    					var content = '<div class="labelWish" style="opacity:0.5; width:400px;"><span class="leftWish"></span><span class="centerWish">'
							+"어린이집 이름: "+data.daycarelist[i].name+'&nbsp;&nbsp;<button id="compare" value='+data.daycarelist[i].code+'>비교하기</button><br>전화번호: '+data.daycarelist[i].tel+'<br>주소:'+data.daycarelist[i].addr+'</span><span class="rightWish"></span></div>';
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content
							}); 
        				 map.setCenter(coords);	 
        			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
        			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
        			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
/*         			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));  */
        			    (function(marker, infowindow) {
        			        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        			        daum.maps.event.addListener(marker, 'mouseover', function() {
        			            infowindow.open(map, marker);
        			        });

        			        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        			        daum.maps.event.addListener(marker, 'click', function() {
        			            infowindow.close();
        			        });
        			    })(marker, infowindow);

					}
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener( map, marker, infowindow) { 
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


				}
			});
		})
//띄운 마커 감추기
function hideMarkers() {
	 for (var i = 0; i < markers.length; i++) {
	      markers[i].setMap(null);
   	}    
	 
}
<%-- 그래프 비교  ajax --%>
$("#compare").click(function() {
	var code = $("#compare").val();
	var data = {
		"code" : code
	}
	$.ajax({
		url : "graph.child",
		type : "post",
		data : data,
		dataType : "json", // ajax 통신으로 받는 타입
		success : function(data) {
			alert(data);
		}});
  });

</script>

</body>
</html>