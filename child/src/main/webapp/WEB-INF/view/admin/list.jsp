<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 정보</title>
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
      for (var i = 0; i < chks.length; i++) {
         chks[i].checked = chk.checked;
      }
   }
   
   function admindelete(mnum){
	   var del = confirm("강제탈퇴 하시겠습니까?")
	   if(del){
		   location.href = "delete.child?mnum="+mnum;
	   }
	   return false;
   }

</script>
</head>
<body>
	<form action="list.child?mnum=${user.mnum}" method="Post">
		<table border="1" style="border-collapse: collapse; width: 100%">
			<tr>
				<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
					<td colspan="4">관리자 정보</td>
				</c:if>
				<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
					<td colspan="4">회원 정보</td>
				</c:if>	
			</tr>
			<tr>
				<td>회원번호</td>
				<td>아이디(이메일)</td>
				<td>닉네임</td>
				<td>수정</td>
			</tr>
			<tr>
				<td>${sessionScope.loginUser.mnum}</td>
				<td>${sessionScope.loginUser.email}</td>
				<td>${sessionScope.loginUser.nickname}</td>
				<td><a href="../user/updateForm.child?mnum=${sessionScope.loginUser.mnum}">수정</a>
					<c:if test="${sessionScope.loginUser.mnum != 1}">
						<a href="../user/delete.child?mnum=${sessionScope.loginUser.mnum}">탈퇴</a>
					</c:if></td>
			</tr>
		</table>
	</form>
	&nbsp;
	<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
	<form action="list.child" method="Post">
		<table border="1" style="border-collapse: collapse; width: 100%">
			<tr>
				<td colspan="5">회원 목록</td>
			</tr>
			<tr>
				<td>회원번호</td>
				<td>아이디(이메일)</td>
				<td>닉네임</td>
				<td>경고횟수</td>
				<td>관리자 수정</td>
			</tr>
			<c:forEach items="${userlist}" var="user">
				<tr>
					<td>${user.mnum}</td>
					<td>${user.email}</td>
					<td>${user.nickname}</td>
					<td> </td>
					<td><a href="javascript:admindelete(${user.mnum})">강제탈퇴</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	</c:if>
</body>
</html>













