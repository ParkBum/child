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
<style type="text/css">
html {
	background-image: url("../decorator/field.jpg");
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
	z-index : 100;
	vertical-align: middle;
	background-color: #ddd;
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
	background-color: #ddd;
	color: black;
	text-align: center;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="top">
		<%-- <c:if test="${empty sessionScope.login}"> --%>
		<a href="${path}/main/main.child" style="float: left"><img
			src="../decorator/house.png" width="25px" height="25px"></a>
		<p style="float: left">000 님 환영합니다.</p>
		<a href="${path}/user/loginForm.child" style="float: right; height:100%">로그인</a> <a
			href="${path}/user/userForm.child" style="float: right">회원가입</a> <a
			href="${path}/board/list.child?bType=1" style="float: right">자유
			게시판</a> <a href="${path}/board/list.child?bType=2" style="float: right">후기
			게시판</a>
		<%-- 	</c:if>
 --%>
	</div>
	<div class="main">
		<decorator:body />
	</div>
	<hr>
	<div class="footer">
		<p class="foottext">서울시 금천구 가산디지털2로 115, 509호, 811호(가산동,
			대륭테크노타운3차)</p>
	</div>
</body>
</html>