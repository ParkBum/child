<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${path}/css/total.css">
<style type="text/css">

.board {
	text-align: left;
}

.btns2 {
	margin: 30px;
	text-align: right;
}

th {
	background-color: #f7f7f7;
}
</style>
<script type="text/javascript">
/* function delcheck(){
	var check = confirm("Ż���Ͻðڽ��ϱ�?");
	if(check){
		if(fdel.pass.value != ${user.password}){
			alert("��й�ȣ�� Ʋ���ϴ�.");
			return false;
		} else {
			alert("Ż�� �Ϸ�Ǿ����ϴ�.");
			return true;
		}
	}
	return false; 
}

function check(){
	if(f.pass.value != ${user.password}){
		alert("��й�ȣ�� Ʋ���ϴ�.");
		return false;
	} else return true;
} */

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
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">ȸ�� ����</font></li>
				<li class="active"><a href="../user/list.child?mnum=${sessionScope.loginUser.mnum}">ȸ�� ����</a></li>
				<li class="menu2"><a href="../user/myBoardList.child?mnum=${sessionScope.loginUser.mnum}">�ۼ��� ���</a></li>
				<li class="menu2"><a href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">�ŷ���û ���</a></li>
			</ul>
		</div>
		<div class="board">
		<div style="margin-top: 30px; margin-bottom: 30px;">
		<h3>ȸ�� ���� ����</h3>
		</div>
		<form action="list.child?mnum=${user.mnum}" method="Post">
			<table border="1" style="border-collapse: collapse; width: 100%;"
				class="w3-table w3-border w3-bordered">
				<tr>
					<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
						<th colspan="2" style="text-align: center; padding-left:8px;">������ ����</th>
					</c:if>
					<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
						<th colspan="2" style="text-align: center; padding-left:8px;">ȸ�� ����</th>
					</c:if>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">�г���</th>
					<td>${sessionScope.loginUser.nickname}</td>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">���̵�(�̸���)</th>
					<td>${sessionScope.loginUser.email}</td>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">�����ȣ</th>
					<td>${sessionScope.loginUser.addr1}</td>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">�ּ�</th>
					<td>${sessionScope.loginUser.addr2}<c:if
							test="${!empty sessionScope.loginUser.addr2}">, </c:if>
						${sessionScope.loginUser.addr3}
					</td>
				</tr>
			</table>
		</form>

		<!-- ȸ������ -->
		<div class="btns2">
			<!--  <a href="../user/updateForm.child">ȸ����������</a>&nbsp; -->
			<a href="myBoardList.child?mnum=${sessionScope.loginUser.mnum}&pageNum=1">
				[�� �Խñ� ���]</a> 
			<a href="javascript:void(0)"
				onclick="document.getElementById('id02').style.display='block'">
				[ȸ������ ����]</a>  
			<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
				<a href="javascript:void(0)"
					onclick="document.getElementById('id01').style.display='block'">[ȸ��Ż��]</a>
			</c:if>
		</div>
		<!-- ȸ��Ż�� ���â -->
		<form action="userdelete.child" method="Post" name="fdel">
			<input type="hidden" name="mnum" value="${user.mnum}"> 
			<input type="hidden" name="password" value="${user.password}">
			<div id="id01" class="w3-modal"
				style="z-index: 4; padding-top: 280px;">
				<div class="w3-modal-content w3-animate-zoom" style="width: 20%">
					<div class="w3-container w3-padding"
						style="background-color: #FFF1F5;">
						<h2>ȸ��Ż�� ��й�ȣ Ȯ��</h2>
					</div>
					<div class="w3-panel">
						��й�ȣ �Է� : <input type="password" id="password" name="pass"
							style="width: 72%">
						<div class="w3-section">
							<a class="w3-button" style="background-color: #FFF1F5;"
								onclick="document.getElementById('id01').style.display='none'">
								�ݱ�</a> <input type="submit"
								onclick="document.getElementById('id01').style.display='none'"
								class="w3-button w3-light-grey w3-right" value="Ȯ��">
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- ��� ���� -->
		<form:form modelAttribute="user" method="post" name="f" action="passConfirm.child?mnum=${user.mnum}">
			<input type="hidden" name="email" value="${user.email}">
			<input type="hidden" name="addr1" value="${user.addr1}">
			<input type="hidden" name="addr3" value="${user.addr3}">
			<input type="hidden" name="password1" value="0000000">
			<input type="hidden" name="nickname" value="${user.nickname}">
			<div id="id02" class="w3-modal" style="z-index: 4; padding-top: 280px;">
				<div class="w3-modal-content w3-animate-zoom" style="width: 20%">
					<div class="w3-container w3-padding"
						style="background-color: #FFF1F5;">
						<h2>��й�ȣ Ȯ��</h2>
					</div>
					<div class="w3-panel">
						��й�ȣ �Է� : <input type="password" id="password1" name="password" style="width: 72%">
						<div class="w3-section">
	<a class="w3-button" style="background-color: #FFF1F5;" onclick="document.getElementById('id02').style.display='none'">	�ݱ� </a> 
	<input type="submit" onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-light-grey w3-right" value="Ȯ��">
						</div>
					</div>
				</div>
			</div>
			</form:form>
		<!-- </form> -->
		&nbsp;
		<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
			<form action="list.child" method="Post">
			<input type="hidden" name="pageNum" value="1">
				<table border="1" style="border-collapse: collapse; width: 100%"
					class="w3-table w3-border w3-bordered">
					<tr>
						<th colspan="5" style="text-align: center; padding-left:8px;">ȸ�� ���</th>
					</tr>

					<tr>
						<th style="text-align: center; padding-left:8px;">ȸ����ȣ</th>
						<th style="text-align: center;">���̵�(�̸���)</th>
						<th style="text-align: center;">�г���</th>
						<th style="text-align: center;">���</th>
						<th style="text-align: center;">���</th>
					</tr>
					<c:forEach items="${userlist}" var="user">
						<tr>
							<td style="text-align: center; padding-left:8px;">${user.mnum}</td>
							<td>&nbsp;${user.email}</td>
							<c:choose>
								<c:when test="${user.red >= 3}">
									<td style="color: red; text-align: center;">${user.nickname}</td>
								</c:when>
								<c:otherwise>
									<td style="text-align: center;">${user.nickname}</td>
								</c:otherwise>
							</c:choose>

							<td style="text-align: center;">${user.red}</td>
							<td style="text-align: center;"><c:if
									test="${user.email != 'admin@aaa.bbb'}">
									<a href="javascript:admindelete(${user.mnum})">����Ż��</a>
								</c:if> <c:if test="${user.email == 'admin@aaa.bbb'}">Ż��Ұ�</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</c:if>
		</div>
	</div>
</body>
</html>













