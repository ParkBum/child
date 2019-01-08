<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ea2633155fc8b442f8cc095a5798ccf&libraries=services"></script>
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
<div id="L">
	<div id="SearchAndMap">
		<form action="search.child" method="post">
		<div id="search">
			<div style=" margin :0 auto; /* vertical-align: middle; */ width : 100%; display: inline-block;">
				<div style="width:100%; height: 30px; margin:5px auto;">
					<div style="width:33%; float: left;">
					구를 선택해주세요&nbsp;&nbsp;
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
					</div>
					<div style="width:33%; float: left;">
					어린이집 유형&nbsp;&nbsp;
					<select name="type">
							<option value="">선택하세요</option>
							<option>가정</option>
							<option>국공립</option>
							<option>민간</option>
							<option>법인·단체등</option>
							<option>사회복지법인</option>
							<option>협동</option>
					</select>
					</div>
					<div style="width:33%; float: left;">
					통원 버스 유무&nbsp;&nbsp;
					<select name="bus">
							<option value="">선택하세요</option>
							<option>운영</option>
							<option>미운영</option>
					</select>
					</div>
				</div>
				<div style="width:100%; height : 30px; margin : 5px auto;">
				<input type="text" name="word" placeholder="검색할 단어를 입력해주세요">
				<input type="submit" value="검색">			
				</div>
			</div>
		</div>
		
		
		</form><!-- 지도 -->
		<div id="wmap">
				<div id="map" style="width: 95%; height: 95%; margin: 15px auto;  padding:10px;"></div>
		</div>
		<script type="text/javascript">
		<%-- 지도 생성 --%>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
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
		
		</script>
		
      <c:forEach items="${daycarelist}" var="daycare">	<!-- 리스트 출력 -->
      <script type="text/javascript">
         var content = {
               content: '<div>${daycare.name}</div>', /* 이름 */
                 latlng: new daum.maps.LatLng("${daycare.lat}", "${daycare.lon}")/* 위도 경도 */
         }
         positions.push(content);
      </script>
      </c:forEach>
		
	</div>
</div>
</body>
</html>