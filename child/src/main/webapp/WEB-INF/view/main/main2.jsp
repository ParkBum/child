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
	<script src="http://d3js.org/d3.v3.min.js"></script><!-- ���� -->
<script src="http://d3js.org/d3.v4.min.js"></script> 
<script src="http://d3js.org/topojson.v1.min.js"></script> 
<script>
	$(document).ready(function() {
		var main = $('.bxslider').bxSlider({
			mode : 'horizontal',
			auto : true, //�ڵ����� �����̵�  
			controls : true, //�¿� ȭ��ǥ     
			autoControls : true, //stop,play  
			pager : true, //����¡  
			pause : 5000,
			slideWidth : 1200,
			speed : 2000,
			infiniteLoop : false,
			hideControlOnEnd : true,
			stopAutoOnclick : true
		});

		$(".bx-stop").click(function() { // ������ư ��������  
			main.stopAuto();
			$(".bx-stop").hide();
			$(".bx-start").show();
			return false;
		});

		$(".bx-start").click(function() { //���۹�ư ��������  
			main.startAuto();
			$(".bx-start").hide();
			$(".bx-stop").show();
			return false;
		});

		$(".bx-start").hide(); //onload�� ���۹�ư ����.
	});
</script>
<style type="text/css">
#chartarea {
/* 	width: 900px;
	height: 500px;
 */	border: solid 2px silver;
	margin-left: 100px;
	margin-bottom: 70px;
}
/* #mapchart {
	margin-left: 50px;
}
 */
