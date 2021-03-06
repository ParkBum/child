<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"  href="${path}/css/total.css">
<style type="text/css">
td {
	text-align: left;
}

th {
	background-color: #eeeeee;
	width: 200px;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
.ani {
	-webkit-animation: stretch-bounce .5s ease-in-out;
}

@-webkit-keyframes stretch-bounce {
  0% {
    -webkit-transform: scale(1);
  }
  25% {
    -webkit-transform: scale(1.2);
  }
  50% {
    -webkit-transform: scale(1);
  }
  75% {
    -webkit-transform: scale(1.2);
  }
  100% {
    -webkit-transform: scale(1);
  }
}

</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#tr2').hide();
		$('#tr3').hide();
		
		$('.starRev span').click(function() {
			var starRevId = $(this).attr('id');
			$(this).parent().children('span').removeClass('on');
			$(this).parent().children('span').removeClass('ani');
			$(this).addClass('on').prevAll('span').addClass('on');
			$(this).addClass('ani').prevAll('span').addClass('ani');
			
			switch (starRevId) {
			case "left1":
				$("#score").val('0.5');
				break;
			case "right1":
				$("#score").val('1.0');
				break;
			case "left2":
				$("#score").val('1.5');
				break;
			case "right2":
				$("#score").val('2.0');
				break;
			case "left3":
				$("#score").val('2.5');
				break;
			case "right3":
				$("#score").val('3.0');
				break;
			case "left4":
				$("#score").val('3.5');
				break;
			case "right4":
				$("#score").val('4.0');
				break;
			case "left5":
				$("#score").val('4.5');
				break;
			case "right5":
				$("#score").val('5.0');
				break;
			}
			return false;
		});

		$('#box1').click(function() {
			$('#tr2').show();
		});
		$('#box2').click(function() {
			$('#tr3').show();
		});

		$('#list').click(function() {
			location.href = "list.child?bType=" + $('input[name=bType]').val();
		});
		
		$('form').submit(function() {
			var check = confirm('등록하시겠습니까?');
			var btype = $('input[name=bType]').val();
			var head = $('select[name=head]').val();
			var mkinds = $('select[name=mkinds]').val();
			var gu = $('#gu').val();
			var code = $('#code').val();
			
			if (check) {
				if (btype == 2) {
					if(gu.length == 0 || code.length == 0) {
						alert("어린이집을 선택하세요");
						return false;
					} else {
						return true;
					}
				} else {
					if (head.length == 0) {
						alert("말머리를 선택하세요");
						return false;
					} else if(mkinds.length == 0){
						alert("물품종류를 선택하세요");
						return false;
					} else {
						return true;
					}
				} 
			}
			return false;
		});
	});
	
