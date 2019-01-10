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
#SearchAndMap {
	width: 800px;
	height: 800px;
	text-align: center;
}

#search {
	width: 100%;
	height: 80px;
	background-color: white;
	margin: 0 10px;
	vertical-align: middle;
}

#map_wrap {
	width: 100%;
	height: 700px;
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
					<div style="margin: 0 auto;  vertical-align: middle; width: 100%; height:100%; padding : 0 auto;display: inline-block; background: #FFCCCC;">
						<div style="width: 100%; height: 100%; margin-top : 10px;">
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
								</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs" value="��ȸ">
							</div>
							<p id="result"></p>
						</div>
					</div>
				</div>
			<!-- </form> -->
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; margin: 0 auto; padding: 10px;" align="center"></div>
			</div><!-- map_wrap�� �� -->
		</div><!-- SearchAndMap -->
	</div>
			

<%-- ������ ������ �մϴ�. --%>
<script type="text/javascript">	
		
		var mapContainer = document.getElementById('map');	
		
		var mapOptions = {									<%-- ������  �⺻ ��ġ�� Ȯ�������� ��Ÿ�� --%>			
			center: new daum.maps.LatLng(37.477885, 126.878985),
			level: 3
		};
		
		<%-- �ʰ�ü ���� --%>
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
		     /*    displayMarker(locPosition, message); */
		            
		      });
		    
		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
		    
		    var locPosition = new daum.maps.LatLng(37.477885, 126.878985),    
		        message = 'geolocation�� ����Ҽ� �����..'
		        
		    /* displayMarker(locPosition, message); */
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

		//���ּ� ��ü ���� 
		var addrs = [];
/* 		   window.onload = function() {
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
		   }; */
<%-- </script>

<div id="a">
 <c:forEach items="${daycarelist}" var="daycare">
      <script type="text/javascript">
         var content = {
               content: '<div>${daycare.name}</div>', 
               latlng: new daum.maps.LatLng("${daycare.lat}", "${daycare.lon}")
         }
         positions.push(content);
      </script>
</c:forEach>
</div>
<script> --%>
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
              		
              		name = addrs[i].name; //i=0
              		tel = addrs[i].tel;
              		homepage = addrs[i].homepage;
              		code = addrs[i].code;
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
            									+'�ּ�:'+name+'<br>��ȭ��ȣ:'+tel+'<br>�ּ�:'+result[0].address_name+'</span><span class="rightWish"></span></div>',
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
            					infowindow.open(map, marker); 
            	            	map.setCenter(coords);	
            				}
            			}
            			);
            		
            	}
                  
              },
              error : function(xhr, status, error) { //�������� ����
                 alert("�������� : " + xhr.status + ", error : "
                       + error + ", status : " + status);
              }
           })
        })
                	  /*  searchMarker(data.daycarelist[i].lat,data.daycarelist[i].lon,i); */
                	  /* var content = {
                      content: data.daycarelist[i].name, 
                      latlng: new daum.maps.LatLng(data.daycarelist[i].lat, data.daycarelist[i].lon)
                }
                positions.push(content);
              }
              displayMarker(locPosition, message) */        
 
              
// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ� 
/* function displayMarker(locPosition, message) {

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
 
}  */   


/* function searchMarker(lat,lon,i){
	  var locPosition = new daum.maps.LatLng(lat, lon)
		
	  var marker = new daum.maps.Marker({
          position: locPosition
          
      });
	  
	  
      marker.setMap(map);

      //���� ������
      daum.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
              var infowindow = new daum.maps.InfoWindow({
                  content: '<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif">' + locations[i] + '</p>',
                  removable : true
              });
            infowindow.open(map, marker);
          }
      })(marker, i)); 

} */
</script>

</body>
</html>