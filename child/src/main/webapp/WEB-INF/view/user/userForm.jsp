<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500,700&amp;subset=korean"
	rel="stylesheet">
<script>
	/* ��й�ȣ Ȯ��. */
	$(function() {
		$(".pass").keyup(function() {
			var pwd = $("#password").val();
			var pwd1 = $("#password1").val();
			var msg = "";
			if (pwd.length <= 3) {
				msg = "��й�ȣ�� 4�� �̻����� �����ؾ� �մϴ�.";
			} else if (pwd == "" && pwd1 == "") {
				msg = "";
			} else if (pwd == pwd1) {
				msg = "��й�ȣ�� ��ġ�մϴ�.";
				$('#check').css('color', 'green');
			} else {
				msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
				$('#check').css('color', 'red');
			}
			$('#check').html(msg);
		})
		$("#nickname").keyup(
				function() {
					var name = $("#nickname").val();

					var data = {
						"nickname" : name
					}
					$.ajax({
						url : "niccheck.child",
						type : "post",
						data : data,
						dataType : "json",
						success : function(data) {
							$("#msg").html(data.msg);
						},
						error : function(xhr, status, error) { //�������� ����
							alert("�������� : " + xhr.status + ", error : " + error
									+ ", status : " + status);
						}
					})
				})
		$("#email").keyup(
				function() {
					var email = $("#email").val();
					var data = {
						"email" : email,
					}
					$.ajax({
						url : "emailcheck.child",
						type : "post",
						data : data,
						dataType : "json",
						success : function(data) {
							$("#msge").html(data.msge);
						},
						error : function(xhr, status, error) { //�������� ����
							alert("�������� : " + xhr.status + ", error : " + error
									+ ", status : " + status);
						}
					})
				})
	});
	
	function resetAll(){
		  document.form.reset();
		 }

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
<style type="text/css">
.joinForm {


	border-radius: 5px;
	margin: 5% auto;
	width: 30%;
	text-align: left;
	border: 1px pink solid;}

.inner {
	display:
}

.inin {
	border-radius: 20px;
	margin: 10px 0;
	padding: 20px;
	padding-top: 0px;
}
.formfont{
	color: gray;
}

input[type=text], input[type=password] {
	border:solid 0.5px silver;
	width:100%;
	text-align: left;
	padding: 10px;
	margin-bottom: 8px;
	margin-top: 4px;
}

/* input[type=reset] {
	background-color: #666666;
	color: white;
	padding: 10px;
	margin: 8px;
	border-radius: 4px;
	cursor: pointer;
}

input[type=reset]:hover {
	background-color: #333333;
}
 */
#checkMsg {
	font-size: 12px;
}

#checkPwd {
	color: red;
	font-size: 12px;
}

.error{
	text-align: center;
}

button{
  background:pink;
  color:#fff;
  border:none;
  position:relative;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}


input[type=submit],input[type=reset]{
  background:pink;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}

input[type=submit]:hover,input[type=reset]:hover{
  background:#fff;
  /* color:#1AAB8A; */
  color:pink;
}

input[type=submit]:before,input[type=submit]:after,input[type=reset]:before,input[type=reset]:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: pink;
  transition:400ms ease all;
}
input[type=submit]:after,input[type=reset]:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
input[type=submit]:hover:before,input[type=submit]:hover:after, input[type=reset]:fover:before,input[type=reset]:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
	<div class="joinForm">
		<form:form modelAttribute="user" method="post"
			action="userEntry.child" name="form" id="form">
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}"
						var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<div>
			<div style="color: white; width: 100%; background-color: pink; border-top-radius:4px; ">
				<!-- <h2 style="font-family: 'Sunflower', sans-serif; text-align: center; margin-top: 0px; height: 70px; padding-top: 14px;">
				��� ������ ������Ʈ</h2> -->
			</div>
			<div class="inin">
			<h2 style="text-align: center;"><b>Sign Up</b></h2>
				<div class="formfont" style="text-align: left;">�̸���</div>
				<c:if test="${entryUser != null}">
					<form:input path="email" id="email" name="email" value="${entryUser.email}"	readonly="readonly" />
					<form:hidden path="id" value="${entryUser.id}" />
				</c:if>
				
				<c:if test="${entryUser == null}">
					<form:input path="email" placeholder="e-mail" id="email" name="email" />
				</c:if>
				
				<br> <font id="msge" size="3" color="red" class="error"></font>

				<div class="formfont" style="text-align: left;">��й�ȣ</div>
				<form:password path="password" class="pass"
					placeholder="��й�ȣ" id="password" name="password" />
				<font color="red" class="error"><br> <form:errors path="password" /></font>

				<div class="formfont" style="text-align: left;">��й�ȣ Ȯ��</div>
				<form:password path="password1" class="pass" placeholder="��й�ȣ Ȯ��"
					id="password1" name="password1" />
				<br> <font id="check" size="3" color="red" class="error"></font>
				<!-- ajax��� �κ� DB��û �ؾ� ��.  -->

				<!-- �ּ�ĭ -->
				<div class="form-group">
				<div class="formfont" style="text-align: left;">�ּ� �Է�</div>
					<form:input path="addr1" class="form-control"
						style="width: 40%; display: inline; margin-bottom: 0px;" placeholder="�����ȣ"
						name="addr1" id="addr1" type="text" readonly="readonly" />
					<button type="button" onclick="execPostCode()" style="height: 45.453px;"> 
					�ּ� �˻�
					</button>
				</div>
				<div class="form-group">
					<form:input path="addr2" class="form-control" style="top: 5px; margin-bottom: 0px;"
						placeholder="���θ� �ּ�" name="addr2" id="addr2" type="text"
						readonly="readonly" />
					<br> <font color="red" class="error"><form:errors path="addr1" /></font>
				</div>
				<div class="form-group">
					<form:input path="addr3" class="form-control" placeholder="���ּ�"
						name="addr3" id="addr3" type="text" />
					<br> <font color="red" class="error"><form:errors path="addr3" /></font>
				</div>
				<!-- �ּ�ĭ -->
				<div class="formfont" style="text-align: left;">�г���</div>
				<form:input path="nickname" placeholder="�г���" name="nickname"
					id="nickname" />
				<br> <font class="error" name="msg" id="msg" size="3" color="red"></font>
				<!-- ajax��� �κ� DB��û �ؾ� ��.  -->
				<br>
				<div align="center">
				<input type="submit" value="ȸ������" style="width: 100%; height: 40px; margin-bottom: 8px;"> <br>
				<a href="javascript:resetAll()" style="text-decoration: none; color: gray;">�ʱ�ȭ</a>
				<!-- <br>
				<input type="reset" value="�ʱ�ȭ" style="width: 100%; height: 40px;"> -->
				</div>
			</div>
			</div>
			<form:hidden path="red" value="0" />
		</form:form>
	</div>
</body>
</html>

