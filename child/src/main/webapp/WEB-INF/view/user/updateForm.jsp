<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
</head>
<body>
<h2 align="center">����� ����</h2>
	<form:form modelAttribute="user" method="post" action="update.child?mnum=${sessionScope.loginUser.mnum}">
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
				<td><form:input path="email" value="${sessionScope.loginUser.email}" readonly="true" /> <font color="red">
				<form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>�г���</td>
				<td><form:input path="nickname" value="${sessionScope.loginUser.nickname}" readonly="true"/> <font color="red">
				<form:errors path="nickname" /></font></td>
			</tr>
			<tr height="40px">
				<td>�����ȣ</td>
				<td><form:input path="addr1" value="${sessionScope.loginUser.addr1}" readonly="true"/> <font color="red">
				<form:errors path="addr1" /></font></td>
			    <td><button type="button" class="btn btn-default" onclick="execPostCode()"><i class="fa fa-search"></i> �����ȣ ã��</button></td>
			</tr>
			<tr height="40px">
				<td>�ּ�</td>
				<td><form:input path="addr2" value="${sessionScope.loginUser.addr2}" readonly="true"/> <font color="red">
				<form:errors path="addr2" /></font></td>
				
			</tr>
			<tr height="40px">
				<td>���ּ�</td>
				<td><form:input path="addr3" value="${sessionScope.loginUser.addr3}"/> <font color="red">
				<form:errors path="addr3" /></font></td>
			</tr>
			<tr height="40px">
				<td>���� ��й�ȣ</td>
				<td><form:password path="password" class="pass" id="password"/> <font color="red">
				<form:errors path="password" /></font></td>
			</tr>
			<tr height="40px"> 
				<td>������ ��й�ȣ</td>
				<td><form:password path="password1" class="pass" id="password1"/> <font id="check" color="red">
				<form:errors path="password1" /></font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="����">
					<input type="reset" value="�ʱ�ȭ"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>





