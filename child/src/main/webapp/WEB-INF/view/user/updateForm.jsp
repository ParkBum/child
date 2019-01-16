<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
	$(".pass").keyup(function(){
		var pass1 = $("#newpass1").val();
		var pass2 = $("#newpass2").val();
		var msg="";
		if(pass1.length <= 4){
			msg = "비밀번호는 4자 이상만 설정가능합니다.";
			
		} else if(pass1 == pass2) {
			msg = "비밀번호 일치";
			$("#check").css("color","green");
		} else {
			msg = "비밀번호 불일치"
			$("#check").css("color","red");
		}
		$('#check').html(msg);
	})
});
	
	function execPostCode() {/* 주소 검색 부분 */
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
</head>
<body>
	<h2 align="center">사용자 수정</h2>
	<form:form modelAttribute="user" method="post"
		action="update.child?mnum=${sessionScope.loginUser.mnum}">
		<%--입력정보 문제 에러메세지 여기서 찍음. --%>
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>

		<table align="center">
			<tr height="40px">
				<td>이메일</td>
				<td><form:input path="email"
						value="${sessionScope.loginUser.email}" readonly="true"
						style="width:154%" /> <font color="red"> <form:errors
							path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>닉네임</td>
				<td><form:input path="nickname"
						value="${sessionScope.loginUser.nickname}" readonly="true"
						style="width:154%" /> <font color="red"> <form:errors
							path="nickname" /></font></td>
			</tr>
			<tr height="40px">
				<td>우편번호</td>
				<td><form:input path="addr1"
						value="${sessionScope.loginUser.addr1}" readonly="true"
						style="width:100%" /> <font color="red"> <form:errors
							path="addr1" /></font></td>
				<td><button type="button" class="btn btn-default"
						onclick="execPostCode()">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button></td>
			</tr>
			<tr height="40px">
				<td>주소</td>
				<td><form:input path="addr2"
						value="${sessionScope.loginUser.addr2}" readonly="true"
						style="width:154%" /> <font color="red"> <form:errors
							path="addr2" /></font></td>

			</tr>
			<tr height="40px">
				<td>상세주소</td>
				<td><form:input path="addr3"
						value="${sessionScope.loginUser.addr3}" style="width:154%" /> <font
					color="red"> <form:errors path="addr3" /></font></td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td><input type="button" value="비밀번호 변경하기" name="pass" style="width:154%"
						onclick="document.getElementById('id01').style.display='block'" /> 
				</td>
			</tr>
			
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="확인">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form:form>
			<!-- <a href="javascript:void(0)" align="right"
					onclick="document.getElementById('id01').style.display='block'">비밀번호변경하기</a>  -->
					<!-- 모달 내용 -->
					<form action="chgPass.child" method="Post" name="f">
					<input type="hidden" name="mnum" value="${user.mnum }">
					<div id="id01" class="w3-modal" style="z-index: 4">
						<div class="w3-modal-content w3-animate-zoom" style="width:20%">
							<div class="w3-container w3-padding"
								style="background-color: #FFF1F5;">
								<h2>비밀번호 변경하기</h2>
							</div>
							<div class="w3-panel">
								변경할 비밀번호 입력 : 
								<input type="password" class="pass" id="newpass1" name="newpass1" ><br><br>
								변경할 비밀번호 확인 : 
								<input type="password" class="pass" id="newpass2" name="newpass2" ><br>
								<font id="check" size="3" color="red"></font> 
								<div class="w3-section">
								<input type="submit" id="change"
									onclick="document.getElementById('id01').style.display='none'"
										class="w3-button w3-light-grey w3-center" value="확인">
									<i class="fa fa-paper-plane"></i>
								<a class="w3-button" style="background-color: #FFF1F5;"
									onclick="document.getElementById('id01').style.display='none'">
										닫기<i class="fa fa-remove"></i></a> 
								</div>
							</div>
						</div>
					</div>
					</form>
</body>
</html>





