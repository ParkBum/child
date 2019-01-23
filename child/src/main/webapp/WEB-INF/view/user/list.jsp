<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 정보</title> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${path}/css/total.css">
<style type="text/css">

.board {
	text-align: left;
}

.btns2 {
	margin: 30px;
	text-align: right;
}

th {
	background-color: #f7f7f7;
}
</style>
<script type="text/javascript">
/* function delcheck(){
	var check = confirm("탈퇴하시겠습니까?");
	if(check){
		if(fdel.pass.value != ${user.password}){
			alert("비밀번호가 틀립니다.");
			return false;
		} else {
			alert("탈퇴가 완료되었습니다.");
			return true;
		}
	}
	return false; 
}

function check(){
	if(f.pass.value != ${user.password}){
		alert("비밀번호가 틀립니다.");
		return false;
	} else return true;
} */

	function allchkbox(chk) {
		var chks = document.getElementsByName("idchks");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = chk.checked;
		}
	}

	function admindelete(mnum) {
		var del = confirm("강제탈퇴 하시겠습니까?")
		if (del) {
			location.href = "delete.child?mnum=" + mnum;
		}
		return false;
	}
</script>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">회원 관리</font></li>
				<li class="active"><a href="../user/list.child?mnum=${sessionScope.loginUser.mnum}">회원 정보</a></li>
				<li class="menu2"><a href="../user/myBoardList.child?mnum=${sessionScope.loginUser.mnum}">작성글 목록</a></li>
				<li class="menu2"><a href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">거래요청 목록</a></li>
			</ul>
		</div>
		<div class="board">
		<div style="margin-top: 30px; margin-bottom: 30px;">
		<h3>회원 정보 관리</h3>
		</div>
		<form action="list.child?mnum=${user.mnum}" method="Post">
			<table border="1" style="border-collapse: collapse; width: 100%;"
				class="w3-table w3-border w3-bordered">
				<tr>
					<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
						<th colspan="2" style="text-align: center; padding-left:8px;">관리자 정보</th>
					</c:if>
					<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
						<th colspan="2" style="text-align: center; padding-left:8px;">회원 정보</th>
					</c:if>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">닉네임</th>
					<td>${sessionScope.loginUser.nickname}</td>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">아이디(이메일)</th>
					<td>${sessionScope.loginUser.email}</td>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">우편번호</th>
					<td>${sessionScope.loginUser.addr1}</td>
				</tr>
				<tr>
					<th style="text-align: center; padding-left:8px;">주소</th>
					<td>${sessionScope.loginUser.addr2}<c:if
							test="${!empty sessionScope.loginUser.addr2}">, </c:if>
						${sessionScope.loginUser.addr3}
					</td>
				</tr>
			</table>
		</form>

		<!-- 회원정보 -->
		<div class="btns2">
			<!--  <a href="../user/updateForm.child">회원정보수정</a>&nbsp; -->
			<a href="myBoardList.child?mnum=${sessionScope.loginUser.mnum}&pageNum=1">
				[내 게시글 목록]</a> 
			<a href="javascript:void(0)"
				onclick="document.getElementById('id02').style.display='block'">
				[회원정보 수정]</a>  
			<c:if test="${sessionScope.loginUser.email != 'admin@aaa.bbb'}">
				<a href="javascript:void(0)"
					onclick="document.getElementById('id01').style.display='block'">[회원탈퇴]</a>
			</c:if>
		</div>
		<!-- 회원탈퇴 모달창 -->
		<form action="userdelete.child" method="Post" name="fdel">
			<input type="hidden" name="mnum" value="${user.mnum}"> 
			<input type="hidden" name="password" value="${user.password}">
			<div id="id01" class="w3-modal"
				style="z-index: 4; padding-top: 280px;">
				<div class="w3-modal-content w3-animate-zoom" style="width: 20%">
					<div class="w3-container w3-padding"
						style="background-color: #FFF1F5;">
						<h2>회원탈퇴 비밀번호 확인</h2>
					</div>
					<div class="w3-panel">
						비밀번호 입력 : <input type="password" id="password" name="pass"
							style="width: 72%">
						<div class="w3-section">
							<a class="w3-button" style="background-color: #FFF1F5;"
								onclick="document.getElementById('id01').style.display='none'">
								닫기</a> <input type="submit"
								onclick="document.getElementById('id01').style.display='none'"
								class="w3-button w3-light-grey w3-right" value="확인">
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- 모달 내용 -->
		<form:form modelAttribute="user" method="post" name="f" action="passConfirm.child?mnum=${user.mnum}">
			<input type="hidden" name="email" value="${user.email}">
			<input type="hidden" name="addr1" value="${user.addr1}">
			<input type="hidden" name="addr3" value="${user.addr3}">
			<input type="hidden" name="password1" value="0000000">
			<input type="hidden" name="nickname" value="${user.nickname}">
			<div id="id02" class="w3-modal" style="z-index: 4; padding-top: 280px;">
				<div class="w3-modal-content w3-animate-zoom" style="width: 20%">
					<div class="w3-container w3-padding"
						style="background-color: #FFF1F5;">
						<h2>비밀번호 확인</h2>
					</div>
					<div class="w3-panel">
						비밀번호 입력 : <input type="password" id="password1" name="password" style="width: 72%">
						<div class="w3-section">
	<a class="w3-button" style="background-color: #FFF1F5;" onclick="document.getElementById('id02').style.display='none'">	닫기 </a> 
	<input type="submit" onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-light-grey w3-right" value="확인">
						</div>
					</div>
				</div>
			</div>
			</form:form>
		<!-- </form> -->
		&nbsp;
		<c:if test="${sessionScope.loginUser.email == 'admin@aaa.bbb'}">
			<form action="list.child" method="Post">
			<input type="hidden" name="pageNum" value="1">
				<table border="1" style="border-collapse: collapse; width: 100%"
					class="w3-table w3-border w3-bordered">
					<tr>
						<th colspan="5" style="text-align: center; padding-left:8px;">회원 목록</th>
					</tr>

					<tr>
						<th style="text-align: center; padding-left:8px;">회원번호</th>
						<th style="text-align: center;">아이디(이메일)</th>
						<th style="text-align: center;">닉네임</th>
						<th style="text-align: center;">경고</th>
						<th style="text-align: center;">비고</th>
					</tr>
					<c:forEach items="${userlist}" var="user">
						<tr>
							<td style="text-align: center; padding-left:8px;">${user.mnum}</td>
							<td>&nbsp;${user.email}</td>
							<c:choose>
								<c:when test="${user.red >= 3}">
									<td style="color: red; text-align: center;">${user.nickname}</td>
								</c:when>
								<c:otherwise>
									<td style="text-align: center;">${user.nickname}</td>
								</c:otherwise>
							</c:choose>

							<td style="text-align: center;">${user.red}</td>
							<td style="text-align: center;"><c:if
									test="${user.email != 'admin@aaa.bbb'}">
									<a href="javascript:admindelete(${user.mnum})">강제탈퇴</a>
								</c:if> <c:if test="${user.email == 'admin@aaa.bbb'}">탈퇴불가</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</c:if>
		</div>
	</div>
</body>
</html>













