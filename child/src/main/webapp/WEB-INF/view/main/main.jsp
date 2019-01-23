<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../css/main2.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script><!-- 지도 -->
<script src="http://d3js.org/d3.v4.min.js"></script> 
<script src="http://d3js.org/topojson.v1.min.js"></script>
<script>
		function makepiechart(data, selectguname){
			d3.selectAll(".svg2 > *").remove(); 	//svg 안에 있는 모든 요소들을 제거한다.
			d3.json("../decorator/dcc_total_2.json", function(error, seoul) {
		        if (error) {
		            console.log(error);
		            throw error;}
			var width = 600, height = 400, radius = Math.min(width, height) /2.5 ;
			// piechart의 svg2를 선택
			var svg = d3.select("#piechart").select('.svg2')
		     .attr("width", width)
		     .attr("height", height) 
		     .attr("radius",Math.min(width, height) / 2)
		     .style("margin-left",-100)
		     .append("g") //svg2안에 g태그 선택
		     .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
			//body에 있는 svg2 선택함
			 var pie = d3.pie();
			 var arc = d3.arc().outerRadius(radius - 10).innerRadius(100);
			 // 각 호의 크기를 정함.
			 var label = d3.arc().outerRadius(radius).innerRadius(radius - 80);
			  var seould1=0, seould2=0, seould3=0, seould4=0, seould5=0, seould6=0, seould7=0;
			  
			  //tooltip
			  var tooltip = d3.select(".tooltip1");
			  ///
			  
			  var x1 = d3.scale.ordinal();
			 for(var i=0; i<seoul.seoul.length; i++){
				if(data == seoul.seoul[i].code||data=='10000'){
 				var piedatas = [
				 	{name : '국공립',  	value : seoul.seoul[i].publics,  	color : '#FF4542'},//녹색
					{name : '복지법인',  	value : seoul.seoul[i].welfare,  	color : '#FF9175'},//주황
					{name : '법인단체',	value : seoul.seoul[i].corporate,	color : '#6F90A2'},//파랑
					{name : '민간', 		value : seoul.seoul[i].privates, 	color : '#00C98F'},//노랑
					{name : '가정',    	value : seoul.seoul[i].home,     	color : '#1673C7'},//붉은
					{name : '부모협동', 	value : seoul.seoul[i].parental, 	color : '#C66B98'},//하늘
					{name : '직장',      value : seoul.seoul[i].Job,     	color : '#764EE8'}	//핑크색
				 ];
 				var kind = [piedatas[0].name,piedatas[1].name,piedatas[2].name,piedatas[3].name,piedatas[4].name,piedatas[5].name,piedatas[6].name];
 				var color = d3.scale.ordinal().range([piedatas[0].color,piedatas[1].color,piedatas[2].color,piedatas[3].color,piedatas[4].color,piedatas[5].color,piedatas[6].color]);
 				var piedata = [piedatas[0].value,piedatas[1].value,piedatas[2].value,piedatas[3].value,piedatas[4].value,piedatas[5].value,piedatas[6].value];
 				 if(data=='10000'){
					 seould1 = seould1 + seoul.seoul[i].publics; 
					 seould2 = seould2 + seoul.seoul[i].welfare;
					 seould3 = seould3 + seoul.seoul[i].corporate;
					 seould4 = seould4 + seoul.seoul[i].privates;
					 seould5 = seould5 + seoul.seoul[i].home;
					 seould6 = seould6 + seoul.seoul[i].parental;
					 seould7 = seould7 + seoul.seoul[i].Job;
				piedata = [seould1,seould2,seould3,seould4,seould5,seould6,seould7];
				piedatas = [
				    { name : '국공립', value : seould1,  	color : '#FF4542'},//녹색
				    { name : '복지법인', value : seould2,  	color : '#FF9175'},//주황
				    { name : '법인단체', value : seould3,	color : '#6F90A2'},//파랑
				    { name : '민간', value : seould4, 	color : '#00C98F'},//노랑
				    { name : '가정', value : seould5,     	color : '#1673C7'},//붉은
				    { name : '부모협동', value : seould6, 	color : '#C66B98'},//하늘
				    { name : '직장', value : seould7,     color : '#764EE8'}	//핑크색
				];
 				} 
				}
			  }
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
			  });
			  
			legend
			  .append('rect')
			  .attr('width', legendItemSize)
			  .attr('height', legendItemSize)
			  .style('fill', function(d,i) {return color(i)});
			
			legend
			  .append('text')
			  .attr('x', legendItemSize + legendSpacing)
			  .attr('y', legendItemSize - legendSpacing)
			  .text(function(d,i) {return kind[i]});
			  
			 ///////////////////////////////////////////////////<<<<<<<<<<<<<<<<<<<<<
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
			        	/* console.log(color(i)) */
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
		             	
			 if(data=='10000'){
				 svg.append("foreignObject")
			      	.attr("width", 200+"px")
			      	.attr("height", 80+"px")
			      	.attr("x",-100)
			      	.attr("y",170)
			    	/* .append("xhtml:body") */
					.html('<button id="maibtn" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white; font-size:18px;">'+selectguname+'</button>');
			 }else{
				 svg.append("foreignObject")
			      	.attr("width", 300+"px")
			      	.attr("height", 80+"px")
			      	.attr("x",-150)
			      	.attr("y",170)
			    	//.append("xhtml:body")
			    	.html('<form action="../map/map.child" method="post">'+
			    			'<input type="hidden" name="gu" value="'+selectguname+'">'+
			    			'<button id="main2btn" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white; font-size:18px; ">'+selectguname+' 어린이집 검색 바로가기 '+'<img src="../decorator/arrow.png" style="height: 23px;"></button>'+
			    			'</form>')
			 }
			 
			      svg.append("text")
					.attr("text-anchor", "middle")
			 		.attr('font-size', '2em')
			 		.attr('y', -165)
		    		.text(selectguname+" 어린이집 시설수")
		    		.style('font-weight','bold');
				////////<<<<<<<<<<<
			 	/*
			 		text 정 중앙에 텍스트 넣기
			 		g.append("text")	//텍스트 테그 부름
			    	.attr("transform", function(d) {
			        var _d = arc.centroid(d);	//arc는 호 하나하나를 말하는 거임 ..
			        _d[0] *= 1.3;	//multiply by a constant factor
			        _d[1] *= 1.3;	//multiply by a constant factor	.. 글자 위치 나타냄
			        return "translate(" + _d + ")";
			      })
			      .attr("dy", ".70em")	//글자 크기
			      .style("text-anchor", "middle")
			      .text(function(d,i) {
			    	if(piedatas[i].value==0){
			    		piedatas[i].value = "";
			    	}
			        return piedatas[i].value;
			      }); */
			      d3.select(".svg2").selectAll("path").on("mousemove", function(d,i) {
			          tooltip.style("left", d3.event.pageX+10+"px");
			          tooltip.style("top", d3.event.pageY-25+"px");
			          tooltip.style("display", "inline-block");
			          tooltip.html((piedatas[i].name)+" : "+(d.value)+"곳");
			          d3.select(this)
                      	.style("fill", d3.rgb(color(i)).brighter(1))
                     	.style("opacity", "0.7");
                     	
			    })
			     d3.select(".svg2").selectAll("path").on("mouseout", function(d,i){
       				tooltip.style("display", "none");
       				d3.select(this).transition().duration(250)
                    .style("fill", color(i))
                    .style("opacity", "1");
   				 });
		});
		}
		
	$(document).ready(function() {
		makepiechart('10000','서울시') 
		var main = $('.bxslider').bxSlider({
			mode : 'horizontal',
			auto : true, //자동으로 슬라이드  
			controls : true, //좌우 화살표     
			autoControls : true, //stop,play  
			pager : true, //페이징  
			pause : 5000,
			slideWidth : 1200,
			speed : 2000,
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
</head>

<body>
<div id="wrap" style="height: 550;">
	<div id="chartarea" style="display: inline-flex;" align="center">
		<div id="mapchart"></div> 
		<div id="piechart" style="width: 600; height: 460;">
		<div class="tooltip1"  style=" z-index:3;"></div>
			<svg class="svg2"></svg>
		</div>
	 </div>
 </div>
   <div style="background-color: #FFF1F5; height: 500px; width: 100%;">
			<div> <!-- style="background-color: #FFF1F5; height: 500px; width: 100%;" -->
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
							<li><a class="a1" href="../board/list.child?bType=1">
							<span class="tit" style="font-size: 16px;">자유게시판</span></a></li>
							<li><a class="a2" href="../board/list.child?bType=2"><span
									class="tit" style="font-size: 16px;">후기게시판</span></a></li>
							<li><a class="a3" href="../board/list.child?bType=3"><span
									class="tit" style="font-size: 16px;">거래게시판</span></a></li>
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
		<script language="javascript" src="../js/main2_map.js" charset="EUC-KR"></script>
</body>
</html>