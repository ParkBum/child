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
<title>어린이집 검색</title>
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
<%-- 지도 영역, 내용 출력 영역 나누기 --%>
.half{
 float: left;
  width: 50%;
  padding: 15px;
} 
.bar {
 
}
<%-- 차트 관련 css--%>
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
							<font style="margin-top: 4px;">구를 선택해주세요&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="gu" id="gu">
								<option value="">선택하세요</option>
								<option>강남구</option>
								<option>강동구</option>
								<option>강북구</option>
								<option>강서구</option>
								<option>관악구</option>
								<option>광진구</option>
								<option>구로구</option>
								<option>금천구</option>
								<option>노원구</option>
								<option>도봉구</option>
								<option>동대문구</option>
								<option>동작구</option>
								<option>마포구</option>
								<option>서대문구</option>
								<option>서초구</option>
								<option>성동구</option>
								<option>성북구</option>
								<option>송파구</option>
								<option>양천구</option>
								<option>영등포구</option>
								<option>용산구</option>
								<option>은평구</option>
								<option>종로구</option>
								<option>중구</option>
								<option>중랑구</option>
							</select>
						</div>
						<div style="width: 30%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">어린이집 유형&nbsp;&nbsp;</font> <select  style="margin-top: 4px;" name="type" id="type">
								<option value="">선택하세요</option>
								<option>가정</option>
								<option>국공립</option>
								<option>민간</option>
								<option>법인·단체등</option>
								<option>사회복지법인</option>
								<option>협동</option>
								<option>직장</option>
							</select>
						</div>
						<div style="width: 39%; height:36px; margin : 2px 0; float: left;">
							<font style="margin-top: 4px;">통원 버스 유무&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="bus" id="bus">
								<option value="">선택하세요</option>
								<option>운영</option>
								<option>미운영</option>
							</select> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="searchs" value="조회">
						</div>
					</div>
					<div style="width: 100%; height: 40px;">
					<a>모든 항목을 필수적으로 선택하셔야합니다.</a>&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="hideMarkers()">지도 초기화</button>
					</div>
				</div>
			</div>
			<!-- </form> -->
			<div id="map_wrap" align="center" class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; margin: 10px 0"
					align="center"></div>
			</div>
			</div>
			<!-- map_wrap의 끝 -->
			<!-- 그래프 및 후기 게시판 출력 -->
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
	<p> 인원 수 : <b id="value"></b>명</p>
</div>

	<%-- 지도를 생성을 합니다. --%>
<script type="text/javascript">
		// 지동 생성에 필요한 값들
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
			level : 2, // 지도의 확대 레벨
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption);

		//지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		//생성된 마커 객체들을 실을 배열 객체
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
				dataType : "json", // ajax 통신으로 받는 타입
				success : function(data) {
					if (data.daycarelist.length == 0){
						alert("조건에 일치하는 어린이집이 없습니다.")
					}
					for (var i = 0; i < data.daycarelist.length; i++) {
						var Map = map;
						var coords = new daum.maps.LatLng(
            					data.daycarelist[i].lat,data.daycarelist[i].lon		
            					);
							
						var imageSrc = '';
						if(data.daycarelist[i].bus == '운영')
							 imageSrc = 'https://cdn.icon-icons.com/icons2/682/PNG/512/school-bus_icon-icons.com_61070.png';	
						else	 
							 imageSrc = 'https://cdn.icon-icons.com/icons2/469/PNG/128/Christmas_2015-32_44374.png'; // 마커이미지의 주소입니다 	
							 
					    var imageSize = new daum.maps.Size(45, 45); // 마커이미지의 크기입니다
					    var imageOption = {offset: new daum.maps.Point(27, 27)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
						var marker = new daum.maps.Marker({
    						map:Map,
    						position:coords,
    						image : markerImage 
    					});
    					marker.setMap(map);
    					markers.push(marker);


    					var content = '<div class="labelWish" style="opacity:0.5; width:500px;"><span class="leftWish"></span><span class="centerWish">'
							+"어린이집 이름: "+data.daycarelist[i].name+'&nbsp;&nbsp;<button id="compare" onclick="javascript:graph('+data.daycarelist[i].code+')">비교하기</button><button id="review" onclick="javascript:review('+data.daycarelist[i].code+')">후기</button><br>전화번호: '+data.daycarelist[i].tel+'<br>주소:'+data.daycarelist[i].addr+'</span><span class="rightWish"></span></div>';
						var infowindow = new daum.maps.InfoWindow({
							    position : coords, 
							    content : content,
							    removable:true
							}); 
						infos.push(infowindow);
        				 map.setCenter(coords);	 
   
        			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
        			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다       			
        			    (function(marker, infowindow) { 
        			        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        			        daum.maps.event.addListener(marker, 'click', function() {
        			            infowindow.open(map, marker);
        			        });

        			    })(marker, infowindow);

					}
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener( map, marker, infowindow) { 
					    return function() {
					        infowindow.open(map, marker);
					    };
					}
					
					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
					    return function() {
					        infowindow.close();
					    };
					}


				}
			});
		})
//띄운 마커, 인포윈도우 감추기
function hideMarkers() {
	 for (var i = 0; i < markers.length; i++) {
	      markers[i].setMap(null);
	      infos[i].close();
   	}    
	 
}
<%-- 그래프 비교  ajax --%>
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
		dataType : "json", // ajax 통신으로 받는 타입
		success : function(data) { 
		d3.selectAll("svg > *").remove();
		dataset.push(
			{"name":data.daycare.name,
             "values":[
						{"value":data.daycare.teachercnt,"column":"교사 수"},
						{"value":data.daycare.maxchild,"column":"정원"},
						{"value":data.daycare.nowchild,"column":"현원"}
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
		  
	      // data 주는 부분	
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
		      .text("인원 수");

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