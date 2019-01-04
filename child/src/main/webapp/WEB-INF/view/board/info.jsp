<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 상세 보기</title>
<style type="text/css">
td {
	text-align : left;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var btype = $('input[name=bType]').val();
	var score = $('input[name=score]').val();
	
	if (btype == 2) {
		switch(score){
		case "0.5": $('#left1').addClass('on').prevAll('span').addClass('on'); break;
		case "1": $('#right1').addClass('on').prevAll('span').addClass('on'); break;
		case "1.5": $('#left2').addClass('on').prevAll('span').addClass('on'); break;
		case "2": $('#right2').addClass('on').prevAll('span').addClass('on'); break;
		case "2.5": $('#left3').addClass('on').prevAll('span').addClass('on'); break;
		case "3": $('#right3').addClass('on').prevAll('span').addClass('on'); break;
		case "3.5": $('#left4').addClass('on').prevAll('span').addClass('on'); break;
		case "4": $('#right4').addClass('on').prevAll('span').addClass('on'); break;
		case "4.5": $('#left5').addClass('on').prevAll('span').addClass('on'); break;
		case "5": $('#right5').addClass('on').prevAll('span').addClass('on'); break;
		}
	}
	
});
</script>
</head>
<body>
<h4><c:choose>
<c:when test="${board.bType == 1}">자유</c:when>
<c:when test="${board.bType == 2}">후기</c:when>
<c:when test="${board.bType == 3}">거래</c:when>
</c:choose>게시판</h4>
	<input type="hidden" name="bType" value="${board.bType}">
	<input type="hidden" name="score" value="${board.score}">
	<table border="1" style="border-collapse: collapse; width: 60%;">
		<tr>
			<td width="15%" style="text-align:center;">글쓴이</td>
			<td width="90%">&nbsp;${board.nickname}</td>
		</tr>
		<tr>
			<td style="text-align:center;">제목</td>
			<td>&nbsp;${board.subject}</td>
		</tr>
		<c:if test="${board.bType == 2}">
		<tr style="height:30px;">
			<th style="text-align:center;">별점</th>
			<td style="padding-left:5px;">
			<div class="starRev">
				<span class="starR1" id="left1">별1_왼쪽</span>
				<span class="starR2" id="right1">별1_오른쪽</span>
				<span class="starR1" id="left2">별2_왼쪽</span>
				<span class="starR2" id="right2">별2_오른쪽</span>
				<span class="starR1" id="left3">별3_왼쪽</span>
				<span class="starR2" id="right3">별3_오른쪽</span>
				<span class="starR1" id="left4">별4_왼쪽</span>
				<span class="starR2" id="right4">별4_오른쪽</span>
				<span class="starR1" id="left5">별5_왼쪽</span>
				<span class="starR2" id="right5">별5_오른쪽</span>
			</div></td>
		</tr>
		</c:if>
		<tr>
			<td style="text-align:center;">내용</td>
			<td>
				<table width="100%" height="250">
					<tr>
						<td>&nbsp;${board.content}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">첨부파일</td>
			<td>&nbsp;
				<c:if test="${!empty board.file1}">
				<img src="../file/${board.file1}" style="width:300px;height:300px;">
				</c:if>&nbsp;
				<c:if test="${!empty board.file2}">
				<img src="../file/${board.file2}" style="width:300px;height:300px;">
				</c:if>&nbsp;
				<c:if test="${!empty board.file3}">
				<img src="../file/${board.file3}" style="width:300px;height:300px;">
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<a href="update.child?bnum=${board.bnum}">수정</a>
				<a href="delete.child?bnum=${board.bnum}">삭제</a>
				<a href="list.child?bType=${board.bType}">목록</a>
			</td>
		</tr>
	</table>
</body>
</html>