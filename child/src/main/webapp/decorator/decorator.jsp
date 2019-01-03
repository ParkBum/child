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
	text-align: center;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	max-width: 1200px;
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}
/* 상단 바 */
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

.zeta-menu-bar {
  background: hotpink;
  display: inline-block;
  width: 100%;
}
.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: white; }
.zeta-menu li:hover>a { color: hotpink; }
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
.top ul li { float: none; }
.top ul li:hover { background: #ddd; } 
.top ul li:hover a { color: black; }
.top ul a { color: black; }
.top ul ul { left: 100%; top: 0; }
.top ul ul li {float:left; margin-right:10px;}
</style>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
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
	    .append("<p style='float:right;margin:-3px'>&#9656;</p>");
	});
</script>
</head>
<body>
	<div class="top">
		<%-- <c:if test="${empty sessionScope.login}"> --%>
		<a href="${path}/main/main.child" style="float: left">
		<img src="../decorator/house.png" width="25px" height="25px"></a>
		<p style="float: left; margin-left:20px;">000 님 환영합니다.</p>
		<a href="${path}/user/loginForm.child" style="float: right; height:100%">로그인</a>
		<a href="${path}/user/userForm.child" style="float: right">회원가입</a>
		<a	href="${path}/board/list.child?bType=1" style="float: right">커뮤니티</a>
		<a href="${path}/board/list.child?bType=3" style="float: right">중고 장터</a>
		<%-- 	</c:if>
 --%>
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