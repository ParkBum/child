<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
$(document).ready(function(){
	var svg = d3.select("svg"),
		margin = {top:20,right:20,bottom:30,left:40},
		width = svg.attr("width"),
		height = +svg.attr("height"),
		g = svg.append("g").attr("transform","translate("+margin.left+","+margin.top+")");
	var x =d3.scaleBand()
		.rangeRound([0,width])
		.paddingInner(0.05)
		.align(0.1);
	
	var y = d3.scaleLinear()
		.rangeRound([height,0]);
	
	var z = d3.scaleOrdinal().range(["#111111","#eeeeee","#aaaaaa","#bbbbbb","#cccc11","#dd22dd","#ee1212"]);
	
	var data = [{"gu":"gangdong","public":53,"welfare":1,"corporate":2,"private":108,"home":117,"parental":0,"job":3},
		{"gu":"songpa","public":57,"welfare":1,"corporate":5,"private":146,"home":195,"parental":2,"job":15},
		{"gu":"gangnam","public":53,"welfare":0,"corporate":0,"private":71,"home":81,"parental":1,"job":25},
		{"gu":"seocho","public":61,"welfare":0,"corporate":1,"private":44,"home":79,"parental":2,"job":19},
		{"gu":"gwanak","public":66,"welfare":4,"corporate":6,"private":93,"home":106,"parental":0,"job":5},
		{"gu":"dongjak","public":53,"welfare":3,"corporate":2,"private":74,"home":90,"parental":1,"job":7},
		{"gu":"yeongdeungpo","public":54,"welfare":2,"corporate":1,"private":77,"home":99,"parental":0,"job":30},
		{"gu":"geumcheon","public":45,"welfare":1,"corporate":13,"private":54,"home":53,"parental":1,"job":7},
		{"gu":"guro","public":60,"welfare":3,"corporate":8,"private":97,"home":158,"parental":6,"job":9},
		{"gu":"gangseo","public":70,"welfare":2,"corporate":3,"private":145,"home":212,"parental":1,"job":8},
		{"gu":"yangcheon","public":66,"welfare":0,"corporate":3,"private":86,"home":169,"parental":1,"job":6},
		{"gu":"mapo","public":62,"welfare":0,"corporate":6,"private":51,"home":78,"parental":4,"job":12},
		{"gu":"seodaemun","public":47,"welfare":0,"corporate":3,"private":51,"home":51,"parental":1,"job":5},
		{"gu":"eunpyeong","public":41,"welfare":1,"corporate":7,"private":158,"home":84,"parental":1,"job":2},
		{"gu":"nohwon","public":57,"welfare":4,"corporate":1,"private":78,"home":330,"parental":1,"job":7},
		{"gu":"dobong","public":42,"welfare":1,"corporate":2,"private":77,"home":129,"parental":2,"job":2},
		{"gu":"gangbuk","public":46,"welfare":1,"corporate":3,"private":72,"home":49,"parental":1,"job":2},
		{"gu":"seongbuk","public":66,"welfare":3,"corporate":17,"private":95,"home":110,"parental":1,"job":6},
		{"gu":"hungnang","public":39,"welfare":1,"corporate":4,"private":101,"home":105,"parental":0,"job":2},
		{"gu":"dongdaemun","public":55,"welfare":0,"corporate":3,"private":69,"home":92,"parental":0,"job":9},
		{"gu":"gwangjin","public":34,"welfare":0,"corporate":4,"private":106,"home":65,"parental":2,"job":3},
		{"gu":"seongdong","public":70,"welfare":0,"corporate":3,"private":40,"home":70,"parental":0,"job":7},
		{"gu":"yongsan","public":28,"welfare":2,"corporate":9,"private":28,"home":51,"parental":1,"job":9},
		{"gu":"jung","public":21,"welfare":0,"corporate":7,"private":7,"home":14,"parental":0,"job":18},
		{"gu":"jongro","public":28,"welfare":2,"corporate":3,"private":11,"home":5,"parental":0,"job":26}];
	
		var keys=[];
		for (key in data[0]){
			if(key != "gu")
				keys.push(key);
		}
		data.forEach(function(d){
		d.total = 0;
		keys.forEach(function(k){
			d.total += d[k];
		})
		});
		
		data.sort(function(a,b){
			return b.total - a.total;
		});
		
		x.domain(data.map(function(d){
			return d.gu;
		}));
		y.domain([0,d3.max(data,function(d){
			return d.total;
		})]).nice();
		z.domain(keys);
		
		g.append("g")
			.selectAll("g")
			.data(d3.stack().keys(keys)(data))
			.enter().append("g")
			.attr("fill",function(d){
				return z(d.key);
			})
			.selectAll("rect")
			.data(function(d){
				return d;
			})
			.enter().append("rect")
			.attr("x",function(d){
				return x(d.data.gu);
			})
			.attr("y",function(d){
				return y(d[1]);
			})
			.attr("height",function(d){
				return y(d[1])-y(d[0]);
			})
			.attr("width",x.bandwidth());
		
		  g.append("g")
		    .attr("class", "axis")
		    .attr("transform", "translate(0," + height + ")")
		    .call(d3.axisBottom(x));

		  g.append("g")
		    .attr("class", "axis")
		    .call(d3.axisLeft(y).ticks(null, "s"))
		    .append("text")
		    .attr("x", 2)
		    .attr("y", y(y.ticks().pop()) + 0.5)
		    .attr("dy", "0.32em")
		    .attr("fill", "#000")
		    .attr("font-weight", "bold")
		    .attr("text-anchor", "start")
		    .text("Population");

		  var legend = g.append("g")
		    .attr("font-family", "sans-serif")
		    .attr("font-size", 10)
		    .attr("text-anchor", "end")
		    .selectAll("g")
		    .data(keys.slice().reverse())
		    .enter().append("g")
		    .attr("transform", function(d, i) {
		      return "translate(0," + i * 20 + ")";
		    });

		  legend.append("rect")
		    .attr("x", width - 19)
		    .attr("width", 19)
		    .attr("height", 19)
		    .attr("fill", z);

		  legend.append("text")
		    .attr("x", width - 24)
		    .attr("y", 9.5)
		    .attr("dy", "0.32em")
		    .text(function(d) {
		      return d;
		    });
})		
</script>
<style type="text/css">
/*차트영역*/
svg{
	font : 10px;
	/* shape-rendering : crispEdges; */
	width: 1200px;
	height: 500px;
 	border : solid 2px silver;
}
  .axis .domain {
    display: none;
  }
