<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글쓰기</title>
<style type="text/css">
td {
	text-align : left;
}
</style>
</head>
<body>
<form:form modelAttribute="board" action="write.child" enctype="multipart/form-data" name="f">
	<input type="hidden" name="bType" value="${board.bType}">
	<table border="1" style="border-collapse:collapse; width:100%;">
		<tr>
			<td style="text-align:center;">제목</td>
			<td valign="middle">
				<select name="filterType" style="height:100%;">
					<option value="">선택하세요</option>
				<c:if test="${board.bType == 1}">
					<option value="1">육아꿀팁</option>
					<option value="2">시설추천</option>
				</c:if>
				<c:if test="${board.bType == 3}">
					<option value="1">삽니다</option>
					<option value="2">팝니다</option>
				</c:if>
				</select>&nbsp;<form:input path="subject" style="height:100%;" />
			<font color="red"><form:errors path="subject" /></font>
		</tr>
		<tr>
			<td style="text-align:center;">내용</td>
			<td><form:textarea path="content" rows="15" cols="80" />
			<font color="red"><form:errors path="content" /></font>
		</tr>
		<tr>
			<td style="text-align:center;">첨부파일</td>
			<td><input type="file" name="file1">
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
			<a href="javascript:document.f.submit()">게시물등록</a>
			<a href="list.shop">게시물목록</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>