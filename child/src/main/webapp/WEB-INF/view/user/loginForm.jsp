<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<style type="text/css">
.loginForm {
	border-radius: 5px;
	margin: 18% auto;
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
		<form:form modelAttribute="user" method="post" action="login.child">
			<h2>�α���</h2>
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}"
						var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<%-- 		<table style="">
			<tr height="40px">
 				<td>�̸���</td> 
				<td><form:input path="email" placeholder="���̵�(e-mail)�� �Է��ϼ���"/><font color="red"> 
				<form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>��й�ȣ</td> 
				<td><form:password path="password" placeholder="��й�ȣ�� �Է��ϼ���"/> <font color="red">
						<form:errors path="password" />
				</font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="�α���"></td></tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="ȸ������" onclick="location.href='userEntry.child'"></td>
			</tr>
		</table> --%>
			<div class="inner">
				<div class="inin">
					<img src="../decorator/lock.png" width="50px" height="50px"
						style="padding: 3px;">
				</div>
				<div class="inin">
					<form:input path="email" placeholder="���̵�(e-mail)�� �Է��ϼ���"
						border="solid 1px black" />
					<font color="red"> <form:errors path="email" /></font>
				</div>
			</div>
			<div class="inner">
				<div class="inin">
					<img src="../decorator/keyhole.png" width="50px" height="50px"
						style="padding: 3px;">
				</div>
				<div class="inin">
					<form:password path="password" placeholder="��й�ȣ�� �Է��ϼ���"
						border="solid 1px black" />
					<font color="red"> <form:errors path="password" />
					</font>
				</div>
			</div>
			<div class="inner">
				<div class="inin">
					<input type="submit" value="�α���"> <input type="button"
						value="ȸ������" onclick="location.href='userEntry.child'">
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>