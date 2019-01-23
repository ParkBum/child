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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d094ff0d46bd9e7038645e9796b5533c&libraries=services"></script>
<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
<style type="text/css">
#main {
   max-width: 1200px;
   margin-left :360px ;
}
#SearchAndMap {
   width: 1200px;
   height: 900px;
}
 
#search {
   width: 570px;
   height: 80px;
   vertical-align: middle;
}

#map_wrap {
   width: 570px;
   height: 500px;
}

.buttons {
    -webkit-appearance: button;

}
option {
   font-size: large;
}
<%-- 지도 영역, 내용 출력 영역 나누기 --%>
.half1{
 float: left;
  width: 570px;
/*   padding: 15px; */
} 
.half2{
 float: right;
  width: 570px;
/*   padding: 15px;  */
}
.
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
  .tooltip1 {
      position: absolute;
    display: none;
    width: auto;
    height: auto;
    background: none repeat scroll 0 0 white;
    border: 0 none;
    border-radius: 8px 8px 8px 8px;
    box-shadow: -3px 3px 15px #888888;
    color: black;
    font: 12px;
    padding: 5px;
    text-align: center;
  } 
<%-- pie chart --%>
.arc2 text ,.arc3 text {
  font: 25px;
  text-anchor: middle;
}
.arc2 path , .arc3 path {
  stroke: #fff;
}
/* .textmiddle{
    text-shadow: -3px 3px 15px #888888;
} */

.tooltip2,.tooltip3 {
    position: absolute;
    display: none;
    width: auto;
    height: auto;
    background: none repeat scroll 0 0 white;
    border: 0 none;
    border-radius: 8px 8px 8px 8px;
    box-shadow: -3px 3px 15px #888888;
    color: black;
    font: 12px;
    padding: 5px;
    text-align: center;
} 

</style>
</head>
<body>
   <div id="main">
      <div id="SearchAndMap">
         <div class="half1">
         <div id="search">
            <div style="text-align: center; width: 100%; height: 80px; background: #f7f7f7; border : solid 1px #dbdbdb;">
               <div style="width: 100%; height: 40px; margin:auto 0; display: inline-block;">
                  <div style="width: 29%; height:30px; margin : 5px 0; float: left; border-right: silver 1px solid;">
                     <font style="margin-top:1px;">지역&nbsp;&nbsp;</font> <select style="margin-top:1px; width:90px;" name="gu" id="gu">
                        <option value="">선택</option>
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
                  <div style="width: 29%; height:30px; margin : 5px 0; float: left; border-right: silver 1px solid;">
                     <font style="margin-top: 1px;">유형&nbsp;&nbsp;</font> <select  style="width:90px; margin-top: 1px;" name="type" id="type">
                        <option value="">선택</option>
                        <option>가정</option>
                        <option>국공립</option>
                        <option>민간</option>
                        <option>법인·단체등</option>
                        <option>사회복지법인</option>
                        <option>협동</option>
                        <option>직장</option>
                     </select>
                  </div>
                  <div style="width: 42%; height:36px; margin : 2px 0; float: left;">
                     <font style="margin-top: 4px;">차량&nbsp;&nbsp;</font> <select style="width:90px; margin-top: 4px;" name="bus" id="bus">
                        <option value="">선택</option>
                        <option>운영</option>
                        <option>미운영</option>
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;<button class="buttons" id="searchs">조회</button>
               </div>
               </div>
               <div style="width: 100%; height: 40px; margin:auto 0; display: inline-block;">
               <input type="text" name="word" id="word" placeholder="단어를 입력해 주세요">&nbsp;&nbsp;&nbsp;&nbsp;<button class="buttons" id="wordsearchs">검색</button>
               </div>
            </div>
         </div>
         <div id="map_wrap" align="center" class="map_wrap">
            <div id="map" style="width: 100%; height: 100%; margin: 10px 0"
               align="center"></div>
            <div class="bar1" style="height:285px;  margin-top:10px;">
           <svg class="legends" style=" position:relative; z-index:2;"></svg>
          <div class="tooltip3" style=" z-index:3;"></div>
            <svg class="svg3" style=" position:relative; top:-20px; z-index:2;"></svg>
         <div class="tooltip2" style=" z-index:3;"></div>
            <svg class="svg2" style=" position:relative; top:-20px; z-index:2;"></svg>
        
         </div>
         </div>
         <!-- map_wrap의 끝 -->
         <!-- 그래프 및 후기 게시판 출력 -->
      <!-- SearchAndMap -->
   </div>
   <div class="half2">
         <div class="bar2" style="height:470px; width:570px;text-align:center;" id="chart">
         <div class="tooltip1"  style=" z-index:3;"></div>
            <svg class="svg1" style=" z-index:2;"></svg>  
         </div>
          <div class="bar3" style="height:400px; width:570px; text-align:center; border:solid 1px #ccc; margin-top : 15px;">
            <div id="reviews" style="position:relative;width:570px; height : 400px; z-index:2;"></div> 
         </div> 
      </div>
   </div>
   </div>
   <%-- 지도를 생성을 합니다. --%>
