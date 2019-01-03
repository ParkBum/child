<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����Խ���</title>
<script type="text/javascript">
	function searchList(pageNum) {
		var searchType = document.searchForm.searchType.value;
		if(searchType == null || searchType.length == 0) {
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
</script>
</head>
<body>
	<table border="1" style="border-collapse:collapse; width:100%;">
		<tr style="border-left:hidden;border-right:hidden;border-top:hidden;">
			<td colspan="2" align="left" style="border-right:hidden;">
				<form action="list.child" method="post" name="filterForm">
					<input type="hidden" name="bType" value="1">
					<input type="hidden" name="pageNum" value="1">
					<select name="filterType" id="filterType" onchange="this.form.submit();">
						<option value="">�Ӹ��� �з�</option>
						<option value="1">���Ʋ���</option>
						<option value="2">�ü���õ</option>
					</select>&nbsp;
					<script type="text/javascript">
						if('${param.filterType}' != '') {
							document.getElementById("filterType").value = '${param.filterType}';
						}
					</script>
				</form>
			</td>
			<td colspan="3" align="right">
				<form action="list.child" method="post" name="searchForm" onsubmit="return searchList(1)">
					<input type="hidden" name="pageNum" value="1">
					<select name="searchType" id="searchType">
						<option value="">�����ϼ���</option>
						<option value="subject">����</option>
						<option value="name">�۾���</option>
						<option value="content">����</option>
					</select>&nbsp;
					<script type="text/javascript">
						if('${param.searchType}' != '') {
							document.getElementById("searchType").value = '${param.searchType}';
						}
					</script>
					<input type="text" name="searchContent" value="${param.searchContent}">
					<input type="submit" value="�˻�">
				</form>
			</td>
		</tr>
		
		<c:if test="${listcount > 0}">
		<tr align="center" valign="middle">
			<td colspan="4">���� �Խ���</td>
			<td>�۰���:${listcount}</td>
		</tr>
		<tr align="center" valign="middle" bordercolor="#212121">
			<th width="8%" height="26">��ȣ</th>
			<th width="50%" height="26">����</th>
			<th width="14%" height="26">�۾���</th>
			<th width="17%" height="26">��¥</th>
			<th width="11%" height="26">��ȸ��</th>
		</tr>
		
		<c:forEach items="${boardlist}" var="board">
		<tr align="center" valign="middle" bordercolor="#333333" 
			onmouseover="this.style.backgroundColor='#5CD1E5'" 
			onmouseout="this.style.backgroundColor=''">
			<td height="23">${boardcnt}</td>
			<c:set var="boardcnt" value="${boardcnt - 1}" />
			<td style="text-align:left;">
			<a href="detail.child?num=${board.bnum}" style="text-decoration:none;">&nbsp;[${(board.head==1)?"���Ʋ���":"�ü���õ"}]&nbsp;${board.subject}</a></td>
			<td align="left">${board.nickname}</td> 
			<td align="center"><fmt:formatDate value="${board.regdate}" pattern="YYYY-MM-dd"/></td>
			<td align="right">${board.readcnt}</td>
		</tr>
		</c:forEach>
		
		<tr align="center" height="26">
			<td colspan="5">
				<c:if test="${pageNum > 1}"><a href="javascript:list(${pageNum - 1})">����</a></c:if>
				<c:if test="${pageNum <= 1}">����</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a==pageNum}">${a}</c:if>
				<c:if test="${a!=pageNum}"><a href="javascript:list(${a})">${a}</a></c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}"><a href="javascript:list(${pageNum + 1})">����</a></c:if>
				<c:if test="${pageNum >= maxpage}">����</c:if>
			</td>
		</tr>
		
		</c:if>
		<c:if test="${listcount == 0}">
		<tr>
			<td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="5" align="right"><a href="write.child">�۾���</a>
		</td>
	</table>
</body>
</html>