<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"  charset="utf-8"></script>
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
<script type="text/javascript">
  $(document).ready(function() {
    var name = ${result}.response.name;
    var email = ${result}.response.email;
    /* $("#name").html("ȯ���մϴ�. "+name+"��"); */
    $("#email").html("ȯ���մϴ�. "+email+"��");
    });
  //location.href = "${pageContext.request.contextPath}/";
</script>

</head>
<body>
  <div style="background-color: #15a181; width: 100%; height: 80px; text-align: center; color: white;">
    <!-- <h3>Naver_Login Success</h3> -->
    <h3>��� ������ ������Ʈ</h3>
  </div>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1�� �ڿ� ��� ���� 
     
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){location.href= "${pageContext.request.contextPath}/"},2000);
// 2�� �ڿ� ���� ȭ�� ���� ����  
    
    })
  </script>

</body>
</html>