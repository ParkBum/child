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
/* function list(pageNum) {
	location.href = "myBoard.child?mnum="+${user.mnum}+"&pageNum=" + pageNum;
return true;
} 
 */
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
.wrap {
	clear: both;
	width: 1200px;
	margin-left: 353px;
	margin-right: 353px;
}

.btns {
	margin: 30px 500px 0px 500px;
}

th, td {
	text-align: center !important;
	vertical-align: middle !important;
	height: 40px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="wrap">
		<h2>작성한 게시글 목록</h2>
		<font size="2">게시글명을 클릭하면 해당 게시글로 이동합니다.</font><br>
		<font size="2">게시글을 선택한 후 삭제버튼을 누르면 해당 글이 삭제됩니다.</font>
		<form:form action="../user/myBoardDelete.child" onsubmit="return deleteCheck()" name="f" method="post">
			<input type="hidden" name="bnum" value="${board.bnum}">
			<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
			<table  border="1" style="border-collapse: collapse;" class="w3-table w3-border w3-bordered">
				<tr>  
					<th width="7%" style="padding-left:8px;">전체&nbsp;<input type="checkbox" name="allchk" onchange="allchkbox(this)"></th> 
					<th width="6%">글번호</th>
					<th width="7%">게시판</th>
					<th width="45%">제목</th>
					<th width="7%">댓글 수</th>
					<th width="13%">작성 날짜</th>
					<th width="15%">비고</th>
				</tr>
				<c:forEach items="${myboard}" var="myboard">
					<tr>
						<td style="padding-left:8px;"><input type="checkbox" name="checkBoard" value="${myboard.bnum}"></td>
						<td>${myboard.bnum}</td>
						<td>${(myboard.bType == 1)?"자유":(myboard.bType == 2)?"후기":"거래"}</td>
						<td  style="text-align: left  !important; padding-left:20px; padding-right:20px;">
							<a href="../board/info.child?bnum=${myboard.bnum}"><c:if 
							test="${myboard.bType == 1}">[<c:if test="${myboard.head == 1}">육아꿀팁</c:if><c:if test="${myboard.head == 2}">시설추천</c:if>]</c:if><c:if 
							test="${myboard.bType == 2}">[${myboard.dcname}]</c:if><c:if 
							test="${myboard.bType == 3}">[<c:if test="${myboard.head == 1}">삽니다</c:if><c:if test="${myboard.head == 2}">팝니다</c:if>]</c:if>
						${myboard.subject}</a></td>
						<td>${myboard.commentcnt}</td>
						<td><fmt:formatDate value="${myboard.regdate}" pattern="YYYY-MM-dd" /></td>
						<td><c:if test="${myboard.bType == 3}"><a href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">${(myboard.boarddeal == 1)?"거래중":(myboard.boarddeal == 2)?"거래 완료":"거래 대기"}</a></c:if></td>
					</tr>
				</c:forEach>
				</table>
				<div class="btns">
					<input type="submit" value="삭제" class="w3-bar" style="width:100px;">
				</div>
			</form:form>
	</div> 
</body>
</html>