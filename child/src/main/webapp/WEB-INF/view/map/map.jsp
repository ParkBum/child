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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ea2633155fc8b442f8cc095a5798ccf&libraries=services"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
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

svg.tooltip {	
    position: absolute;			
    text-align: center;			
    width: 60px;					
    height: 34px;					
    padding: 2px;				
    font: 12px sans-serif;		 
    background: lightsteelblue;	
    border: 0px;		
    border-radius: 8px;			
    pointer-events: none;			
}
</style>
</head>
<body>
	<div id="main">
		<div id="SearchAndMap">
			<div class="half">
			<div id="search">
				<div style="text-align: center; width: 100%; height: 80px; background: #FFF3F6;">
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
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs" value="��ȸ">
						</div>
					</div>
					<div style="width: 100%; height: 40px;">
					<a>��� �׸��� �ʼ������� �����ϼž��մϴ�.</a>&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="hideMarkers()">���� �ʱ�ȭ</button>
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
			<div class="bar" style="height:470px; background-color: rgba(255, 243, 246, 0.5);	" id="chart">
				<svg></svg>
			</div>
			<div class="bar" style="height:320px;">
				<div style="width:750px; height : 270px; border:solid 1px black; margin : 23px auto;"></div> 
			</div>
			</div>
		</div>
		<!-- SearchAndMap -->
	</div>
<div id="tooltip" class="hidden">
	<p> �ο� �� : <b id="value"></b>��</p>
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
					for (var i = 0; i < data.daycarelist.length; i++) {
						var Map = map;
						var coords = new daum.maps.LatLng(
            					data.daycarelist[i].lat,data.daycarelist[i].lon		
            					);
							
						var imageSrc = '';
						if(data.daycarelist[i].bus == '�')
							 imageSrc = 'https://cdn.icon-icons.com/icons2/682/PNG/512/school-bus_icon-icons.com_61070.png';	
						else	 
							 imageSrc = 'https://cdn.icon-icons.com/icons2/469/PNG/128/Christmas_2015-32_44374.png'; // ��Ŀ�̹����� �ּ��Դϴ� 	
							 
					    var imageSize = new daum.maps.Size(45, 45); // ��Ŀ�̹����� ũ���Դϴ�
					    var imageOption = {offset: new daum.maps.Point(27, 27)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords,
    						image : markerImage 
    					});
    					marker.setMap(map);
    					markers.push(marker);


    					var content = '<div class="labelWish" style="opacity:0.5; width:500px;"><span class="leftWish"></span><span class="centerWish">'
							+"����� �̸�: "+data.daycarelist[i].name+'&nbsp;&nbsp;<button id="compare" onclick="javascript:graph('+data.daycarelist[i].code+')">���ϱ�</button><button id="review" onclick="javascript:review('+data.daycarelist[i].code+')">�ı�</button><br>��ȭ��ȣ: '+data.daycarelist[i].tel+'<br>�ּ�:'+data.daycarelist[i].addr+'</span><span class="rightWish"></span></div>';
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content,
							    removable:true
							}); 
						infos.push(infowindow);
        				 map.setCenter(coords);	 
   
        			    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
        			    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�       			
        			    (function(marker, infowindow) { 
        			        // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
        			        daum.maps.event.addListener(marker, 'click', function() {
        			            infowindow.open(map, marker);
        			        });

        			    })(marker, infowindow);

					}
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
<%-- �׷��� ��  ajax --%>
var dataset = [];
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
		d3.selectAll("svg > *").remove();
		dataset.push(
			{"name":data.daycare.name,
             "values":[
						{"value":data.daycare.teachercnt,"column":"���� ��"},
						{"value":data.daycare.maxchild,"column":"����"},
						{"value":data.daycare.nowchild,"column":"����"}
					  ]
				});
		var margin = {top: 20, right: 20, bottom: 30, left: 40},
		    width = 750 - margin.left - margin.right,
		    height = 450 - margin.top - margin.bottom;

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
		    .range(["#FFC321","#7FD100" ,"#0B77E8"]);

		var svg = d3.select('#chart').select('svg')
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
		  y.domain([0, d3.max(data, function(name) { return d3.max(name.values, function(d) { return d.value; }); })]); 
		  
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
		  
		  var div = d3.select("svg").append("div")	
		    .attr("class", "tooltip")				
		    .style("opacity", 0);
		  
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
		      .on("mouseover", function(d) {
		          d3.select(this).style("fill", d3.rgb(color(d.column)).brighter(1));
		      })
		      .on("mouseout", function(d) {
		    	 	
		          d3.select(this).style("fill", color(d.column)); 
		      });

		  
		  
		  slice.selectAll("rect")
		      .transition()
		      .delay(function (d) {return Math.random()*1000;})
		      .duration(1000)
		      .attr("y", function(d) { return y(d.value); })
		      .attr("height", function(d) { return height - y(d.value); });

		  //Legend
		  var legend = svg.selectAll(".legend")
		      .data(data[0].values.map(function(d) { return d.column; }).reverse())
		  .enter().append("g")
		      .attr("class", "legend")
		      .attr("transform", function(d,i) { return "translate(0," + i * 20 + ")"; })
		      .style("opacity","0");

		  legend.append("rect")
		      .attr("x", width - 18)
		      .attr("width", 18)
		      .attr("height", 18)
		      .style("fill", function(d) { return color(d); });

		  legend.append("text")
		      .attr("x", width - 24)
		      .attr("y", 9)
		      .attr("dy", ".35em")
		      .style("text-anchor", "end")
		      .text(function(d) {return d; });

		  legend.transition().duration(500).delay(function(d,i){ return 1300 + 100 * i; }).style("opacity","1"); 

		}});
	
}
</script>

</body>
</html>