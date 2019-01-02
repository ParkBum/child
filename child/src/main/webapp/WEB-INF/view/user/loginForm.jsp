<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<style type="text/css">
div {
border-radius :5px;
margin:0 auto;
background-color: #f2f2f2;
}
form {

}
input[type=text], input[type=password] {
	padding : 10px;
	maring : 8px 0;
	border-radius: 4px;
}
input[type=submit],input[type=button] {
	background-color: #4CAF50;
	color : white;
	width:100%;
	padding : 10px;
	maring : 8px 0;
	border-radius: 4px;
	cursor : pointer;
}
input[type=submit]:hover,input[type=button]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
<div>
<form:form modelAttribute="user" method="post" action="login.child">
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>	
		<h2>로그인</h2>
		<table>
			<tr height="40px">
<!-- 				<td>이메일</td> -->
				<td><form:input path="email" placeholder="아이디(e-mail)을 입력하세요"/> <font color="red"> 
				<form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
<!-- 				<td>비밀번호</td> -->
				<td><form:password path="password" placeholder="비밀번호를 입력하세요"/> <font color="red">
						<form:errors path="password" />
				</font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="로그인"></td></tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="button" value="회원가입" onclick="location.href='userEntry.child'"></td>
			</tr>
		</table>
	</form:form>
</div>
</body>
</html>