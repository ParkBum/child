<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 확인하기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript">
function list(pageNum) {
	location.href = "myBoard.child?mnum="+${user.mnum}+"&pageNum=" + pageNum;
return true;
} 

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

th {
	text-align : center;
}
</style>
</head>
<body>
	<div align="center">
		<h4>&lt;본인이 작성한 게시글 목록&gt;</h4>
		<table class="mylist" class="w3-table w3-border w3-bordered" border="1">
			<form:form action="../user/myBoardDelete.child" onsubmit="return deleteCheck()" name="f" method="post">
				<input type="hidden" name="bnum" value="${board.bnum}">
				<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
				<tr>  
					<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th> 
					<th style="width : 50px;">글번호</th>
					<th style="width : 80px;">닉네임</th>
					<th style="width : 260px;">제목</th>
					<th style="width : 120px;">작성일</th>
				</tr>
				<c:forEach items="${myboard}" var="myboard">
					<tr>
						<td><input type="checkbox" name="checkBoard" value="${myboard.bnum}"></td>
						<td>${myboard.bnum}</td>
						<td>${nickname}</td>
						<td style="text-align:center;"><a href="../board/info.child?bnum=${myboard.bnum}">${myboard.subject}</a></td>
						<td><fmt:formatDate value="${myboard.regdate}"
										pattern="YYYY-MM-dd" /></td>
					</tr>
				</c:forEach> 
				<tr><td colspan="5" align="center">
					<input type="submit" value="삭제" ><br><br>
					</td></tr>
			</form:form>
		</table>
		<div class="btns">
				<c:if test="${pageNum > 1}">
					<a href="javascript:list(${pageNum - 1})"><i
						class="material-icons" style="vertical-align: middle;">arrow_back</i></a>&nbsp;
					</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a==pageNum}">
						<font size="4" class="w3-pale-red">&nbsp; ${a} &nbsp;</font>&nbsp;</c:if>
					<c:if test="${a!=pageNum}">
						<a href="javascript:list(${a})"><font size="4">&nbsp;
								${a} &nbsp;</font></a>&nbsp;</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}">
					&nbsp;<a href="javascript:list(${pageNum + 1})"><i
						class="material-icons" style="vertical-align: middle;">arrow_forward</i></a>
				</c:if>
			</div>
	</div> 
</body>
</html>