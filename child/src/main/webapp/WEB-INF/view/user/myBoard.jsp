<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� Ȯ���ϱ�</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
function allchkbox(chk) {
	var chks = document.getElementsByName("checkBoard"); 
	for(var i=0; i<chks.length; i++) {
		chks[i].checked = chk.checked;
	}
}

function deleteCheck(){
	var chk = confirm("�Խñ��� �����Ͻðڽ��ϱ�?");
	if(chk){
		alert("�����߽��ϴ�.");
		return true;
	} else return false;
}
</script>
<style type="text/css">
.mylist{
	border-collapse:collapse;
} 

th {
	text-align : center;
}
</style>
</head>
<body>
	<div align="center">
		<h4>&lt;������ �ۼ��� �Խñ� ���&gt;</h4>
		<table class="mylist" class="w3-table w3-border w3-bordered" border="1">
			<form:form action="../user/myBoardDelete.child" onsubmit="return deleteCheck()" name="f" method="post">
				<input type="hidden" name="bnum" value="${board.bnum}">
				<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
				<tr>  
					<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th> 
					<th style="width : 50px;">�۹�ȣ</th>
					<th style="width : 80px;">�г���</th>
					<th style="width : 260px;">����</th>
					<th style="width : 120px;">�ۼ���</th>
				</tr>
				<c:forEach items="${myboard}" var="myboard">
					<tr>
						<td><input type="checkbox" name="checkBoard" value="${myboard.bnum}"></td>
						<td>${myboard.bnum}</td>
						<td>${nickname}</td>
						<td style="text-align:center;"><a href="../board/info.child?bnum=${myboard.bnum}">${myboard.subject}</a></td>
						<td><fmt:formatDate value="${myboard.regdate}"
										pattern="YYYY-MM-dd" /></td>
					</tr>
				</c:forEach> 
				<tr><td colspan="5" align="center">
					<input type="submit" value="����" ><br><br>
					</td></tr>
			</form:form>
		</table>
	</div> 
</body>
</html>