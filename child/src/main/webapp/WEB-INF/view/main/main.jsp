<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script> -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/scc"> -->
<script type="text/javascript">
$(function() {
	$(document).ready(function(){
		// create the svg
		var svg = d3.select("svg"),
		    margin = {top: 20, right: 20, bottom: 30, left: 40},
		    width = +svg.attr("width") - margin.left - margin.right,
		    height = +svg.attr("height") - margin.top - margin.bottom,
		    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		// set x scale
		var x = d3.scaleBand()
		    .rangeRound([0, width])
		    .paddingInner(0.05)
		    .align(0.1);

		// set y scale
		var y = d3.scaleLinear()
		    .rangeRound([height, 0]);

		// set the colors
		var z = d3.scaleOrdinal()
		    .range(["#495228", "#6C7C33", "#90A73A", "#B0D03C", "#C0E730", "#CDEE55", "#D5F561"]);

		// load the csv and create the chart
		d3.csv("../decorator/dcc_total.csv", function(d, i, columns) {
		  for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
		  d.total = t;
		  return d;
		}, function(error, data) {
		  if (error) throw error;

		  var keys = data.columns.slice(1);

		  data.sort(function(a, b) { return b.total - a.total; });
		  x.domain(data.map(function(d) { return d.gu; }));
		  y.domain([0, d3.max(data, function(d) { return d.total; })]).nice();
		  z.domain(keys);

		  g.append("g")
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
		      .attr("width", x.bandwidth())
		    .on("mouseover", function() { tooltip.style("display", null); })
		    .on("mouseout", function() { tooltip.style("display", "none"); })
		    .on("mousemove", function(d) {
		      console.log(d);
		      var xPosition = d3.mouse(this)[0] - 5;
		      var yPosition = d3.mouse(this)[1] - 5;
		      tooltip.attr("transform", "translate(" + xPosition + "," + yPosition + ")");
		      tooltip.select("text").text(d[1]-d[0]);
		    });

		  g.append("g")
		      .attr("class", "axis")
		      .attr("transform", "translate(0," + height+ ")")
		      .call(d3.axisBottom(x))
		      	 .selectAll("text")
		      	 .attr("x",-25)
		      	 .attr("y",10)
			     .attr("transform", "rotate(-45)");

		  g.append("g")
		      .attr("class", "axis")
		      .call(d3.axisLeft(y).ticks(null, "s"))
		    .append("text")
		      .attr("x", 2)
		      .attr("y", y(y.ticks().pop()) + 1) // y:9
		      .attr("dy", "0.32em")
		      .attr("fill", "#000")
		      .attr("font-weight", "bold")
		      .attr("text-anchor", "start");

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

		  // Prep the tooltip bits, initial display is hidden
		  var tooltip = svg.append("g")
		    .attr("class", "tooltip")
		    .style("display", "none");
		      
		  tooltip.append("rect")
		    .attr("width", 60)
		    .attr("height", 20)
		    .attr("fill", "white")
		    .style("opacity", 0.5);

		  tooltip.append("text")
		    .attr("x", 30)
		    .attr("dy", "1.2em")
		    .style("text-anchor", "middle")
		    .attr("font-size", "15px")
		    .attr("font-weight", "bold");
	})
})
</script>
<style type="text/css">
.canvas-holder {
	width: 1200px;
	height: 500px;
 	border : solid 2px silver;
/* 	border-radius: 20px;  */
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
</head>
<body>
	<div id="wrap">
	<div class="canvas-holder">
		  <svg width="1200" height="500">
		 </svg> 
	</div>
<div class="menus">
		<div class="card1">
			<div class="image1-1"> <%-- mouseover �� �� ���� --%>
				  <a class="main-a" href="../map/map.child"><img src="../decorator/locations.png" width="150px" height="150px"
					style="margin:10px 0;"><br>����� �˻�&nbsp;<i class="fa fa-arrow-right"></i></a>  
			</div>
			<div class="image1-2">
				  <a class="main-a" href="../board/list.child?bType=1"><img src="../decorator/customer-review.png" width="150px"
					height="150px" style="margin: 10px 0;"><font><br>Ŀ�´�Ƽ&nbsp;<i class="fa fa-arrow-right"></i></font></a>
			</div>
			<div class="image1-3">
				  <a class="main-a" href="../board/list.child?bType=3"><img src="../decorator/pay-per-click.png" width="150px"
					height="150px" style="margin: 10px 0;"><br>�߰�ŷ�&nbsp;<i class="fa fa-arrow-right"></i></a>
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
	<input type="hidden" value="${result}">
</body>
</html>