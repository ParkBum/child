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
			case "1.0": $('#right1').addClass('on').prevAll('span').addClass('on'); break;
			case "1.5": $('#left2').addClass('on').prevAll('span').addClass('on'); break;
			case "2.0": $('#right2').addClass('on').prevAll('span').addClass('on'); break;
			case "2.5": $('#left3').addClass('on').prevAll('span').addClass('on'); break;
			case "3.0": $('#right3').addClass('on').prevAll('span').addClass('on'); break;
			case "3.5": $('#left4').addClass('on').prevAll('span').addClass('on'); break;
			case "4.0": $('#right4').addClass('on').prevAll('span').addClass('on'); break;
			case "4.5": $('#left5').addClass('on').prevAll('span').addClass('on'); break;
			case "5.0": $('#right5').addClass('on').prevAll('span').addClass('on'); break;
		}
	}	
	
	$('#update').click(function() {
		var bnum = $('input[name=bnum]').val();
		location.href = "updateForm.child?bnum=" + bnum;
	})
	
	$('#delete').click(function() {
		var bnum = $('input[name=bnum]').val();
		var check = confirm("삭제하시겠습니까?");
		if (check) {
			location.href = "delete.child?bnum=" + bnum;
		}	
	})
	
	$('#list').click(function() {
		var btype = $('input[name=bType]').val();
		location.href = "list.child?bType=" + btype;
	})
});
</script>
</head>
<body>
<div align="center" style="margin-bottom:30px;">
<c:choose>
	<c:when test="${board.bType == 1}">
	<input type="button" value="자유게시판" class="w3-button w3-round-xxlarge" style="background-color:#FFC322; color:black" id="community">
	</c:when>
	<c:when test="${board.bType == 2}">
<input type="button" value="후기게시판" class="w3-button w3-round-xxlarge" style="background-color:#FFC322; color:black" id="review">
	</c:when>
	<c:when test="${board.bType == 3}">
	<input type="button" value="거래게시판" class="w3-button w3-round-xxlarge" style="background-color:#FFC322; color:black" id="market">
	</c:when>
</c:choose>
</div>

	<input type="hidden" name="bType" value="${board.bType}">
	<input type="hidden" name="score" value="${board.score}">
	<table border="1" style="border-collapse: collapse; width:60%;" align="center">
		<tr style="height:30px;">
			<td width="15%" style="text-align:center;">작성자</td>
			<td width="90%">&nbsp;${board.nickname}
			<c:if test="${board.bType == 3}">
				&nbsp;<input type="button" value="신고">
				</c:if></td> 
		</tr>
		<tr style="height:30px;">
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
			<td style="text-align:center;height:400px;">내용</td>
			<td>
				<table width="100%" height="100%">
					<tr>
						<td>&nbsp;${board.content}</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:if test="${!empty board.file1 || !empty board.file2 || !empty board.file3}">
		<tr>
			<td style="text-align:center;">첨부파일</td>
			<td>&nbsp;
				<c:if test="${!empty board.file1}">
				<img src="../file/${board.file1}" style="width:150px;height:150px;"> 
				</c:if>&nbsp;
				<c:if test="${!empty board.file2}">
				<img src="../file/${board.file2}" style="width:150px;height:150px;">
				</c:if>&nbsp;
				<c:if test="${!empty board.file3}">
				<img src="../file/${board.file3}" style="width:150px;height:150px;">
				</c:if>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2" style="text-align:center;height:30px;">
			<c:if test="${sessionScope.loginUser.mnum == board.mnum}">
				<input type="button" id="update" value="수정">
				<input type="button" id="delete" value="삭제">
			</c:if>
				<input type="button" id="list" value="목록">
			</td>
		</tr>
		<!-- 댓글 -->
			<tr style="height:30px;">
			<td style="text-align:center;">댓글</td> 
			<td>
				<form:form action="commentWrite.child" method="Post" modelAttribute="comment"> 
					<input type="hidden" name="bnum" value="${board.bnum}"> 
							댓글 작성자 : ${sessionScope.loginUser.nickname} 
					<form:textarea path="recomment" style="width:100%;height:100px;border:0;resize:none;" placeholder="댓글 입력"></form:textarea>
					<input type="submit" value="등록">
				</form:form>
			</td>
		</tr>
 	<!-- 댓글 있을때만 보이게 -->
		<c:if test="${commentList != null}">
		<tr>
			<td colspan="2">
				<c:forEach var="c" items="${commentList}">
					${c.cnum} : ${c.mnum} : ${c.comdate}
						<br>
					&nbsp;${c.recomment}<br><br>
				<%-- <c:if test="${sessionScope.loginUser == c.mnum || sessionScope.loginUser.email=='admin@aaa.bbb'}">
					<a href="redelete.bo?num=${c.num}&seqnum=${r.seqnum}&btype=${board.btype}">[삭제]</a>
				</c:if> --%>
					<hr>
				</c:forEach></td>
		</tr></c:if> 
	</table>
</body>
</html>















