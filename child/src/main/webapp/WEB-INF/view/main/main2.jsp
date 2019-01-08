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
	width : 1200px;
}

.image1-1 {
	float:left;
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
				  <a href="../board/list.child?bType=1"><img src="../decorator/customer-review.png" width="150px"
						height="150px" style="margin: 10px 0;"><font><br>커뮤니티&nbsp;<i class="fa fa-arrow-right"></i></font></a>
				</div>
				<div class="image1-3">
				  <a href="../board/list.child?bType=3"><img src="../decorator/pay-per-click.png" width="150px"
						height="150px" style="margin: 10px 0;"><br>중고거래&nbsp;<i class="fa fa-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${result}">
</div>
</body>
</html>