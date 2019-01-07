<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="decorator"	uri="http://www.opensymphony.com/sitemesh/decorator"%>
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
  color : white;
 /*  width: 90%;
  margin : 0 5%; */
  width:100%;
  height : 140px;
  background :  linear-gradient(to right, rgba(255, 255, 255, 0.5),  rgba(255, 255, 255, 0.5)),url("../decorator/child1.jpg"); 
  background-position: center;
  background-repeat: no-repeat;
}
.menu { margin: auto; padding: 0 auto; }
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
.menu .right:hover  { background: white; }
.menu .right:hover a { color: black; }
.menu ul a { color: black; }
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
.menu-bar .right:hover ul li {background: white;}			  
.menu-bar .right:hover ul li:hover {background : silver; opacity: 0.5;}			  

/* main */
.main {
	width : 1400px;
	margin: 0 auto;
	padding: 10px;
	height: 800px;
}
/*하단 footer */
.footer {
	text-align: center;
	color : black;
  	width: 80%;
  	margin : 0 10%;
 	 height : 80px;
}
.public {
	margin-top: 20px;
	width: 100%;
	height: 95px;
}
.card2 {
	background-position : center;
	background-size :cover;
	margin: 8px 0;
	width: 100%;
	height: 75px;
	text-align: center;
	
}
.image2 {
	display: inline-block;
	height: 66px;
	margin: 5px 2px;
	width: 24%;
	border:solid 2px silver;
	padding : 1px;
}
</style>
</head>
<body>
<%-- 원래 메뉴 --%>
 <div class='menu-bar'>
     <div style="/* border:solid 1px black; */ width:100%; height : 40px; background-color:#333333">
 		 <ul class="menu">
    <li class="left"><a href="${path}/main/main.child"><img src="../decorator/home-icon-silhouette.png" style="width:30px; height:25px;"></a></li>
    <c:if test="${empty sessionScope.loginUser}">
	<li class="right"><a href="${path}/user/loginForm.child">로그인</a></li>
	<li class="right"><a href="${path}/user/userForm.child">회원가입</a></li>
		</c:if>
	<c:if test="${!empty sessionScope.loginUser}">
	<li class="left"><p style="margin:10px;">${sessionScope.loginUser.nickname}님 환영합니다. 오늘도 좋은 하루 되세요</p></li>
	<li class="right"><a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}" style="float: right">
		<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">내 정보</c:if>
		<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">관리자 페이지</c:if>
		</a> </li>
	<li class="right"><a href="${path}/user/logout.child" style="float: right">로그아웃</a> </li>
	<li class="right"><a href="${path}/map/map.child" style="float: right">지도 검색</a></li>
	<li class="right"><a href="#" style="float: right">커뮤니티</a> 
		<ul>
			<li><a href="${path}/board/list.child?bType=1">자유게시판</a></li>
       	    <li><a href="${path}/board/list.child?bType=2">후기게시판</a></li>
		</ul>
	</li>
	<li class="right"><a href="${path}/board/list.child?bType=3" style="float: right">중고 장터</a></li>
	</c:if>
  </ul>
 </div>
 <div style="/* border:solid 1px black;  */width:100%; height : 100px;">

  </div>
 </div>

<div style="height:8px; width:100%; background-color: #999999 ; display: inline-block;"></div>
	<div class="main">
		<decorator:body />
	</div>
	<!-- <hr> -->
<div style="height:8px; width:100%; background-color: #999999 ; display: inline-block;"></div>
	<div class="footer">
		 	<div class="public">
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
	</div>
	<hr>
		<p class="foottext">서울시 금천구 가산디지털2로 115, 509호, 811호(가산동, 대륭테크노타운3차)</p>
	</div>
</body>
</html>