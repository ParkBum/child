<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="decorator"   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js">
</script>
<style type="text/css">
html {
   background-position : center;
   background-size: cover;
   font-family: 'Noto Sans KR', sans-serif;
}

* {
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

body {
   /* max-width: 1200px; */
   display :block;
   margin: 0 auto;
   font-family: 'Noto Sans KR', sans-serif;
}
/* 상단 바 */
.menu-bar {

  display: inline-block;
  color : black;
 /*  width: 90%;
  margin : 0 5%; */
  width:100%;
  height : 140px;
}
.menu { padding: 0 auto; }
.menu .left {
  float:left;
  list-style:none;
  position: relative;
  margin : auto ;
}
.menu .right {
  float:right;
  list-style:none;
  position: relative;
  margin : auto 0;
}
.menu a {
  background-color: #F6A5BC;
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.menu ul {
  background: #eee;
  border: 1px solid silver;
  display: block;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
}

.menu ul li { list-style:none; float: none; z-index: 300;}
.menu .right:hover a { background-color: #CE5B7C; }
.menu .right:hover a { color: white; }
.menu ul a { color: white; }
.menu ul ul { left: 100%; top: 0; }
.menu ul ul li {float:left; margin-right:10px;}

.menu-bar .right ul {
background: rgb(109,109,109);
display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}
.menu-bar .right:hover ul { display:block;}
.menu-bar .right:hover ul li {background-color: #FAACC4;}
.menu-bar .right:hover ul li:hover {background-color: #CE5B7C;} 
     
/* main */
.main {
   margin-bottom: 5%;
   padding: 10px;
   align: center;
   width:100%;
   height:100%;
}
/*하단 footer */
.footer {
   text-align: center;
   color : black;
   width: 100%;
   margin : 0 auto;
   height : 80px;
}
</style>
</head>
<body>
<%-- 원래 메뉴 --%>
 <c:if test="${!empty sessionScope.loginUser}">
   <font size="2" style="float:right; margin:3px 300px 0 0;">${sessionScope.loginUser.nickname}님 환영합니다.</font>
 </c:if>
 <div class='menu-bar'>
    <div style="width:100%; height:40px;">
      <ul class="menu" style="margin:0px 300px 10px 200px;">
      <li class="left">
         <a href="${path}/main/main2.child" style="background-color:white;"><img src="../decorator/logo.png" 
                           style="width:130px; height:100px; margin: 0 0 3% 15%;"></a></li>
      <c:if test="${!empty sessionScope.loginUser}"><li class="right"><a href="${path}/user/logout.child" style="border-radius: 0 20px 20px 0;">로그아웃</a></li></c:if>
      <c:if test="${!empty sessionScope.loginUser}"><li class="right">
         <c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
         <a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}">회원정보</a></c:if>
         <c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
         <a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}">회원관리</a></c:if></li></c:if>
      <c:if test="${empty sessionScope.loginUser}"><li class="right">
                        <a href="${path}/user/loginForm.child" style="border-radius: 0 20px 20px 0;">로그인</a></li></c:if>
      <c:if test="${empty sessionScope.loginUser}"><li class="right">
                        <a href="${path}/user/userForm.child">회원가입</a></li></c:if>
      <li class="right"><a href="${path}/board/list.child?bType=3">중고장터</a></li>
      <li class="right"><a href="${path}/board/list.child?bType=1">커뮤니티</a> 
      <ul>
         <li><a href="${path}/board/list.child?bType=1">자유게시판</a></li>
         <li><a href="${path}/board/list.child?bType=2">후기게시판</a></li>
      </ul>
      </li>
      <li class="right"><a href="${path}/map/map.child" style="border-radius: 20px 0 0 20px;">어린이집 검색</a></li>
     </ul>
    </div>
 </div>

<!-- <div style="height:8px; width:100%; background-color: #999999 ; display: inline-block;"></div> -->
   <div class="main">
      <decorator:body />
   </div>
   <!-- <hr> -->
<!-- <div style="height:8px; width:100%; background-color: #FFCC52 ; display: inline-block;"></div> -->
	<hr>
	<div class="footer" align="center" style="width:550px; text-align:left">
		<img src="../decorator/logo1.png" style="width:50px; height:45px; float:left;">
		어린이 집마련 프로젝트팀<br>
		서울시 금천구 가산디지털2로 115, 509호, 811호(가산동, 대륭테크노타운3차)
	</div>
</body>
</html>