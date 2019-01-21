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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500,700&amp;subset=korean" rel="stylesheet">
<style type="text/css">
#formform{
	border: 1.5px #F6A5BC solid;
	border-radius: 10px;
	padding: 10px;
}

.loginForm {
	margin: 5% auto;
	width: 25%;
	text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
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

input[type=button] {
	padding: 10px;
	maring: 8px 0;
	border-radius: 4px;
	cursor: pointer;
	background-color: white;
	width: 100%;
}

input[type=submit]:hover{ 
	background-color: white;
	color:pink;
}
input[type=submit]{
  background:pink;
  margin: 8px 0;
  padding: 10px;
  margin-top: 10px;
  color:#fff;
  border:none;
  position:relative;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  width: 210.667px;
}
.Row {
  margin-bottom: 6px;
}
.Row.horizontalRow {
  position: relative;
  margin-bottom: 18px;
  margin-top: 17px;
}
.Row.horizontalRow .horizontalText {
  width: 100%;
  text-align: center;
  background-color: #ffffff;
  position: relative;
  color: #ababab;
  font-size: 14px;
  z-index: 1;
  overflow: hidden;
}
.Row.horizontalRow .horizontalText:before,
.Row.horizontalRow .horizontalText:after {
  width: 50%;
  top: 51%;
  overflow: hidden;
  height: 1px;
  background-color: #d0d0d0;
  content: '\a0';
  position: absolute;
}
.Row.horizontalRow .horizontalText:before {
  margin-left: -52%;
  text-align: right;
}
ul{
list-style:none;
padding-left:0px;
}

</style>
</head>
<body>
	<div class="loginForm">
		<form:form modelAttribute="login" method="post" action="login.child">
		<div align="center">
		<div id="formform" >
			
			<h2 style="font-family:'Sunflower', sans-serif;">Sign in</h2>
			<spring:hasBindErrors name="login">
				<font color="red">
				 <c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<div class="inner">
				<div class="inin">
					<!-- <img src="../decorator/lock.png" width="50px" height="50px"
						style="padding: 3px;"> -->
				</div>
				<div class="inin">
				<input type="hidden" value="${result}">
					<form:input path="login_email" placeholder="아이디(e-mail)" border="solid 1px black" />
					<br><font color="red"> <form:errors path="login_email" /></font>
				</div>
			</div>
			<div class="inner">
				<div class="inin">
					<!-- <img src="../decorator/keyhole.png" width="50px" height="50px"
						style="padding: 3px;"> -->
				</div>
				<div class="inin">
					<form:password path="login_password" placeholder="비밀번호"	border="solid 1px black" />
					<br>
					<font color="red"> <form:errors path="login_password" /></font>
				</div>
				<div class="inin">
				<input type="submit" value="로그인" >
				</div>
				<ul>
			<li class="Row horizontalRow">
              <div class="horizontalText">또는</div>
              <div class="horizontalLine"></div>
            </li>
            </ul>
				<a href="${url}"><img src="../decorator/naverlogin.png" width="100%" height="100%" style="padding: 3px; width: 210px;"></a>
				<br>
				<br>
			</div>
		</div><!-- 로그인 명시 위에 부분 -->
		</div>
			<div class="inner">
			<br>
					<a href="userForm.child" style="text-decoration:none; color: gray;">회원가입</a>
			</div>
		</form:form>
	</div>
</body>
</html>