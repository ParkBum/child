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
<title>����� �˻�</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
 <style>/* ���� ����� ��Ʈ�ѷ� �߰�  */
 html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '���� ���', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
</style>
</head>
<body>
	<div id="L" align="center">
		<div id="SearchAndMap">
			<form action="search.child" method="post">
				<div id="search">
					<div style="margin: 0 auto;  vertical-align: middle; width: 100%; display: inline-block;">
						<div style="width: 100%; height: 30px; margin: 5px auto;">
							<div style="width: 33%; float: left;">
								���� �������ּ���&nbsp;&nbsp; <select name="gu">
									<option>������</option>
									<option>������</option>
									<option>���ϱ�</option>
									<option>������</option>
									<option>���Ǳ�</option>
									<option>������</option>
									<option>���α�</option>
									<option>��õ��</option>
									<option>�����</option>
									<option>������</option>
									<option>���빮��</option>
									<option>���۱�</option>
									<option>������</option>
									<option>���빮��</option>
									<option>���ʱ�</option>
									<option>������</option>
									<option>���ϱ�</option>
									<option>���ı�</option>
									<option>��õ��</option>
									<option>��������</option>
									<option>��걸</option>
									<option>����</option>
									<option>���α�</option>
									<option>�߱�</option>
									<option>�߶���</option>
									<option></option>
								</select>
							</div>
							<div style="width: 33%; float: left;">
								����� ����&nbsp;&nbsp; <select name="type">
									<option value="">�����ϼ���</option>
									<option>����</option>
									<option>������</option>
									<option>�ΰ�</option>
									<option>���Ρ���ü��</option>
									<option>��ȸ��������</option>
									<option>����</option>
									<option></option>
								</select>
							</div>
							<div style="width: 33%; float: left;">
								��� ���� ����&nbsp;&nbsp; <select name="bus">
									<option value="">�����ϼ���</option>
									<option>�</option>
									<option>�̿</option>
									<option></option>
								</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="��ȸ">
							</div>
						</div>
					</div>
				</div>
			</form>
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map" style="width: 95%; height: 95%; margin: 15px auto; padding: 10px;" align="center"></div>
				<div class="custom_typecontrol radius_border">
			        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">����</span>
			        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">��ī�̺�</span>
			    </div>
			    <!-- ���� Ȯ��, ��� ��Ʈ�� div �Դϴ� -->
			    <div class="custom_zoomcontrol radius_border"> 
			        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="Ȯ��"></span>  
			        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="���"></span>
			    </div>
			</div><!-- map_wrap�� �� -->
		</div><!-- SearchAndMap -->
	</div>
			

<%-- ������ ������ �մϴ�. --%>
<script type="text/javascript">	
		
		var mapContainer = document.getElementById('map');	
		
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
		
		
		
		
		
		
		
		


		<%--��ǥ ���� --%>
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
</script>

 <c:forEach items="${daycarelist }" var="daycare">
      <script type="text/javascript">
         var content = {
               content: '<div>${daycare.name}</div>', 
               latlng: new daum.maps.LatLng("${daycare.lat}", "${daycare.lon}")
         }
         positions.push(content);
      </script>
</c:forEach>
<script>



// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ� 
// �ܼ��� ��Ŀ�� ǥ���ϴ� �޼���
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
<script>
//����Ÿ�� ��Ʈ���� ���� �Ǵ� ��ī�̺� ��ư�� Ŭ���ϸ� ȣ��Ǿ� ����Ÿ���� �ٲٴ� �Լ��Դϴ�
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// ���� Ȯ��, ��� ��Ʈ�ѿ��� Ȯ�� ��ư�� ������ ȣ��Ǿ� ������ Ȯ���ϴ� �Լ��Դϴ�
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// ���� Ȯ��, ��� ��Ʈ�ѿ��� ��� ��ư�� ������ ȣ��Ǿ� ������ Ȯ���ϴ� �Լ��Դϴ�
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
</script>

</body>
</html>