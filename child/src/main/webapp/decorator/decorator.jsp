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
* {
	text-align:center;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	max-width: 1500px;
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}
/* 상단 바 */
.top {
	overflow : hidden;
	background-color: white;
}
.top a{
	display: block;
	color: black;
	text-align: center;
	text-decoration: none;
	padding : 10px;
}

.top a:hover {
	background-color: #ddd;
	padding: 10px;
}
/* main */
.main {
background-color: white;
padding : 10px;
height :800px;
}
/*하단 footer */
.footer {
	background-color: #ddd;
	color : black;
	text-align: center;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="top">
	<%-- <c:if test="${empty sessionScope.login}"> --%>
		<a href="${path}/main/main.child" style="float:left"><img src= "../decorator/house.png" width="30px" height="30px"></a>
		<a href="${path}/user/loginForm.child" style="float:right">로그인</a>
		<a href="${path}/user/userForm.child" style="float:right">회원가입</a>
		<a href="${path}/board/list.child?bType=1" style="float:right">자유 게시판</a>
		<a href="${path}/board/list.child?bType=2" style="float:right">후기 게시판</a>
<%-- 	</c:if>
 --%>	</div>
	<div class="main">
		<decorator:body />
	</div>
	<hr>
	<div class="footer">
		<p class="foottext">서울시 금천구 가산디지털2로 115, 509호, 811호(가산동, 대륭테크노타운3차)</p>
	</div>
</body>
</html>