<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
					<p>���� �������ּ���</p>
					<select name="gu">
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
					</select>
					<p>����� ����</p>
					<select name="type">
							<option value="">�����ϼ���</option>
							<option>����</option>
							<option>������</option>
							<option>�ΰ�</option>
							<option>���Ρ���ü��</option>
							<option>��ȸ��������</option>
							<option>����</option>
					</select>
					<p>��� ���� ����</p>
					<select name="bus">
							<option value="">�����ϼ���</option>
							<option>�</option>
							<option>�̿</option>
					</select>
					<hr>
				<input type="text" name="word" placeholder="�˻��� �ܾ �Է����ּ���">
				<input type="submit" value="�˻�">			
			</div>
		</div>
		</form>
		<div id="wmap">
			<div id="map" class="section"
				style="width: 95%; height: 330px; margin: 10px auto;">
				<div class="buttons">
					<input id="controls" type="hidden" name="��� ���� ��Ʈ��" value="��� ���� ��Ʈ��" class="control-btn" />
					<input id="min-max-zoom" type="hidden" name="�ּ�/�ִ� �� ����" class="control-btn" />
				</div>
			</div>
			<code id="snippet" class="snippet"></code>
		</div>
		<script id="code">
			//������ ������ HTML ��� �Ǵ� HTML ����� id�� �����մϴ�.
			var mapDiv = document.getElementById('map'); // 'map'���� �����ص� ����
			//�ɼ� ���� ���� ��ü�� �����ϸ� ���� ��û�� �߽����� �ϴ� 11 ������ ������ �����˴ϴ�.
			
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
			//���� ��Ʈ��
			$("#interaction, #tile-transition, #controls").addClass(
					"control-on");
		</script>
		<script type="text/javascript">
		var map = document.getElementById('map');
		//��Ŀ ���
		<c:forEach items="${addr}" var="addrs">
		var myaddress = ${addrs};
		naver.maps.Service.geocode({address:myaddress},function(status,response) {
			if (status !== naver.maps.Service.Status.OK) {
	              return alert(myaddress + '�� �˻� ����� ���ų� ��Ÿ ��Ʈ��ũ ����');
	          }
		
		var result = response.result;
		 // �˻� ��� ����: result.total
         // ù��° ��� ��� �ּ�: result.items[0].address
         // ù��° �˻� ��� ��ǥ: result.items[0].point.y, result.items[0].point.x
         var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
         // ��Ŀ ǥ��
         var marker = new naver.maps.Marker({
             position: myaddr,
             map: map
		});
         // ��Ŀ Ŭ�� �̺�Ʈ ó��
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