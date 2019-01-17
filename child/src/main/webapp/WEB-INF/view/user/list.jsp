<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.cmain {
	clear: both;
	width: 1200px;
	margin: 0 315px 315px 315px;
}

.btns {
	margin: 30px;
	text-align: right;
}
</style>
<script type="text/javascript">
function check(){
	if(f.pass.value != ${user.password}){
		alert("��й�ȣ�� Ʋ���ϴ�.");
		return false;
	} else return true;
}

	function allchkbox(chk) {
		var chks = document.getElementsByName("idchks");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = chk.checked;
		}
	}

	function admindelete(mnum) {
		var del = confirm("����Ż�� �Ͻðڽ��ϱ�?")
		if (del) {
			location.href = "delete.child?mnum=" + mnum;
		}
		return false;
	}
</script>
</head>
<body>
	<div class="cmain">
		<form action="list.child?mnum=${user.mnum}" method="Post">
			<table border="1" style="border-collapse: collapse; width: 100%;"
				class="w3-table w3-border w3-bordered">
				<tr>
					<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
						<th colspan="2" style="text-align: center;">������ ����</th>
					</c:if>
					<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
						<th colspan="2" style="text-align: center;">ȸ�� ����</th>
					</c:if>
				</tr>
				<tr>
					<th style="text-align: center;">�г���</th>
					<td>${sessionScope.loginUser.nickname}</td>
				</tr>
				<tr>
					<th style="text-align: center;">���̵�(�̸���)</th>
					<td>${sessionScope.loginUser.email}</td>
				</tr>
				<tr>
					<th style="text-align: center;">������ȣ</th>
					<td>${sessionScope.loginUser.addr1}</td>
				</tr>
				<tr>
					<th style="text-align: center;">�ּ�</th>
					<td>${sessionScope.loginUser.addr2}<c:if
							test="${!empty sessionScope.loginUser.addr2}">, </c:if>
						${sessionScope.loginUser.addr3}
					</td>
				</tr>
			</table>


			<!-- ȸ������ -->
			<div class="btns">
				<!--  <a href="../user/updateForm.child">ȸ����������</a>&nbsp; -->
				<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
					<a href="../user/delete.child?mnum=${user.mnum}">ȸ��Ż��</a>
				</c:if>
			</div>
		</form>
		<a href="../user/myBoardList.child?mnum=${sessionScope.loginUser.mnum}">������ �ۼ��� �Խñ� Ȯ���ϱ�</a><br> 
		<a href="javascript:void(0)" align="right"
			onclick="document.getElementById('id01').style.display='block'">ȸ������
			�����ϱ�</a> 
		<!-- ��� ���� -->
		<form action="../user/passConfirm.child?mnum=${user.mnum}" method="Post" 
						onsubmit="return check()" name="f">
			<input type="hidden" name="password" value="${user.password}">
			<div id="id01" class="w3-modal" style="z-index: 4; padding-top:280px;">
				<div class="w3-modal-content w3-animate-zoom" style="width: 20%">
					<div class="w3-container w3-padding"
						style="background-color: #FFF1F5;">
						<h2>��й�ȣ Ȯ��</h2>
					</div>
					<div class="w3-panel">
						��й�ȣ �Է� : <input type="password" id="password" name="pass"
							style="width: 72%">
						<div class="w3-section">
							<a class="w3-button" style="background-color: #FFF1F5;"
								onclick="document.getElementById('id01').style.display='none'">
								�ݱ�<i class="fa fa-remove"></i>
							</a> <input type="submit"
								onclick="document.getElementById('id01').style.display='none'"
								class="w3-button w3-light-grey w3-right" value="Ȯ��"> <i
								class="fa fa-paper-plane"></i>
						</div>
					</div>
				</div>
			</div>
		</form>
		&nbsp;
		<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
			<form action="list.child" method="Post">
				<table border="1" style="border-collapse: collapse; width: 100%"
					class="w3-table w3-border w3-bordered">
					<tr>
						<th colspan="5" style="text-align: center;">ȸ�� ���</th>
					</tr>
					
					<tr>
						<th style="text-align: center;">ȸ����ȣ</th>
						<th style="text-align: center;">���̵�(�̸���)</th>
						<th style="text-align: center;">�г���</th>
						<th style="text-align: center;">���</th>
						<th style="text-align: center;">���</th>
					</tr>
					<c:forEach items="${userlist}" var="user">
						<tr>
							<td style="text-align: center;">${user.mnum}</td>
							<td>${user.email}</td>
							<c:choose>
							<c:when test="${user.red >= 3}">
								<td style="color:red">${user.nickname}</td>
							</c:when>
							<c:otherwise>
							<td>${user.nickname}</td>
							</c:otherwise>
							</c:choose>
							
							<td style="text-align: center;">${user.red}</td>
							<td style="text-align: center;">
							<c:if test="${user.email != 'admin@aaa.bbb'}">
							<a href="javascript:admindelete(${user.mnum})">����Ż��</a></c:if>
							<c:if test="${user.email == 'admin@aaa.bbb'}">Ż��Ұ�</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</c:if>
	</div>
</body>
</html>












