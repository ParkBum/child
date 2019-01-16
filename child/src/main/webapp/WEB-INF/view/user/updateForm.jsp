<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
	$(".pass").keyup(function(){
		var pass1 = $("#newpass1").val();
		var pass2 = $("#newpass2").val();
		var msg="";
		if(pass1.length <= 4){
			msg = "��й�ȣ�� 4�� �̻� ���������մϴ�.";
			
		} else if(pass1 == pass2) {
			msg = "��й�ȣ ��ġ";
			$("#check").css("color","green");
		} else {
			msg = "��й�ȣ ����ġ"
			$("#check").css("color","red");
		}
		$('#check').html(msg);
	})
});
	
	function execPostCode() {/* �ּ� �˻� �κ� */
		new daum.Postcode({
			oncomplete : function(data) {
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

				// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
				// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
				var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

				// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
				// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
				if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5�ڸ� �������ȣ ���
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
</head>
<body>
	<h2 align="center">����� ����</h2>
	<form:form modelAttribute="user" method="post"
		action="update.child?mnum=${sessionScope.loginUser.mnum}">
		<%--�Է����� ���� �����޼��� ���⼭ ����. --%>
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>

		<table align="center">
			<tr height="40px">
				<td>�̸���</td>
				<td><form:input path="email"
						value="${sessionScope.loginUser.email}" readonly="true"
						style="width:154%" /> <font color="red"> <form:errors
							path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>�г���</td>
				<td><form:input path="nickname"
						value="${sessionScope.loginUser.nickname}" readonly="true"
						style="width:154%" /> <font color="red"> <form:errors
							path="nickname" /></font></td>
			</tr>
			<tr height="40px">
				<td>�����ȣ</td>
				<td><form:input path="addr1"
						value="${sessionScope.loginUser.addr1}" readonly="true"
						style="width:100%" /> <font color="red"> <form:errors
							path="addr1" /></font></td>
				<td><button type="button" class="btn btn-default"
						onclick="execPostCode()">
						<i class="fa fa-search"></i> �����ȣ ã��
					</button></td>
			</tr>
			<tr height="40px">
				<td>�ּ�</td>
				<td><form:input path="addr2"
						value="${sessionScope.loginUser.addr2}" readonly="true"
						style="width:154%" /> <font color="red"> <form:errors
							path="addr2" /></font></td>

			</tr>
			<tr height="40px">
				<td>���ּ�</td>
				<td><form:input path="addr3"
						value="${sessionScope.loginUser.addr3}" style="width:154%" /> <font
					color="red"> <form:errors path="addr3" /></font></td>
			</tr>
			<tr height="40px">
				<td>��й�ȣ</td>
				<td><input type="button" value="��й�ȣ �����ϱ�" name="pass" style="width:154%"
						onclick="document.getElementById('id01').style.display='block'" /> 
				</td>
			</tr>
			
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="Ȯ��">
					<input type="reset" value="�ʱ�ȭ">
				</td>
			</tr>
		</table>
	</form:form>
			<!-- <a href="javascript:void(0)" align="right"
					onclick="document.getElementById('id01').style.display='block'">��й�ȣ�����ϱ�</a>  -->
					<!-- ��� ���� -->
					<form action="chgPass.child" method="Post" name="f">
					<input type="hidden" name="mnum" value="${user.mnum }">
					<div id="id01" class="w3-modal" style="z-index: 4">
						<div class="w3-modal-content w3-animate-zoom" style="width:20%">
							<div class="w3-container w3-padding"
								style="background-color: #FFF1F5;">
								<h2>��й�ȣ �����ϱ�</h2>
							</div>
							<div class="w3-panel">
								������ ��й�ȣ �Է� : 
								<input type="password" class="pass" id="newpass1" name="newpass1" ><br><br>
								������ ��й�ȣ Ȯ�� : 
								<input type="password" class="pass" id="newpass2" name="newpass2" ><br>
								<font id="check" size="3" color="red"></font> 
								<div class="w3-section">
								<input type="submit" id="change"
									onclick="document.getElementById('id01').style.display='none'"
										class="w3-button w3-light-grey w3-center" value="Ȯ��">
									<i class="fa fa-paper-plane"></i>
								<a class="w3-button" style="background-color: #FFF1F5;"
									onclick="document.getElementById('id01').style.display='none'">
										�ݱ�<i class="fa fa-remove"></i></a> 
								</div>
							</div>
						</div>
					</div>
					</form>
</body>
</html>





