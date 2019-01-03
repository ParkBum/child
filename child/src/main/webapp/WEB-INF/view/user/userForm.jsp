<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<script>

function getMessage(){
	$.ajax({
		method : "POST",
		url : "<c:url value='/study/getMessage.html'/>",
		dataType : "JSON",
		data : null,
		error : function(){alert('error');},
		success : result
	})
}
function result(data){
  alert(data.result)
}

</script>
<style type="text/css">
.joinForm {
	border-radius: 5px;
	margin: 10% auto;
	width: 30%;
	background-color: #f2f2f2;
	text-align: center;
}

.inner {
	display:
}

.inin {
	margin: 10px 0;
}

input[type=text], input[type=password] {
	text-align: center;
	padding: 10px;
	margin: 8px;
	width: 90%;
	border-radius: 4px;
}

input[type=submit], input[type=reset] {
	background-color: #666666;
	color: white;
	padding: 10px;
	margin: 8px;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit] :hover, input[type=reset]:hover {
	background-color: #333333;
}

#checkMsg {
	font-size: 12px;
}

#checkPwd {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
	<div class="joinForm">
		<form:form modelAttribute="user" method="post"
			action="userEntry.child" name="joinForm">
			<h2>����� ���</h2>
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>

			<div class="inin">
				<form:input path="email" placeholder="���̵� �Է��ϼ���(e-mail ����)"
					id="email" />
				<font color="red"><br>
				<form:errors path="email" /></font>
				<input type="button" value="getMessage" onClick="javascript:getMessage()"/>
			</div>

			<div class="inin" style="display: inline;">
				<button	style="background-color: #33CC99; width: 90%; border-radius: 10px;"
					onclick="javascript:alert('�����ȵ�')">������ȣ ����</button>
			</div>

			<div class="inin" style="display: inline;">
				<form:input path="authnum" placeholder="������ȣ�� �Է��ϼ���" />
				<font color="red"><br>
				<form:errors path="authnum" /></font>

				<button
					style="background-color: #33CC99; width: 90%; border-radius: 10px;"
					id="check" onclick="javascript:alert('�����ȵ�')">������ȣ Ȯ��</button>
			</div>

			<div class="inin">
				<form:password path="password" placeholder="��й�ȣ�� �Է��ϼ���." />
				<font color="red"><br>
				<form:errors path="password" /></font>
			</div>

			<div class="inin">
				<form:password path="password1" placeholder="��й�ȣ Ȯ��" />
				<font color="red"><form:errors path="password1" /></font>
			</div>
			<!-- ajax��� �κ� DB��û �ؾ� ��.  -->

			<div class="inin">
				<form:input path="nickname" placeholder="�г����� �Է��ϼ���" />
				<font color="red"><br>
				<form:errors path="nickname" /></font>
			</div>
			<!-- ajax��� �κ� DB��û �ؾ� ��.  -->

			<div class="inin">
				<input type="submit" value="����"> <input type="reset"
					value="���ۼ�">
			</div>

		</form:form>
	</div>
</body>
</html>


<!-- <script>
/* $(".check").click(function(){
$.ajax({
	url : "mailauth.child",
	type : "post",
	dataType : "json",
	success : function(e){
		console.log(e.list[0].s_user)
		console.log(e.list[1].s_user)
	},
	error : function(){
		alert('error');
	}
});
}); */
/* function validateEmail(sEmail) {
var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
if (filter.test(sEmail)) {
return true;
}
else {
	return false;
}
}
$(document).ready(function() {
$('#check').click(function() {
var sEmail = $('#email').val();
if ($.trim(sEmail).length == 0) {
alert('Please enter valid email address');
e.preventDefault();
}
if (validateEmail(sEmail)) {
alert('�ùٸ� �̸����Դϴ�');
}
else {
alert('�߸��� �̸����Դϴ�');
e.preventDefault();
}
});
}); */
</script> -->