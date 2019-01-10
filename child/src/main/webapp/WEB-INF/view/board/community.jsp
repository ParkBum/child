<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����Խ���</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript">
	function searchList(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if (searchType == null || searchType.length == 0) {
			document.searchForm.searchContent.value = "";
			document.searchForm.pageNum.value = "1";
			location.href = "list.child?bType=1,pageNum=" + pageNum;
		} else {
			document.searchForm.pageNum.value = pageNum;
			document.searchForm.submit();
			return true;
		}
		return false;
	}
	$('document').ready(function() {
		$('#community').click(function() {
			location.href = "list.child?bType=1";
		});

		$('#review').click(function() {
			location.href = "list.child?bType=2";
		});
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
	margin: 0 auto;
}

.subMenu {
	float: left;
	width: 200px;
	margin: 0 auto;
	margin-bottom: 500px;
	border-bottom: 2px solid #dddddd;
}

.subMenu ul, li {
	margin: 0;
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
}
</style>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">�Խ���</font></li>
				<li class="active"><a href="../board/list.child?bType=1">�����Խ���</a></li>
				<li class="menu2"><a href="../board/list.child?bType=2">�ı�Խ���</a></li>
				<li class="menu2"><a href="../board/list.child?bType=3">�ŷ��Խ���</a></li>
			</ul>
		</div>
		<div class="board">
			<div style="margin-bottom: 30px; text-align: left;">
				<h4>���� �Խ���</h4>
			</div>
			<div class="search">
				<form action="list.child" method="post" name="searchform"
					onsubmit="return searchList(1)">
					<input type="hidden" name="pageNum" value="1"> <select
						name="searchType" id="searchType">
						<option value="subject" selected="selected">����</option>
						<option value="nickname">�۾���</option>
						<option value="content">����</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.searchType}' != '') {
							document.getElementById("searchType").value = '${param.searchType}';
						}
					</script>
					<input type="text" name="searchContent"
						value="${param.searchContent}" style="width: 150px;"> <input
						type="submit" value="�˻�">
				</form>
			</div>
			<div class="filter">
				<form action="list.child" method="post" name="filterForm">
					<input type="hidden" name="bType" value="1"> <input
						type="hidden" name="pageNum" value="1"> <select
						name="filterType" id="filterType" onchange="this.form.submit();">
						<option value="">��ü</option>
						<option value="1">���Ʋ���</option>
						<option value="2">��õ���</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.filterType}' != '') {
							document.getElementById("filterType").value = '${param.filterType}';
						}
					</script>
					<font size="2">Total ${listcount}�� ${pageNum}������</font>
				</form>
			</div>
			<div>
				<table border="1" style="border-collapse: collapse; width: 100%;">
					<c:if test="${listcount > 0}">
						<tr align="center" valign="middle" bordercolor="#212121">
							<th width="8%" height="26">��ȣ</th>
							<th width="50%" height="26">����</th>
							<th width="14%" height="26">�۾���</th>
							<th width="17%" height="26">��¥</th>
							<th width="11%" height="26">��ȸ</th>
						</tr>
						<c:forEach items="${boardlist}" var="board">
							<tr align="center" valign="middle" bordercolor="#333333"
								onmouseover="this.style.backgroundColor='#FFF5C7'"
								onmouseout="this.style.backgroundColor=''">
								<td height="23">${boardcnt}</td>
								<c:set var="boardcnt" value="${boardcnt - 1}" />
								<td style="text-align: left;"><a
									href="info.child?bnum=${board.bnum}"
									style="text-decoration: none;">&nbsp;[${(board.head==1)?"���Ʋ���":"�ü���õ"}]&nbsp;${board.subject}</a></td>
								<td align="left">${board.nickname}</td>
								<td align="center"><fmt:formatDate value="${board.regdate}"
										pattern="YYYY-MM-dd" /></td>
								<td align="right">${board.readcnt}</td>
							</tr>
						</c:forEach>

						<tr align="center" height="26">
							<td colspan="5"><c:if test="${pageNum > 1}">
									<a href="javascript:list(${pageNum - 1})">����</a>
								</c:if> <c:if test="${pageNum <= 1}">����</c:if> <c:forEach var="a"
									begin="${startpage}" end="${endpage}">
									<c:if test="${a==pageNum}">${a}</c:if>
									<c:if test="${a!=pageNum}">
										<a href="javascript:list(${a})">${a}</a>
									</c:if>
								</c:forEach> <c:if test="${pageNum < maxpage}">
									<a href="javascript:list(${pageNum + 1})">����</a>
								</c:if> <c:if test="${pageNum >= maxpage}">����</c:if></td>
						</tr>

					</c:if>
					<c:if test="${listcount == 0}">
						<tr>
							<td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="5" align="right"><a
							href="writeForm.child?bType=1">�۾���</a></td>
				</table>
			</div>
		</div>
	</div>
</body>
</html>