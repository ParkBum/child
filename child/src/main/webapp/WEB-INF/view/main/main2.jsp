<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		var main = $('.bxslider').bxSlider({
			mode : 'horizontal',
			auto : true, //자동으로 슬라이드  
			controls : true, //좌우 화살표     
			autoControls : true, //stop,play  
			pager : true, //페이징  
			pause : 5000,
			autoDelay : 0,
			slideWidth : 1200,
			speed : 1000,
			infiniteLoop : true,
			stopAutoOnclick : true
		});

		$(".bx-stop").click(function() { // 중지버튼 눌렀을때  
			main.stopAuto();
			$(".bx-stop").hide();
			$(".bx-start").show();
			return false;
		});

		$(".bx-start").click(function() { //시작버튼 눌렀을때  
			main.startAuto();
			$(".bx-start").hide();
			$(".bx-stop").show();
			return false;
		});

		$(".bx-start").hide(); //onload시 시작버튼 숨김.
	});
</script>
<style type="text/css">
.chart {
	width: 900px;
	height: 500px;
	border: solid 2px silver;
	margin-left: 320px;
	margin-bottom: 70px;
}

.menus {
	margin: 40px;
	margin-left: 320px;
	width: 1200px;
	height: 350px;
}

.mainimage1 {
	float: left;
	padding: 30px 0 0 30px;
	width: 800px;
}

.mainimage2 {
	float: right;
	padding: 10px;
	padding-left: 25px;
	width: 400px;
	list-style: none;
}

.mainimage3 {
	float: right;
	padding: 10px 10px 10px 25px;
	width: 400px;
	text-align: left;
}

.tit {
	margin-left: 40px;
}

.a1 {
	background:
		url(http://iseoul.seoul.go.kr/images/portal/main/bg-mainInfo-link-img11.png)
		no-repeat;
	color: #7c5348;
	display: table-cell;
	width: 350px;
	height: 63px;
	vertical-align: middle;
	text-align: left;
	text-decoration: none;
}

.a2 {
	background:
		url(http://iseoul.seoul.go.kr/images/portal/main/bg-mainInfo-link-img13.png)
		no-repeat;
	color: #7c5348;
	display: table-cell;
	width: 350px;
	height: 63px;
	vertical-align: middle;
	text-align: left;
	text-decoration: none;
}

.a3 {
	background:
		url(http://iseoul.seoul.go.kr/images/portal/main/bg-mainInfo-link-img12.png)
		no-repeat;
	color: #7c5348;
	display: table-cell;
	width: 350px;
	height: 63px;
	vertical-align: middle;
	text-align: left;
	text-decoration: none;
}
</style>
<style>

svg .municipality {
  pointer-events: none;
}

svg .municipality {
  stroke: #fff; 
}
svg .municipality-label {
  fill: #bbb;
  font-size: 12px;
  font-weight: 300;
  text-anchor: middle;
}
path {
  fill:#efefef;
}
path:hover {
  fill: red;
}
svg .municipality-label{
  stroke: #333; 
}

</style>
</head>
<body>
		<div id="wrap">
		<div id="chart"></div>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="http://d3js.org/topojson.v1.min.js"></script>
    <script>
        var width = 800,
    height = 600;

var svg = d3.select("#chart").append("svg")
    .attr("width", width)
    .attr("height", height);

var projection = d3.geo.mercator()
    .center([126.9895, 37.5651])
    .scale(100000)
    .translate([width/2, height/2]);

var quantize = d3.scale.quantize()
    .domain([0, 1000])
    .range(d3.range(9).map(function(i) { return "p" + i; }));
var popByName = d3.map();
var path = d3.geo.path().projection(projection);


var map = svg.append("g").attr("id", "map");
    //places = svg.append("g").attr("id", "places");


d3.json("../decorator/seoul_municipalities_topo_simple.json", function(error, data) {
  var features = topojson.feature(data, data.objects.seoul_municipalities_geo).features;
  
  map.selectAll("path")
      .data(features)
      .enter().append("path")
      .attr("class", function(d) { 
        console.log(); 
        return "municipalityc" + d.properties.SIG_CD} 
        )
      .attr("d", path)
      .attr("id",function(d){
        return d.properties.SIG_CD
      });
      
  map.selectAll("text")
      .data(features)
      .enter().append("text")
      .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .attr("class", "municipality-label")
      .text(function(d) { return d.properties.SIG_KOR_NM; })
});
    </script>
			<div class="maineslider">
<!-- 				<a href="../map/map.child"><img
					src="../decorator/seoulsearch.png" alt="어린이집 검색"
					style="width: 750px; height: 445px;"></a>
 -->
			</div>
			<div style="background-color: #FFF1F5; height: 500px; width: 100%;">
				<div class="menus">
					<div class="card1">
						<div class="mainimage1">
							<div class="bxslider">
								<div>
									<a href="http://iseoul.seoul.go.kr/portal/mainCall.do"
										target="_blank"> <img
										src="${path}/decorator/new-img_visual01.png" alt="보육특별시서울"
										title="보육특별시서울" style="width: 800px; height: 400px;"></a>
								</div>
								<div>
									<a href="https://seoul.childcare.go.kr/ccef/main.jsp"
										target="_blank"> <img
										src="${path}/decorator/new-img_visual03.png" alt="육아도움지원센터"
										title="육아도움지원센터" style="width: 800px; height: 400px;"></a>
								</div>
								<div>
									<a href="http://info.childcare.go.kr/info/main.jsp"
										target="_blank"> <img
										src="http://img.childcare.go.kr/info/unityPblntf/main/main_visual.jpg"
										alt="통합정보공시" title="통합정보공시" style="width: 800px; height: 400px;"></a>
								</div>
							</div>
						</div>
						<ul class="mainimage2">
							<li><a class="a1" href="../board/list.child?bType=1"><span
									class="tit">자유게시판</span></a></li>
							<li><a class="a2" href="../board/list.child?bType=2"><span
									class="tit">후기게시판</span></a></li>
							<li><a class="a3" href="../board/list.child?bType=3"><span
									class="tit">거래게시판</span></a></li>
						</ul>
						<div class="mainimage3">
							<iframe style="height: 200px;"
								src="https://www.youtube.com/embed/SY6zhxH4UEo?autohide=1&loop=1&vq=hd720&controls=2&showinfo=0&rel=0&volume=1"
								frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" value="${result}">
</body>
</html>