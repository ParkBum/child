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
/* ��� �� */
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
/*�ϴ� footer */
.footer {
	z-index : 100;
	background-color: #006633 ;
	color: white;
	text-align: center;
	padding: 10px;
}

</style>
</head>
<body>
	<div class="top">
		<%-- <c:if test="${empty sessionScope.login}"> --%>
		<a href="${path}/main/main.child" style="float: left">
		<img src="../decorator/house.png" width="25px" height="25px"></a>
		<c:if test="${empty sessionScope.loginUser}">
		<a href="${path}/user/loginForm.child" style="float: right; height:100%">�α���</a>
		<a href="${path}/user/userForm.child" style="float: right">ȸ������</a>
		</c:if>
		<c:if test="${!empty sessionScope.loginUser}">
		<p style="float: left; margin-left:20px;">000 �� ȯ���մϴ�.</p>
		<a href="${path}/user/logout.child" style="float: right">�α׾ƿ�</a>
		<a href="${path}/map/map.child" style="float: right">���� �˻�</a>
		<a	href="${path}/board/list.child?bType=1" style="float: right">Ŀ�´�Ƽ</a>
		<a href="${path}/board/list.child?bType=3" style="float: right">�߰� ����</a>
		</c:if>
		<%-- 	</c:if>
 --%>
	</div>
	<div class="main">
		<decorator:body />
	</div>
	<hr>
	<div class="footer">
		<p class="foottext" >����� ��õ�� ���������2�� 115, 509ȣ, 811ȣ(���굿,
			�븢��ũ��Ÿ��3��)</p>
	</div>
</body>
</html>