<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� �� ����</title>
<style type="text/css">
td {
	text-align : left;
}
</style>
</head>
<body>
<h4><c:choose>
<c:when test="${board.bType == 1}">����</c:when>
<c:when test="${board.bType == 2}">�ı�</c:when>
<c:when test="${board.bType == 3}">�ŷ�</c:when>
</c:choose>�Խ���</h4>
	<table border="1" style="border-collapse: collapse; width: 100%;">
		<tr>
			<td width="15%" style="text-align:center;">�۾���</td>
			<td width="90%">&nbsp;${board.nickname}</td>
		</tr>
		<tr>
			<td style="text-align:center;">����</td>
			<td>&nbsp;${board.subject}</td>
		</tr>
		<%-- �ı� �Խ����� ���� ��Ÿ���� �κ� ǥ�� --%>
		<tr>
			<td style="text-align:center;">����</td>
			<td>
				<table width="100%" height="250">
					<tr>
						<td>&nbsp;${board.content}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">÷������</td>
			<td>&nbsp;
				<c:if test="${!empty board.file1}">
				<img src="../file/${board.file1}" style="width:300px;height:300px;">
				</c:if>&nbsp;
				<c:if test="${!empty board.file2}">
				<img src="../file/${board.file2}" style="width:300px;height:300px;">
				</c:if>&nbsp;
				<c:if test="${!empty board.file3}">
				<img src="../file/${board.file3}" style="width:300px;height:300px;">
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<a href="update.child?bnum=${board.bnum}">����</a>
				<a href="delete.child?bnum=${board.bnum}">����</a>
				<a href="list.child?bType=${board.bType}">���</a>
			</td>
		</tr>
	</table>
</body>
</html>