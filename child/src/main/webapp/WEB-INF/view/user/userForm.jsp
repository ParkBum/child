<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
/* ��й�ȣ Ȯ��. */
$(function() {
		$(".pass").keyup(function(){
			var pwd = $("#password").val();
			var pwd1 = $("#password1").val();
			var msg ="";
			if(pwd.length<=4){
				msg ="��й�ȣ�� 4�� �̻����� �����ؾ� �մϴ�.";	
			}else if(pwd == "" && pwd1 ==""){
				msg = "";
			}else if(pwd == pwd1){
				msg = "��й�ȣ�� ��ġ�մϴ�.";
				$('#check').css('color','green');
			}else{
				msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
				$('#check').css('color','red');
			}
				$('#check').html(msg);
		})
		  $("#nickname").keyup(function() {
			  var name = $("#nickname").val();
			  
					var data = {
						"nickname" :name
						}
					$.ajax({
						url : "niccheck.child",
						type : "post",
						data : data,
						dataType : "json",
						success : function(data){
							$("#msg").html(data.msg);
						},
						error : function(xhr, status, error) { //�������� ����
	                           alert("�������� : " + xhr.status + ", error : "
	                                 + error + ", status : " + status);
	                    }
					})
				})
		   $("#email").keyup(function() {
			   			var email = $("#email").val();
						var data = {
							"email" : email,
							}
						$.ajax({
							url : "emailcheck.child",
							type : "post",
							data : data,
							dataType : "json",
							success : function(data){
								$("#msge").html(data.msge);
							},
							error : function(xhr, status, error) { //�������� ����
		                           alert("�������� : " + xhr.status + ", error : "
		                                 + error + ", status : " + status);
		                    }
						})
					})  
	});

function execPostCode() {/* �ּ� �˻� �κ� */
    new daum.Postcode({
        oncomplete: function(data) {
           // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

           // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
           // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
           var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
           var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

           // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
           // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
           if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
           if(fullRoadAddr !== ''){
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
		<form:form modelAttribute="user" method="post" action="userEntry.child" name="form" id="form">
			<h2>����� ���</h2>
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>

			<div class="inin">
				<form:input path="email" placeholder="���̵� �Է��ϼ���(e-mail ����)" id="email" name="email" />
				<br>
				<font id="msge" size="3" color="red"></font>
			</div>

			<div class="inin">
				<form:password path="password" class="pass" placeholder="��й�ȣ�� �Է��ϼ���." id="password" name="password" />
				<font color="red"><br>
				<form:errors path="password" /></font>
				
				<form:password path="password1" class="pass" placeholder="��й�ȣ Ȯ��" id="password1" name="password1"/>
				<br>
				<font id="check" size="3" color="red"></font> 
			</div>
			<!-- ajax��� �κ� DB��û �ؾ� ��.  -->
			
			
			<!-- �ּ�ĭ -->
			<div class="form-group">                   
			<form:input path="addr1" class="form-control" style="width: 40%; display: inline;" placeholder="�����ȣ" name="addr1" id="addr1" type="text" readonly="readonly" />
			    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> �����ȣ ã��</button>
			</div>
			<div class="form-group">
			    <form:input path="addr2" class="form-control" style="top: 5px;" placeholder="���θ� �ּ�" name="addr2" id="addr2" type="text" readonly="readonly" />
			    <br>
			    <font color="red"><form:errors path="addr1" /></font>
			</div>
			<div class="form-group">
			    <form:input path="addr3" class="form-control" placeholder="���ּ�" name="addr3" id="addr3" type="text"  />
			    <br>
			    <font color="red"><form:errors path="addr3" /></font>
			</div>
			<!-- �ּ�ĭ -->
			<div class="inin">
				<form:input path="nickname" placeholder="�г����� �Է��ϼ���" name="nickname" id="nickname" />
				<br>
				<font name="msg" id="msg" size="3" color="red"></font>
			</div>
			<!-- ajax��� �κ� DB��û �ؾ� ��.  -->

			<div class="inin">
				<input type="submit" value="����"> <input type="reset" value="���ۼ�">
			</div>

		</form:form>
	</div>
</body>
</html>