<script type="text/javascript">
      // 지동 생성에 필요한 값들
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
         level : 5, // 지도의 확대 레벨
         mapTypeId : daum.maps.MapTypeId.ROADMAP
      // 지도종류
      };
      // 지도를 생성한다 
      var map = new daum.maps.Map(mapContainer, mapOption);

      //지도에 확대 축소 컨트롤을 생성한다
      var zoomControl = new daum.maps.ZoomControl();

      // 지도의 우측에 확대 축소 컨트롤을 추가한다
      map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
      var imageSrc = 'https://image.flaticon.com/icons/svg/1397/1397965.svg', // 마커이미지의 주소입니다    
      imageSize = new daum.maps.Size(40, 60), // 마커이미지의 크기입니다
      imageOption = {offset: new daum.maps.Point(15, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
        
  // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
      var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
      //생성된 마커 객체들을 실을 배열 객체
      var markers = [];
      var infos = [];
</script>
<c:if test="${!empty sessionScope.loginUser}"> <!-- 로그인 하여 어린이집 검색으로 들어올 시 주소 기준 반경 1km내 가까운 곳부터 10개 출력 -->
<c:if test="${empty gu}">
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
                  alert("반경 안에 어린이집이 없습니다.")
               }
               hideMarkers();
               for (var i = 0; i < data.autoMarkerList.length; i++) {
                  var Map = map;
                  var coords = new daum.maps.LatLng(
                           data.autoMarkerList[i].lat,data.autoMarkerList[i].lon      
                           );
                     
                  var marker = new daum.maps.Marker({
                      map:Map,
                      position:coords,
                      image : markerImage
                   });
                   marker.setMap(map);
                   var content = '<div class="labelWish" style="border-radius:5px; width:450px;">';
                   content += '<div style="text-align:center; margin-top:15px;";>['+data.autoMarkerList[i].type+']<strong>'+data.autoMarkerList[i].name+'</strong>';
                   if(data.autoMarkerList[i].bus == '운영'){
                       content += '&nbsp;&nbsp;<img src="../decorator/bus2.png" style="width:22px; height:22px; margin-top:-4px;"></div>';   
                       }
                   content += '<div style="margin-top:8px; margin-left: 15px; margin-right:15px; text-align:left;">전화번호: '+data.autoMarkerList[i].tel+'</div>';
                   content += '<div style=" margin-top:8px; margin-left: 15px; margin-right:15px; text-align:left; text-overflow: ellipsis; overflow:hidden; white-space:nowrap;"  title="'+data.autoMarkerList[i].addr+'">주소:'+data.autoMarkerList[i].addr+'</div>';
                   content += '<div style="margin-top:8px;"><button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+data.autoMarkerList[i].code+')">차트 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+data.autoMarkerList[i].code+')">후기</button></div><br></div>';
                   var infowindow = new daum.maps.InfoWindow({
                         position : coords, 
                         content : content,
                         removable:true
                     }); 
                  infos.push(infowindow);
                  markers.push(marker);
                  map.setCenter(coords);  
                     // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                     // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다                
                     (function(marker, infowindow, codes,is) { 
                         // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
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
               
               // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
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
<c:if test="${!empty gu}">
<script>
$(document).ready(function(){ 
    hideMarkers();
    <c:forEach items="${guMarkerlist}" var="lists">
       var Map = map;
       var coords = new daum.maps.LatLng(
     		  ${lists.lat},${lists.lon}      
                );
          
       var marker = new daum.maps.Marker({
           map:Map,
           position:coords,
           image : markerImage
        });
        marker.setMap(map);
        var content = '<div class="labelWish" style="border-radius:5px; width:450px;">';
        content += '<div style="text-align:center; margin-top:15px;";>['+'${lists.type}'+']<strong>'+'${lists.name}'+'</strong>';
        if('${lists.bus}' == '운영'){
            content += '&nbsp;&nbsp;<img src="../decorator/bus2.png" style="width:22px; height:22px; margin-top:-4px;"></div>';   
            }
        content += '<div style="margin-top:8px; margin-left: 15px; margin-right:15px; text-align:left;">전화번호: '+'${lists.tel}'+'</div>';
        content += '<div style=" margin-top:8px; margin-left: 15px; margin-right:15px; text-align:left; text-overflow: ellipsis; overflow:hidden; white-space:nowrap;"  title="'+ '${lists.addr}'+'">주소:'+ '${lists.addr}' +'</div>';
        content += '<div style="margin-top:8px;"><button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+'${lists.code}'+')">차트 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+'${lists.code}'+')">후기</button></div><br></div>';
        var infowindow = new daum.maps.InfoWindow({
              position : coords, 
              content : content,
              removable:true
          }); 
       infos.push(infowindow);
       markers.push(marker);
       map.setCenter(coords);    
          // 이벤트 리스너로는 클로저를 만들어 등록합니다 
          // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다                
          (function(marker, infowindow, codes,is) { 
              // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
              daum.maps.event.addListener(marker, 'click', function() {
                 AnotherMarkers();
                 infowindow.open(map, marker);
              });

          })(marker, infowindow);  
    </c:forEach>
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
}) 
</script>
</c:if>
</c:if>
<c:if test="${empty sessionScope.loginUser}"> <!-- 비로그인 : GPS 켠 상태로 들어올 시 어린이집 검색으로 들어올 시 주소 기준 반경 1.5km내 가까운 곳부터 20개 출력 -->
<c:if test="${empty gu}">
<script>
$(document).ready(function() { 
   if (navigator.geolocation) {//현재 위치가 켜져 있을 시
       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
       navigator.geolocation.getCurrentPosition(function(position) {

           var data ={
               "lat" : position.coords.latitude,
               "lon" :position.coords.longitude
         }
         $.ajax({
            url : "autoMarker.child",
            type : "post",
            data : data,
            dataType : "json",
            success : function(data){
               if (data.autoMarkerList.length == 0){
                  alert("반경 안에 어린이집이 없습니다.")
               }
               hideMarkers();
               for (var i = 0; i < data.autoMarkerList.length; i++) {
                  var Map = map;
                  var coords = new daum.maps.LatLng(
                           data.autoMarkerList[i].lat,data.autoMarkerList[i].lon      
                           );
                     
                  var marker = new daum.maps.Marker({
                      map:Map,
                      position:coords,
                      image : markerImage
                   });
                   marker.setMap(map);
                   var content = '<div class="labelWish" style="border-radius:5px; width:450px;">';
                   content += '<div style="text-align:center; margin-top:15px;";>['+data.autoMarkerList[i].type+']<strong>'+data.autoMarkerList[i].name+'</strong>';
                   if(data.autoMarkerList[i].bus == '운영'){
                       content += '&nbsp;&nbsp;<img src="../decorator/bus2.png" style="width:22px; height:22px; margin-top:-4px;"></div>';   
                       }
                   content += '<div style="margin-top:8px; margin-left: 15px; margin-right:15px;text-align:left; text-overflow: ellipsis;">전화번호: '+data.autoMarkerList[i].tel+'</div>';
                   content += '<div style="margin-top:8px; margin-left: 15px;margin-right:15px; text-align:left; text-overflow: ellipsis;overflow:hidden;white-space:nowrap;" title="'+data.autoMarkerList[i].addr+'">주소:'+data.autoMarkerList[i].addr+'</div>';
                   content += '<div style="margin-top:8px;"><button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+data.autoMarkerList[i].code+')">차트 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+data.autoMarkerList[i].code+')">후기</button></div><br><div>';
                  var infowindow = new daum.maps.InfoWindow({
                         position : coords, 
                         content : content,
                         removable:true
                     }); 
                  infos.push(infowindow);
                  markers.push(marker);
                    map.setCenter(coords);    
                     // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                     // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다                
                     (function(marker, infowindow, codes,is) { 
                         // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
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
               
               // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
               function makeOutListener(infowindow) {
                   return function() {
                       infowindow.close();
                   };
               }
            }
         })  
          
           
          
         })
       
   } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
       
       var locPosition = new daum.maps.LatLng(37.56682, 126.97865),    
           message = '현재 GPS가 켜져있지 않습니다.'
           
       displayMarker(locPosition, message);
   }
     

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

          // 마커를 생성합니다
          var marker = new daum.maps.Marker({  
              map: map, 
              position: locPosition
          }); 
          
          var iwContent = message, // 인포윈도우에 표시할 내용
              iwRemoveable = true;

          // 인포윈도우를 생성합니다
          var infowindow = new daum.maps.InfoWindow({
              content : iwContent,
              removable : iwRemoveable
          });
          
          // 인포윈도우를 마커위에 표시합니다 
          infowindow.open(map, marker);
          
          // 지도 중심좌표를 접속위치로 변경합니다
          map.setCenter(locPosition);      
      }    
})
</script>
</c:if>
<c:if test="${!empty gu}">
<script>
$(document).ready(function(){ 
	               hideMarkers();
	               <c:forEach items="${guMarkerlist}" var="lists">
	                  var Map = map;
	                  var coords = new daum.maps.LatLng(
	                		  ${lists.lat},${lists.lon}      
	                           );
	                     
	                  var marker = new daum.maps.Marker({
	                      map:Map,
	                      position:coords,
	                      image : markerImage
	                   });
	                   marker.setMap(map);
	                   var content = '<div class="labelWish" style="border-radius:5px; width:450px;">';
	                   content += '<div style="text-align:center; margin-top:15px;";>['+'${lists.type}'+']<strong>'+'${lists.name}'+'</strong>';
	                   if('${lists.bus}' == '운영'){
	                       content += '&nbsp;&nbsp;<img src="../decorator/bus2.png" style="width:22px; height:22px; margin-top:-4px;"></div>';   
	                       }
	                   content += '<div style="margin-top:8px; margin-left: 15px; margin-right:15px; text-align:left;">전화번호: '+'${lists.tel}'+'</div>';
	                   content += '<div style=" margin-top:8px; margin-left: 15px; margin-right:15px; text-align:left; text-overflow: ellipsis; overflow:hidden; white-space:nowrap;"  title="'+ '${lists.addr}'+'">주소:'+ '${lists.addr}' +'</div>';
	                   content += '<div style="margin-top:8px;"><button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+'${lists.code}'+')">차트 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+'${lists.code}'+')">후기</button></div><br></div>';
	                   var infowindow = new daum.maps.InfoWindow({
	                         position : coords, 
	                         content : content,
	                         removable:true
	                     }); 
	                  infos.push(infowindow);
	                  markers.push(marker);
	                  map.setCenter(coords);    
	                     // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	                     // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다                
	                     (function(marker, infowindow, codes,is) { 
	                         // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	                         daum.maps.event.addListener(marker, 'click', function() {
	                            AnotherMarkers();
	                            infowindow.open(map, marker);
	                         });

	                     })(marker, infowindow);  
	               </c:forEach>
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
	}) 
