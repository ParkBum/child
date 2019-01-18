<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
.loginForm {
	border-radius: 5px;
	margin: 5% auto;
	width: 25%;
	background-color: #f2f2f2;
	text-align: center;
}

.inner {
	display: block;
}

.inin {
	margin: 10px 0;	
}

input[type=text], input[type=password] {
	padding: 10px;
	maring: 8px 0;
	border-radius: 4px;
}

input[type=submit], input[type=button] {
	background-color: #666666;
	color: white;
	width: 100%;
	padding: 10px;
	maring: 8px 0;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover, input[type=button]:hover {
	background-color: #333333;
}
</style>
</head>
<body>
	<div class="loginForm">
		<form:form modelAttribute="login" method="post" action="login.child">
			<h2>로그인</h2>
			<spring:hasBindErrors name="login">
				<font color="red"> <c:forEach items="${errors.globalErrors}"
						var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<div class="inner">
				<div class="inin">
					<img src="../decorator/lock.png" width="50px" height="50px"
						style="padding: 3px;">
				</div>
				<div class="inin">
				<input type="hidden" value="${result}">
					<form:input path="login_email" placeholder="아이디(e-mail)을 입력하세요" border="solid 1px black" />
					<br><font color="red"> <form:errors path="login_email" /></font>
				</div>
			</div>
			<div class="inner">
				<div class="inin">
					<img src="../decorator/keyhole.png" width="50px" height="50px"
						style="padding: 3px;">
				</div>
				<div class="inin">
					<form:password path="login_password" placeholder="비밀번호를 입력하세요"
						border="solid 1px black" />
					<font color="red"> <form:errors path="login_password" />
					</font>
				</div>
			</div>
			<div class="inner">
				<div class="inin">
					<input type="submit" value="로그인"> 
					<input type="button" value="회원가입" onclick="location.href='userForm.child'">
					<a href="${url}"><img src="../decorator/naverlogin.png" width="100%" height="100%" style="padding: 3px;"></a>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>