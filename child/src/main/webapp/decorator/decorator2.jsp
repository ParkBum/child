<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js">
</script>
<style type="text/css">

</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(function(){
  $(".menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
  $(".menu>li:has(ul)>a").each( function() {
    $(this).html( $(this).html()+' &or;' );
  });
  $(".menu ul li:has(ul)")
    .find("a:first")
});
</script>
</head>
<body>
 <div class='menu-bar'>
  <ul class="menu">
    <li class="left"><a href="${path}/main/main.child"><img src="../decorator/house.png" width="25px" height="25px"></a></li>
    <c:if test="${empty sessionScope.loginUser}">
	<li class="right"><a href="${path}/user/loginForm.child" >�α���</a></li>
	<li class="right"><a href="${path}/user/userForm.child" >ȸ������</a></li>
		</c:if>
	<c:if test="${!empty sessionScope.loginUser}">
	<li class="left"><p style="margin:10px;">${sessionScope.loginUser.nickname}�� ȯ���մϴ�.</p></li>
	<li class="right"><a href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}" style="float: right">
		<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">�� ����</c:if>
		<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">������ ������</c:if>
		</a> </li>
	<li class="right"><a href="${path}/user/logout.child" style="float: right">�α׾ƿ�</a> </li>
	<li class="right"><a href="${path}/map/map.child" style="float: right">���� �˻�</a></li>
	<li class="right"><a href="#" style="float: right">Ŀ�´�Ƽ</a> 
		<ul>
			<li><a href="${path}/board/list.child?bType=1">�����Խ���</a></li>
       	    <li><a href="${path}/board/list.child?bType=2">�ı�Խ���</a>
		</ul>
	</li>
	<li class="right"><a href="${path}/board/list.child?bType=3" style="float: right">�߰� ����</a></li>
	</c:if>
  </ul>
</div>
	<div class="main">
		<decorator:body />
	</div>
	<hr style="color:black;">
	<div class="footer">
		<p class="foottext">����� ��õ�� ���������2�� 115, 509ȣ, 811ȣ(���굿, �븢��ũ��Ÿ��3��)</p>
	</div>
</body>
</html>