</script>
</c:if>
</c:if>
<script>//조건 select 후 조회 시
      $("#searchs").click(function() {
    	  if( $("#gu").val()=='' ||$("#type").val()=='' || $("#bus").val()=='' ){
				alert("조건을 모두 선택하셔야합니다.")
				return false;
			}else{
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
               hideMarkers();
               for (var i = 0; i < data.daycarelist.length; i++) {
                  
                  var Map = map;
                  var coords = new daum.maps.LatLng(
                           data.daycarelist[i].lat,data.daycarelist[i].lon      
                           );
                     
                  var marker = new daum.maps.Marker({
                      map:Map,
                      position:coords,
                      image : markerImage
                   });
                   marker.setMap(map);                
                   var content = '<div class="labelWish" style="border-radius:5px; width:450px;">';
                   content += '<div style="text-align:center; margin-top:15px;";>['+data.daycarelist[i].type+']<strong>'+data.daycarelist[i].name+'</strong>';
                   if(data.daycarelist[i].bus == '운영'){
                       content += '&nbsp;&nbsp;<img src="../decorator/bus2.png" style="width:22px; height:22px; margin-top:-4px;"></div>';   
                       }
                   content += '<div style="margin-top:8px; margin-left: 15px; text-align:left;margin-right:15px;">전화번호: '+data.daycarelist[i].tel+'</div>';
                   content += '<div style="margin-top:8px; margin-left: 15px; text-align:left;margin-right:15px; text-overflow: ellipsis;overflow:hidden;white-space:nowrap;" title="'+data.daycarelist[i].addr+'">주소:'+data.daycarelist[i].addr+'</div>';
                   content += '<div style="margin-top:8px;"><button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+data.daycarelist[i].code+')">차트 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+data.daycarelist[i].code+')">후기</button></div><br></div>';
                 var infowindow = new daum.maps.InfoWindow({
                         position : coords, 
                         content : content,
                         removable:true
                     }); 
                  infos.push(infowindow);//배열에 추가
                  markers.push(marker);//배열에 추가
                    map.setCenter(coords);
                     // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                     // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다                
                     (function(marker, infowindow) { 
                         // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
                         daum.maps.event.addListener(marker, 'click', function() {
                            AnotherMarkers();
                             infowindow.open(map, marker);
                         });

                     })(marker, infowindow);
               } //for문 끝나는 부분
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
		}
      })
