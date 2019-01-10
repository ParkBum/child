<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 게시판</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchForm.searchContent.value = "";
			document.searchForm.pageNum.value = "1";
			location.href = "list.child?bType=3,pageNum=" + pageNum;
		} else {
			document.searchForm.pageNum.value = pageNum;
			document.searchForm.submit();
			return true;
		}
		return false;
	}
	
	$('document').ready(function() {
		$('#market').click(function() {
			location.href = "list.child?bType=3";
		});
	});
</script>
<style type="text/css">
.cmain {
	padding-left:600px;
}
.search {
	margin-bottom: 50px;
    padding: 17px 0 17px;
    text-align: center;
    border: 1px solid #dbdbdb;
    background: #f7f7f7 url(../../../images/skin/search_box/bg.gif) no-repeat 80px center;
    width: 800px;
}
.filter {
	margin-bottom: 5px;
}
</style>
</head>
<body>
<div class="cmain">
	<div style="margin-bottom:30px;">
		<h4>거래 게시판</h4>
	</div>
	<div class="search">
	<form action="list.child" method="post" name="searchForm" onsubmit="return list(1)">
		<input type="hidden" name="pageNum" value="1">
		<select name="searchType" id="searchType">
			<option value="subject" selected="selected">제목</option>
			<option value="nickname">글쓴이</option>
			<option value="content">내용</option>
		</select>&nbsp;
		<script type="text/javascript">
			if('${param.searchType}' != '') {
				document.getElementById("searchType").value = '${param.searchType}';
			}
		</script>
		<input type="text" name="searchContent" value="${param.searchContent}" style="width:150px;">
		<input type="submit" value="검색">
	</form>
	</div>
	<div class="filter">
		<form action="list.child" method="post" name="filterForm">
			<input type="hidden" name="bType" value="3">
			<input type="hidden" name="pageNum" value="1">
			<select name="filterType" id="filterType" onchange="this.form.submit();">
				<option value="">전체</option>
				<option value="1">삽니다</option>
				<option value="2">팝니다</option>
			</select>&nbsp;
			<script type="text/javascript">
				if('${param.filterType}' != '') {
					document.getElementById("filterType").value = '${param.filterType}';
				}
			</script>
		<font size="2">Total ${listcount}건 ${pageNum}페이지</font>
		</form>
	</div>
	<div>
	<table border="1" style="border-collapse:collapse; width:800px;">
		<c:if test="${listcount > 0}">
		<tr align="center" valign="middle" bordercolor="#212121">
			<th width="8%" height="26">번호</th>
			<th width="50%" height="26">제목</th>
			<th width="14%" height="26">글쓴이</th>
			<th width="17%" height="26">날짜</th>
			<th width="11%" height="26">조회</th>
		</tr>
		<c:forEach items="${boardlist}" var="board">
		<tr align="center" valign="middle" bordercolor="#333333" 
			onmouseover="this.style.backgroundColor='#FFF5C7'" 
			onmouseout="this.style.backgroundColor=''">
			<td height="23">${boardcnt}</td>
			<c:set var="boardcnt" value="${boardcnt - 1}" />
			<td style="text-align:left;">
			<a href="info.child?bnum=${board.bnum}" style="text-decoration:none;">&nbsp;[${(board.head==1)?"삽니다":"팝니다"}]&nbsp;${board.subject}</a></td>
			<td align="left">${board.nickname}</td> 
			<td align="center"><fmt:formatDate value="${board.regdate}" pattern="YYYY-MM-dd"/></td>
			<td align="right">${board.readcnt}</td>
		</tr>
		</c:forEach>
		
		<tr align="center" height="26">
			<td colspan="5">
				<c:if test="${pageNum > 1}"><a href="javascript:list(${pageNum - 1})">이전</a></c:if>
				<c:if test="${pageNum <= 1}">이전</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a==pageNum}">${a}</c:if>
				<c:if test="${a!=pageNum}"><a href="javascript:list(${a})">${a}</a></c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}"><a href="javascript:list(${pageNum + 1})">다음</a></c:if>
				<c:if test="${pageNum >= maxpage}">다음</c:if>
			</td>
		</tr>
		
		</c:if>
		<c:if test="${listcount == 0}">
		<tr>
			<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="5" align="right"><a href="writeForm.child?bType=3">글쓰기</a>
		</td>
	</table>
	</div>
</div>
</body>
</html>