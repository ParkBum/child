<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ŷ� ��û ���</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
.wrap {
	clear: both;
	width: 1200px;
	margin-left: 350px;
}

th, td {
	text-align: center !important;
}
</style>
</head>
<body>
	<div class="wrap">
	<h2>�ŷ� ��û ���</h2>
		<font size="2">�ŷ� �����ÿ��� ��û ȸ�� ������ ����ó�� ���̸�, �ŷ��Ϸ� �Ŀ��� ����ó�� �ڵ� �����˴ϴ�.</font><br>
		<font size="2">�ŷ� ���� �� 7���� ���� �ŷ��� �Ϸ�� �ڵ� ��ȯ�˴ϴ�.</font>
		<table border="1" style="border-collapse: collapse;" class="w3-table w3-border w3-bordered">
			<tr>
				<th width="10%">�ŷ� ����</th>
				<th width="50%">�ش� �Խñ�</th>
				<th width="20%">��û ȸ�� ����</th> <!-- ����ó ���⿡ ���� -->
				<th width="20%">���� ����</th>
			</tr>
			<c:forEach items="${messageList}" var="msg">
			<tr>
				<td>
				<c:choose>
				<c:when test="${msg.deal == 1}">
					<font color="blue">�ŷ���</font>
				</c:when>
				<c:when test="${msg.deal == 2}">
					<font>�ŷ� �Ϸ�</font>
				</c:when>
				<c:when test="${msg.deal == 3}">
					<font>�ŷ� ����</font>
				</c:when>
				<c:otherwise>
					<font color="red">�����</font>
				</c:otherwise>
				</c:choose>
				</td>
				<td style="text-align: left  !important; padding-left:20px; padding-right:20px;">
				<c:if test="${msg.board.mkinds == 1}">[�ϱ�]</c:if>
				<c:if test="${msg.board.mkinds == 2}">[����]</c:if>
				<c:if test="${msg.board.mkinds == 3}">[�Ƿ�]</c:if>
				<c:if test="${msg.board.mkinds == 4}">[��Ÿ]</c:if>				
				${msg.board.subject}</td>
				<td>${msg.user.nickname}&nbsp;<c:if test="${msg.deal == 1}"><i class="material-icons" style="vertical-align: middle; font-size: 18px; width:16px;">phone_iphone</i>${msg.phone}</c:if></td>
				<td><input type="button" value="����" id="yes">&nbsp;<input type="button" value="����" id="no"></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>