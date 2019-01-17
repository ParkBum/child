<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 요청 목록</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
.wrap {
	clear: both;
	width: 1200px;
	margin-left: 350px;
}

th, td {
	text-align: center !important;
}
</style>
</head>
<body>
	<div class="wrap">
	<h2>거래 요청 목록</h2>
		<font size="2">거래 수락시에만 요청 회원 정보에 연락처가 보이며, 거래완료 후에는 연락처가 자동 삭제됩니다.</font><br>
		<font size="2">거래 수락 후 7일이 지난 거래는 완료로 자동 전환됩니다.</font>
		<table border="1" style="border-collapse: collapse;" class="w3-table w3-border w3-bordered">
			<tr>
				<th width="10%">거래 상태</th>
				<th width="50%">해당 게시글</th>
				<th width="20%">요청 회원 정보</th> <!-- 연락처 여기에 포함 -->
				<th width="20%">수락 여부</th>
			</tr>
			<c:forEach items="${messageList}" var="msg">
			<tr>
				<td>
				<c:choose>
				<c:when test="${msg.deal == 1}">
					<font color="blue">거래중</font>
				</c:when>
				<c:when test="${msg.deal == 2}">
					<font>거래 완료</font>
				</c:when>
				<c:when test="${msg.deal == 3}">
					<font>거래 거절</font>
				</c:when>
				<c:otherwise>
					<font color="red">대기중</font>
				</c:otherwise>
				</c:choose>
				</td>
				<td style="text-align: left  !important; padding-left:20px; padding-right:20px;">
				<c:if test="${msg.board.mkinds == 1}">[완구]</c:if>
				<c:if test="${msg.board.mkinds == 2}">[도서]</c:if>
				<c:if test="${msg.board.mkinds == 3}">[의류]</c:if>
				<c:if test="${msg.board.mkinds == 4}">[기타]</c:if>				
				${msg.board.subject}</td>
				<td>${msg.user.nickname}&nbsp;<c:if test="${msg.deal == 1}"><i class="material-icons" style="vertical-align: middle; font-size: 18px; width:16px;">phone_iphone</i>${msg.phone}</c:if></td>
				<td><input type="button" value="수락" id="yes">&nbsp;<input type="button" value="거절" id="no"></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>