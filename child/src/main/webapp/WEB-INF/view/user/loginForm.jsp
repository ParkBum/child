<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<form:form modelAttribute="user" method="post" action="login.shop">
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		<h2>로그인</h2>
		<table>
			<tr height="40px">
				<td>이메일</td>
				<td><form:input path="email" /> <font color="red"> 
				<form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td><form:password path="password" /> <font color="red">
						<form:errors path="password" />
				</font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="로그인">
					<input type="button" value="회원가입"
					onclick="location.href='userEntry.shop'"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>