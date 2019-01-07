<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/scc">
<style type="text/css">
.canvas-holder {
	width: 1200px;
	height: 500px;
 	border : solid 2px silver;
/* 	border-radius: 20px;  */
}
.canvas-holder div {
	font : 10px;
	background-color: steelblue;
	text-align: right;
	color : white;
}
.menus {
	margin-top: 25px;
	width: 1200px;
	height: 180px;
}
/* .public {
	margin-top: 20px;
	width: 100%;
	height: 95px;
} */
.card1 {
	background-position : center;
	background-size :cover;
	margin: 25px 0;
	width: 100%;
	height: 250px;
	text-align: center;
/* 	background :  linear-gradient(to right, rgba(000,000,102, 0.7),  rgba(000, 000, 204, 0.7)),url("../decorator/samples.png"); */
}

/* .card2 {
	background-position : center;
	background-size :cover;
	margin: 8px 0;
	width: 100%;
	height: 75px;
	text-align: center;
	
} */

.image1-1,.image1-2,.image1-3 {
	display: inline-block;
	height: 230px;
	position : relative;
	border-radius: 20px;
	margin: 2% 5%;
	width: 20%;
}
.image1-1:hover{
	background-color: #F5ECCE; 
}
.image1-2:hover{
	background-color: #A9F5D0; 
}
.image1-3:hover{
	background-color: #A9D0F5; 
}

/* .image2 {
	display: inline-block;
	height: 66px;
	margin: 5px 2px;
	width: 24%;
	border:solid 2px silver;
	padding : 1px;
} */

.main-a {
	text-decoration: none;
	font-size: xx-large;
	color : black; 

}
.main-b {
	text-decoration: none;
	marign:2px 0;
}
.axis .domain {
  display: none;
}

</style>
<script type="text/javascript">
$(function() {
	d3.csv("../decorator/dcc_total.csv"). then(function(d, i, columns) {
		console.log(d)
		for (i = 1, t = 0; i < columns; ++i) t += d[columns[i]] = +d[columns[i]];
		d.total = t;
		return d;
		}, function(error, data) {
		if (error) throw error;
		});

var data = [4,8,15,16,23,42]
var x = d3.scale.linear()
		  .domain([0,d3.max(data)])
		  .range([0,420])
d3.select(".canvas-holder")
	.selectAll('div')
	.data(data)
	.enter()
	.append('div')
		.style('width',function(d){return x(d)+'px';})
		.text(function(d){return d;})


})
</script>
</head>
<body>
	<div id="wrap">
	<div class="canvas-holder">
		<!--  <svg width="384" height="130">
		 </svg> --><!-- <img src="../decorator/child7.jpg" style="width:100%; height:100%;"> -->
	</div>
<div class="menus">
		<div class="card1">
			<div class="image1-1"> <%-- mouseover 시 색 변경 --%>
				  <a class="main-a" href="../map/map.child"><img src="../decorator/locations.png" width="150px" height="150px"
					style="margin:10px 0;"><br>어린이집 검색&nbsp;<i class="fa fa-arrow-right"></i></a>  
			</div>
			<div class="image1-2">
				  <a class="main-a" href="../board/list.child?bType=1"><img src="../decorator/customer-review.png" width="150px"
					height="150px" style="margin: 10px 0;"><font><br>커뮤니티&nbsp;<i class="fa fa-arrow-right"></i></font></a>
			</div>
			<div class="image1-3">
				  <a class="main-a" href="../board/list.child?bType=3"><img src="../decorator/pay-per-click.png" width="150px"
					height="150px" style="margin: 10px 0;"><br>중고거래&nbsp;<i class="fa fa-arrow-right"></i></a>
			</div>
		</div>
	</div>
	</div>
 	<!-- <div class="public">
		<div class="card2">
			<div class="image2">
				<a class="main-b" href="https://www.seoulchildrensmuseum.org/"><img src="https://www.seoulchildrensmuseum.org/z00_images/common/logo.png" width="100%"
					height="58px"></a>
			</div>
			<div class="image2">
				<a class="main-b" href="http://seoul.childcare.go.kr/ccef/main.jsp"><img src="http://seoul.childcare.go.kr/images/ccef/common/logo_seoul.gif" width="100%"
					height="58px"></a>
			</div>
			<div class="image2">
				<a class="main-b" href="http://www.childcare.go.kr"><img src="http://www.childcare.go.kr/images/cpin/common/h1_logo_s.gif" width="100%"
					height="58px"></a>
			</div>
			<div class="image2">
				<a class="main-b" href="http://www.korea1391.go.kr/new/"><img src="http://korea1391.go.kr/new/theme/custom/images/common/logo_big.jpg" width="100%"
					height="58px"></a>
			</div>
		</div>
	</div> -->
</body>
</html>