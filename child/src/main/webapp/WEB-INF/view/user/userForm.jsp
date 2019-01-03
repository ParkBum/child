<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<style type="text/css">
.joinForm {
	border-radius: 5px;
	margin: 10% auto;
	width: 30%;
	background-color: #f2f2f2;
	text-align: center;
}

.inner {
	display:
}

.inin {
	margin: 10px 0;
}

input[type=text], input[type=password] {
	text-align: center;
	padding: 10px;
	margin: 8px;
	width : 90%;
	border-radius: 4px;
}

input[type=submit], input[type=reset] {
	background-color: #666666;
	color: white; 
	padding: 10px;
	margin: 8px;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit] :hover, input[type=reset]:hover {
	background-color: #333333; 
}
</style>
</head>
<body>
	<div class="joinForm">
		<form:form modelAttribute="user" method="post"
			action="userEntry.child">
			<h2>����� ���</h2>
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}"
						var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<%-- 	<table>
		<tr height="40px">
<!-- 			<td>�̸���</td> -->
			<td><form:input path="email" placeholder="���̵� �Է��ϼ���(e-mail ����)"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<tr height="40px">
			<td>������ȣ</td>
			<td><form:input path="email"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<tr height="40px">
			<td>��й�ȣ</td>
			<td><form:password path="password"/>
			<font color="red"><form:errors path="password"/></font></td>
		</tr>
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
		</td></tr></table> --%>
			<div class="inin">
				<form:input path="email" placeholder="���̵� �Է��ϼ���(e-mail ����)" />
				<font color="red"><form:errors path="email" /></font>
			</div>
			<div class="inin">
			<button style="background-color:#33CC99; width:90%; border-radius: 10px;" onclick="javascript:alert('�����ȵ�')">������ȣ ����</button>
			</div>
			<div class="inin" style="display: inline-block; width:100%;">
			
				<form:input path="email" placeholder="������ȣ�� �Է��ϼ���"/>
				<font color="red"><form:errors path="email" /></font>
			    <button style="background-color:#33CC99; width:90%; border-radius: 10px;" onclick="javascript:alert('�����ȵ�')">������ȣ Ȯ��</button>
			</div>
			<div class="inin">
				<form:password path="password" placeholder="��й�ȣ�� �Է��ϼ���" />
				<font color="red"><form:errors path="password" /></font>
			</div>
			<div class="inin">
				<form:password path="password" placeholder="��й�ȣ Ȯ��" />
				<font color="red"><form:errors path="password" /></font>
			</div>
			<div class="inin">
				<form:input path="nickname" placeholder="�г����� �Է��ϼ���" />
				<font color="red"><form:errors path="nickname" /></font>
			</div>
			<div class="inin">
				<input type="submit" value="����">
				<input type="reset" value="���ۼ�">
			</div>

		</form:form>
	</div>
</body>
</html>