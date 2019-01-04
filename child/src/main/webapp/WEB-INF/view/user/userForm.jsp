<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 등록</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
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
<style type="text/css">
.joinForm {
	border-radius: 5px;
	margin: 10% auto;
	width: 30%;
	background-color: #f2f2f2;
	text-align: center;
}

.inner {
	display:
}

.inin {
	margin: 10px 0;
}

input[type=text], input[type=password] {
	text-align: center;
	padding: 10px;
	margin: 8px;
	width: 90%;
	border-radius: 4px;
}

input[type=submit], input[type=reset] {
	background-color: #666666;
	color: white;
	padding: 10px;
	margin: 8px;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit] :hover, input[type=reset]:hover {
	background-color: #333333;
}

#checkMsg {
	font-size: 12px;
}

#checkPwd {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
	<div class="joinForm">
		<form:form modelAttribute="user" method="post" action="userEntry.child" name="form" id="form">
			<h2>사용자 등록</h2>
			<spring:hasBindErrors name="user">
				<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}" />
					</c:forEach>
				</font>
			</spring:hasBindErrors>

			<div class="inin">
				<form:input path="email" placeholder="아이디를 입력하세요(e-mail 형식)" id="email" />
				<font color="red"><br>
				<form:errors path="email" /></font>
			</div>

			<div class="inin">
				<form:password path="password" placeholder="비밀번호를 입력하세요." />
				<font color="red"><br>
				<form:errors path="password" /></font>
				
				<form:password path="password1" placeholder="비밀번호 확인" />
				<font color="red"><form:errors path="password1" /></font>
			</div>
			<!-- ajax사용 부분 DB요청 해야 함.  -->
			
			
			<!-- 주소칸 -->
			<div class="form-group">                   
			<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
			    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
			</div>
			<div class="form-group">
			    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
			    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
			</div>
			
						
			
			<!-- 주소칸 -->
			<div class="inin">
				<form:input path="nickname" placeholder="닉네임을 입력하세요" />
				<font color="red"><br>
				<form:errors path="nickname" /></font>
			</div>
			<!-- ajax사용 부분 DB요청 해야 함.  -->

			<div class="inin">
				<input type="submit" value="가입"> <input type="reset"
					value="재작성">
			</div>

		</form:form>
	</div>
</body>
</html>


<!-- <script>
/* $(".check").click(function(){
$.ajax({
	url : "mailauth.child",
	type : "post",
	dataType : "json",
	success : function(e){
		console.log(e.list[0].s_user)
		console.log(e.list[1].s_user)
	},
	error : function(){
		alert('error');
	}
});
}); */
/* function validateEmail(sEmail) {
var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
if (filter.test(sEmail)) {
return true;
}
else {
	return false;
}
}
$(document).ready(function() {
$('#check').click(function() {
var sEmail = $('#email').val();
if ($.trim(sEmail).length == 0) {
alert('Please enter valid email address');
e.preventDefault();
}
if (validateEmail(sEmail)) {
alert('올바른 이메일입니다');
}
else {
alert('잘못된 이메일입니다');
e.preventDefault();
}
});
}); */
</script> -->

<%-- <div class="inin" style="display: inline;">
				<button	style="background-color: #33CC99; width: 90%; border-radius: 10px;"
					onclick="javascript:alert('구현안됨')">인증번호 전송</button>
			</div>

			<div class="inin" style="display: inline;">
				<form:input path="authnum" placeholder="인증번호를 입력하세요" />
				<font color="red"><br>
				<form:errors path="authnum" /></font>
				<button
					style="background-color: #33CC99; width: 90%; border-radius: 10px;"
					id="check" onclick="javascript:alert('구현안됨')">인증번호 확인</button>
			</div> --%>