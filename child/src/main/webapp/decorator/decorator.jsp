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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js"></script>
<style type="text/css">
html {
	overflow: auto;
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	/* max-width: 1200px; */
	display: block;
	margin: 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
	height: 100%;
	/* max-width: 1200px; */
	font-family: 'Noto Sans KR', sans-serif;
}
/* 상단 바 */
.menu-bar {
	display: inline-block;
	color: black;
	width: 100%;
	height: 140px;
	margin-bottom: 20px;
}

.menu .left {
	/* float: left; */
	list-style: none;
}

.menu .right {
	/* float: right; */
	list-style: none;
	margin: 40px 0px 10px 0px;
}

.menu a {
	background-color: #F6A5BC;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
}

.menu .right:hover a {
	background-color: #CE5B7C;
}

.menu .right:hover a {
	color: white;
}

.menu ul a {
	color: white;
}

/*하단 footer */
.footer {
	clear: both;
	color: black;
	margin: 10px auto 30px auto;
	height: 80px;
	width: 550px;
	text-align: left;
}

.menu:after {
	content: "";
	display: block;
	clear: both;
}

.menu li {
	display: inline-block;
}

.menu {
	width: 1300px;
	margin: 0 -384px 0 300px;
	padding-top: 20px;
}

.nav {
	padding-left: 400px;
}

.right ul {
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	float: left;
	padding: 20px;
	padding-left: 10px;
	border: 0px;
	position: absolute;
	width: auto;
}

.right ul a {
	padding: 5px;
	border-radius: 20px;
}

.menu-bar .right:hover ul {
	display: block; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}
</style>
</head>
<body>
	<div>
		<%-- <div style="text-align:right;">
		<c:if test="${!empty sessionScope.loginUser}">
			<font size="2" style="margin: 30px 300px 0 0;">${sessionScope.loginUser.nickname}님 환영합니다.</font>
		</c:if>
		</div> --%>
		<div class='menu-bar'>
			<div style="height: 40px;">
				<ul class="menu">
					<li class="left"><a href="${path}/main/main2.child"
						style="background-color: white;"><img
							src="../decorator/logo.png"
							style="width: 130px; height: 100px; margin: 0 0 4px 20px;" title="홈바로가기"></a></li>
					<li class="right nav"><a href="${path}/map/map.child"
						style="border-radius: 20px 0 0 20px;" title="어린이집검색">어린이집 검색</a></li>
					<li class="right"><a href="${path}/board/list.child?bType=1"
						style="margin-left: -4px;" title="커뮤니티">커뮤니티</a>
						<ul>
							<li><a href="${path}/board/list.child?bType=1"
								style="background: white; color: #AAAAAA;"
								onmouseover="this.style.color='#CE5B7C'"
								onmouseout="this.style.color='#AAAAAA'" title="자유게시판">자유게시판</a>
								<a href="${path}/board/list.child?bType=2"
								style="background: white; color: #AAAAAA;"
								onmouseover="this.style.color='#CE5B7C'"
								onmouseout="this.style.color='#AAAAAA'" title="후기게시판">후기게시판</a></li>
						</ul></li>
					<li class="right"><a href="${path}/board/list.child?bType=3"
						style="margin-left: -4px;" title="거래게시판">중고장터</a></li>
					<c:if test="${empty sessionScope.loginUser}">
						<li class="right"><a href="${path}/user/userForm.child"
							style="margin-left: -4px;" title="회원가입">회원가입</a></li>
					</c:if>
					<c:if test="${empty sessionScope.loginUser}">
						<li class="right" style="margin-right: 50px;"><a
							href="${path}/user/loginForm.child"
							style="border-radius: 0 20px 20px 0; margin-left: -4px;"
							title="로그인">로그인</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser}">
						<li class="right"><c:if
								test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
								<a
									href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}"
									style="margin-left: -4px;" title="회원정보">회원정보</a>
							</c:if> <c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
								<a
									href="${path}/admin/list.child?mnum=${sessionScope.loginUser.mnum}"
									style="margin-left: -4px;" title="회원관리">회원관리</a>
							</c:if></li>
						<c:if test="${!empty sessionScope.loginUser}">
							<li class="right" style="margin-right: 50px;"><a
								href="${path}/user/logout.child"
								style="border-radius: 0 20px 20px 0; margin-left: -4px;"
								title="로그아웃">로그아웃</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>

		<div class="main">
			<decorator:body />
		</div>
		<div class="footer" align="center">
		<br>
		<hr>
			<img src="../decorator/logo1.png"
				style="width: 55px; height: 70px; float: left; margin-top: 5px">
			<br>어린이 집마련 프로젝트팀<br> 서울시 금천구 가산디지털2로 115, 509호, 811호(가산동,
			대륭테크노타운3차)
		</div>
	</div>
</body>
</html>