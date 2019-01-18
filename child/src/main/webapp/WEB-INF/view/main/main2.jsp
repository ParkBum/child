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
	<script src="http://d3js.org/d3.v3.min.js"></script><!-- 지도 -->
<script src="http://d3js.org/d3.v4.min.js"></script> 
<script src="http://d3js.org/topojson.v1.min.js"></script> 
<script>
	$(document).ready(function() {
		var main = $('.bxslider').bxSlider({
			mode : 'horizontal',
			auto : true, //자동으로 슬라이드  
			controls : true, //좌우 화살표     
			autoControls : true, //stop,play  
			pager : true, //페이징  
			pause : 5000,
			slideWidth : 1200,
			speed : 2000,
			infiniteLoop : false,
			hideControlOnEnd : true,
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
#chartarea {
    width: 1200px;
	height: 600px;/*
 	border: solid 2px silver;*/
	margin-left: 300px;
	background-image: url('../decorator/seoul.png');

}

/* #mapchart {
	margin-left: 50px;
}
 */
.menus {
	margin: 40px;
	margin-top: 0px;
	margin-left: 320px;
	width: 1200px;
	height: 350px;
}

.mainimage1 {
	float: left;
	padding: 30px 30px 0 30px;
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
.svg1{
    margin-left: 100px;
}

.path{
/* border:solid 1px black; */
	box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.4);
}

.svg1 .municipality {
  pointer-events: none;
}

.svg1 .municipality {
  stroke: black; 
  
}
.svg1 .municipality-label {
  fill: #bbb;
  font-size: 12px;
  font-weight: 300;
  text-anchor: middle;
}
.svg1 .municipality-label{
  stroke: #333; 
}
.svg2{
    margin-top: 20px;
}
#map path{
   stroke:white;
   stroke-width: 0.5px;
}
</style>
</head>
<body>

<div id="wrap">
<div id="chartarea" style="display: inline-flex;" align="center">
<div id="mapchart"></div> 
<div id="piechart" style="width: 600; height: 460;">
	<!-- <a href="../map/map.child" id="maplink"> -->
	<!-- <img src="../decorator/seoulsearch.png" alt="어린이집 검색"
					style="width: 750px; height: 445px;"></a> -->
	<!-- <div class="tooltip2">
	</div> -->
	<div>
	
	</div>
	<svg class="svg2">
	</svg>
	</div>
	
 </div>

<script>
/** 
 * 
 	select : 태그 선택
 	append() : 문서요소정의
 	data() : 데이터 불러옴
 	enter() : 데이터와 문서연동
 	svg 안에 요소, g : g는 동일한 속성을 공유하는 요소 집합이다. 
	 
 */
function makepiechart(data,selectguname){
	d3.selectAll(".svg2 > *").remove(); 	//svg 안에 있는 모든 요소들을 제거한다.
	
	d3.json("../decorator/dcc_total_2.json", function(error, seoul) {
        if (error) {
            console.log(error);
            throw error;
        }
     // topojson의 properties.SIG_CD
	var width = 600, height = 400, radius = Math.min(width, height) /2.5 ;
	var svg = d3.select("#piechart").select('.svg2')// piechart의 svg2를 선택
     .attr("width", width)
     .attr("height", height) 
     .attr("radius",Math.min(width, height) / 2)
     .style("margin-left",-100)
     .style("margin-top",50)
     .append("g") //svg2안에 g태그 선택
     .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	//body에 있는 svg2 선택함
	 var pie = d3.pie();
	 var arc = d3.arc()	//호
                .outerRadius(radius - 10)
	 			.innerRadius(100);
	 // 각 호의 크기를 정함.
	 var label = d3.arc()
	 			.outerRadius(radius)
	 			.innerRadius(radius - 80);
	 
	//Generate groups
	for(var i=0; i<seoul.seoul.length; i++){
	
		if(data == seoul.seoul[i].code){
 	/* var piedata = [
		 seoul.seoul[i].publics,
		 seoul.seoul[i].welfare,
		 seoul.seoul[i].corporate,
		 seoul.seoul[i].privates,
		 seoul.seoul[i].home,
		 seoul.seoul[i].parental,
		 seoul.seoul[i].Job
		 ];  */
	 	
	 var piedatas = [
		 	{name : '국공립',  	value : seoul.seoul[i].publics,  	color : '#3acc85'},//녹색
			{name : '복지법인',  	value : seoul.seoul[i].welfare,  	color : '#ff8a00'},//주황
			{name : '법인단체',	value : seoul.seoul[i].corporate,	color : '#304bce'},//파랑
			{name : '민간', 		value : seoul.seoul[i].privates, 	color : '#ffffbf'},//노랑
			{name : '가정',    	value : seoul.seoul[i].home,     	color : '#cc5555'},//붉은
			{name : '부모협동', 	value : seoul.seoul[i].parental, 	color : '#009dee'},//하늘
			{name : '직장',      	value : seoul.seoul[i].Job,      	color : '#ff0099'}	//핑크색
		 ]; 
	var kind = [piedatas[0].name,piedatas[1].name,piedatas[2].name,piedatas[3].name,piedatas[4].name,piedatas[5].name,piedatas[6].name];
	var color = d3.scale.ordinal().range([piedatas[0].color,piedatas[1].color,piedatas[2].color,piedatas[3].color,piedatas[4].color,piedatas[5].color,piedatas[6].color]);
	var piedata = [piedatas[0].value,piedatas[1].value,piedatas[2].value,piedatas[3].value,piedatas[4].value,piedatas[5].value,piedatas[6].value];
	 
	console.log(piedatas[0].value)// 국공립... 
	 var legendItemSize = 18
	 var legendSpacing = 4
	 var legend = svg
	  .selectAll('.legend')
	  .data(piedatas)
	  .enter()
	  .append('g')
	  .attr('class', 'legend')
	  .attr("transform", function(d, i) {
	    var height = legendItemSize + legendSpacing
	    var offset = height * piedatas.length / 2
	    var x = legendItemSize * -2;
	    var y = (i * height) - offset
	    return "translate("+x+","+y+")";
	  })
	  
	legend
	  .append('rect')
	  .attr('width', legendItemSize)
	  .attr('height', legendItemSize)
	  .style('fill', function(d,i) {return color(i)});
	
	legend
	  .append('text')
	  .attr('x', legendItemSize + legendSpacing)
	  .attr('y', legendItemSize - legendSpacing)
	  .text(function(d,i) {return kind[i]})
	 
	 //실제 데이터를 넣고 파이그래프를 만드는 부분
	 var g = svg.selectAll(".arc")		//호들을 집합시킴
             .attr("class", "arc")		//arcs의 class : arc임
             .data(pie(piedata))		//data들은 piedata를 넣어 줌
             .enter().append("g");		//g라는 것을 대입함.
	    //Draw arc paths
	   	 g.append("path")	//호 하나하나를 만듦
	   	 	.attr("class","arcdata")
	        .attr("d", arc)		//d는 호라고 생각하자.
	        .attr("fill", 
	        function(d, i) {	//호 별로 i 순서대로 color 데이터를 넣어 줍니다
	        	console.log(color(i))
	        	return color(i);
	        })
	        .transition()	//에니메이션
	    	.duration(1000)
	    	.delay(function(d, i) {
	    		return i * 10;
	    	})
	    	.attrTween("d", function(d, i) {
	    		var interpolate = d3.interpolate(
	    			{startAngle : d.startAngle, endAngle : d.startAngle},
	    			{startAngle : d.startAngle, endAngle : d.endAngle}
	    		);
	    		return function(t){
	    			return arc(interpolate(t));
	    		}
	    	});
	 // text 정 중앙에 텍스트 넣기
	    svg.append("text")
	    	.attr("text-anchor", "middle")
		 	.attr('font-size', '1.5em')
		 	.attr('y', 190)
		 	.text(selectguname);
		svg.append("text")
			.attr("text-anchor", "middle")
	 		.attr('font-size', '2em')
	 		.attr('y', -165)
    		.text("구별 어린이집 현황");
	 	//성공했던 코드...
	 	
	 	 g.append("text")
	    	.attr("transform", function(d) {
	        var _d = arc.centroid(d);
	        _d[0] *= 1;	//multiply by a constant factor
	        _d[1] *= 1;	//multiply by a constant factor
	        return "translate(" + _d + ")";
	      })
	      .attr("dy", ".40em")
	      .style("text-anchor", "middle")
	      .text(function(d,i) {
	    	if(piedatas[i].value==0){
	    		piedatas[i].value = "";
	    	}
	        return piedatas[i].value;
	      });
	 	}
    
  }
});
}

</script>
<script>

var width = 600, height = 430;
var svg = d3.select("#mapchart").append("svg")
	.attr("class","svg1")
	.style("margin-top",50)
    .attr("width", width)
    .attr("height", height);
var projection = d3.geo.mercator()
    .center([126.9895, 37.5651])
    .scale(70000)
    .translate([width/2, height/2]);
var quantize = d3.scale.quantize()
    .domain([1, 1000])
    .range(d3.range(9).map(function(i) { return "p" + i; }));
/* var popByName = d3.map(); */
var path = d3.geo.path().projection(projection);
var width2 = 300, height2 = 100;
var map = svg.append("g")
			.attr("id", "map")
			.attr("width", width2)
			.attr("height", height2);
    //places = svg.append("g").attr("id", "places");
d3.json("../decorator/seoul_municipalities_topo_simple.json", function(error, data) {
  var features = topojson.feature(data, data.objects.seoul_municipalities_geo).features;
  
  console.log(features)
  map.selectAll("path")
      .data(features)
      .enter().append("path")
      .attr("class",  function(d) { 
        console.log();
        var gus = "municipalityc" + d.properties.SIG_CD
        return gus} 
        )
      .attr("d", path)
      .attr("id",function(d){
        return d.properties.SIG_CD
      })
      .style("fill","#8CD790")
      .on("mouseover",function(d){
    	 d3.select(this).style("fill","#30A9DE");
       //d3.select(this).style("마우스 포인터 변경");
      })
      .on("click",function(d){
    	 makepiechart(d.properties.SIG_CD, d.properties.SIG_KOR_NM);
    	 $( '#maplink' ).hide();
      })
      .on("mouseout",function(){
    	  d3.select(this).style("fill","#8CD790");
      });
      
  map.selectAll("text")	//글자넣는 구간
      .data(features)
      .enter().append("text")
      .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .attr("class", "municipality-label")
      .text(function(d) { return d.properties.SIG_KOR_NM; })
});

var defs = svg.append("defs");

//create filter with id #drop-shadow
//height=130% so that the shadow is not clipped
var filter = defs.append("filter")
 .attr("id", "drop-shadow")
 .attr("height", "120%");

//SourceAlpha refers to opacity of graphic that this filter will be applied to
//convolve that with a Gaussian with standard deviation 3 and store result
//in blur
filter.append("feGaussianBlur")
 .attr("in", "SourceAlpha")
 .attr("stdDeviation", 3)
 .attr("result", "blur");

//translate output of Gaussian blur to the right and downwards with 2px
//store result in offsetBlur
var feOffset = filter.append("feOffset")
 .attr("in", "blur")
 .attr("dx", 2)
 .attr("dy", 3)
 .attr("result", "offsetBlur");

//overlay original SourceGraphic over translated blurred opacity by using
//feMerge filter. Order of specifying inputs is important!
var feMerge = filter.append("feMerge");

feMerge.append("feMergeNode")
    .attr("in", "offsetBlur")
feMerge.append("feMergeNode")
    .attr("in", "SourceGraphic");

var gradient = svg.append("svg:defs")
  .append("svg:linearGradient")
    .attr("id", "gradient")
    .attr("x1", "0%")
    .attr("y1", "0%")
    .attr("x2", "0%")
    .attr("y2", "100%")
    .attr("spreadMethod", "pad");

gradient.append("svg:stop")
    .attr("offset", "0%")
    .attr("stop-color", "#0F3871")
    .attr("stop-opacity", 1);

gradient.append("svg:stop")
    .attr("offset", "100%")
    .attr("stop-color", "#175BA8")
    .attr("stop-opacity", 1);
    </script>
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