<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� Ȯ��</title>
<script type="text/javascript">
	function userdelete(mnum){
		var del = confirm("Ż���Ͻðڽ��ϱ�?");
		if(del){
			location.href = "userdelete.child?mnum="+mnum;
		}
		return false;
	}
</script>
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
</head>
<body>
<h4>Ż���Ͻ÷��� ��й�ȣ�� �Է��ϼ���.</h4>
<form action="userdelete.child?mnum=${user.mnum}" method="post" name="delete">
	<input type="hidden" name="email" value="${param.email}">
	��й�ȣ<input type="password" name="password" size="12"><br>
	<br>
	<a href="javascript:userdelete(${user.mnum})">[ȸ��Ż��]</a>
	<br><a href="../main/main.child">[����ȭ������ ���ư���]</a>
</form>
</body>
</html>