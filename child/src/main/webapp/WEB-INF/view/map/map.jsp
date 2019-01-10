
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
	/* $(function() {
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
	 alert(data);
	 $("#a").html(data); 
	 },
	 error : function(xhr, status, error) { //�������� ����
	 alert("�������� : " + xhr.status + ", error : "
	 + error + ", status : " + status);
	 }
	 })
	 })
	 }) */
</script>
<style type="text/css">
#main {
	width: 1600px;
	margin-left: 150px;
}

#SearchAndMap {
	width: 800px;
	height: 800px;
	/* text-align: center; */
}

#search {
	width: 100%;
	height: 80px;
	background-color: white;
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
</style>
</head>
<body>
	<div id="main">
		<div id="SearchAndMap">
			<!-- <form action="search.child" method="post"> -->
			<div id="search">
				<div
					style="text-align: center; width: 100%; height: 100%; display: inline-block; background: #FFF3F6;">
					<div style="width: 100%; height: 100%; margin-top: 20px;">
						<div style="width: 33%; float: left;">
							���� �������ּ���&nbsp;&nbsp; <select name="gu" id="gu">
								<option value="">�����ϼ���</option>
								<option onselect="">������</option>
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
								<option>����</option>
							</select>
						</div>
						<div style="width: 33%; float: left;">
							��� ���� ����&nbsp;&nbsp; <select name="bus" id="bus">
								<option value="">�����ϼ���</option>
								<option>�</option>
								<option>�̿</option>
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs"
								value="��ȸ">
						</div>
					</div>
				</div>
			</div>
			<!-- </form> -->
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; margin: 10px 0"
					align="center"></div>
			</div>
			<!-- map_wrap�� �� -->
		</div>
		<!-- SearchAndMap -->
	</div>


	<%-- ������ ������ �մϴ�. --%>
<script type="text/javascript">
		// ���� ������ �ʿ��� ����
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new daum.maps.LatLng(37.56682, 126.97865), // ������ �߽���ǥ
			level : 3, // ������ Ȯ�� ����
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// ��������
		};

		// ������ �����Ѵ� 
		var map = new daum.maps.Map(mapContainer, mapOption);

		//������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
		var zoomControl = new daum.maps.ZoomControl();

		// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
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
				dataType : "json", // ajax ������� �޴� Ÿ��
				success : function(data) {
					if (data.daycarelist.length == 0){
						alert("���ǿ� ��ġ�ϴ� ������� �����ϴ�.")
					}
					for (var i = 0; i < data.daycarelist.length; i++) {
						var Map = map;
						alert(data.daycarelist[i].code)
						var coords = new daum.maps.LatLng(
            					data.daycarelist[i].lat,data.daycarelist[i].lon		
            					);
							
						var imageSrc = '';
						if(data.daycarelist[i].bus == '�')
							 imageSrc = 'https://cdn.icon-icons.com/icons2/1706/PNG/128/3986695-bus-school_112262.png';	
						else	 
							 imageSrc = 'https://cdn.icon-icons.com/icons2/1750/PNG/128/015location_113739.png'; // ��Ŀ�̹����� �ּ��Դϴ� 	
							 
					    var imageSize = new daum.maps.Size(45, 45); // ��Ŀ�̹����� ũ���Դϴ�
					    var imageOption = {offset: new daum.maps.Point(27, 27)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords,
    						image : markerImage 
    					});
    					marker.setMap(map);
    					var content = '<div class="labelWish" style="opacity:0.5; width:400px;"><span class="leftWish"></span><span class="centerWish">'
							+"����� �̸�: "+data.daycarelist[i].name+'<br>��ȭ��ȣ: '+data.daycarelist[i].tel+'<br>�ּ�: '+data.daycarelist[i].addr+'</span><span class="rightWish"></span></div>',
							iwRemoveable = true;
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content
							}); 
        				map.setCenter(coords);	
        				
        			    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
        			    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
        			    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
        			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}
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
				}
			});
		})
	<%-- 		var mapContainer = document.getElementById('map');	
		
		var mapOptions = {									������  �⺻ ��ġ�� Ȯ�������� ��Ÿ��			
			center: new daum.maps.LatLng(37.477885, 126.878985),
			level: 3
		};
		
		�ʰ�ü ����
		var map = new daum.maps.Map(mapContainer, mapOptions);
		// �� ��Ʈ�ѹ� 
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
		// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
		    
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		    
		});
		
		
		���� ���� ��ġ�� ��� ����
		//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		if (navigator.geolocation) {
		    
		    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // ����
		            lon = position.coords.longitude; // �浵
		        
		        var locPosition = new daum.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
		            message = '<div style="padding:5px;">���� ��ġ �Դϴ�.</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
		        
		        // ��Ŀ�� ���������츦 ǥ���մϴ�
		     /*    displayMarker(locPosition, message); */
		            
		      });
		    
		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
		    
		    var locPosition = new daum.maps.LatLng(37.477885, 126.878985),    
		        message = 'geolocation�� ����Ҽ� �����..'
		        
		    /* displayMarker(locPosition, message); */
		}
			��ǥ ����
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
		var addrs = [];

$("#searchs").click(
        function() {
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
              dataType : "json", // ajax ������� �޴� Ÿ��
              success : function(data) {
                  for(var i=0; i<data.daycarelist.length; i++){              	  
                	  addrs.push({"address":data.daycarelist[i].addr,"name":data.daycarelist[i].name,"tel":data.daycarelist[i].tel,"code":data.daycarelist[i].code,"score":data.daycarelist[i].score,"type":data.daycarelist[i].type,"nows":data.daycarelist[i].nows,"bus":data.daycarelist[i].bus,"classcnt":data.daycarelist[i].classcnt,"homepage":data.daycarelist[i].homepage});
                	  /* alert(addrs[i].address) */
              	}
                
              	for (var i = 0; i < addrs.length; i++){ 

            		geocoder.addressSearch(
            			addrs[i].address, //��� ���ư� 0~ addrs.length
            			function(result,status,data){
            				//������ �˻� ��
          
            				if(status == daum.maps.services.Status.OK){
            					console.log(result[0].y,result[0].x)
            					var coords = new daum.maps.LatLng(
            					result[0].y,result[0].x		
            					);
            					var marker = new daum.maps.Marker({
            						map:map,
            						position:coords
            					});
            					marker.setMap(map);
            					
            					var content = '<div class="labelWish" style="opacity:0.7; width:400px;"><span class="leftWish"></span><span class="centerWish">'
            									+"�ּ�:"+result[0].address_name+'</span><span class="rightWish"></span></div>',
            						iwRemoveable = true;
            								
            					var infowindow = new daum.maps.InfoWindow({
            									    position : coords, 
            									    content : content,
            									    removable : iwRemoveable
            									});
            					daum.maps.event.addListener(marker, 'click', function() {
            					      // ��Ŀ ���� ���������츦 ǥ���մϴ�
            					      infowindow.open(map, marker);  
            					});
            					
            	            	map.setCenter(coords);	
            				}
            			});
            		
            	}
                  
              },
              error : function(xhr, status, error) { //�������� ����
                 alert("�������� : " + xhr.status + ", error : "
                       + error + ", status : " + status);
              }
           })
        })
 --%>
		
	</script>

</body>
</html>