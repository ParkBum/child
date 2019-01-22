<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${path}/css/total.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   function passcheck() {
      if (f.newpass1.value.length <= 4 || f.newpass1.value.length <= 4) {
         alert("5�� �̻� ���� �����մϴ�.");
         f.newpass1.focus();
         return false;
      } else if (f.newpass1.value != f.newpass2.value) {
         alert("��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է��ϼ���");
         f.newpass1.focus();
         return false;
      } else
         return true;
   }

   $(function() {
      $(".pass").keyup(function() {
         var pass1 = $("#newpass1").val();
         var pass2 = $("#newpass2").val();
         var msg = "";
         if (pass1.length <= 4) {
            msg = "��й�ȣ�� 5�� �̻� ���������մϴ�.";

         } else if (pass1 == pass2) {
            msg = "��й�ȣ ��ġ";
            $("#check").css("color", "green");
         } else {
            msg = "��й�ȣ ����ġ"
            $("#check").css("color", "red");
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
</head>
<body>
   <div class="cmain" align="center">
      <div class="subMenu">
         <ul>
            <li class="menu1"><font style="line-height: 100px;" size="5">ȸ��
                  ����</font></li>
            <li class="active"><a
               href="../user/list.child?mnum=${sessionScope.loginUser.mnum}">ȸ��
                  ����</a></li>
            <li class="menu2"><a
               href="../user/myBoardList.child?mnum=${sessionScope.loginUser.mnum}">�ۼ���
                  ���</a></li>
            <li class="menu2"><a
               href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">�ŷ���û
                  ���</a></li>
         </ul>
      </div>
      <div class="board">
         <div style="margin-top: 30px; margin-bottom: 30px;">
            <h3>ȸ�� ���� ����</h3>
         </div>
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

            <table border="1" style="border-collapse: collapse; width: 100%;"
               class="w3-table w3-border w3-bordered">
               <tr>
                  <th colspan="2" style="text-align: center; padding-left:8px;">ȸ�� ����</th>
               </tr>
               <tr>
                  <th style="text-align: center; padding-left:8px;">���̵�(�̸���)</th>
                  <td><form:input path="email"
                        value="${sessionScope.loginUser.email}" readonly="true"
                        style="width:80%" /> <font color="red"> <form:errors
                           path="email" /></font></td>
               </tr>
               <tr>
                  <th style="text-align: center; padding-left:8px;">�г���</th>
                  <td><form:input path="nickname"
                        value="${sessionScope.loginUser.nickname}" readonly="true"
                        style="width:80%" /> <font color="red"> <form:errors
                           path="nickname" /></font></td>
               </tr>
               <tr>
                  <th style="text-align: center; padding-left:8px;">�����ȣ</th>
                  <td><form:input path="addr1"
                        value="${sessionScope.loginUser.addr1}" readonly="true"
                        style="width:30%" /> <font color="red"> <form:errors
                           path="addr1" /></font>&nbsp;&nbsp;<button type="button" class="btn btn-default"
                        onclick="execPostCode()">
                        <i class="fa fa-search"></i> �����ȣ ã��
                     </button></td>
               </tr>
               <tr>
                  <th style="text-align: center; padding-left:8px;">�ּ�</th>
                  <td><form:input path="addr2"
                        value="${sessionScope.loginUser.addr2}" readonly="true"
                        style="width:80%" /> <font color="red"> <form:errors
                           path="addr2" /></font></td>
               </tr>
               <tr>
                  <th style="text-align: center; padding-left:8px;">���ּ�</th>
                  <td><form:input path="addr3"
                        value="${sessionScope.loginUser.addr3}" style="width:80%" /> <font
                     color="red"> <form:errors path="addr3" /></font></td>
               </tr>
               <tr>
                  <th style="text-align: center; padding-left:8px;">��й�ȣ</th>
                  <td><input type="button" value="��й�ȣ �����ϱ�" name="pass"
                     style="width: 46%"
                     onclick="document.getElementById('id01').style.display='block'" />
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="text-align:center;"><input type="submit"
                     value="Ȯ��"> <input type="reset" value="�ʱ�ȭ"></td>
               </tr>
            </table>
         </form:form>
         <!-- <a href="javascript:void(0)" align="right"
               onclick="document.getElementById('id01').style.display='block'">��й�ȣ�����ϱ�</a>  -->
         <!-- ��� ����  action="chgPass.child"  -->
         <form action="chgPass.child" method="Post" name="f"
            onsubmit="return passcheck()">
            <input type="hidden" name="mnum" value="${user.mnum }">
            <div id="id01" class="w3-modal"
               style="z-index: 4; padding-top: 280px;">
               <div class="w3-modal-content w3-animate-zoom" style="width: 20%">
                  <div class="w3-container w3-padding"
                     style="background-color: #FFF1F5;">
                     <h2>��й�ȣ �����ϱ�</h2>
                  </div>
                  <div class="w3-panel">
                     ������ ��й�ȣ �Է� : <input type="password" class="pass" id="newpass1"
                        name="newpass1"><br>
                     <br> ������ ��й�ȣ Ȯ�� : <input type="password" class="pass"
                        id="newpass2" name="newpass2"><br> <font
                        id="check" size="3" color="red"></font>
                     <div class="w3-section" style="text-align:center;">
                        <input type="submit" id="change"
                           onclick="document.getElementById('id01').style.display='none'"
                           class="w3-button w3-light-grey w3-center" value="Ȯ��"> <i
                           class="fa fa-paper-plane"></i> <a class="w3-button"
                           style="background-color: #FFF1F5;"
                           onclick="document.getElementById('id01').style.display='none'">
                           �ݱ�<i class="fa fa-remove"></i>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </form>
      </div>
   </div>
</body>
</html>
