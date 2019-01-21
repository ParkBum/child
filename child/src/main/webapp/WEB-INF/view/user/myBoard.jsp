<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 확인하기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/css/total.css">
<script type="text/javascript">
function list(pageNum) {
	var mnum = document.f.mnum.value;
	location.href = "myBoardList.child?mnum="+mnum+"&pageNum=" + pageNum;
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

.board {
	text-align: left;
}

.btns2 {
	margin: 30px 500px 0px 500px;
}

th {
	background-color: #f7f7f7;
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
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">회원 관리</font></li>
				<li class="menu2"><a href="../user/list.child?mnum=${sessionScope.loginUser.mnum}">회원 정보</a></li>
				<li class="active"><a href="../user/myBoardList.child?mnum=${sessionScope.loginUser.mnum}">작성글 목록</a></li>
				<li class="menu2"><a href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">거래요청 목록</a></li>
			</ul>
		</div>
		<div class="board">
			<div style="margin-top: 30px; margin-bottom: 30px;">
			<h3>작성한 게시글 목록</h3>
			</div>
			<font size="2">게시글명을 클릭하면 해당 게시글로 이동합니다.</font><br>
			<font size="2">게시글을 선택한 후 삭제버튼을 누르면 해당 글이 삭제됩니다.</font>
			<form:form action="../user/myBoardDelete.child" onsubmit="return deleteCheck()" name="f" method="post">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="bnum" value="${board.bnum}">
			<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
			<table  border="1" style="border-collapse: collapse;" class="w3-table w3-border w3-bordered">
				<tr>  
					<th width="7%" style="padding-left:8px;">전체&nbsp;<input type="checkbox" name="allchk" onchange="allchkbox(this)"></th> 
					<th width="7%">글번호</th>
					<th width="7%">게시판</th>
					<th width="45%">제목</th>
					<th width="7%">댓글 수</th>
					<th width="12%">작성 날짜</th>
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
				<div class="btns2">
					<input type="submit" value="삭제" class="w3-bar" style="width:100px;">
				</div>
				<!-- 페이징 -->
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
			</form:form>
		</div>
	</div> 
</body>
</html>