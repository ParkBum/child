<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>중고물품거래 게시판</title>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchform.searchType.value;
		if (searchType == null || searchType.length == 0) { 
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = "1";
			location.href = "list.child?bType=3,pageNum=" + pageNum;
		} else {
			document.searchform.pageNum.value = pageNum;
			document.searchform.submit();
			return true;
		}
		return false;
	}
	function searchlist(pageNum) {
		var searchType = document.searchform.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = "1";
			location.href = "list.child?bType=3,pageNum=" + pageNum;
		} else {
			document.searchform.pageNum.value = pageNum;
			document.searchform.submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<table border="1" style="border-collapse: collapse; width: 100%">
		<tr>
			<td colspan="2" align="left">
				<form action="list.child" method="post" name="filterform" onsubmit="return filterlist(1)">
					<input type="hidden" name="pageNum" value="1">
					<select name="filterType" id="filterType">
						<option value="">머리말 분류</option>
						<option value="buy">삽니다</option>
						<option value="sell">팝니다</option>
					</select>&nbsp;
					<script type="text/javascript">
						if('${param.filterType}' != '') {
							document.getElementById("filterType").value = '${param.filterType}';
						}
					</script>
					<input type="text" name="searchContent" value="${param.searchContent}">
					<input type="submit" value="검색">
				</form>
			</td>
			<td colspan="5" align="center">
			<%--검색form --%>
				<form action="list.child" method="post" name="searchform"
					onsubmit="return list(1)">
					<input type="hidden" name="pageNum" value="1">
					<select name="searchType" id="searchType">
						<option value="">선택하세요</option>
						<option value="subject">제목</option>
						<option value="name">글쓴이</option>
						<option value="content">내용</option>
					</select>&nbsp;
					<script type="text/javascript">
						if ('${param.searchType}' != '') {
							document.getElementById("searchType").value = '${param.searchType}';
						}
					</script>
					<input type="text" name="searchContent" value="${param.searchContent}"> 
					<input type="submit" value="검색">
				</form><%--파라미터는 pageNum,searchType,serachContent 들어감 --%>
				
			</td>
		</tr>
			<%--조회할 게시글이 있는 경우 --%>
		<c:if test="${listcount > 0}">
			<tr align="center" valign="middle">
				<td colspan="4">Spring 게시판</td>
				<td>글개수:${listcount}</td>
			</tr>
			<tr align="center" valign="middle" bordercolor="#212121">
				<th width="8%" height="26">번호</th>
				<th width="50%" height="26">제목</th>
				<th width="14%" height="26">글쓴이</th>
				<th width="17%" height="26">날짜</th>
				<th width="11%" height="26">조회수</th>
			</tr>
			<%-- 글 목록 --%>
			<c:forEach var="board" items="${boardlist}">
				<tr align="center" valign="middle" bordercolor="#333333"
					onmouseover="this.style.backgroundColor='#5CD1E5'"
					onmouseout="this.style.backgroundColor=''">
					<td height="23">${boardcnt}</td>
					<c:set var="boardcnt" value="${boardcnt - 1 }" />
					<td align="left"> 
					<%--첨부파일 있는경우--%>
						<c:if test="${! empty board.fileurl}">
							<a href="../file/${board.fileurl}">@</a>
						</c:if>
						<%--첨부파일 없는경우--%>
						<c:if test="${empty board.fileurl}">
							&nbsp;&nbsp;&nbsp;</c:if>
					<%-- 답변글인지 아닌지. 답글이면 공백으로 띄워주기--%>
						<c:forEach begin="1" end="${board.reflevel}">&nbsp;&nbsp;&nbsp;</c:forEach>
						<c:if test="${board.reflevel > 0}">┗</c:if>	
					<a href="detail.shop?num=${board.num}">${board.subject}</a></td>
					<td align="left">${board.name}</td>
					<td align="center">${board.regdate}</td>
					<td align="right">${board.readcnt}</td>
				</tr>
			</c:forEach>
			<%-- 페이지 구분 출력 --%>
			<tr align="center" height="26">
				<td colspan="5">
				<c:if test="${pageNum > 1}">
						<%--하이퍼 링크 걸어줌. 2페이지면 1이 들어가서 위 함수로 감. --%>
						<a href="javascript:list(${pageNum - 1})">[이전]</a>
				</c:if> 
				<c:if test="${pageNum <= 1}">[이전]</c:if> <%--앞 페이지가없기때문에 링크 걸지않음. --%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a==pageNum}">[${a}]</c:if>
					<c:if test="${a!=pageNum}"><a href="javascript:list(${a})">[${a}]</a></c:if>
				</c:forEach>
				<%--다음 페이지 존재 --%>
					<c:if test="${pageNum < maxpage}">
						<a href="javascript:list(${pageNum+1})">[다음]</a>
					</c:if>
					<c:if test="${pageNum >= maxpage}">[다음]</c:if>
				</td>
			</tr>
		</c:if>
		<%--조회할 게시물 없는 경우 --%>
		<c:if test="${listcount == 0}">
			<tr>
				<td colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" align="right"><a href="write.child?bType=3">[글쓰기]</a></td>
		</tr>
	</table>
</body>
</html>











