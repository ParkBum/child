
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
<title>����� �˻�</title>
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
							���� �������ּ���&nbsp;&nbsp; <select name="gu" id="gu">
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
							����� ����&nbsp;&nbsp; <select name="type" id="type">
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
							��� ���� ����&nbsp;&nbsp; <select name="bus" id="bus">
								<option value="">�����ϼ���</option>
								<option>�</option>
								<option>�̿</option>
								<option></option>
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs"
								value="��ȸ">
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
			<!-- map_wrap�� �� -->
		</div>
		<!-- SearchAndMap -->
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
	                       dataType : "html", // ajax ������� �޴� Ÿ��
	                       success : function(data) {
	                           for(var i=0; i<data.length; i++){
	 	                    	    content = {
	                                   content: data[i].name, 
	                                   latlng: new daum.maps.LatLng(data[i].lat, data[i].lon)
	                             }
	                             positions.push(content);
	                           }
	                       },
	                       error : function(xhr, status, error) { //�������� ����
	                          alert("�������� : " + xhr.status + ", error : "
	                                + error + ", status : " + status);
	                       }
	                    })
	                 })


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

</body>
</html>