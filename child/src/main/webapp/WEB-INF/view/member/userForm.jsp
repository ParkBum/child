<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 등록</title>
</head>
<body>
<h2>사용자 등록</h2>
<form:form modelAttribute="user" method="post" action="userEntry.shop">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr height="40px">
			<td>이메일</td>
			<td><form:input path="email"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<tr height="40px">
			<td>비밀번호</td>
			<td><form:password path="password"/>
			<font color="red"><form:errors path="password"/></font></td>
		</tr>
		<tr height="40px">
			<td>닉네임</td>
			<td><form:input path="nickname"/>
			<font color="red"><form:errors path="nickname"/></font></td>
		</tr>
		<tr height="40px">
			<td>전화번호</td>
			<td><form:input path="phoneNo"/>
			<font color="red"><form:errors path="phoneNo"/></font></td>
		</tr>
		
		<tr height="40px">
		<td colspan="2" align="center">
		<input type="submit" value="등록">
		<input type="reset" value="초기화">
		</td></tr></table>
</form:form>
</body>
</html>