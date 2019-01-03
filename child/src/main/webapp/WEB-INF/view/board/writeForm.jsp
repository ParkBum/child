<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글쓰기</title>
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
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('.starRev span').click(function(){
		var starRevId = $(this).attr('id');
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		switch(starRevId){
		case "left1": $("#score").val('0.5'); break;
		case "right1": $("#score").val('1'); break;
		case "left2": $("#score").val('1.5'); break;
		case "right2": $("#score").val('2'); break;
		case "left3": $("#score").val('2.5'); break;
		case "right3": $("#score").val('3'); break;
		case "left4": $("#score").val('3.5'); break;
		case "right4": $("#score").val('4'); break;
		case "left5": $("#score").val('4.5'); break;
		case "right5": $("#score").val('5'); break;
		}
		return false;
	});
});
</script>
</head>
<body>
<form:form modelAttribute="board" action="write.child" enctype="multipart/form-data" name="f">
	<input type="hidden" name="bType" value="${board.bType}">
	<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
	<table border="1" style="border-collapse:collapse; width:100%;">
		<tr>
			<td style="text-align:center;">제목</td>
			<td valign="middle">
			<c:if test="${board.bType != 2 }"> <%-- 후기게시판에서는 머리말 안보이게 해놓음 --%>
				<select name="head" style="height:100%;">
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
				</c:if>&nbsp;<form:input path="subject" style="height:100%;" />
			<font color="red"><form:errors path="subject" /></font>
		</tr>
		<c:if test="${board.bType == 2}"> <%-- 별점은 후기게시판으로. write시킬 때 sql에 score가 추가됨. --%>
		<tr>
			<td style="text-align:center;">별점</td>
			<td><div class="starRev">
				<span class="starR1 on" id="left1">별1_왼쪽</span>
				<span class="starR2 on" id="right1">별1_오른쪽</span>
				<span class="starR1 on" id="left2">별2_왼쪽</span>
				<span class="starR2 on" id="right2">별2_오른쪽</span>
				<span class="starR1 on" id="left3">별3_왼쪽</span>
				<span class="starR2 on" id="right3">별3_오른쪽</span>
				<span class="starR1" id="left4">별4_왼쪽</span>
				<span class="starR2" id="right4">별4_오른쪽</span>
				<span class="starR1" id="left5">별5_왼쪽</span>
				<span class="starR2" id="right5">별5_오른쪽</span>
				<input type="hidden" name="score" id="score" value="0">
			</div></td>
		</tr>
		</c:if>
		<tr>
			<td style="text-align:center;">내용</td>
			<td><form:textarea path="content" rows="15" cols="80" />
			<font color="red"><form:errors path="content" /></font>
		</tr>
		<tr>
			<td style="text-align:center;">첨부파일1</td>
			<td><input type="file" name="multi1">
		</tr>
		<tr>
			<td style="text-align:center;">첨부파일2</td>
			<td><input type="file" name="multi2">
		</tr>
		<tr>
			<td style="text-align:center;">첨부파일3</td>
			<td><input type="file" name="multi3">
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
			<a href="javascript:document.f.submit()">게시물등록</a>
			<a href="list.shop">게시물목록</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>