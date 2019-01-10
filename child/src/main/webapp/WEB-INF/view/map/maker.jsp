<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<script>
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
<%-- 현재 나의 위치를 찍는 구간 --%>

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
<c:forEach items="${daycarelist}" var="daycare">
      <script type="text/javascript">
         var content = {
               content: '<div>${daycare.name}</div>', 
               latlng: new daum.maps.LatLng("${daycare.lat}", "${daycare.lon}")
         }
         positions.push(content);
      </script>
</c:forEach>