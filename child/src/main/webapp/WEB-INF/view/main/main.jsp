<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/scc">
<script type="text/javascript">
$(function() {
var ctx = document.getElementById("Chart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [<c:forEach items="${gulist}" var="gulist">'${gulist}',</c:forEach>],
        datasets: [{
			label : '2017년 어린이집 시설 수',
            data: [<c:forEach items="${cntlist}" var="list">'${list}',</c:forEach>], 
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)'

            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)'

            ],
            borderWidth: 1,
            pointRadius: 10,
            fill: false
        }
        ]
    },
    options: {
    	responsive:true,
    	title: {
			display: true,
			text: '어린이 집 관련 현황(2017년 기준)'
		},
    	hover : {
    		mode : 'nearest',
    		intersect : true
    	},
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
})
</script>
<style type="text/css">
.canvas-holder {
	width: 100%;
	height: 400px;
	border : solid 2px silver;
	border-radius: 20px;
}


.menus {
	margin-top: 25px;
	width: 100%;
	height: 250px;
}
.public {
	margin-top: 20px;
	width: 100%;
	height: 95px;
}
.card1 {
	background-position : center;
	background-size :cover;
	margin: 25px 0;
	width: 100%;
	height: 250px;
/* 	border : solid 1px #F8E0E0; */
	text-align: center;
	background :  linear-gradient(to right, rgba(255, 0, 102, 0.7),  rgba(255, 0, 204, 0.7)),url("../decorator/samples.png");
}

.card2 {
	background-position : center;
	background-size :cover;
	margin: 8px 0;
	width: 100%;
	height: 75px;
	text-align: center;
	
}

.image1 {
	display: inline-block;
	height: 230px;
	border-radius: 20px;
	margin: 10px 50px;
	width: 200px;
}

.image2 {
	display: inline-block;
	height: 66px;
	margin: 5px 2px;
	width: 24%;
	border:solid 2px silver;
	padding : 1px;
}

.main-a {
	text-decoration: none;
	font-size: xx-large;
	color : white; 

}
.main-b {
	text-decoration: none;
	marign:2px 0;
}
</style>
</head>
<body>
	<div class="canvas-holder">
		 <canvas id="Chart" width="384px" height="130px"></canvas>
	</div>
	<div class="menus">
		<div class="card1">
			<div class="image1">
				  <a class="main-a" href="../map/map.child"><img src="../decorator/locations.png" width="150px" height="150px"
					style="margin:10px 0;"><br>지도 검색&nbsp;<i class="fa fa-arrow-right"></i></a>  
			</div>
			<div class="image1">
				  <a class="main-a" href="../board/list.child?bType=1"><img src="../decorator/customer-review.png" width="150px"
					height="150px" style="margin: 10px 0;"><br>커뮤니티&nbsp;<i class="fa fa-arrow-right"></i></a>
			</div>
			<div class="image1">
				  <a class="main-a" href="../board/list.child?bType=3"><img src="../decorator/pay-per-click.png" width="150px"
					height="150px" style="margin: 10px 0;"><br>중고거래&nbsp;<i class="fa fa-arrow-right"></i></a>
			</div>
		</div>
	</div>
	<div class="public">
		<div class="card2">
			<div class="image2">
				<a class="main-b" href="https://www.seoulchildrensmuseum.org/"><img src="https://www.seoulchildrensmuseum.org/z00_images/common/logo.png" width="100%"
					height="58px"></a>
			</div>
			<div class="image2">
				<a class="main-b" href="http://seoul.childcare.go.kr/ccef/main.jsp"><img src="http://seoul.childcare.go.kr/images/ccef/common/logo_seoul.gif" width="100%"
					height="58px"></a>
			</div>
			<div class="image2">
				<a class="main-b" href="http://www.childcare.go.kr"><img src="http://www.childcare.go.kr/images/cpin/common/h1_logo_s.gif" width="100%"
					height="58px"></a>
			</div>
			<div class="image2">
				<a class="main-b" href="http://www.korea1391.go.kr/new/"><img src="http://korea1391.go.kr/new/theme/custom/images/common/logo_big.jpg" width="100%"
					height="58px"></a>
			</div>
		</div>
	</div>
</body>
</html>