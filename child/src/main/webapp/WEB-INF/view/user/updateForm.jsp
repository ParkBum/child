<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
</head>
<body>
<h2>����� ����</h2>
	<form:form modelAttribute="user" method="post" action="update.child?mnum=${sessionScope.loginUser.mnum}">
		<%--�Է����� ���� �����޼��� ���⼭ ����. --%>
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		
		<table>
			<tr height="40px">
				<td>�̸���</td>
				<td><form:input path="email" value="${sessionScope.loginUser.email}" readonly="true" /> <font color="red">
				<form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>�г���</td>
				<td><form:input path="nickname" value="${sessionScope.loginUser.nickname}" readonly="true"/> <font color="red">
				<form:errors path="nickname" /></font></td>
			</tr>
			<tr height="40px">
				<td>�� ��й�ȣ</td>
				<td><form:password path="password1" /> <font color="red">
				<form:errors path="password" /></font></td>
			</tr>
			<tr height="40px">
				<td>�� ��й�ȣ Ȯ��</td>
				<td><form:password path="password1" /> <font color="red">
				<form:errors path="password" /></font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="����">
					<input type="reset" value="�ʱ�ȭ"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>





