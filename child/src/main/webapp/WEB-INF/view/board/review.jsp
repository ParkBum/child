<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자유게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="${path}/css/total.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if (searchType == null || searchType.length == 0) {
			document.searchForm.searchContent.value = "";
			document.searchForm.pageNum.value = "1";
			location.href = "list.child?bType=2&pageNum=" + pageNum;
		} else {
			document.searchForm.pageNum.value = pageNum;
			document.searchForm.submit();
			return true;
		}
		return false;
	}
	

	function searchCheck(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if (searchType == null || searchType == "" || searchType.length == 0) {
			alert("검색 조건을 선택하세요");
			return false;
		} else {
			document.searchForm.pageNum.value = pageNum;
			document.searchForm.submit();
			return true;
		}
		return false;
	}
	
	$('document').ready(function() {
		$('#writebtn').click(function() {
			location.href = "writeForm.child?bType=2";
		})
	})
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">게시판</font></li>
				<li class="menu2"><a href="../board/list.child?bType=1">자유게시판</a></li>
				<li class="active"><a href="../board/list.child?bType=2">후기게시판</a></li>
				<li class="menu2"><a href="../board/list.child?bType=3">거래게시판</a></li>
			</ul>
		</div>
		<div class="board">
			<img src="${path}/decorator/visual_02.gif" title="게시판">
			<div style="margin-top: 30px; margin-bottom: 30px; text-align: left;">
				<h3>후기 게시판</h3>
			</div>
			<div class="search">
				<form action="list.child" method="post" name="searchForm"
					onsubmit="return searchCheck(1)">
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="bType" value="2">
					<select name="searchType" id="searchType" style="width:80px;">
						<option value="">선택</option>
						<option value="dcname">어린이집</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.searchType}' != '') {
							document.getElementById("searchType").value = '${param.searchType}';
						}
					</script>
					<input type="text" name="searchContent"
						value="${param.searchContent}" style="width: 200px;">&nbsp;
						<input type="submit" value="검색">
				</form>
			</div>
			<div class="filter">
				<font size="2">Total ${listcount}건 ${pageNum}페이지</font>
			</div>
			<div>
				<table border="1" style="border-collapse: collapse; width: 100%;" class="w3-table w3-border w3-bordered">
					<c:if test="${listcount > 0}">
						<tr>
							<th width="8%" height="26" style="text-align:center; padding-left:8px;">번호</th>
							<th width="50%" height="26" style="text-align:center">제목</th>
							<th width="14%" height="26" style="text-align:center">글쓴이</th>
							<th width="17%" height="26" style="text-align:center">날짜</th>
							<th width="11%" height="26" style="text-align:center">조회</th>
						</tr>
						<c:forEach items="${boardlist}" var="board">
							<tr align="center" valign="middle" bordercolor="#333333"
								onmouseover="this.style.backgroundColor='#FFF1F5'"
								onmouseout="this.style.backgroundColor=''">
								<td height="23" style="text-align:center; padding-left:8px;">${boardcnt}</td>
								<c:set var="boardcnt" value="${boardcnt - 1}" />
								<td><a href="info.child?bnum=${board.bnum}" style="text-decoration: none;">
								&nbsp;[${board.dcname}] ${board.subject}</a>
								<c:if test="${board.commentcnt != 0}">
										<i class="fa fa-comment-o w3-margin-left"><font size="1" color="red">${board.commentcnt}</font></i>
									</c:if></td>
								<td style="text-align:center">${board.nickname}</td>
								<td style="text-align:center"><fmt:formatDate value="${board.regdate}"
										pattern="YYYY-MM-dd" /></td>
								<td style="text-align:center">${board.readcnt}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${listcount == 0}">
						<tr>
							<th width="8%" height="26" style="text-align:center; padding-left:8px;">번호</th>
							<th width="50%" height="26" style="text-align:center">제목</th>
							<th width="14%" height="26" style="text-align:center">글쓴이</th>
							<th width="17%" height="26" style="text-align:center">날짜</th>
							<th width="11%" height="26" style="text-align:center">조회</th>
						</tr>
						<tr>
							<td colspan="5" style="padding-left:8px;">등록된 게시물이 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<div class="btns">
					<c:if test="${pageNum > 1}">
					<a href="javascript:list(${pageNum - 1})"><i class="material-icons" style="vertical-align: middle;">arrow_back</i></a>&nbsp;
					</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==pageNum}"><font size="4" class="w3-pale-red">&nbsp; ${a} &nbsp;</font>&nbsp;</c:if>
						<c:if test="${a!=pageNum}"><a href="javascript:list(${a})"><font size="4">&nbsp; ${a} &nbsp;</font></a>&nbsp;</c:if>
					</c:forEach>
					<c:if test="${pageNum < maxpage}">
					&nbsp;<a href="javascript:list(${pageNum + 1})"><i class="material-icons" style="vertical-align: middle;">arrow_forward</i></a>
					</c:if>
					<input type="button" value="글쓰기" id="writebtn" style="float:right;">
				</div>
			</div>
		</div>
	</div>
</body>
</html>