<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<style type="text/css">
table {
	width: 90%;
	border-collapse: collapse;
}

th, td {
	border: 3px solid #bcbcbc;
	text-align: center;
	padding: 8px;
}

th {
	background-color: #4CAF50;
	color: white;
	text-align: center;
}

td {
	background-color: #f2f2f2;
}

td.title {
	background-color: #e2e2e2;
	color: blue;
}
</style>
<script type="text/javascript">
	function allchkbox(chk) {
		var chks = document.getElementsByName("idchks"); 
		for(var i=0; i<chks.length; i++) {
			chks[i].checked = chk.checked;
		}
	}
</script>
</head>
<body>
<!-- <form action="info.child" method="Post">
		
	 </form> -->
	<form action="list.child" method="Post">
		<table border="1" style="border-collapse: collapse; width: 100%">
			<tr>
				<td colspan="4">ȸ�� ���</td>
			</tr>
			<tr>
				<td>ȸ����ȣ</td>
				<td>���̵�(�̸���)</td>
				<td>�г���</td>
				<td>������ ����</td>
			</tr>
			<c:forEach items="${userlist}" var="user">
				<tr>
					<td>${user.mnum}</td>
					<td>${user.email}</td>
					<td>${user.nickname}</td>
			 		<td>
						<a href="../user/updateForm.child?mnum=${user.mnum}">����</a>
						<a href="../user/delete.child?mnum=${user.mnum}">����Ż��</a>
						<a href="../user/mypage.child?mnum=${user.mnum}">ȸ������</a>
					</td> 
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>