/* .axis path, .axis line {
	fill:none;
	stroke:#000;
}
path.domain{
stroke:none;
}
.y .tick line {
	stroke:#ddd;
} */
.canvas-holder {
/* 	width: 1200px;
	height: 500px;
 	border : solid 2px silver; */
/* 	border-radius: 20px;  */
}

.menus {
	margin-top: 80px;
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
/* $(function() {
var svg = d3.select("svg"),
 margin = {top: 20, right: 20, bottom: 30, left: 40},
width = +svg.attr("width") - margin.left - margin.right,
height = +svg.attr("height") - margin.top - margin.bottom,
g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var x = d3.scaleBand()
.rangeRound([0, width])
.paddingInner(0.25)
.align(0.1);

var y = d3.scaleLinear()
.rangeRound([height, 0]);

var z = d3.scaleOrdinal()
.range(['#d53e4f','#fc8d59','#fee08b','#ffffbf','#e6f598','#99d594','#3288bd','#e1b2c3']);

d3.csv("../decorator/dcc_total.csv"). then(function(d, i, columns) {
console.log(d)
for (i = 1, t = 0; i < columns; ++i) t += d[columns[i]] = +d[columns[i]];
d.total = t;
return d;
}, function(error, data) {
if (error) throw error;

var keys = data.columns.slice(1);

data.sort(function(a, b) { return b.total - a.total;});
x.domain(data.map(function(d) { return d.gu; }));
y.domain([0, d3.max(data, function(d) { return d.totol; })]).nice();
z.domain(keys);

var bars = g.append("g")
.selectAll("g")
.data(d3.stack().keys(keys)(data))
.enter().append("g")
  .attr("fill", function(d) { return z(d.key); })
.selectAll("rect")
.data(function(d) { return d; })
.enter().append("rect")
  .attr("x", function(d) { return x(d.data.gu); })
  .attr("y", function(d) { return y(d[1]); })
  .attr("height", function(d) { return y(d[0]) - y(d[1]); })
  .attr("width", x.bandwidth());

g.append("g")
  .attr("class", "axis")
  .attr("transform", "translate(0," + height + ")")
  .call(d3.axisBottom(x));

g.append("g")
  .attr("class", "axis")
  .call(d3.axisLeft(y).ticks(null, "s"))
.append("text")
  .attr("x", 0)
  .attr("y", y(y.ticks().pop()) + 0.5)
  .attr("dy", "0.32em")
  .attr("fill", "#000")
  .attr("font-weight", "bold")
  .attr("text-anchor", "start")
  .text("Incidents");

var legend = g.append("g")
  .attr("font-family", "sans-serif")
  .attr("font-size", 10)
  .attr("text-anchor", "end")
.selectAll("g")
.data(keys.slice().reverse())
.enter().append("g")
  .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

legend.append("rect")
  .attr("x", width - 19)
  .attr("width", 19)
  .attr("height", 19)
  .attr("fill", z);

legend.append("text")
  .attr("x", width - 24)
  .attr("y", 9.5)
  .attr("dy", "0.32em")
  .text(function(d) { return d; });
});

	
}) */
</script>
</head>
<body>
	<div id="wrap">
	<svg class="canvas-holder">
		<!--  <svg width="384" height="130">
		 </svg> --><!-- <img src="../decorator/child7.jpg" style="width:100%; height:100%;"> -->
	</svg>
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