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
					<th style="text-align: center;">�����ȣ</th>
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

			<a href="javascript:void(0)" align="right"
				onclick="document.getElementById('id01').style.display='block'">ȸ������
				�����ϱ�</a>

			<!-- ��� ���� -->
			<!--
<div id="id01" class="w3-modal" style="z-index:4"> 
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding" style="background-color:#FFF1F5;">
      <h2>��й�ȣ Ȯ��</h2>
    </div>
    <div class="w3-panel">
      <label>��й�ȣ �Է�</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <div class="w3-section">
        <a class="w3-button" style="background-color:#FFF1F5;" onclick="document.getElementById('id01').style.display='none'">�ݱ�<i class="fa fa-remove"></i></a>
        <a href="../user/updateForm.child" class="w3-button w3-light-grey w3-right"
        	onclick="document.getElementById('id01').style.display='none'">Ȯ��<i class="fa fa-paper-plane"></i></a> 
      </div>    
    </div>
  </div>
</div>


<a href="../admin/passConfirm.child?mnum=${user.mnum}"> 
 -->

			<!-- ��� ���� -->
			<form:form modelAttribute="user" action="../admin/passConfirm.child?mnum=${user.mnum}" method="Post">
			<div id="id01" class="w3-modal" style="z-index: 4">
				<div class="w3-modal-content w3-animate-zoom">
					<div class="w3-container w3-padding"
						style="background-color: #FFF1F5;">
						<h2>��й�ȣ Ȯ��</h2>
					</div>
					<div class="w3-panel">
						<label>��й�ȣ �Է� : </label> <input type="password" id="password">
						<div class="w3-section">
							<a class="w3-button" style="background-color: #FFF1F5;"
								onclick="document.getElementById('id01').style.display='none'">
								�ݱ�<i class="fa fa-remove"></i></a> 
								<input type="submit" onclick="document.getElementById('id01').style.display='none'" 
									class="w3-button w3-light-grey w3-right" value="Ȯ��" >
									 <i class="fa fa-paper-plane"></i>
						</div>
					</div>
				</div>
			</div>
			</form:form>

			<!-- ȸ������ -->
			<div class="btns">
				<!--  <a href="../user/updateForm.child">ȸ����������</a>&nbsp; -->
				<c:if test="${sessionScope.loginUser.mnum != 1}">
					<a href="../user/delete.child?mnum=${user.mnum}">ȸ��Ż��</a>
				</c:if>
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
							<td>${user.nickname}</td>
							<td style="text-align: center;">${user.red}</td>
							<td style="text-align: center;"><a
								href="javascript:admindelete(${user.mnum})">����Ż��</a></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</c:if>
	</div>
</body>
</html>













