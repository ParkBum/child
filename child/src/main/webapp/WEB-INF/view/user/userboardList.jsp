<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 확인하기</title>
<style type="text/css">
.mylist{
	border-collapse:collapse;
}
tr,td {
	border : 1px solid black;
	text-align : center;
}
</style>
</head>
<body>
	<div align="center">
		<h4>&lt;본인이 작성한 게시글 목록&gt;</h4>
		<table class="mylist" >
			<form:form action="../board/info.child" modelAttribute="board">
				<input type="hidden" name="bnum" value="${board.bnum}">
				<tr> 
					<td><strong>선택</strong></td> 
					<td style="width : 50px;"><strong>글번호</strong></td>
					<td style="width : 80px;"><strong>닉네임</strong></td>
					<td style="width : 260px;"><strong>제목</strong></td>
					<td style="width : 120px;"><strong>작성일</strong></td>
				</tr>
				<c:forEach items="${myboard}" var="board">
					<tr>
						<td><input type="checkbox" name="checkBoard"></td>
						<td>${board.bnum}</td>
						<td>${nickname}</td>
						<td><a href="../board/info.child?bnum=${board.bnum}">${board.subject}</a></td>
						<td><fmt:formatDate value="${board.regdate}"
										pattern="YYYY-MM-dd" /></td>
					</tr>
				</c:forEach>
			</form:form>
		</table>
					<br><input type="submit" value="삭제" onsubmit="return deleteCheck()">
	</div> 
</body>
</html>