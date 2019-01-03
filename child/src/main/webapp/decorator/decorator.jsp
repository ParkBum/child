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
<style type="text/css">
html {
	/* background-image: url("../decorator/field.jpg"); */
	background-position : center;
	background-size: cover;
}

* {
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	max-width: 1200px;
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}
/* 상단 바 1 */
.top {
	overflow: hidden;
}

.top a {
	display: block;
	vertical-align: middle;
	color: black;
	text-align: center;
	font-size : x-large;
	text-decoration: none;
	padding: 13px;
	color: black;
}

.top a:hover {
	vertical-align: middle;
	border-radius : 20px;
	padding: 13px;
}
/* 상단 바 2*/
.zeta-menu-bar {
  background: skyblue;
  display: inline-block;
  width: 100%;
}
.zeta-menu { margin: auto; padding: 0 auto; }
.zeta-menu li {
  float:left;
  list-style:none;
  position: relative;
  margin : auto 0;
}
.zeta-menu li:hover { background: white; }
.zeta-menu li:hover>a { color: skyblue; }
.zeta-menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
}
.zeta-menu ul li { float: none; z-index: 100;}
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
.zeta-menu ul ul li {float:left; margin-right:10px;}

/* main */
.main {
	z-index : 100;
	padding: 10px;
	height: 800px;
}
/*하단 footer */
.footer {
	z-index : 100;
	background-color: #006633 ;
	color: white;
	text-align: center;
	padding: 10px;
}

</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(function(){
  $(".zeta-menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
  $(".zeta-menu>li:has(ul)>a").each( function() {
    $(this).html( $(this).html()+' &or;' );
  });
  $(".zeta-menu ul li:has(ul)")
    .find("a:first")
    .append("<p style='margin:-3px'>&#9656;</p>");
});
</script>
</head>
<body>
	<div class="top">
		<a href="${path}/main/main.child" style="float: left">
		<img src="../decorator/house.png" width="25px" height="25px"></a>
		<c:if test="${empty sessionScope.loginUser}">
		<a href="${path}/user/loginForm.child" style="float: right; height:100%">로그인</a>
		<a href="${path}/user/userForm.child" style="float: right">회원가입</a>
		</c:if>
		<c:if test="${!empty sessionScope.loginUser}">
		<p style="float: left; margin-left:20px;">000 님 환영합니다.</p>
		<a href="${path}/user/logout.child" style="float: right">로그아웃</a>
		<a href="${path}/map/map.child" style="float: right">지도 검색</a>
		<a	href="${path}/board/list.child?bType=1" style="float: right">커뮤니티</a>
		<a href="${path}/board/list.child?bType=3" style="float: right">중고 장터</a>
		</c:if>
	</div>
	<div class='zeta-menu-bar'>
  <ul class="zeta-menu">
    <li><a href="${path}/main/main.child"><img src="../decorator/house.png" width="25px" height="25px"></a></li>
    <c:if test="${empty sessionScope.loginUser}">
	<li><a href="${path}/user/loginForm.child" style="float: right; height:100%">로그인</a></li>
	<li><a href="${path}/user/userForm.child" style="float: right">회원가입</a></li>
		</c:if>
	<c:if test="${!empty sessionScope.loginUser}">
	<li><p style="float: left; margin-left:20px;">000 님 환영합니다.</p></li>
	<c:if test="${sessionScope.loginUser.email == 'admin' }">
	<li><a href="${path}/admin/list.child" style="float: right">관리자페이지</a> </li>
	</c:if>
	<li><a href="${path}/user/logout.child" style="float: right">로그아웃</a> </li>
	<li><a href="${path}/map/map.child" style="float: right">지도 검색</a></li>
	<li><a	href="#" style="float: right">커뮤니티</a> 
		<ul>
			<li><a href="${path}/board/list.child?bType=1">자유게시판</a></li>
       	    <li><a href="${path}/board/list.child?bType=2">후기게시판</a>
		</ul>
	</li>
	<li><a href="${path}/board/list.child?bType=3" style="float: right">중고 장터</a></li>
		</c:if>
  </ul>
</div>
	<div class="main">
		<decorator:body />
	</div>
	<hr>
	<div class="footer">
		<p class="foottext" >서울시 금천구 가산디지털2로 115, 509호, 811호(가산동,
			대륭테크노타운3차)</p>
	</div>
</body>
</html>