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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style type="text/css">
.wrap {
	clear: both;
	width: 1200px;
	margin-left: 353px;
	margin-right: 353px;
}

th, td {
	text-align: center !important;
	vertical-align: middle !important;
	height: 40px;
}

a {
	text-decoration: none;
}
</style>
<script>
$(document).ready(function() {
});
</script>
</head>
<body>
	<div class="wrap">
	<h2>�ŷ� ��û ���</h2>
		<font size="2">�ŷ� �����ÿ��� ��û ȸ�� ������ ����ó�� ǥ��Ǹ�, �ŷ��Ϸ� �Ŀ��� ����ó�� ǥ������ʽ��ϴ�.</font><br>
		<font size="2">�ŷ� ���� �� 7���� ���� �ŷ��� �Ϸ�� �ڵ� ��ȯ�˴ϴ�.</font>
		<table border="1" class="w3-table w3-border w3-bordered" style="border-collapse: collapse;w">
			<tr>
				<th width="10%" style="padding-left:8px;">�ŷ���ȣ</th>
				<th width="10%">�ŷ� ����</th>
				<th width="40%">�ش� �Խñ�</th>
				<th width="20%">��û ȸ�� ����</th> <!-- ����ó ���⿡ ���� -->
				<th width="20%">���� ����</th>
			</tr>
			<c:forEach items="${messageList}" var="msg">
			<tr>
				<td style="padding-left:8px;"><fmt:formatNumber value="${msg.bnum}" pattern="000-" /><fmt:formatNumber value="${msg.msgnum}" pattern="000" /></td>
				<td>
				<c:choose>
				<c:when test="${msg.deal == 1}">
					<font color="blue">�ŷ���</font>
				</c:when>
				<c:when test="${msg.deal == 2}">
					<font>�ŷ� �Ϸ�</font>
				</c:when>
				<c:when test="${msg.deal == 3}">
					<font>�ŷ� ���</font>
				</c:when>
				<c:otherwise>
					<font color="red">�����</font>
				</c:otherwise>
				</c:choose>
				</td>
				<td style="text-align: left  !important; padding-left:20px; padding-right:20px;">
				<a href="../board/info.child?bnum=${msg.bnum}">
				<c:if test="${msg.board.mkinds == 1}">[�ϱ�]</c:if>
				<c:if test="${msg.board.mkinds == 2}">[����]</c:if>
				<c:if test="${msg.board.mkinds == 3}">[�Ƿ�]</c:if>
				<c:if test="${msg.board.mkinds == 4}">[��Ÿ]</c:if>	
				${msg.board.subject}</a></td>
				<td>${msg.user.nickname}&nbsp;&nbsp;<c:if test="${msg.deal == 1}"><i class="material-icons" style="vertical-align: middle; font-size: 18px; width:16px; color:gray;">phone_iphone</i>${msg.phone}</c:if></td>
				<td>
				<c:if test="${msg.deal == 0}">
					<c:if test="${msg.board.boarddeal == 0}">
					<a href="${path}/user/dealYes.child?msgnum=${msg.msgnum}" type="button" class="w3-button w3-small">����</a>
					&nbsp;<a href="${path}/user/dealNo.child?msgnum=${msg.msgnum}" type="button" class="w3-button w3-small">����</a>
					</c:if>
					<c:if test="${msg.board.boarddeal == 1}">
					<a href="#" type="button" class="w3-button w3-small w3-disabled" title="�ŷ����� �Խñ��Դϴ�.">����</a>
					&nbsp;<a href="${path}/user/dealNo.child?msgnum=${msg.msgnum}" type="button" class="w3-button w3-small">����</a>
					</c:if>
				</c:if>
				<c:if test="${msg.deal == 1}">
					<a href="${path}/user/dealEnd.child?msgnum=${msg.msgnum}" type="button" class="w3-button w3-small">�Ϸ�</a>&nbsp;<a href="${path}/user/dealCancel.child?msgnum=${msg.msgnum}" type="button" class="w3-button w3-small">���</a>
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>