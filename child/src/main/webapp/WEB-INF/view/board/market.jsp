<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if (searchType == null || searchType.length == 0) {
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
		$('#writebtn').click(function() {
			location.href = "writeForm.child?bType=3";
		})
	})
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
	
</script>
<style type="text/css">
.cmain {
	clear: both;
	width: 1200px;
	margin: 0 315px 0 315px;
}

.subMenu {
	float: left;
	width: 200px;
	margin: 0 auto;
	margin-bottom: 300px;
	border-bottom: 2px solid #dddddd;
}

.subMenu ul, li {
	margin: 0;
	margin-bottom: 1px;
	padding: 0;
	list-style: none;
}

.subMenu a {
	text-decoration: none;
}

.menu1 {
	height: 100px;
	background: #F6A5BC;
	color: white;
}

.active {
	display: block;
	height: 40px;
	background-color: #CE5B7C;
	color: white;
}
.active a {
	display: block;
	height: 100%;
	width: 100%;
	line-height: 40px;
}

.menu2 {
	height: 40px;
	background: #f7f7f7;
}

.menu2 a {
	display: block;
	height: 100%;
	width: 100%;
	line-height: 40px;
}

.board {
	float: right;
	width: 1000px;
	padding-left: 50px;
}

.search {
	margin-bottom: 50px;
	padding: 17px 0 17px 0;
	text-align: center;
	border: 1px solid #dbdbdb;
	background: #f7f7f7 80px center;
	width: 100%;
}

.filter {
	text-align: left;
	margin-bottom: 5px;
}

.btns {
	margin: 20px;
}
</style>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">게시판</font></li>
				<li class="menu2"><a href="../board/list.child?bType=1">자유게시판</a></li>
				<li class="menu2"><a href="../board/list.child?bType=2">후기게시판</a></li>
				<li class="active"><a href="../board/list.child?bType=3">거래게시판</a></li>
			</ul>
		</div>
		<div class="board">
			<img src="${path}/decorator/visual_02.gif" title="게시판">
			<div style="margin-top: 30px; margin-bottom: 30px; text-align: left;">
				<h3>거래 게시판</h3>
			</div>
			<div class="search">
				<form action="list.child" method="post" name="searchForm"
					onsubmit="return list(1)">
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="bType" value="3">
					<select name="searchType" id="searchType">
						<option value="0">선택</option>
						<option value="subject">제목</option>
						<option value="nickname">글쓴이</option>
						<option value="content">내용</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.searchType}' != '') {
							document.getElementById("searchType").value = '${param.searchType}';
						}
					</script>
					<input type="text" name="searchContent"
						value="${param.searchContent}" style="width: 150px;"> <input
						type="submit" value="검색">
				</form>
			</div>
			<div class="filter">
				<form action="list.child" method="post" name="filterForm">
					<input type="hidden" name="bType" value="3"> <input
						type="hidden" name="pageNum" value="1"> <select
						name="filterType" id="filterType" onchange="this.form.submit();" class="w3-border">
						<option value="">전체</option>
						<option value="1">삽니다</option>
						<option value="2">팝니다</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.filterType}' != '') {
							document.getElementById("filterType").value = '${param.filterType}';
						}
					</script>
					<font size="2">Total ${listcount}건 ${pageNum}페이지</font>
				</form>
			</div>
			<div>
				<table border="1" style="border-collapse: collapse; width: 100%;" class="w3-table w3-border w3-bordered">
					<c:if test="${listcount > 0}">
						<tr>
							<th width="8%" height="26" style="text-align:center">번호</th>
							<th width="50%" height="26" style="text-align:center">제목</th>
							<th width="14%" height="26" style="text-align:center">글쓴이</th>
							<th width="17%" height="26" style="text-align:center">날짜</th>
							<th width="11%" height="26" style="text-align:center">조회</th>
						</tr>
						<c:forEach items="${boardlist}" var="board">
							<tr align="center" valign="middle" bordercolor="#333333"
								onmouseover="this.style.backgroundColor='#FFF1F5'"
								onmouseout="this.style.backgroundColor=''">
								<td height="23" style="text-align:center">${boardcnt}</td>
								<c:set var="boardcnt" value="${boardcnt - 1}" />
								<td><a href="info.child?bnum=${board.bnum}"
									style="text-decoration: none;">
									&nbsp;[${(board.head==1)?"삽니다":"팝니다"}]
									&nbsp;${board.subject}</a></td>
								<td style="text-align:center">${board.nickname}</td>
								<td style="text-align:center"><fmt:formatDate value="${board.regdate}"
										pattern="YYYY-MM-dd" /></td>
								<td style="text-align:center">${board.readcnt}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${listcount == 0}">
						<tr>
							<th width="8%" height="26" style="text-align:center">번호</th>
							<th width="50%" height="26" style="text-align:center">제목</th>
							<th width="14%" height="26" style="text-align:center">글쓴이</th>
							<th width="17%" height="26" style="text-align:center">날짜</th>
							<th width="11%" height="26" style="text-align:center">조회</th>
						</tr>
						<tr>
							<td colspan="5">등록된 게시물이 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<div class="btns">
					<c:if test="${pageNum > 1}">
					<a href="javascript:list(${pageNum - 1})"><i class="material-icons" style="vertical-align: middle;">arrow_back</i></a>&nbsp;
					</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==pageNum}"><font size="4">${a}</font>&nbsp;</c:if>
						<c:if test="${a!=pageNum}"><a href="javascript:list(${a})"><font size="4">${a}</font></a>&nbsp;</c:if>
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