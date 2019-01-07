<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보수정</title>
</head>
<body>
<h2>사용자 수정</h2>
	<form:form modelAttribute="user" method="post" action="update.child?mnum=${sessionScope.loginUser.mnum}">
		<%--입력정보 문제 에러메세지 여기서 찍음. --%>
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		
		<table>
			<tr height="40px">
				<td>이메일</td>
				<td><form:input path="email" value="${sessionScope.loginUser.email}" readonly="true" /> <font color="red">
				<form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>닉네임</td>
				<td><form:input path="nickname" value="${sessionScope.loginUser.nickname}" readonly="true"/> <font color="red">
				<form:errors path="nickname" /></font></td>
			</tr>
			<tr height="40px">
				<td>새 비밀번호</td>
				<td><form:password path="password1" /> <font color="red">
				<form:errors path="password" /></font></td>
			</tr>
			<tr height="40px">
				<td>새 비밀번호 확인</td>
				<td><form:password path="password1" /> <font color="red">
				<form:errors path="password" /></font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="수정">
					<input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>





