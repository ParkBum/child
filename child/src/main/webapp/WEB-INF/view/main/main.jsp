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
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/scc">
<!-- <script type="text/javascript">
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
			text: '2018 통계된 2017 어린이집 수'
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
</script> -->
<style type="text/css">
.canvas-holder {
	width: 100%;
	height: 400px;
	border : solid 2px silver;
	border-radius: 20px;
}


.menus {
	margin-top: 40px;
	width: 100%;
	height: 300px;
}

.card {
	margin: 25px 0;
	float: right;
	width: 33.3%;
	height: 250px;
	text-align: center;
}

.image {
	display: inline-block;
	width: 180px;
	height: 230px;
	border-radius: 20px;
	background-color: #9FF781;
	margin: 25px;
	width: 180px;
}

.main-a {
	text-decoration: none;
	font-size: xx-large;
}
</style>
</head>
<body>
	<div class="canvas-holder">
		 <canvas id="Chart" width="384px" height="130px"></canvas>
	</div>
	<div class="menus">
		<div class="card">
			<div class="image">
				<img src="../decorator/shopping-cart.png" width="150px"
					height="150px" style="margin: 10px"> <a class="main-a"
					href="../board/list.child?bType=3">중고거래></a>
			</div>
		</div>
		<div class="card">
			<div class="image">
				<img src="../decorator/group.png" width="150px" height="150px"
					style="margin: 10px"> <a  class="main-a" href="../board/list.child?bType=1">커뮤니티></a>
			</div>

		</div>
		<div class="card">
			<div class="image">
				<img src="../decorator/location.png" width="150px" height="150px"
					style="margin: 10px"> <a class="main-a" href="../map/map.child">지도 검색></a>
			</div>
		</div>
	</div>
</body>
</html>