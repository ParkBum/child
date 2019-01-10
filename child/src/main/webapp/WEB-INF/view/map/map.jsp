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
<%-- �ݹ� --%>
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
							<font style="margin-top: 4px;">���� �������ּ���&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="gu" id="gu">
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
						<div style="width: 30%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">����� ����&nbsp;&nbsp;</font> <select  style="margin-top: 4px;" name="type" id="type">
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
						<div style="width: 39%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">��� ���� ����&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="bus" id="bus">
								<option value="">�����ϼ���</option>
								<option>�</option>
								<option>�̿</option>
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs" value="��ȸ">
						</div>
					</div>
					<div style="width: 100%; height: 40px;">
					<button onclick="hideMarkers()">���� �ʱ�ȭ</button>
					</div>
				</div>
			</div>
			<!-- </form> -->
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; margin: 10px 0"
					align="center"></div>
			</div>
			</div>
			<!-- map_wrap�� �� -->
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
		<!-- right side  ����-->
		<!-- <div id="rightside"><svg style="width:800; height:500; border:solid 1px black; float: right; "></svg></div> -->
	</div>


	<%-- ������ ������ �մϴ�. --%>
<script type="text/javascript">
		// ���� ������ �ʿ��� ����
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new daum.maps.LatLng(37.56682, 126.97865), // ������ �߽���ǥ
			level : 2, // ������ Ȯ�� ����
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// ��������
		};

		// ������ �����Ѵ� 
		var map = new daum.maps.Map(mapContainer, mapOption);

		//������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
		var zoomControl = new daum.maps.ZoomControl();

		// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		//������ ��Ŀ ��ü���� ���� �迭 ��ü
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
				dataType : "json", // ajax ������� �޴� Ÿ��
				success : function(data) {
					if (data.daycarelist.length == 0){
						alert("���ǿ� ��ġ�ϴ� ������� �����ϴ�.")
					}
					for (var i = 0; i < data.daycarelist.length; i++) {
						var Map = map;
						var coords = new daum.maps.LatLng(
            					data.daycarelist[i].lat,data.daycarelist[i].lon		
            					);
							
						var imageSrc = '';
						if(data.daycarelist[i].bus == '�')
							 imageSrc = 'https://cdn.icon-icons.com/icons2/682/PNG/512/school-bus_icon-icons.com_61070.png';	
						else	 
							 imageSrc = 'https://cdn.icon-icons.com/icons2/469/PNG/128/Christmas_2015-32_44374.png'; // ��Ŀ�̹����� �ּ��Դϴ� 	
							 
					    var imageSize = new daum.maps.Size(45, 45); // ��Ŀ�̹����� ũ���Դϴ�
					    var imageOption = {offset: new daum.maps.Point(27, 27)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords,
    						image : markerImage 
    					});
    					marker.setMap(map);
    					markers.push(marker);

    					var content = '<div class="labelWish" style="opacity:0.5; width:400px;"><span class="leftWish"></span><span class="centerWish">'
							+"����� �̸�: "+data.daycarelist[i].name+'&nbsp;&nbsp;<button id="compare" value='+data.daycarelist[i].code+'>���ϱ�</button><br>��ȭ��ȣ: '+data.daycarelist[i].tel+'<br>�ּ�:'+data.daycarelist[i].addr+'</span><span class="rightWish"></span></div>';
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content
							}); 
        				 map.setCenter(coords);	 
        			    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
        			    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
        			    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
/*         			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));  */
        			    (function(marker, infowindow) {
        			        // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
        			        daum.maps.event.addListener(marker, 'mouseover', function() {
        			            infowindow.open(map, marker);
        			        });

        			        // ��Ŀ�� mouseout �̺�Ʈ�� ����ϰ� ���콺 �ƿ� �� ���������츦 �ݽ��ϴ�
        			        daum.maps.event.addListener(marker, 'click', function() {
        			            infowindow.close();
        			        });
        			    })(marker, infowindow);

					}
					// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
					function makeOverListener( map, marker, infowindow) { 
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
//��� ��Ŀ ���߱�
function hideMarkers() {
	 for (var i = 0; i < markers.length; i++) {
	      markers[i].setMap(null);
   	}    
	 
}
<%-- �׷��� ��  ajax --%>
$("#compare").click(function() {
	var code = $("#compare").val();
	var data = {
		"code" : code
	}
	$.ajax({
		url : "graph.child",
		type : "post",
		data : data,
		dataType : "json", // ajax ������� �޴� Ÿ��
		success : function(data) {
			alert(data);
		}});
  });

</script>

</body>
</html>