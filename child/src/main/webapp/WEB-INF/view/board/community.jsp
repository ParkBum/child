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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="${path}/css/total.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if (searchType == null || searchType == "" || searchType.length == 0) {
			document.searchForm.searchContent.value = "";
			document.searchForm.pageNum.value = "1";
			location.href = "list.child?bType=1&pageNum=" + pageNum;
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
			alert("�˻� ������ �����ϼ���");
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
			location.href = "writeForm.child?bType=1";
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
				<li class="menu1"><font style="line-height:100px;" size="5">�Խ���</font></li>
				<li class="active"><a href="../board/list.child?bType=1">�����Խ���</a></li>
				<c:if test="${!empty sessionScope.loginUser}"><li class="menu2"><a href="../board/list.child?bType=2">�ı�Խ���</a></li></c:if>
				<c:if test="${empty sessionScope.loginUser}"><li class="menu2"><a href="../user/loginForm.child">�ı�Խ���</a></li></c:if>
				<c:if test="${!empty sessionScope.loginUser}"><li class="menu2"><a href="../board/list.child?bType=3">�ŷ��Խ���</a></li></c:if>
				<c:if test="${empty sessionScope.loginUser}"><li class="menu2"><a href="../user/loginForm.child">�ŷ��Խ���</a></li></c:if>
			</ul>
		</div>
		<div class="board">
			<img src="${path}/decorator/visual_02.gif" title="�Խ���">
			<div style="margin-top: 30px; margin-bottom: 30px; text-align: left;">
				<h3>���� �Խ���</h3>
			</div>
			<div class="search">
				<form action="list.child" method="post" name="searchForm"
					onsubmit="return searchCheck(1)">
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="bType" value="1">
					<select name="searchType" id="searchType" style="width:80px;">
						<option value="">����</option>
						<option value="subject">����</option>
						<option value="content">����</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.searchType}' != '') {
							document.getElementById("searchType").value = '${param.searchType}';
						}
					</script>
					<input type="text" name="searchContent"
						value="${param.searchContent}" style="width: 200px;">&nbsp;
						<input type="submit" value="�˻�">
				</form>
			</div>
			<div class="filter">
				<form action="list.child" method="post" name="filterForm">
					<input type="hidden" name="bType" value="1"> <input
						type="hidden" name="pageNum" value="1"> <select
						name="filterType" id="filterType" onchange="this.form.submit();" class="w3-border">
						<option value="">��ü</option>
						<option value="1">���Ʋ���</option>
						<option value="2">�ü���õ</option>
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
				<table border="1" style="border-collapse: collapse; width: 100%;" class="w3-table w3-border w3-bordered">
					<c:if test="${listcount > 0}">
						<tr>
							<th width="8%" height="26" style="text-align:center; padding-left:8px;">��ȣ</th>
							<th width="50%" height="26" style="text-align:center">����</th>
							<th width="14%" height="26" style="text-align:center">�۾���</th>
							<th width="17%" height="26" style="text-align:center">��¥</th>
							<th width="11%" height="26" style="text-align:center">��ȸ</th>
						</tr>
						<c:forEach items="${boardlist}" var="board">
							<tr align="center" valign="middle" bordercolor="#333333"
								onmouseover="this.style.backgroundColor='#FFF1F5'"
								onmouseout="this.style.backgroundColor=''">
								<td height="23" style="text-align:center; padding-left:8px;">${boardcnt}</td>
								<c:set var="boardcnt" value="${boardcnt - 1}" />
								<td>
									<c:if test="${!empty sessionScope.loginUser}">
									<a href="info.child?bnum=${board.bnum}" style="text-decoration: none;">
									&nbsp;[${(board.head==1)?"���Ʋ���":"�ü���õ"}]&nbsp;${board.subject}</a>
									</c:if>
									<c:if test="${empty sessionScope.loginUser}">
									&nbsp;[${(board.head==1)?"���Ʋ���":"�ü���õ"}]&nbsp;${board.subject}</c:if>
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
							<th width="8%" height="26" style="text-align:center; padding-left:8px;">��ȣ</th>
							<th width="50%" height="26" style="text-align:center">����</th>
							<th width="14%" height="26" style="text-align:center">�۾���</th>
							<th width="17%" height="26" style="text-align:center">��¥</th>
							<th width="11%" height="26" style="text-align:center">��ȸ</th>
						</tr>
						<tr>
							<td colspan="5" style="padding-left:8px;">��ϵ� �Խù��� �����ϴ�.</td>
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
					<c:if test="${!empty sessionScope.loginUser}">
					<input type="button" value="�۾���" id="writebtn" style="float:right;">
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>