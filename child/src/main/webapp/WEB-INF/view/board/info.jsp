<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 상세 보기</title>
<style type="text/css">
td {
	text-align: left;
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
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>
<script type="text/javascript">
function commentDelete(bnum, cnum){
	   var del = confirm("댓글을 삭제하시겠습니까?")
	   if(del){
		   location.href = "commentDelete.child?bnum="+bnum+"&cnum="+cnum;
		   alert("삭제했습니다.");
	   }
	   return false;
}

</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addred').hide()
		
		var btype = $('input[name=bType]').val();
		var score = $('input[name=score]').val();

		if (btype == 2) {
			switch (score) {
			case "0.5":
				$('#left1').addClass('on').prevAll('span').addClass('on');
				break;
			case "1.0":
				$('#right1').addClass('on').prevAll('span').addClass('on');
				break;
			case "1.5":
				$('#left2').addClass('on').prevAll('span').addClass('on');
				break;
			case "2.0":
				$('#right2').addClass('on').prevAll('span').addClass('on');
				break;
			case "2.5":
				$('#left3').addClass('on').prevAll('span').addClass('on');
				break;
			case "3.0":
				$('#right3').addClass('on').prevAll('span').addClass('on');
				break;
			case "3.5":
				$('#left4').addClass('on').prevAll('span').addClass('on');
				break;
			case "4.0":
				$('#right4').addClass('on').prevAll('span').addClass('on');
				break;
			case "4.5":
				$('#left5').addClass('on').prevAll('span').addClass('on');
				break;
			case "5.0":
				$('#right5').addClass('on').prevAll('span').addClass('on');
				break;
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
		
		$('#siren').click(function() {
			var check = confirm("신고하시겠습니까?");
			if (check) {
				$.ajax({
					url : "addRed.child",
					type : "get",
					data : {
						"mnum" : $('input[name=mnum]').val()
					}
				})
			}
			$('#siren').hide()
			$('#addred').show()
		})


	});
</script>
</head>
<body>
	<div align="center" style="margin-bottom: 30px;">
		<c:choose>
			<c:when test="${board.bType == 1}">
				<input type="button" value="자유게시판"
					class="w3-button w3-round-xxlarge"
					style="background-color: #FFC322; color: black" id="community">
			</c:when>
			<c:when test="${board.bType == 2}">
				<input type="button" value="후기게시판"
					class="w3-button w3-round-xxlarge"
					style="background-color: #FFC322; color: black" id="review">
			</c:when>
			<c:when test="${board.bType == 3}">
				<input type="button" value="거래게시판"
					class="w3-button w3-round-xxlarge"
					style="background-color: #FFC322; color: black" id="market">
			</c:when>
		</c:choose>
	</div>
	<input type="hidden" name="bType" value="${board.bType}">
	<input type="hidden" name="mnum" value="${board.mnum}">
	<input type="hidden" name="score" value="${board.score}">
	<table border="1" style="border-collapse: collapse; width: 60%;"
		align="center">
		<tr style="height: 30px;">
			<td width="15%" style="text-align: center;">작성자</td>
			<td width="90%">&nbsp;${board.nickname} <c:if
					test="${board.bType == 3}">
				&nbsp;<img src="${path}/decorator/siren.png" id="siren">
					<font id="addred" size="1" color="red"><b>신고완료</b></font>
				</c:if></td>
		</tr>
		<tr style="height: 30px;">
			<td style="text-align: center;">제목</td>
			<td>&nbsp;${board.subject}</td>
		</tr>
		<c:if test="${board.bType == 2}">
			<tr style="height: 30px;">
				<th style="text-align: center;">별점</th>
				<td style="padding-left: 5px;">
					<div class="starRev">
						<span class="starR1" id="left1">별1_왼쪽</span> <span class="starR2"
							id="right1">별1_오른쪽</span> <span class="starR1" id="left2">별2_왼쪽</span>
						<span class="starR2" id="right2">별2_오른쪽</span> <span
							class="starR1" id="left3">별3_왼쪽</span> <span class="starR2"
							id="right3">별3_오른쪽</span> <span class="starR1" id="left4">별4_왼쪽</span>
						<span class="starR2" id="right4">별4_오른쪽</span> <span
							class="starR1" id="left5">별5_왼쪽</span> <span class="starR2"
							id="right5">별5_오른쪽</span>
					</div>
				</td>
			</tr>
		</c:if>
		<tr>
			<td style="text-align: center; height: 400px;">내용</td>
			<td>
				<table width="100%" height="100%">
					<tr>
						<td>&nbsp;${board.content}</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:if
			test="${!empty board.file1 || !empty board.file2 || !empty board.file3}">
			<tr>
				<td style="text-align: center;">첨부파일</td>
				<td>&nbsp; <c:if test="${!empty board.file1}">
						<img src="../file/${board.file1}"
							style="width: 150px; height: 150px;">
					</c:if>&nbsp; <c:if test="${!empty board.file2}">
						<img src="../file/${board.file2}"
							style="width: 150px; height: 150px;">
					</c:if>&nbsp; <c:if test="${!empty board.file3}">
						<img src="../file/${board.file3}"
							style="width: 150px; height: 150px;">
					</c:if>
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2" style="text-align: center; height: 30px;"><c:if
					test="${sessionScope.loginUser.mnum == board.mnum}">
					<input type="button" id="update" value="수정">
					<input type="button" id="delete" value="삭제">
				</c:if> <input type="button" id="list" value="목록"></td>
		</tr>
		<!-- 댓글작성 -->
		<tr style="height: 30px;">
			<td style="text-align: center;">댓글</td>
			<td><form:form action="commentWrite.child" method="Post"
					modelAttribute="comment">
					<input type="hidden" name="bnum" value="${board.bnum}">
					<input type="hidden" name="mnum" value="${loginUser.mnum}">
							댓글 작성자 : ${sessionScope.loginUser.nickname}
					<form:textarea path="recomment"
						style="width:100%;height:100px;border:0;resize:none;"
						placeholder="댓글을 입력하세요."></form:textarea>
					<div align="right">
						<input type="submit" value="등록">
					</div>
				</form:form></td>
		</tr>
		<!-- --------------------------------------------------------------------------------------------------------- -->
		<tr>
			<td colspan="2"> 
				<c:forEach var="c" items="${commentList}" varStatus="stat">
				<%-- 	<c:choose>
					대댓글인 경우
						<c:when test="${c.refstep>0}">
						&nbsp;&nbsp;└${stat.count}
						<!-- 버튼 위에 놓으려고 여기에 작성함 -->
						<input type="button" id="recom" value="답글" onclick="$('#comm${stat.index}').show();">
						<!-- 작성자나 관리자인경우에만 수정,삭제 가능 -->
							<c:if test="${sessionScope.loginUser.mnum == c.mnum || sessionScope.loginUser.email=='admin@aaa.bbb'}">
								<!-- 댓글수정버튼  -->
								<input type="button" id="commentUpdate" value="수정"
									onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();">
								<input type="button" id="commentDelete" value="삭제"
									onclick="commentDelete(${c.bnum},${c.cnum})">
							</c:if>
							<br>
					&nbsp;&nbsp;&nbsp;회원번호 : ${c.mnum} &nbsp;&nbsp;&nbsp;&nbsp; (
					<f:formatDate value="${today}" pattern="yyyyMMdd" var="t" />
							<f:formatDate value="${c.comdate}" pattern="yyyyMMdd" var="c1" />
							<c:choose>
								<c:when test="${t==c1}">
									<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
								</c:when>
								<c:otherwise>
									<f:formatDate value="${c.comdate}" pattern="yy/MM/dd HH:mm:ss" />
								</c:otherwise>
							</c:choose>)
						
						<!-- 댓글 출력-->
							<div id="recontent${stat.index}">
								<div id="recomment${stat.index}" style="display: block">
									&nbsp;&nbsp;&nbsp;${c.recomment}<br>
								</div>
							
								<!-- 수정버튼 눌리고 댓글수정창 나옴-->
								<div id="recommentupd${stat.index}" style="display: none">
									<form:form action="commentUpdate.child" method="Post"
										modelAttribute="comment">
										<input type="hidden" name="bnum" value="${c.bnum}"> 
										<input type="hidden" name="cnum" value="${c.cnum}">
										&nbsp;&nbsp;&nbsp;<form:input path="recomment" value="${c.recomment}" />
										<input type="submit" value="수정">
										<input type="button" id="x" value="수정취소"
											onclick="$('#recomment${stat.index}').show();$('#recommentupd${stat.index}').hide();">
									</form:form>
								</div>
							</div>
							<div id="rere${stat.index}">
						<div id="comm2${stat.index}" style="display: block">
						
						</div>
						<!-- 답글버튼 눌리고 대댓글창 나옴-->
						<div id="comm${stat.index}" style="display: none">
							<form:form action="recomment.child" method="Post" modelAttribute="comment"
								style="border:1px solid black; background-color:#f7f7f7;">
								<input type="hidden" name="bnum" value="${c.bnum}">
								<input type="hidden" name="cnum" value="${c.cnum}">
								<input type="hidden" name="mnum" value="${loginUser.mnum}">
									&nbsp;&nbsp;&nbsp;&nbsp;댓글 작성자 : ${sessionScope.loginUser.nickname}<br>
							 		&nbsp;&nbsp;&nbsp;&nbsp;<form:textarea path="recomment"
									style="width:80%;height:100px;border:0;resize:none;"
									placeholder="댓글을 입력하세요."></form:textarea>
								<div align="right">
									<input type="submit" value="등록"> 
									<input type="button" id="x" value="취소" onclick="$('#comm${stat.index}').show();$('#comm${stat.index}').hide();">
								<input type="button" id="commentUpdate" value="수정"
									onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();">
								</div>
							</form:form>
						</div>
					</div>
							
						</c:when> 
						---------------------------------------------------------------------------------------------------------  
						<c:otherwise> --%>
						<!-- 그냥 댓글인 경우 -->
						→${stat.count}
					<input type="button" id="recom" value="답글"
								onclick="$('#comm${stat.index}').show();">
							<c:if
								test="${sessionScope.loginUser.mnum == c.mnum || sessionScope.loginUser.email=='admin@aaa.bbb'}">
								<!-- 댓글수정버튼 -->
								<input type="button" id="commentUpdate" value="수정"
									onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();">
								<input type="button" id="commentDelete" value="삭제"
									onclick="commentDelete(${c.bnum},${c.cnum})">
							</c:if>
							<br>
							
					회원번호 : ${c.mnum} &nbsp;&nbsp;&nbsp;&nbsp; (
					<f:formatDate value="${today}" pattern="yyyyMMdd" var="t" />
							<f:formatDate value="${c.comdate}" pattern="yyyyMMdd" var="c1" />
							<c:choose>
								<c:when test="${t==c1}">
									<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
								</c:when>
								<c:otherwise>
									<f:formatDate value="${c.comdate}" pattern="yy/MM/dd HH:mm:ss" />
								</c:otherwise>
							</c:choose>)
						
						<!-- 댓글 출력-->
							<div id="recontent${stat.index}">
								<div id="recomment${stat.index}" style="display: block">
									&nbsp;${c.recomment}<br>
								</div>
						</div>
								<!-- 수정버튼 눌리고 댓글수정창 나옴-->
								<div id="recommentupd${stat.index}" style="display: none">
									<form:form action="commentUpdate.child" method="Post"
										modelAttribute="comment">
										<input type="hidden" name="bnum" value="${c.bnum}">
										<input type="hidden" name="cnum" value="${c.cnum}">
										<form:input path="recomment" value="${c.recomment}" />
										<input type="submit" value="수정">
										<input type="button" id="x" value="수정취소"
											onclick="$('#recomment${stat.index}').show();$('#recommentupd${stat.index}').hide();">
									</form:form>
								</div>
							<div id="rere${stat.index}">
						<div id="comm2${stat.index}" style="display: block">
							<c:if test="${c.refstep > 0}">
								→${c.cnum}
								${c.recomment}
							</c:if>
						</div>
						
						<!-- 답글버튼 눌리고 대댓글창 나옴--> 
						<div id="comm${stat.index}" style="display: none">
							<form:form action="recomment.child" method="Post" modelAttribute="comment"
								style="border:1px solid black; background-color:#f7f7f7;">
								<input type="hidden" name="bnum" value="${c.bnum}">
								<input type="hidden" name="cnum" value="${c.cnum}">
								<input type="hidden" name="mnum" value="${loginUser.mnum}">
									댓글 작성자 : ${sessionScope.loginUser.nickname}<br>
							 		<form:textarea path="recomment" 
									style="width:80%;height:100px;border:0;resize:none;"
									placeholder="댓글을 입력하세요."></form:textarea>
								<div align="right">
									<input type="submit" value="등록"> 
									<input type="button" id="x" value="취소" 
										onclick="$('#comm2${stat.index}').hide();$('#comm${stat.index}').hide();">
								<%-- <input type="button" id="commentUpdate" value="수정"
									onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();"> --%>
								</div> 
							</form:form>
						</div>
					</div>
							
						<%-- </c:otherwise>
					</c:choose> --%>
					<!--대댓글 -->
					
					<hr>
				</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>