.menus {
	margin: 40px;
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

.svg1 .municipality {
  pointer-events: none;
}

.svg1 .municipality {
  stroke: #fff; 
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

.toolTip {
    position: absolute;
    display: none;
    width: auto;
    height: auto;
    background: none repeat scroll 0 0 white;
    border: 0 none;
    border-radius: 8px 8px 8px 8px;
    box-shadow: -3px 3px 15px #888888;
    color: black;
    font: 12px sans-serif;
    padding: 5px;
    text-align: center;
}

</style>
</head>
<body>


<div id="wrap">
<div id="chartarea" style="display: inline-flex;" align="center">
<div id="mapchart"></div> 
<div id="piechart" style="width: 600">
	<a href="../map/map.child" id="maplink">
	<img src="../decorator/seoulsearch.png" alt="����� �˻�"
					style="width: 750px; height: 445px;"></a>
	<!-- <div class="tooltip2">
	</div> -->
	<svg class="svg2">
	</svg>
	</div>
	
 </div>

<script>
/** 
 * 
 	select : �±� ����
 	append() : �����������
 	data() : ������ �ҷ���
 	enter() : �����Ϳ� ��������
 	svg �ȿ� ���, g : g�� ������ �Ӽ��� �����ϴ� ��� �����̴�. 
	 
 */
function makepiechart(data,selectguname){
	d3.selectAll(".svg2 > *").remove(); 	//svg �ȿ� �ִ� ��� ��ҵ��� �����Ѵ�.
	
	d3.json("../decorator/dcc_total_2.json", function(error, seoul) {
        if (error) {
            console.log(error);
            throw error;
        }
        console.log(data)
        
     // topojson�� properties.SIG_CD
	var width = 800, height = 500, radius = Math.min(width, height) /3 ;
	var svg = d3.select("#piechart").select('.svg2')// piechart�� svg2�� ����
     .attr("width", width)
     .attr("height", height) 
     .attr("radius",Math.min(width, height) / 2)
     .append("g") //svg2�ȿ� g�±� ����
     .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	//body�� �ִ� svg2 ������
	 var color = d3.scale.ordinal().range(['#3acc85','#ff8a00','#304bce','#ffffbf','#cc5555','#009dee','#ff0099']);
	 var kind = ["������","��������","���δ�ü","�ΰ�","����","�θ�����","����"]
	 var pie = d3.pie();
	 var arc = d3.arc()	//ȣ
                .outerRadius(radius - 10)
	 			.innerRadius(100);
	 // �� ȣ�� ũ�⸦ ����.
	 
	 var label = d3.arc()
	 			.outerRadius(radius)
	 			.innerRadius(radius - 80);
	 
	//Generate groups
	for(var i=0; i<seoul.seoul.length; i++){
	
		if(data == seoul.seoul[i].code){
		
 	var piedata = [
		 seoul.seoul[i].publics,
		 seoul.seoul[i].welfare,
		 seoul.seoul[i].corporate,
		 seoul.seoul[i].privates,
		 seoul.seoul[i].home,
		 seoul.seoul[i].parental,
		 seoul.seoul[i].Job
		 ]; 
	 	console.log(piedata);
	 	
	 var piedatas = [
		 	{name : '������',  	value : seoul.seoul[i].publics,  	color : '#3acc85'},//���
			{name : '��������',  	value : seoul.seoul[i].welfare,  	color : '#ff8a00'},//��Ȳ
			{name : '���δ�ü',	value : seoul.seoul[i].corporate,	color : '#304bce'},//�Ķ�
			{name : '�ΰ�', 		value : seoul.seoul[i].privates, 	color : '#ffffbf'},//���
			{name : '����',    	value : seoul.seoul[i].home,     	color : '#cc5555'},//����
			{name : '�θ�����', 	value : seoul.seoul[i].parental, 	color : '#009dee'},//�ϴ�
			{name : '����',      	value : seoul.seoul[i].Job,      	color : '#ff0099'}	//��ũ��
		 ]; 
	 
	 
	 //���� �����͸� �ְ� ���̱׷����� ����� �κ�
	 var g = svg.selectAll(".arc")		//ȣ���� ���ս�Ŵ
             .attr("class", "arc")		//arcs�� class : arc��
             .data(pie(piedata))		//data���� piedata�� �־� ��
             .enter().append("g");		//g��� ���� ������.
	    //Draw arc paths
	   	 g.append("path")	//ȣ �ϳ��ϳ��� ����
	   	 	.attr("class","arcdata")
	        .attr("d", arc)		//d�� ȣ��� ��������.
	        .attr("fill", 
	        function(d, i) {	//ȣ ���� i ������� color �����͸� �־� �ݴϴ�
	        	console.log(color(i))
	        	return color(i);
	        })
	        .transition()	//���ϸ��̼�
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
             
	   var div = d3.select("#piechart").append("div").attr("class", "toolTip");
	   	
		d3.selectAll(".arc").append("g").on("click", function(d, i) {
		      div.style("left", d3.event.pageX+10+"px");
			  div.style("top", d3.event.pageY-25+"px");
			  
			  div.style("display", "inline-block");
			  div.html(kind[i] + " : " + piedatas[i].value);
		    	})
	 // text �� �߾ӿ� �ؽ�Ʈ �ֱ�
	    svg.append("text")
	    	.attr("text-anchor", "middle")
		 	.attr('font-size', '3em')
		 	.attr('y', 20)
		 	.text(selectguname);
	    	
		
		svg.append("text")
			.attr("text-anchor", "middle")
		 	.attr('font-size', '2em')
		 	.attr('y', 230)
	    	.text("�հ�:" + seoul.seoul[i].total);
		
	 	//�����ߴ� �ڵ�...
	 	 g.append("text")
	    	.attr("transform", function(d) {
	        var _d = arc.centroid(d);
	        _d[0] *= 1.5;	//multiply by a constant factor
	        _d[1] *= 1.5;	//multiply by a constant factor
	        return "translate(" + _d + ")";
	      })
	      .attr("dy", ".50em")
	      .style("text-anchor", "middle")
	      .text(function(d,i) {
	        return kind[i] + ":" + piedatas[i].value;
	      });
	 	}
    
  }
});
}

</script>
<script>
    
    
var width = 800, height = 600;

var svg = d3.select("#mapchart").append("svg")
	.attr("class","svg1")
    .attr("width", width)
    .attr("height", height);

var projection = d3.geo.mercator()
    .center([126.9895, 37.5651])
    .scale(100000)
    .translate([width/2, height/2]);

var quantize = d3.scale.quantize()
    .domain([1, 1000])
    .range(d3.range(9).map(function(i) { return "p" + i; }));
/* var popByName = d3.map(); */
var path = d3.geo.path().projection(projection);

var map = svg.append("g")
			.attr("id", "map")
			.attr("width", width)
			.attr("height", height);
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
      .style("fill","#E89923")
      .on("mouseover",function(d){
    	 d3.select(this).style("fill","red");
       //d3.select(this).style("���콺 ������ ����");
      })
      .on("click",function(d){
    	 makepiechart(d.properties.SIG_CD, d.properties.SIG_KOR_NM);
    	 $( '#maplink' ).hide();
      })
      .on("mouseout",function(){
    	  d3.select(this).style("fill","#E89923");
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

<!-- 				
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
										src="${path}/decorator/new-img_visual01.png" alt="����Ư���ü���"
										title="����Ư���ü���" style="width: 800px; height: 400px;"></a>
								</div>
								<div>
									<a href="https://seoul.childcare.go.kr/ccef/main.jsp"
										target="_blank"> <img
										src="${path}/decorator/new-img_visual03.png" alt="���Ƶ�����������"
										title="���Ƶ�����������" style="width: 800px; height: 400px;"></a>
								</div>
								<div>
									<a href="http://info.childcare.go.kr/info/main.jsp"
										target="_blank"> <img
										src="http://img.childcare.go.kr/info/unityPblntf/main/main_visual.jpg"
										alt="������������" title="������������" style="width: 800px; height: 400px;"></a>
								</div>
							</div>
						</div>
						<ul class="mainimage2">
							<li><a class="a1" href="../board/list.child?bType=1"><span
									class="tit">�����Խ���</span></a></li>
							<li><a class="a2" href="../board/list.child?bType=2"><span
									class="tit">�ı�Խ���</span></a></li>
							<li><a class="a3" href="../board/list.child?bType=3"><span
									class="tit">�ŷ��Խ���</span></a></li>
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