var width = 600, height = 430;
var svg = d3.select("#mapchart").append("svg")
	.attr("class","svg1")
	//.style("margin-top",50)
	.style("margin-left","80")
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
      
      .style("fill","#C8E5F2")
//      .style("opacity","0.8")
      .on("mouseover",function(d){
      	 d3.select(this).style("fill","#98C9DE");
    	 d3.select(this).style("cursor","pointer");
     	 d3.select(this).style("transform","scale(0.99)");
     	 d3.select(this).style("stroke","#6BA7C1"); 
     	 d3.select(this).style("stroke-width","3px");
      })
      .on("click",function(d){
    	 makepiechart(d.properties.SIG_CD, d.properties.SIG_KOR_NM);
    	 $('#maplink' ).hide();
      })
      .on("mouseout",function(){
		 d3.select(this).style("fill","#C8E5F2");
		 d3.select(this).style("transform","scale(1)"); 
     	 d3.select(this).style("stroke","white");
     	 d3.select(this).style("stroke-width","1.3px");
      });
  map.selectAll("text")	//글자넣는 구간
      .data(features)
      .enter().append("text")
      .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .attr("class", "municipality-label")
      .style("stroke", "#1F1F1F")
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