function nextselect(){
	var data = {
			"gu" : $('select[name=gu]').val()
	}
	$.ajax({
		url : "selectname.child",
		type : "post",
		data : data,
		dataType : "json",
		success : function(data){
			    $('#code').empty();
			for(var i = 0; i < data.daycareList.length; i++){                
                var option = $("<option value='"+data.daycareList[i].code+"'>"+data.daycareList[i].name+"</option>");
                $('#code').append(option);
            }
		}
	})
}
</script>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height: 100px;" size="5">게시판</font></li>
				<c:if test="${board.bType == 1}"><li class="active"></c:if><c:if test="${board.bType != 1}"><li class="menu2"></c:if><a href="../board/list.child?bType=1">자유게시판</a></li>
				<c:if test="${board.bType == 2}"><li class="active"></c:if><c:if test="${board.bType != 2}"><li class="menu2"></c:if><a href="../board/list.child?bType=2">후기게시판</a></li>
				<c:if test="${board.bType == 3}"><li class="active"></c:if><c:if test="${board.bType != 3}"><li class="menu2"></c:if><a href="../board/list.child?bType=3">거래게시판</a></li>
			</ul>
		</div>
		<div class="board">
			<img src="${path}/decorator/visual_05.gif" title="게시판">
			<div style="margin-top: 30px; margin-bottom: 30px; text-align: left;">
				<c:choose>
					<c:when test="${board.bType == 1}">
						<h3>자유 게시판</h3>
					</c:when>
					<c:when test="${board.bType == 2}">
						<h3>후기 게시판</h3>
					</c:when>
					<c:when test="${board.bType == 3}">
						<h3>거래 게시판</h3>
					</c:when>
				</c:choose>
			</div>
			<form:form modelAttribute="board" action="write.child"
				enctype="multipart/form-data" name="f" method="post">
				<input type="hidden" name="bType" value="${board.bType}">
				<input type="hidden" name="mnum"
					value="${sessionScope.loginUser.mnum}">
				<input type="hidden" name="score" id="score" value="0">
				<table border="1" style="border-collapse: collapse; width: 100%;" class="w3-table w3-border w3-bordered">
					<tr style="height: 30px;">
						<th style="text-align: center;">제목</th>
						<td style="vertical-align: middle;"><c:if
								test="${board.bType != 2 }">
								<select name="head">
									<option value="">선택하세요</option>
									<c:if test="${board.bType == 1}">
										<option value="1">육아꿀팁</option>
										<option value="2">시설추천</option>
									</c:if>
									<c:if test="${board.bType == 3}">
										<option value="1">삽니다</option>
										<option value="2">팝니다</option>
									</c:if>
								</select>
									<c:if test="${board.bType == 3}">
								<select name="mkinds">
								<option value="">선택하세요</option>
										<option value="1">완구</option>
										<option value="2">도서</option>
										<option value="3">의류</option>
										<option value="4">기타</option>
								</select>
									</c:if>
								
							</c:if>
							<c:if test="${board.bType == 2 }">
							<select name="gu" id = "gu" onchange="javascript:nextselect()">
								<option value="">구선택</option>
								<c:forEach items="${gulist}" var = "gulist">
								<option value="${gulist.gu}">${gulist.gu}</option>
								</c:forEach>
							</select>
							<select name="code" id="code" style="width:120px;">
								<option value="">어린이집선택</option>
							</select>
							</c:if>
							&nbsp;<form:input path="subject" style="width:500px;border:0;"
								placeholder="제목을 입력하세요" /> <font color="red"><form:errors
									path="subject" /></font></td>
					</tr>
					<c:if test="${board.bType == 2}">
						<tr style="height: 30px;">
							<th style="text-align: center;">별점</th>
							<td><div class="starRev">
									<span class="starR1" id="left1">별1_왼쪽</span> <span
										class="starR2" id="right1">별1_오른쪽</span> <span
										class="starR1" id="left2">별2_왼쪽</span> <span
										class="starR2" id="right2">별2_오른쪽</span> <span
										class="starR1" id="left3">별3_왼쪽</span> <span
										class="starR2" id="right3">별3_오른쪽</span> <span
										class="starR1" id="left4">별4_왼쪽</span> <span class="starR2"
										id="right4">별4_오른쪽</span> <span class="starR1" id="left5">별5_왼쪽</span>
									<span class="starR2" id="right5">별5_오른쪽</span>
								</div></td>
						</tr>
					</c:if>
					<tr style="height: 400px;">
						<th style="text-align: center;">내용</th>
						<td style="padding: 5px; vertical-align: middle;"><form:textarea
								path="content"
								style="width:100%;height:400px;border:0;resize:none;"
								placeholder="내용을 입력하세요" /> <font color="red"><form:errors
									path="content" /></font>
					</tr>
					<tr id="tr1" style="height: 30px;">
						<th style="text-align: right;"><a href="#"><i
								class="material-icons"
								style="vertical-align: middle; float: left;" id="box1">add_box</i></a>첨부파일1&nbsp;</th>
						<td><input type="file" name="multi1"><br><font size="2">이미지 파일만 첨부가능</font></td>
					</tr>
					<tr id="tr2" style="height: 30px;">
						<th style="text-align: right;"><a href="#"><i
								class="material-icons"
								style="vertical-align: middle; float: left;" id="box2">add_box</i></a>첨부파일2&nbsp;</th>
						<td><input type="file" name="multi2"><br><font size="2">이미지 파일만 첨부가능</font></td>
					</tr>
					<tr id="tr3" style="height: 30px;">
						<th style="text-align: right;">첨부파일3&nbsp;</th>
						<td><input type="file" name="multi3"><br><font size="2">이미지 파일만 첨부가능</font></td>
					</tr>
					<tr style="height: 30px;">
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="등록"><input type="button" id="list"
							value="목록"></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>