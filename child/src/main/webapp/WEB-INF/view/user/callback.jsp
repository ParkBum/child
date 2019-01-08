<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"  charset="utf-8"></script>
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
<script type="text/javascript">
  $(document).ready(function() {
    var name = ${result}.response.name;
    var email = ${result}.response.email;
    /* $("#name").html("환영합니다. "+name+"님"); */
    $("#email").html("환영합니다. "+email+"님");
    });
  if(sessionScope.loginUser == null){
  location.href = "${pageContext.request.contextPath}/";
	  
  }
</script>

</head>
<body>
  <div style="background-color: #15a181; width: 100%; height: 80px; text-align: center; color: white;">
    <!-- <h3>Naver_Login Success</h3> -->
    <h3>어린이 집마련 프로젝트</h3>
  </div>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1초 뒤에 사라 지자 
     
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){location.href= "${pageContext.request.contextPath}/"},2000);
// 2초 뒤에 메인 화면 으로 가자  
    })
  </script>

</body>
</html>



<!-- <!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>네이버 로그인</title>
  
</head>
<body>
  네이버아이디로로그인 버튼 노출 영역
  <div id="naver_id_login"></div>
  //네이버아이디로로그인 버튼 노출 영역
  
</html>

2. callback.html
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
</body>
</html> -->



