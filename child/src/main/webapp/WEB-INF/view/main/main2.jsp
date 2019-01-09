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
	border: solid 2px silver;
}

.menus {
	margin: 40px;
	width: 1200px;
	height: 350px;
}

.mainimage1 {
	float: left;
	padding: 30px 0 0 30px;
	width: 600px;
}

.mainimage2 {
	float: right;
	padding: 10px;
	width: 400px;
	list-style: none;
}

.mainimage3 {
	float: right;
	padding: 10px 10px 10px 25px;
	width: 400px;
	text-align: left;
}

.tit {
	margin-left: 40px;
}

.a1 {
	background:
		url(http://iseoul.seoul.go.kr/images/portal/main/bg-mainInfo-link-img11.png)
		no-repeat;
	color: #7c5348;
	display: table-cell;
	width: 350px;
	height: 63px;
	vertical-align: middle;
	text-align: left;
	text-decoration: none;
}

.a2 {
	background:
		url(http://iseoul.seoul.go.kr/images/portal/main/bg-mainInfo-link-img13.png)
		no-repeat;
	color: #7c5348;
	display: table-cell;
	width: 350px;
	height: 63px;
	vertical-align: middle;
	text-align: left;
	text-decoration: none;
}

.a3 {
	background:
		url(http://iseoul.seoul.go.kr/images/portal/main/bg-mainInfo-link-img12.png)
		no-repeat;
	color: #7c5348;
	display: table-cell;
	width: 350px;
	height: 63px;
	vertical-align: middle;
	text-align: left;
	text-decoration: none;
}
</style>
</head>
<body>
	<div align="center">
		<div id="wrap">
			<div class="canvas-holder"></div>
			<div class="menus">
				<div class="card1">
					<div class="mainimage1">
						<a href="../map/map.child"><img
							src="../decorator/seoulsearch.png" alt="어린이집 검색" style="width:750px; height:445px;"></a>
					</div>
					<ul class="mainimage2">
						<li><a class="a1" href="../board/list.child?bType=1"><span
								class="tit">자유게시판</span></a></li>
						<li><a class="a2" href="../board/list.child?bType=2"><span
								class="tit">후기게시판</span></a></li>
						<li><a class="a3" href="../board/list.child?bType=3"><span
								class="tit">거래게시판</span></a></li>
					</ul>
					<div class="mainimage3">
						<iframe style="height: 200px;"
							src="https://www.youtube.com/embed/SY6zhxH4UEo?autohide=1&loop=1&vq=hd720&controls=2&showinfo=0&rel=0&volume=1"
							frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" value="${result}">
	</div>
</body>
</html>