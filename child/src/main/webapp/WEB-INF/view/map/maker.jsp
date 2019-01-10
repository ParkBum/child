<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<script>
var mapOptions = {									<%-- ������  �⺻ ��ġ�� Ȯ�������� ��Ÿ�� --%>			
center: new daum.maps.LatLng(33.450701, 126.570667),
level: 3
};

<%-- �ʰ�ü ���� --%>
var map = new daum.maps.Map(mapContainer, mapOptions);		



<%-- ���� ���� ��ġ�� ��� ���� --%>
//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
if (navigator.geolocation) {

// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
navigator.geolocation.getCurrentPosition(function(position) {
    
    var lat = position.coords.latitude, // ����
        lon = position.coords.longitude; // �浵
    
    var locPosition = new daum.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
        message = '<div style="padding:5px;">���� ��ġ �Դϴ�.</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
    
    // ��Ŀ�� ���������츦 ǥ���մϴ�
    displayMarker(locPosition, message);
        
  });

} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
    message = 'geolocation�� ����Ҽ� �����..'
    
displayMarker(locPosition, message);
}
<%-- ���� ���� ��ġ�� ��� ���� --%>

var geocoder = new daum.maps.services.Geocoder();


// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

// ��Ŀǥ��
var positions = new Array();

window.onload = function() {
   for (var i = 0; i < positions.length; i ++) {
       // ��Ŀ�� �����մϴ�
       var marker = new daum.maps.Marker({
           map: map, // ��Ŀ�� ǥ���� ����
           position: positions[i].latlng // ��Ŀ�� ��ġ
       });
   
       // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
       var infowindow = new daum.maps.InfoWindow({
           content: positions[i].content // ���������쿡 ǥ���� ����
       });
   
       // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
       // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
       // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
       daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
       daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
   }
};

function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // ���������쿡 ǥ���� ����
        iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // ���������츦 ��Ŀ���� ǥ���մϴ� 
    infowindow.open(map, marker);
    
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
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