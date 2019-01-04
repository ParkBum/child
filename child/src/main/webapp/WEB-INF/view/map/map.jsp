<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<script type="text/javascript" src="../../docs/js/examples-base.js"></script>
<script type="text/javascript" src="../../docs/js/highlight.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/maps3.js?clientId=o9mqgo9laj&oss=true&amp;submodules=panorama&amp;submodules=geocoder"></script>
<link rel="stylesheet" type="text/css"
	href="../../docs/css/examples-base.css" />
<style type="text/css">
#SearchAndMap {
	width: 100%;
	height: 350px;
}

#search {
text-align : center;
	float: left;
	width: 40%;
	height: 350px;
	background-color: white;
	margin: 0 10px;
	border: solid 1px black;
}

#wmap {
	float: right;
	width: 55%;
	height: 350px;
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
	<div id="SearchAndMap">
		<form action="search.child" method="post">
		<div id="search">
			<div style="display: inline-block; margin :8% auto; vertical-align: middle; width : 80%;">
					<p>구를 선택해주세요</p>
					<select name="gu">
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
					<p>어린이집 유형</p>
					<select name="type">
							<option value="">선택하세요</option>
							<option>가정</option>
							<option>국공립</option>
							<option>민간</option>
							<option>법인·단체등</option>
							<option>사회복지법인</option>
							<option>협동</option>
					</select>
					<p>통원 버스 유무</p>
					<select name="bus">
							<option value="">선택하세요</option>
							<option>운영</option>
							<option>미운영</option>
					</select>
					<hr>
				<input type="text" name="word" placeholder="검색할 단어를 입력해주세요">
				<input type="submit" value="검색">			
			</div>
		</div>
		</form>
		<div id="wmap">
			<div id="map" class="section"
				style="width: 95%; height: 330px; margin: 10px auto;">
				<div class="buttons">
					<input id="controls" type="hidden" name="모든 지도 컨트롤" value="모든 지도 컨트롤" class="control-btn" />
					<input id="min-max-zoom" type="hidden" name="최소/최대 줌 레벨" class="control-btn" />
				</div>
			</div>
			<code id="snippet" class="snippet"></code>
		</div>
		<script id="code">
			//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
			var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일
			//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 11 레벨의 지도가 생성됩니다.
			
			var map = new naver.maps.Map(mapDiv, {
				center : new naver.maps.LatLng(37.2900533, 127.1036797),
				zoom : 10,
				zoomControl : true,
				zoomControlOptions : {
					position : naver.maps.Position.TOP_RIGHT
				},
				mapTypeControl : true,
				mapTypeControlOptions : {
					position : naver.maps.Position.TOP_LEFT
				}
			});
			//지도 컨트롤
			$("#interaction, #tile-transition, #controls").addClass(
					"control-on");
		</script>
		<script type="text/javascript">
		var map = document.getElementById('map');
		//마커 찍기
		<c:forEach items="${addr}" var="addrs">
		var myaddress = ${addrs};
		naver.maps.Service.geocode({address:myaddress},function(status,response) {
			if (status !== naver.maps.Service.Status.OK) {
	              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
	          }
		
		var result = response.result;
		 // 검색 결과 갯수: result.total
         // 첫번째 결과 결과 주소: result.items[0].address
         // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
         var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
         // 마커 표시
         var marker = new naver.maps.Marker({
             position: myaddr,
             map: map
		});
         // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
		});
        </c:forEach>
		</script>
	</div>
</body>
</html>