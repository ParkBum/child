<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js">
	
</script>
<style type="text/css">
html {
	overflow: auto;
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
}

body {

	/* max-width: 1200px; */
	font-family: 'Noto Sans KR', sans-serif;

}
/* 상단 바 */
<<<<<<< HEAD
.menu-bar {
  display: inline-block;
  color : black;
  width:100%;
  height : 180px;
=======
.menu-bar {
	height: 140px;
>>>>>>> refs/heads/master
}

.menu .left {
	/* float: left; */
	list-style: none;
}

.menu .right {
	/* float: right; */
	list-style: none;
	margin: 40px 0px 10px 0px;
}

.menu a {
	background-color: #F6A5BC;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
}

.menu .right:hover a {
	background-color: #CE5B7C;
}

.menu .right:hover a {
	color: white;
}

.menu ul a {
	color: white;
}

/* main */
.main {

/*    margin-bottom: 5%;
   padding: 10px;
   margin-bottom: 10%;
   padding: 10px;
   height: 1000px;
   align: center;
 */


	padding-bottom: 60px;
	align: center;
	width: 100%;
	height: 100%;

}
/*하단 footer */
.footer {
	color: black;
	margin: 10px auto 30px auto;
	height: 80px;
	width: 550px; 
	text-align: left;
}

.menu:after {
	content: "";
	display: block;
	clear: both;
}

.menu li {
	display: inline-block;
}

.menu {
	width: 1300px;
	margin: 0 auto;
	padding-top: 20px;
}

.nav {
	padding-left: 400px;
}

.card2 {

   background-position : center;
   background-size :cover;
   width: 100%;
   height: 75px;
   text-align: center;
   

}
.image2 {

	background-color: white;
	display: inline-block;
	height: 46px;
	margin: 5px 2px;
	width: 14%;
	border:solid 2px silver;
	padding : 1px;
	margin : 10px 10px 0px 10px;

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
      <c:if test="${!empty sessionScope.loginUser}"><li class="right" style="margin-right:50px;"><a href="${path}/user/logout.child" style="border-radius: 0 20px 20px 0;">로그아웃</a></li></c:if>
      <c:if test="${!empty sessionScope.loginUser}"><li class="right">
         <c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
         <a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}">회원정보</a></c:if>
         <c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
         <a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}">회원관리</a></c:if></li></c:if>
      <c:if test="${empty sessionScope.loginUser}"><li class="right" style="margin-right:50px;">
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

	<div>
		<%-- <div style="text-align:right;">
		<c:if test="${!empty sessionScope.loginUser}">
			<font size="2" style="margin: 30px 300px 0 0;">${sessionScope.loginUser.nickname}님 환영합니다.</font>
		</c:if>
		</div> --%>
		<div class='menu-bar'>
			<div style="height: 40px;">
				<ul class="menu">
					<li class="left"><a href="${path}/main/main2.child"
						style="background-color: white;"><img src="../decorator/logo.png" 
															style="width: 130px; height: 100px; margin: 0 0 4px 20px;"></a></li>
					<li class="right nav"><a href="${path}/map/map.child" style="border-radius: 20px 0 0 20px;">어린이집 검색</a></li>
					<li class="right"><a href="${path}/board/list.child?bType=1" style="margin-left: -4px;">커뮤니티</a>
					<li class="right"><a href="${path}/board/list.child?bType=3">중고장터</a></li>
				<c:if test="${empty sessionScope.loginUser}">
					<li class="right"><a href="${path}/user/userForm.child" style="margin-left: -4px;">회원가입</a></li>
				</c:if>
				<c:if test="${empty sessionScope.loginUser}">
					<li class="right" style="margin-right: 50px;"><a href="${path}/user/loginForm.child"
							style="border-radius: 0 20px 20px 0; margin-left: -4px;">로그인</a></li>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<li class="right"><c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
						<a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}" style="margin-left: -4px;">회원정보</a>
						</c:if><c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
						<a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}" style="margin-left: -4px;">회원관리</a>
						</c:if></li>
					<c:if test="${!empty sessionScope.loginUser}">
						<li class="right" style="margin-right: 50px;"><a href="${path}/user/logout.child"
							style="border-radius: 0 20px 20px 0; margin-left: -4px;">로그아웃</a></li>
					</c:if>
				</c:if>
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
	<div class="card2" style="background-color: #F6A5BC;">
         <div class="image2">
            <a class="main-b" href="https://www.seoulchildrensmuseum.org/"><img src="https://www.seoulchildrensmuseum.org/z00_images/common/logo.png" width="100%"
               height="40px"></a>
         </div>
         <div class="image2">
            <a class="main-b" href="http://seoul.childcare.go.kr/ccef/main.jsp"><img src="http://seoul.childcare.go.kr/images/ccef/common/logo_seoul.gif" width="100%"
               height="40px"></a>
         </div>
         <div class="image2">
            <a class="main-b" href="http://www.childcare.go.kr"><img src="http://www.childcare.go.kr/images/cpin/common/h1_logo_s.gif" width="100%"
               height="40px"></a>
         </div>
         <div class="image2">
            <a class="main-b" href="http://www.korea1391.go.kr/new/"><img src="http://korea1391.go.kr/new/theme/custom/images/common/logo_big.jpg" width="100%"
               height="40px"></a>
         </div>
   	</div>


		<div class="main">
			<decorator:body />
		</div>
		
		<hr>
		<div class="footer" align="center">
			<img src="../decorator/logo1.png"
				style="width: 55px; height: 70px; float: left; margin-top: 5px"> <br>어린이 집마련 프로젝트팀<br>
			서울시 금천구 가산디지털2로 115, 509호, 811호(가산동, 대륭테크노타운3차)
		</div>
	</div>

</body>
</html>