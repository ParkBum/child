<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<script type="text/javascript"></script>
<style type="text/css">
.chart {
	width: 100%;
	height: 400px;
	border : solid 1px black;
}

.chart p {
	text-align: center;
	font-family: sans-serif;
}

.menu {
	margin-top: 40px;
	width: 100%;
	height: 300px;
}

.card {
	margin: 25px 0;
	float: right;
	width: 33.3%;
	height: 250px;
	text-align: center;
}

.image {
	display: inline-block;
	width: 180px;
	height: 230px;
	border-radius: 20px;
	background-color: #9FF781;
	margin: 25px;
	width: 180px;
}

.main-a {
	text-decoration: none;
	font-size: xx-large;
}
</style>
</head>
<body>
	<div class="chart">
		<p>chart 위치</p>
	</div>
	<div class="menu">
		<div class="card">
			<div class="image">
				<img src="../decorator/shopping-cart.png" width="150px"
					height="150px" style="margin: 10px"> <a class="main-a"
					href="../board/list.child?bType=3">중고거래></a>
			</div>
		</div>
		<div class="card">
			<div class="image">
				<img src="../decorator/group.png" width="150px" height="150px"
					style="margin: 10px"> <a  class="main-a" href="../board/list.child?bType=1">커뮤니티></a>
			</div>

		</div>
		<div class="card">
			<div class="image">
				<img src="../decorator/location.png" width="150px" height="150px"
					style="margin: 10px"> <a class="main-a" href="../map/map.child">지도 검색></a>
			</div>
		</div>
	</div>
</body>
</html>