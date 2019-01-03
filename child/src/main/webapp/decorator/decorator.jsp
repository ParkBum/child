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
html {
	background-image: url("../decorator/field.jpg");
	background-position : center;
	background-size: cover;
}

* {
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	max-width: 1200px;
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}
/* ��� �� */
.menu-bar {
  background: skyblue;
  display: inline-block;
  width: 100%;
}
.menu { margin: auto; padding: 0 auto; }
.menu .left {
  float:left;
  list-style:none;
  position: relative;
  margin : auto 0;
}
.menu .right {
  float:right;
  list-style:none;
  position: relative;
  margin : auto 0;
}
.menu li:hover { background: white; }
.menu li:hover>a { color: skyblue; }
.menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
}
.menu ul li { float: none; z-index: 300;}
.menu ul .right :hover { background: #ddd; }
.menu ul .right :hover a { color: black; }
.menu ul a { color: black; }
.menu ul ul { left: 100%; top: 0; }
.menu ul ul li {float:left; margin-right:10px;}

/* main */
.main {
	
	padding: 10px;
	height: 800px;
}
/*�ϴ� footer */
.footer {

	background-color: #006633 ;
	color: white;
	text-align: center;
	padding: 10px;
}

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
    .append("<p style='float:right; margin:-3px'>&#9656;</p>");
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
	<c:if test="${sessionScope.loginUser.email=='admin'}">
	<li class="right"><a href="${path}/admin/list.child" style="float: right">������ ������</a> </li>
	</c:if>
		<c:if test="${sessionScope.loginUser.email!='admin'}">
	<li class="right"><a href="${path}/admin/list.child" style="float: right">���� ������</a> </li>
	</c:if>
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
		<p class="foottext" >����� ��õ�� ���������2�� 115, 509ȣ, 811ȣ(���굿, �븢��ũ��Ÿ��3��)</p>
	</div>
</body>
</html>