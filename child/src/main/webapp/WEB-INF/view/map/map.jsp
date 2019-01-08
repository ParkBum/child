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
<div id="L" align="center">
	<div id="SearchAndMap" >
		<form action="search.child" method="post">
		<div id="search">
			<div style=" margin :0 auto; /* vertical-align: middle; */ width : 100%; display: inline-block;">
				<div style="width:100%; height: 30px; margin:5px auto;">
					<div style="width:33%; float: left;">
					���� �������ּ���&nbsp;&nbsp;
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
					</div>
					<div style="width:33%; float: left;">
					����� ����&nbsp;&nbsp;
					<select name="type">
							<option value="">�����ϼ���</option>
							<option>����</option>
							<option>������</option>
							<option>�ΰ�</option>
							<option>���Ρ���ü��</option>
							<option>��ȸ��������</option>
							<option>����</option>
					</select>
					</div>
					<div style="width:33%; float: left;">
					��� ���� ����&nbsp;&nbsp;
					<select name="bus">
							<option value="">�����ϼ���</option>
							<option>�</option>
							<option>�̿</option>
					</select>
					</div>
				</div>
				<div style="width:100%; height : 30px; margin : 5px auto;">
				<input type="text" name="word" placeholder="�˻��� �ܾ �Է����ּ���">
				<input type="submit" value="�˻�">			
				</div>
			</div>
		</div>
		</form>
		<div id="wmap" align="center">
				<div id="map" style="width: 95%; height: 95%; margin: 15px auto;  padding:10px;"align="center"></div>
		</div>
		<script type="text/javascript">
		<%-- ���� ���� --%>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		</script>
		
		<script type="text/javascript">
		<%--��ǥ ���� --%>
		var geocoder = new daum.maps.services.Geocoder();

		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        console.log(result);
		    }
		};
		<c:forEach var="addrs" items="${addr}">
		geocoder.addressSearch(${addrs}, callback);
		</c:forEach>
		</script>
	</div>
</div>
</body>
</html>