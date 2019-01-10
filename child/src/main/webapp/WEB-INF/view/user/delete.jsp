<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴 확인</title>
<script type="text/javascript">
	function userdelete(mnum){
		var del = confirm("탈퇴하시겠습니까?");
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
<h4>탈퇴하시려면 비밀번호를 입력하세요.</h4>
<form action="userdelete.child?mnum=${user.mnum}" method="post" name="delete">
	<input type="hidden" name="email" value="${param.email}">
	비밀번호<input type="password" name="password" size="12"><br>
	<br>
	<a href="javascript:userdelete(${user.mnum})">[회원탈퇴]</a>
	<br><a href="../main/main.child">[메인화면으로 돌아가기]</a>
</form>
</body>
</html>