<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<style type="text/css">
div,form {
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

input[type=submit],input[type=reset] {
	background-color: #4CAF50;
	color : white;
	padding : 10px;
	maring : 8px 0;
	border-radius: 4px;
	cursor : pointer;
}
input[type=submit] :hover {
	background-color: #45a049;
}
</style>
</head>
<body>
<h2>����� ���</h2>
<div>
<form:form modelAttribute="user" method="post" action="userEntry.child">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr height="40px">
<!-- 			<td>�̸���</td> -->
			<td><form:input path="email" placeholder="���̵� �Է��ϼ���(e-mail ����)"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<%-- <tr height="40px">
			<td>������ȣ</td>
			<td><form:input path="email"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<tr height="40px">
			<td>��й�ȣ</td>
			<td><form:password path="password"/>
			<font color="red"><form:errors path="password"/></font></td>
		</tr> --%>
		<tr height="40px">
<!-- 			<td>��й�ȣ</td> -->
			<td><form:password path="password" placeholder="��й�ȣ�� �Է��ϼ���"/>
			<font color="red"><form:errors path="password"/></font></td>
		</tr>
		<tr height="40px">
<!-- 			<td>�г���</td> -->
			<td><form:input path="nickname" placeholder="�г����� �Է��ϼ���"/>
			<font color="red"><form:errors path="nickname"/></font></td>
		</tr>
		<tr height="40px">
		<td colspan="2" align="center">
		<input type="submit" value="����">
		<input type="reset" value="���ۼ�">
		</td></tr></table>
</form:form>
</div>
</body>
</html>