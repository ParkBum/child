<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<script language='javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script>
$(".check").click(function(){
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
});

/* 
 * 
 function check(){
	var form = document.joinForm;
	var authNum = ${authNum};
	var userauthNum = ${userauthNum};
	if(userauthNum==""||userauthNum==null){
		alert("������ȣ�� �Է����ּ���")
	}
	if(authNum == userauthNum){
		alert("�����Ǿ����ϴ�.")
	}
	if(authNum != userauthNum){
		alert("������ȣ�� Ȯ���� �ּ���.")
		userauthNum="";
		return false;
	}
} */
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
	display: block;
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
</style>
</head>
<body>
	<div class="joinForm">
		<form:form modelAttribute="user" method="post"
			action="userEntry.child" name="joinForm">
			<h2>����� ���</h2>
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}"
						var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>

			<div class="inin">
				<form:input path="email" placeholder="���̵� �Է��ϼ���(e-mail ����)"
					id="email" />
				<font color="red"><form:errors path="email" /></font>
			</div>
			
			
			
			
			
			
			<div class="inin">
				<button	style="background-color: #33CC99; width: 90%; border-radius: 10px;" 
					id="check">������ȣ ����</button>
					
			<!-- send�� ��, ��ȣ ������ ���۵�.  -->
			
			</div>
			
			
			
			
			
			<%-- <div class="inin" style="display: inline;">
				<div style="width: 60%;">
					<form:hidden path="authNum" name="authNum"/>
					<form:input path="userauthNum" placeholder="������ȣ�� �Է��ϼ���" />
					<font color="red"><form:errors path="userauthNum" /></font>
				</div>

				<button
					style="background-color: #33CC99; width: 30%; float: right; border-radius: 10px;"
					onclick="javascript:check()">������ȣ Ȯ��</button>
			</div> --%>

			<div class="inin">
				<form:password path="password" placeholder="��й�ȣ�� �Է��ϼ���." />
				<font color="red"><form:errors path="password" /></font>
			</div>
			<div class="inin">
				<form:password path="password" placeholder="��й�ȣ Ȯ��" />
				<font color="red"><form:errors path="password" /></font>
			</div>
			<div class="inin">
				<form:input path="nickname" placeholder="�г����� �Է��ϼ���" />
				<font color="red"><form:errors path="nickname" /></font>
			</div>
			<div class="inin">
				<input type="submit" value="����"> <input type="reset"value="���ۼ�">
			</div>

		</form:form>
	</div>
</body>
</html>