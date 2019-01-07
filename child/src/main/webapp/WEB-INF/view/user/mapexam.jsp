<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나따릉이 메인화면</title>
<style type="text/css">
#wrap{
   width: 1020px;
   margin: 0 auto;
}

#main_img_bar{
   width: :100%;
   height: 170px;
   background-color: rgba(0,0,0,0.25);
}
#main_img{
   width: 1020px;
   height: 170px;
   margin: 0 auto;
}

#container{
   width: 1020px;
   height: 1000px;
   background-color: navy;
}

#map_div{
   width: 600px;
   height: 550px;
   box-sizing:border-box;
   float: left;
}
#map_search{
   width: 600px;
   height: 50px;
   font-family: "Roboto", sans-serif;
}
#map{
   width: 600px;
   height: 500px;
}

#login_div{
   padding-top:30px;
   width: 420px;
   height: 550px;
   float: left;
   background-color: #BDEDC9;
   box-sizing: border-box;
}
#con2_title{
   margin-right:90px;
   width: 300px;
   height: 65px;
   line-height: 65px;
   font-size:26px;
   font-weight:800;
   font-family: "Nanum Gothic";
   border-bottom: 5px solid #0E7518;
}
</style>

</head>
<body>
<div id="main_img_bar">
   <div id="main_img">
      <img src="img/main_img.jpg" style="height: 170px;width: 1020px;">
   </div>
</div>

<div id="wrap">
<div id="container">

<div id="map_div">
   <div id="map_search">
      <select style="height: 50px;width: 180px; box-sizing: border-box;float: left;">
         <option>대여소 이름</option>
         <option>대여소 번호</option>
      </select>
      <input type="text" name="find" style="height: 50px;width: 420px; box-sizing: border-box; padding-left:10px; float: left;">
   </div>

   <div id="map"></div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f692a5cbdd7deb058db63ec9f3045a3"></script>
   <script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = { 
           center: new daum.maps.LatLng(37.477885, 126.878985), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };
   
   // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
   var map = new daum.maps.Map(mapContainer, mapOption); 
   
   //마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

   
   // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
   function makeOverListener(map, marker, infowindow) {
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
   
   var positions = new Array();
   
   window.onload = function() {
      for (var i = 0; i < positions.length; i ++) {
          // 마커를 생성합니다
          var marker = new daum.maps.Marker({
              map: map, // 마커를 표시할 지도
              position: positions[i].latlng // 마커의 위치
          });
      
          // 마커에 표시할 인포윈도우를 생성합니다 
          var infowindow = new daum.maps.InfoWindow({
              content: positions[i].content // 인포윈도우에 표시할 내용
          });
      
          // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
          // 이벤트 리스너로는 클로저를 만들어 등록합니다 
          // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
          daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
          daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
      }
   };
   
   </script>

</div><!-- map_div 닫음 -->

<!-- 비로그인시 로그인창 표시 , 로그인시 즐겨찾기 정보가 표시 -->
<div id="login_div">
   <div id="con2_title">
      로그인
      <c:forEach items="${stationList }" var="station">
      <script type="text/javascript">
         var content = {
               content: '<div>${station.name}</div>', 
                 latlng: new daum.maps.LatLng("${station.latitude}", "${station.longtitude}")
         }
         positions.push(content);
      </script>
      </c:forEach>
   </div>
   
   <input type="text" name="id" class="login_input" placeholder="ID를 입력해주세요">
</div><!-- login_div 닫음 -->

</div><!-- container 닫음 -->
</div><!-- wrap 닫음 -->
</body>
</html>