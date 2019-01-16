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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ea2633155fc8b442f8cc095a5798ccf&libraries=services"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>

<style type="text/css">
#main {
	width: 1600px;
	margin-left: 150px;
} 

#SearchAndMap {
	width: 100%;
	height: 800px;
	display: table;
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

select {
	border : 0;
	outline: 0;

}
.buttons {
	border : 0;
	outline: 0;
	background-color:#F6A5BC; 
	color:white;
	
}
.buttons:hover{
	background-color : #CE5B7C;
	color : white;
}
option {
	font-size: large;
}
<%-- ���� ����, ���� ��� ���� ������ --%>
.half{
 float: left;
  width: 50%;
  padding: 15px;
} 
.bar {
 
}
<%-- ��Ʈ ���� css--%>
.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {
  display: none;
} 
  .tooltip1 {
      position: absolute;
      display: none;
      width: auto;
      height: auto;
      background: #515A5A;
      border: 0 none;
      border-radius: 4px;
      color: white;
      font: 12px sans-serif;
      padding: 5px;
      text-align: center;
  } 
<%-- pie chart --%>
.arc2 text {
  font: 10px sans-serif;
  text-anchor: middle;
}

.arc2 path {
  stroke: #fff;
}

.tooltip2 {
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
	<div id="main">
		<div id="SearchAndMap">
			<div class="half">
			<div id="search">
				<div style="text-align: center; width: 100%; height: 80px; background: #F6A5BC; color:white;">
					<div style="width: 100%; height: 40px; margin:auto 0; display: inline-block;">
						<div style="width: 30%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">���� �������ּ���&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="gu" id="gu">
								<option value="">�����ϼ���</option>
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
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<button class="buttons" id="searchs">��ȸ</button>
						</div>
					</div>
					<div style="width: 100%; height: 40px;">
					<a>��� �׸��� �ʼ������� �����ϼž��մϴ�.</a>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <button class="buttons" onclick="hideMarkers()">���� �ʱ�ȭ</button> --><!-- &nbsp;&nbsp;&nbsp;<button id="remove" class="buttons">��Ʈ �ʱ�ȭ</button>&nbsp;&nbsp;&nbsp;<button id="removeboard" class="buttons">�ı�Խ��� �ʱ�ȭ</button> -->
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
			<!-- �׷��� �� �ı� �Խ��� ��� -->
			<div class="half" style="display: block;">
			<div class="bar" style="height:470px; border:solid 1px #aaaaaa; " id="chart">
			<div class="tooltip1"></div>
				<svg class="svg1"></svg>
			<div class="tooltip2"></div>
				<svg class="svg2"></svg>
			</div>
			<div class="bar" style="height:320px;">
				<div id="reviews" style="width:750px; height : 270px; margin : 23px auto; /* background-color: rgba(255, 243, 246, 0.5); */"></div> 
			</div>
			</div>
		</div>
		<!-- SearchAndMap -->
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
		var infos = [];
		var codes =[];
</script>
<c:if test="${!empty sessionScope.loginUser}"> <!-- �α��� �Ͽ� ����� �˻����� ���� �� �ּ� ���� �ݰ� 1km�� ����� ������ 10�� ��� -->
<script>
$(document).ready(function() { 
	var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch('${sessionScope.loginUser.addr2}', function(result, status) {
	     if (status === daum.maps.services.Status.OK) {
			var data ={
					"lat" : result[0].y,
					"lon" : result[0].x
			}
			$.ajax({
				url : "autoMarker.child",
				type : "post",
				data : data,
				dataType : "json",
				success : function(data){
					if (data.autoMarkerList.length == 0){
						alert("�ݰ� �ȿ� ������� �����ϴ�.")
					}
					hideMarkers();
					for (var i = 0; i < data.autoMarkerList.length; i++) {
						var Map = map;
						var coords = new daum.maps.LatLng(
            					data.autoMarkerList[i].lat,data.autoMarkerList[i].lon		
            					);
							
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords
    					});
    					marker.setMap(map);
    					
    					var content = '<div class="labelWish" style="opacity:0.5; width:500px; height:100px;margin-top : 15px;"><span class="leftWish"></span><span class="centerWish">'
							+"����� �̸�: "+data.autoMarkerList[i].name+"["+data.autoMarkerList[i].type+"]"+'&nbsp;&nbsp;<button id="compare" style="border:0; outline: 0; background:rgba(76, 103, 140,1); color:white;" onclick="javascript:graph('+data.autoMarkerList[i].code+')">��Ʈ ����</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(76, 103, 140,1); color:white;" onclick="javascript:review('+data.autoMarkerList[i].code+')">�ı�</button><br>��ȭ��ȣ: '+data.autoMarkerList[i].tel+'<br>�ּ�:'+data.autoMarkerList[i].addr+'</span><span class="rightWish"></span></div>';
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content,
							    removable:true
							}); 
						infos.push(infowindow);
						markers.push(marker);
        				map.setCenter(coords);	 
        			    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
        			    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�       			
        			    (function(marker, infowindow) { 
        			        // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
        			        daum.maps.event.addListener(marker, 'click', function() {
        			        	AnotherMarkers();
        			            infowindow.open(map, marker);
        			        });

        			    })(marker, infowindow);
						
					}
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
			})   
	    }; 
	})   	
})
</script>
</c:if>
<script>
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
					hideMarkers();
					for (var i = 0; i < data.daycarelist.length; i++) {
						
						var Map = map;
						var coords = new daum.maps.LatLng(
            					data.daycarelist[i].lat,data.daycarelist[i].lon		
            					);
							
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords
    					});
    					marker.setMap(map);
    					
    					var content = '<div class="labelWish" style="opacity:0.5; width:500px; height:100px;margin-top : 15px;"><span class="centerWish">'
							+"����� �̸�: "+data.daycarelist[i].name+'&nbsp;&nbsp;<button id="compare" style="border:0; outline: 0; background:rgba(76, 103, 140,1); color:white;" onclick="javascript:graph('+data.daycarelist[i].code+')">��Ʈ ����</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(76, 103, 140,1); color:white;" onclick="javascript:review('+data.daycarelist[i].code+')">�ı�</button><br>��ȭ��ȣ: '+data.daycarelist[i].tel+'<br>�ּ�:'+data.daycarelist[i].addr+'</span><span class="rightWish"></span></div>';
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content,
							    removable:true
							}); 
						infos.push(infowindow);
						markers.push(marker);
        				map.setCenter(coords);	 
        			    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
        			    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�       			
        			    (function(marker, infowindow) { 
        			        // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
        			        daum.maps.event.addListener(marker, 'click', function() {
        			        	AnotherMarkers();
        			            infowindow.open(map, marker);
        			        });

        			    })(marker, infowindow);
					} //for�� ������ �κ�
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
//��� ��Ŀ, ���������� ���߱�
function hideMarkers() {
	 for (var i = 0; i < markers.length; i++) {
	      markers[i].setMap(null);
	      infos[i].close();
   	}    
	 
}
//Ŭ���� ���� �ܿ� �ٸ� ��Ŀ�� �����
function AnotherMarkers(){
	 for (var i = 0; i < markers.length; i++) {
	      infos[i].close();
	      
  	}    
}
<%-- �׷��� ��  ajax --%>
var dataset = []; // �ʱ� ���� ��� ��� dataset�� ����
dataset.push({"name":"����� ���",
    "values":[
		{"value":${daytotal.teacher_avg} ,"column":"���� ��"},
		{"value":${daytotal.maxchild_avg},"column":"����"}, 
		{"value":${daytotal.nowchild_avg},"column":"����"},
		{"value":${daytotal.child_per_teacher},"column":"���� �� ���� ��"}
	  ]
});
//ù���� ��Ʈ
function graph(a){
	var code = a;
	var data = {
		"code" : code
	}
	$.ajax({
		url : "graph.child",
		type : "post",
		data : data,
		dataType : "json", // ajax ������� �޴� Ÿ��
		success : function(data) { 
/* 			console.log(data); */
 	    pieChart(data.daycare.gu); 
		d3.selectAll(".svg1 > *").remove(); 
		if(dataset.length == 1){
			dataset.push(
					{"name":data.daycare.name,
		             "values":[
								{"value":data.daycare.teachercnt,"column":"���� ��"},
								{"value":data.daycare.maxchild,"column":"����"},
								{"value":data.daycare.nowchild,"column":"����"},
								{"value":data.daycare.child_per_teacher,"column":"���� �� ���� ��"}
							  ]
						});	
		}else{
			dataset.pop(); 
			dataset.push(
				{"name":data.daycare.name,
	             "values":[
							{"value":data.daycare.teachercnt,"column":"���� ��"},
							{"value":data.daycare.maxchild,"column":"����"},
							{"value":data.daycare.nowchild,"column":"����"},
							{"value":data.daycare.child_per_teacher,"column":"���� �� ���� ��"}
						  ]
					});	
		}
/* 		 score(data.daycare.score_avg);  */
		var margin = {top: 20, right: 20, bottom: 30, left: 40},
		    width = 750 - margin.left - margin.right,
		    height = 450 - margin.top - margin.bottom;
		var divTooltip = d3.select(".tooltip1");
		var x0 = d3.scale.ordinal()
		    .rangeRoundBands([0, width], .1);

		var x1 = d3.scale.ordinal();

		var y = d3.scale.linear()
		    .range([height, 0]);

		var xAxis = d3.svg.axis()
		    .scale(x0)
		    .tickSize(0)										
		    .orient("bottom");

		var yAxis = d3.svg.axis()
		    .scale(y)
		    .orient("left");
	
		  
		var color = d3.scale.ordinal()
		    .range(["#FFC321","#7FD100" ,"#0B77E8","#FF6336"]);

		var svg = d3.select('#chart').select('.svg1')
		    .attr("width", width + margin.left + margin.right)
		    .attr("height", height + margin.top + margin.bottom)
		  .append("g")
		    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		  
	      // data �ִ� �κ�	
	      var data = dataset;
	      
		  var Names = data.map(function(d) { return d.name; });
		  var columnNames = data[0].values.map(function(d) { return d.column; });
		  
		  x0.domain(Names);
		  x1.domain(columnNames).rangeRoundBands([0, x0.rangeBand()]);
		  y.domain([0, 20+d3.max(data, function(name) { return d3.max(name.values, function(d) { return d.value; }); })]); 
		  
		  svg.append("g")
		      .attr("class", "x axis")
		      .attr("transform", "translate(0," + height + ")")
		      .call(xAxis);

		  svg.append("g")
		      .attr("class", "y axis")
		      .style('opacity','0')
		      .call(yAxis)
		  .append("text")
		  	  .attr("x",50)
		      .attr("y", 6)
		      .attr("dy", ".71em")
		      .style("text-anchor", "end")
		      .style('font-weight','bold')
		      .text("�ο� ��");

		  svg.select('.y').transition().duration(500).delay(1300).style('opacity','1');
		  
		  
		  var slice = svg.selectAll(".slice")
		      .data(data)
		      .enter().append("g")
		      .attr("class", "g")
		      .attr("transform",function(d) { return "translate(" + x0(d.name) + ",0)"; });

		  slice.selectAll("rect")
		      .data(function(d) { return d.values; })
		  .enter().append("rect")
		      .attr("width", x1.rangeBand())
		      .attr("x", function(d) { return x1(d.column); })
		      .style("fill", function(d) { return color(d.column) })
		      .attr("y", function(d) { return y(0); })
		      .attr("height", function(d) { return height - y(0); })
		      .on("mouseover", function(d) {  //���콺 ���� �̺�Ʈ �� �ش� ������ �� ��ȸ.
		    	    divTooltip.style("left", d3.event.pageX + 10 + "px")
	                divTooltip.style("top", d3.event.pageY - 25 + "px")
	                divTooltip.style("display", "inline-block")
	                divTooltip.style("opacity", "0.9");
	                var x = d3.event.pageX,
	                    y = d3.event.pageY;
	                divTooltip.html(d.column + "<br>" + d.value);
	                d3.select(this)
	                    .style("fill", d3.rgb(color(d.column)).brighter(1))
	                    .style("opacity", "0.7");
		      })
		      .on("mouseout", function(d) {
		    	  divTooltip.style("display", "none")
	                d3.select(this).transition().duration(250)
	                    .style("fill", color(d.column))
	                    .style("opacity", "1");
		      });
		  
		  slice.selectAll("rect")
		      .transition()
		      .delay(function (d) {return Math.random()*1000;})
		      .duration(1000)
		      .attr("y", function(d) { return y(d.value); })
		      .attr("height", function(d) { return height - y(d.value); });

		  //����
		  var legend = svg.selectAll(".legend")
		      .data(data[0].values.map(function(d) { return d.column; }).reverse())
		  .enter().append("g")
		      .attr("class", "legend")
		      .attr("transform", function(d,i) { return "translate(0," + i * 20 + ")"; })
		      .style("opacity","0");

		  legend.append("rect")
		      .attr("x", width)
		      .attr("width", 18)
		      .attr("height", 18)
		      .style("fill", function(d) { return color(d); });

		  legend.append("text")
		      .attr("x", width - 2)
		      .attr("y", 9)
		      .attr("dy", ".35em")
		      .style("text-anchor", "end")
		      .text(function(d) {return d; });

		  legend.transition().duration(500).delay(function(d,i){ return 1300 + 100 * i; }).style("opacity","1");
		/*   //��ư Ŭ�� �� ��Ʈ �ʱ�ȭ
		  d3.select('#remove').on('click',function(){ d3.selectAll("svg > *").remove(); data=[];}); */
		}});
	
}
//�߰� pie chart 
function pieChart(guname){//guname�� �Ƿ�����
	 var tooltip = d3.select(".tooltip2");

	 var width = 960,
	     height = 500,
	     radius = Math.min(width, height) / 2;

	 var color = d3.scale.ordinal()
	     .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

	 var arc = d3.svg.arc()
	     .outerRadius(radius - 10)
	     .innerRadius(radius - 70);

	 var pie = d3.layout.pie()
	     .sort(null)
	 	 .startAngle(1.1*Math.PI)
	     .endAngle(3.1*Math.PI)
	     .value(function(d) { return d.value; });
	 	 

	 var svg = d3.select("body").select(".svg2")
	     .attr("width", width)
	     .attr("height", height)
	   .append("g")
	     .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	
	d3.json("../decorator/total_nowchild.json", function(error, data) {
	 for (var i=0; i<data.length;i++){
		 if(guname == data[i].gu){
			 console.log(data[i].gu);			 
			var dataset=[
				{"type":data[i].values[0].column,"value":data[i].values[0].value},
				{"type":data[i].values[1].column,"value":data[i].values[1].value},
				{"type":data[i].values[2].column,"value":data[i].values[2].value},
				{"type":data[i].values[3].column,"value":data[i].values[3].value},
				{"type":data[i].values[4].column,"value":data[i].values[4].value},
				{"type":data[i].values[5].column,"value":data[i].values[5].value},
				{"type":data[i].values[6].column,"value":data[i].values[6].value}
			]
	  var g = svg.selectAll("arc")
	       .data(pie(dataset))
	     .enter().append("g")
	       .attr("class", "arc2");

	   g.append("path")
	 	.style("fill", function(d) { return color(d.data.type); })
	     .transition().delay(function(d,i) {
	 	return i * 500; }).duration(500)
	 	.attrTween('d', function(d) {
	 		var i = d3.interpolate(d.startAngle+0.1, d.endAngle);
	 		return function(t) {
	 			d.endAngle = i(t); 
	 			return arc(d);
	 			}
	 		}); 
	   g.append("text")
	       .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
	       .attr("dy", ".35em")
	 	  .transition()
	 	  .delay(1000)
	       .text(function(d) { return d.data.type; });

	 	d3.select(".svg2").selectAll("path").on("mousemove", function(d) {
	 		tooltip.style("left", d3.event.pageX+10+"px");
	 		tooltip.style("top", d3.event.pageY-25+"px");
	 		tooltip.style("display", "inline-block");
	 		tooltip.html((d.data.type)+"<br>"+(d.data.value));
	 });
	 	  
	 d3.select(".svg2").selectAll("path").on("mouseout", function(d){
		 tooltip.style("display", "none");
	 });
	 	  
	 	  
	 //d3.select("body").transition().style("background-color", "#d3d3d3");
 	 function type(d) {
	   d.value = +d.value;
	   return d;
	 } 
	 		
		 }
	 }		  
		  
	});
	
} 
//�ش� ������� ���� �ֽż� �ı�Խ��� ���
function review(code){
	var data = {
		"code" : code
	}
	$.ajax({
		url : "reviews.child",
		type : "post",
		data : data,
		dataType : "json", // ajax ������� �޴� Ÿ��
		success : function(data) {
			//��ư Ŭ���� �ʱ�ȭ
			$('#removeboard').click(function(){
				$('#reviews').empty();
			})
			//�ٸ� ����� �ı� Ŭ���� ������ �ʱ�ȭ �� �Խ��� �����
		    $('#reviews').empty();
		    var board  = "<table border='1' style='border-collapse: collapse; width: 100%; margin: 10px auto;' class='w3-table w3-border w3-bordered'>";
		    	if ( data.fourlists.length > 0){
		        board  += "<tr><th width='80%' height='26' style='text-align:center'>����</th><th width='80%' height='26' style='text-align:center'>����</th></tr>";
			for(var i = 0; i < data.fourlists.length; i++){     
				board += "<tr align='center' valign='middle' bordercolor='#333333' onmouseover='this.style.backgroundColor=#FFF1F5' onmouseout='this.style.backgroundColor=white'>";
                board += "<td height='23' style='text-align:center'><a href='../board/info.child?bnum="+data.fourlists[i].bnum+"&bType=2' style='text-decoration: none;'>"+data.fourlists[i].subject+"</a></td><td height='23' style='text-align:center'>"+data.fourlists[i].score+"</td></tr>";
               }
			board += "<tr><td colspan='2' style='text-align:right'><a href='../board/list.child?bType=2'>������</a></td></tr></table>";
		     }else{
			board += "<tr><th width='80%' height='26' style='text-align:center'>����</th><th width='80%' height='26' style='text-align:center'>����</th></tr><tr><td colspan='2'>��ϵ� �Խù��� �����ϴ�.</td></tr>";
			board += "<tr><td colspan='2' style='text-align:right'><a href='../board/list.child?bType=2'>������</a></td></tr></table>";
		     }
			$('#reviews').append(board);
		}});
}


</script>
</body>
</html>