<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 확인하기</title>
<script type="text/javascript">
function allchkbox(chk) {
	var chks = document.getElementsByName("checkBoard"); 
	for(var i=0; i<chks.length; i++) {
		chks[i].checked = chk.checked;
	}
}

function deleteCheck(){
	var chk = confirm("게시글을 삭제하시겠습니까?");
	if(chk){
		alert("삭제했습니다.");
		return true;
	} else return false;
}
</script>
<style type="text/css">
.mylist{
	border-collapse:collapse;
}
tr,td {
	border : 1px solid black;
	text-align : center;
}
</style>
</head>
<body>
	<div align="center">
		<h4>&lt;본인이 작성한 게시글 목록&gt;</h4>
		<table class="mylist" >
			<form:form action="../user/myBoardDelete.child" onsubmit="return deleteCheck()" name="f" method="post">
				<input type="hidden" name="bnum" value="${board.bnum}">
				<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
				<tr>  
					<td><strong><input type="checkbox" name="allchk" onchange="allchkbox(this)"></strong></td> 
					<td style="width : 50px;"><strong>글번호</strong></td>
					<td style="width : 80px;"><strong>닉네임</strong></td>
					<td style="width : 260px;"><strong>제목</strong></td>
					<td style="width : 120px;"><strong>작성일</strong></td>
				</tr>
				<c:forEach items="${myboard}" var="myboard">
					<tr>
						<td><input type="checkbox" name="checkBoard" value="${myboard.bnum}"></td>
						<td>${myboard.bnum}</td>
						<td>${nickname}</td>
						<td><a href="../board/info.child?bnum=${myboard.bnum}">${myboard.subject}</a></td>
						<td><fmt:formatDate value="${myboard.regdate}"
										pattern="YYYY-MM-dd" /></td>
					</tr>
				</c:forEach> 
					<input type="submit" value="삭제" ><br><br>
			</form:form>
		</table>
	</div> 
</body>
</html>