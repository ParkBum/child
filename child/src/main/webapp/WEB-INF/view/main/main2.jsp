<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style type="text/css">
.canvas-holder {
	width: 1200px;
	height: 500px;
 	border : solid 2px silver;
}

.menus {
	margin: 30px;
	width : 1200px;
}

.image1-1 {
	float:left;
}

.a1 {
    background: url(../../images/portal/main/bg-mainInfo-link-img11.png) no-repeat;
    color: #7c5348;
}

.a2 {
    background: url(../../images/portal/main/bg-mainInfo-link-img12.png) no-repeat;
    color: #6c431f;
}

.a3 {
    background: url(../../images/portal/main/bg-mainInfo-link-img14.png) no-repeat;
    color: #646f3d;
}
</style>
</head>
<body>
<div align="center">
	<div id="wrap">
		<div class="canvas-holder">
		</div>
		<div class="menus">
			<div class="card1">
				<div class="image1-1"> <%-- mouseover 시 색 변경 --%>
					<a href="../map/map.child"><img src="../decorator/seoulsearch.png" alt="어린이집 검색"></a>  
				</div>
				<div class="image1-2">
					<ul>
						<li><a class="a1">자유게시판</a></li>
						<li><a class="a2">후기게시판</a></li>
						<li><a class="a3">거래게시판</a></li>						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${result}">
</div>
</body>
</html>