//띄운 마커, 인포윈도우 감추기
function hideMarkers() {
    for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
         infos[i].close();
      }    
    
}
//클릭한 인포 외에 다른 마커를 지우기
function AnotherMarkers(){
    for (var i = 0; i < markers.length; i++) {
         infos[i].close();
         
     }    
}
<%-- 그래프 비교  ajax --%>
var dataset = []; // 초기 서울 통계 평균 dataset에 저장
dataset.push({"name":"서울시 평균",
    "values":[
      {"value":${daytotal.teacher_avg} ,"column":"교사 수"},
      {"value":${daytotal.maxchild_avg},"column":"정원"}, 
      {"value":${daytotal.nowchild_avg},"column":"현원"},
      {"value":${daytotal.child_per_teacher},"column":"교사 당 원아 수"}
     ]
});
</script>
<script>//페이지 로드 시 서울 평균, 게시판 부분 먼저 출력
loadBarGraph();
loadReviews();
loadPieGraph_max();
loadPieGraph_now();
function loadBarGraph(){
   var margin = {top: 20, right: 20, bottom: 30, left: 30},
    width = 540 - margin.left - margin.right,
    height = 470 - margin.top - margin.bottom;
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
  
  // data 주는 부분   
  var data = dataset;
  
  var Names = data.map(function(d) { return d.name; });
  var columnNames = data[0].values.map(function(d) { return d.column; });
  
  x0.domain(Names);
  x1.domain(columnNames).rangeRoundBands([0, x0.rangeBand()]);
  y.domain([0,20+d3.max(data, function(name) { return d3.max(name.values, function(d) { return d.value; }); })]); 
  
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
      .on("mousemove", function(d) {  //마우스 오버 이벤트 시 해당 범례의 수 조회.
           divTooltip.style("left", d3.event.pageX + 10 + "px")
            divTooltip.style("top", d3.event.pageY - 25 + "px")
            divTooltip.style("display", "inline-block")
            divTooltip.style("opacity", "0.9")
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

  //범례
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
   
}
function loadReviews() {
   $.ajax({
      url : "reviewsOnload.child",
      type : "post",
      data : {"bType":2},
      success: function(data){
         $('.bar3').css('border','');
         $('#text3').remove();
         $('#reviews').css('top','0px');
         $('#reviews').html(data);
      }
   })
}
function loadPieGraph_max(){
    d3.selectAll(".svg3 > *").remove(); 
    var tooltip = d3.select(".tooltip3");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(1.1*Math.PI)
        .endAngle(3.1*Math.PI)
        .value(function(d) { return d.value; });
        

    var svg = d3.select("body").select(".svg3")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
   
   d3.json("../decorator/total_maxchild.json", function(error, data) {    
         var dataset=[
            {"type":data[0].values[0].column,"value":data[0].values[0].value},
            {"type":data[0].values[1].column,"value":data[0].values[1].value},
            {"type":data[0].values[2].column,"value":data[0].values[2].value},
            {"type":data[0].values[3].column,"value":data[0].values[3].value},
            {"type":data[0].values[4].column,"value":data[0].values[4].value},
            {"type":data[0].values[5].column,"value":data[0].values[5].value},
            {"type":data[0].values[6].column,"value":data[0].values[6].value}
         ]
     var g = svg.selectAll("arc")
           .attr("class", "arc3")
           .data(pie(dataset))
           .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
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
         .delay(500);
     
    svg.append("text")
     .attr("text-anchor", "middle")
     .attr('font-size', '1em')
     .attr('y', 130)
     .text("어린이집 정원");
    
    svg.append("text")
    .attr('class','textmiddle')
     .attr("text-anchor", "middle")
     .attr('font-size', '2em')
     .attr('y', 15)
     .text(data[0].gu);
    
    d3.select(".svg3").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+":"+(d.data.value)+"명");
    });
         
    d3.select(".svg3").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
    
    var legend = d3.select('.legends').attr('width',570).attr('height',20).selectAll(".legend3")
     .data(dataset.map(function(d) { return d.type; }).reverse())
    .enter().append("g")
     .attr("class", "legend3")
     .attr("transform", function(d,i) { return "translate("+(i*86+20)+",0 )"; })
     .style("opacity","1");

 legend.append("rect")
     .attr("x", 16)
     .attr("y",8)
     .attr("width", 13)
     .attr("height", 13)
     .style("fill", function(d) { return color(d); });
 
 legend.append("text")
     .attr("x",-7)
     .attr("y", 14)
     .attr('font-size', '0.8em')
     .attr("dy", ".35em")
     .style("text-anchor", "middle")
     .text(function(d) {
        if(d=='사회복지법인') return '사회복지';
        else if(d=='법인·단체 등') return '법인단체';
        return d; });
         
     function type(d) {
      d.value = +d.value;
      return d;
    }      
   });
}
function loadPieGraph_now(){
    d3.selectAll(".svg2 > *").remove(); 
    var tooltip = d3.select(".tooltip2");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

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
         var dataset=[
            {"type":data[0].values[0].column,"value":data[0].values[0].value},
            {"type":data[0].values[1].column,"value":data[0].values[1].value},
            {"type":data[0].values[2].column,"value":data[0].values[2].value},
            {"type":data[0].values[3].column,"value":data[0].values[3].value},
            {"type":data[0].values[4].column,"value":data[0].values[4].value},
            {"type":data[0].values[5].column,"value":data[0].values[5].value},
            {"type":data[0].values[6].column,"value":data[0].values[6].value}
         ]
     var g = svg.selectAll("arc")
            .attr("class", "arc2")
            .data(pie(dataset))
            .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
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
         .delay(500);

     svg.append("text")
      .attr("text-anchor", "middle")
      .attr('font-size', '1em')
      .attr('y', 130)
      .text("어린이집 현원");
     
     svg.append("text")
         .attr('class','textmiddle')
        .attr("text-anchor", "middle")
        .attr('font-size', '2em')
        .attr('y', 15)
        .text(data[0].gu);
          
    d3.select(".svg2").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+":"+(d.data.value)+"명");
    });
         
    d3.select(".svg2").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
     function type(d) {
      d.value = +d.value;
      return d;
    } 
              
   });   
}
</script>

<script>
//첫번재 차트(클릭시)
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
      NowChildPieChart(data.daycare.gu); 
      MaxChildPieChart(data.daycare.gu); 
      d3.selectAll(".svg1 > *").remove(); 
      if(dataset.length == 1){
         dataset.push(
               {"name":data.daycare.name,
                   "values":[
                        {"value":data.daycare.teachercnt,"column":"교사 수"},
                        {"value":data.daycare.maxchild,"column":"정원"},
                        {"value":data.daycare.nowchild,"column":"현원"},
                        {"value":data.daycare.child_per_teacher,"column":"교사 당 원아 수"}
                       ]
                  });   
      }else{
         dataset.pop(); 
         dataset.push(
            {"name":data.daycare.name,
                "values":[
                     {"value":data.daycare.teachercnt,"column":"교사 수"},
                     {"value":data.daycare.maxchild,"column":"정원"},
                     {"value":data.daycare.nowchild,"column":"현원"},
                     {"value":data.daycare.child_per_teacher,"column":"교사 당 원아 수"}
                    ]
               });   
      }
      var margin = {top: 20, right: 20, bottom: 30, left: 30},
          width = 540 - margin.left - margin.right,
          height = 470 - margin.top - margin.bottom;
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
        
         // data 주는 부분   
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
            .text("인원 수");

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
            .on("mousemove", function(d) {  //마우스 오버 이벤트 시 해당 범례의 수 조회.
                 divTooltip.style("left", d3.event.pageX + 10 + "px")
                   divTooltip.style("top", d3.event.pageY - 25 + "px")
                   divTooltip.style("display", "inline-block")
                   divTooltip.style("opacity", "0.9")
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

        //범례
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
      }});
   
}
//추가 pie chart (2017 구별 종합 현원 수)
function NowChildPieChart(guname){//guname이 실려있음
    d3.selectAll(".svg2 > *").remove(); 
    var tooltip = d3.select(".tooltip2");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

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
    for (var i=1; i<data.length;i++){
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
            .attr("class", "arc2")
            .data(pie(dataset))
            .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
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
         .delay(500);

     svg.append("text")
      .attr("text-anchor", "middle")
      .attr('font-size', '1em')
      .attr('y', 130)
      .text("어린이집 현원");
     
     svg.append("text")
         .attr('class','textmiddle')
        .attr("text-anchor", "middle")
        .attr('font-size', '2em')
        .attr('y', 15)
        .text(data[i].gu);
          
    d3.select(".svg2").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+":"+(d.data.value)+"명");
    });
         
    d3.select(".svg2").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
    
     

     function type(d) {
      d.value = +d.value;
      return d;
    } 
          
          }
       }             
   });   
}
//추가 pie chart (2017 구별 종합 현원 수)
function MaxChildPieChart(guname){//guname이 실려있음
    d3.selectAll(".svg3 > *").remove(); 
    var tooltip = d3.select(".tooltip3");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(1.1*Math.PI)
        .endAngle(3.1*Math.PI)
        .value(function(d) { return d.value; });
        

    var svg = d3.select("body").select(".svg3")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
   
   d3.json("../decorator/total_maxchild.json", function(error, data) {
    for (var i=1; i<data.length;i++){
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
           .attr("class", "arc3")
           .data(pie(dataset))
           .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
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
         .delay(500);
     
    svg.append("text")
     .attr("text-anchor", "middle")
     .attr('font-size', '1em')
     .attr('y', 130)
     .text("어린이집 정원");
    
    svg.append("text")
    .attr('class','textmiddle')
     .attr("text-anchor", "middle")
     .attr('font-size', '2em')
     .attr('y', 15)
     .text(data[i].gu);
    
    d3.select(".svg3").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+":"+(d.data.value)+"명");
    });
         
    d3.select(".svg3").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
    
    var legend = d3.select('.legends').attr('width',570).attr('height',20).selectAll(".legend3")
     .data(dataset.map(function(d) { return d.type; }).reverse())
    .enter().append("g")
     .attr("class", "legend3")
     .attr("transform", function(d,i) { return "translate("+(i*86+20)+",0 )"; })
     .style("opacity","1");

 legend.append("rect")
     .attr("x", 16)
     .attr("y",8)
     .attr("width", 13)
     .attr("height", 13)
     .style("fill", function(d) { return color(d); });
 
 legend.append("text")
     .attr("x",-7)
     .attr("y", 14)
     .attr('font-size', '0.8em')
     .attr("dy", ".35em")
     .style("text-anchor", "middle")
     .text(function(d) {
        if(d=='사회복지법인') return '사회복지';
        else if(d=='법인·단체 등') return '법인단체';
        return d; });
         
     function type(d) {
      d.value = +d.value;
      return d;
    } 
          
       }
    }        
        
   });
   
}
//해당 어린이집에 대한 최신순 후기게시판 출력
function review(code){
   $.ajax({
      url : "reviews.child",
      type : "post",
      data : {"code" : code, "bType":2},
      success : function(data) {
         $('#reviews').html(data);
      }});
}
</script>
<script type="text/javascript">//단어 검색
$('#wordsearchs').click(function(){
	$.ajax({
        url : "search.child",
        type : "post",
        data : {"word" : $('#word').val()},
        dataType : "json",
        success : function(data){
           hideMarkers();
           for (var i = 0; i < data.daycarelist.length; i++) {
              var Map = map;
              var coords = new daum.maps.LatLng(
                       data.daycarelist[i].lat,data.daycarelist[i].lon      
                       );
                 
              var marker = new daum.maps.Marker({
                  map:Map,
                  position:coords,
                  image : markerImage
               });
               marker.setMap(map);
               var content = '<div class="labelWish" style="border-radius:5px; width:450px;">';
               content += '<div style="text-align:center; margin-top:15px;";>['+data.daycarelist[i].type+']<strong>'+data.daycarelist[i].name+'</strong>';
               if(data.daycarelist[i].bus == '운영'){
                   content += '&nbsp;&nbsp;<img src="../decorator/bus2.png" style="width:22px; height:22px; margin-top:-4px;"></div>';   
                   }
               content += '<div style="margin-top:8px; margin-left: 15px; margin-right:15px;text-align:left; text-overflow: ellipsis;">전화번호: '+data.daycarelist[i].tel+'</div>';
               content += '<div style="margin-top:8px; margin-left: 15px;margin-right:15px; text-align:left; text-overflow: ellipsis;overflow:hidden;white-space:nowrap;" title="'+data.daycarelist[i].addr+'">주소:'+data.daycarelist[i].addr+'</div>';
               content += '<div style="margin-top:8px;"><button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+data.daycarelist[i].code+')">차트 보기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+data.daycarelist[i].code+')">후기</button></div><br><div>';
              var infowindow = new daum.maps.InfoWindow({
                     position : coords, 
                     content : content,
                     removable:true
                 }); 
              infos.push(infowindow);
              markers.push(marker);
                map.setCenter(coords);    
                 // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                 // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다                
                 (function(marker, infowindow, codes,is) { 
                     // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
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
           
           // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
           function makeOutListener(infowindow) {
               return function() {
                   infowindow.close();
               };
           }
        }
     })  
})
</script>
</body>
</html>