<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 수정하기</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
td { 
   text-align : left;
}
th {
   background-color:#eeeeee;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
<script type="text/javascript">
   function file_delete1() {
      document.f.file1.value = "";
      file_desc.style.display = "none";
   }
   function file_delete2() {
      document.f.file2.value = "";
      file_desc.style.display = "none";
   }
   function file_delete3() {
      document.f.file3.value = "";
      file_desc.style.display = "none";
   }
</script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
   $('#tr1').hide();
   $('#tr2').hide();
   $('.starRev span').click(function(){
      var starRevId = $(this).attr('id');
      $(this).parent().children('span').removeClass('on');
      $(this).addClass('on').prevAll('span').addClass('on');
      switch(starRevId){
      case "left1": $("#score").val('0.5'); break;
      case "right1": $("#score").val('1.0'); break;
      case "left2": $("#score").val('1.5'); break;
      case "right2": $("#score").val('2.0'); break;
      case "left3": $("#score").val('2.5'); break;
      case "right3": $("#score").val('3.0'); break;
      case "left4": $("#score").val('3.5'); break;
      case "right4": $("#score").val('4.0'); break;
      case "left5": $("#score").val('4.5'); break;
      case "right5": $("#score").val('5.0'); break;
      }
      return false;
   });

   $('#box1').click(function() {
      $('#tr1').show();
   });
   $('#box2').click(function() {
      $('#tr2').show();
   });
   
   $('#list').click(function() {
      location.href = "list.child?bType=" + $('input[name=bType]').val();
   });
   $('form').submit(function() {
      var check = confirm('등록하시겠습니까?');
      var btype = $('input[name=bType]').val();
      var head = $('select[name=head]').val();
      if (check) {
         if (btype == 2){
            return check_submit;            
         } else {
            if (head.length == 0){
               alert("말머리를 선택하세요");
               return false;
            } else {
               return true;
            }
         }
      }
   });
});
</script>
</head>
<body>
<div align="center" style="margin-bottom:30px;">
<c:choose>
   <c:when test="${board.bType == 1}">
   <input type="button" value="자유게시판" class="w3-button w3-round-xxlarge" style="background-color:#FFC322; color:black" id="community">
   </c:when>
   <c:when test="${board.bType == 2}">
<input type="button" value="후기게시판" class="w3-button w3-round-xxlarge" style="background-color:#FFC322; color:black" id="review">
   </c:when>
   <c:when test="${board.bType == 3}">
   <input type="button" value="거래게시판" class="w3-button w3-round-xxlarge" style="background-color:#FFC322; color:black" id="market">
   </c:when>
</c:choose>
</div>
<form:form modelAttribute="board" action="update.child" enctype="multipart/form-data" name="f" method="post">
   <input type="hidden" name="bType" value="${board.bType}">
   <input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
   <input type="hidden" name="score" id="score" value="0">
   <table border="1" style="border-collapse:collapse; width:60%;" align="center">
      <tr style="height:30px;">
         <th style="text-align:center;">제목</th>
         <td style="vertical-align:middle;">
         <c:if test="${board.bType != 2 }">
            <select name="head" style="width:20%;">
               <option value="">선택하세요</option>
            <c:if test="${board.bType == 1}">
               <option value="1">육아꿀팁</option>
               <option value="2">시설추천</option>
            </c:if>
            <c:if test="${board.bType == 3}">
               <option value="1">삽니다</option>
               <option value="2">팝니다</option>
            </c:if>
            </select>
            </c:if>&nbsp;<form:input path="subject" style="width:77%;border:0;" value="${board.subject}"/>
         <font color="red"><form:errors path="subject" /></font>
      </tr>
      <c:if test="${board.bType == 2}">
      <tr style="height:30px;">
         <th style="text-align:center;">별점</th>
         <td><div class="starRev">
            <span class="starR1 on" id="left1">별1_왼쪽</span>
            <span class="starR2 on" id="right1">별1_오른쪽</span>
            <span class="starR1 on" id="left2">별2_왼쪽</span>
            <span class="starR2 on" id="right2">별2_오른쪽</span>
            <span class="starR1 on" id="left3">별3_왼쪽</span>
            <span class="starR2 on" id="right3">별3_오른쪽</span>
            <span class="starR1" id="left4">별4_왼쪽</span>
            <span class="starR2" id="right4">별4_오른쪽</span>
            <span class="starR1" id="left5">별5_왼쪽</span>
            <span class="starR2" id="right5">별5_오른쪽</span>
         </div></td>
      </tr>
      </c:if>
      <tr style="height:400px;">
         <th style="text-align:center;">내용</th>
         <td style="padding:5px;vertical-align:middle;"><form:textarea path="content" style="width:100%;height:400px;border:0;resize:none;" placeholder="내용을 입력하세요" />
         <font color="red"><form:errors path="content" /></font>
      </tr>
      
      <c:if test="${!empty board.file1}">
      <tr style="height:30px;">
         <th style="text-align:right;"><a href="#">
         <i class="material-icons" style="vertical-align:middle;float:left;" id="box1">add_box</i></a>
               첨부파일1&nbsp;</th>
         <td>
        <a href="../file/${board.file1}">${board.file1}</a>
            <input type="file" name="multi1">
            <a href="javascript:file_delete1()">[첨부파일삭제]</a></td>
      </tr>
      </c:if>
      <c:if test="${!empty board.file2}">
      <tr id="tr1" style="height:30px;">
         <th style="text-align:right;"><a href="#">
         <i class="material-icons" style="vertical-align:middle;float:left;" id="box2">add_box</i></a>
               첨부파일2&nbsp;</th>
         <td>
        <a href="../file/${board.file2}">${board.file2}</a>
           <input type="file" name="multi2">
           <a href="javascript:file_delete2()">[첨부파일삭제]</a></td>
      </tr></c:if>
      
      <c:if test=" ${!empty board.file3} ">
      <tr id="tr2" style="height:30px;">
         <th style="text-align:right;">첨부파일3&nbsp;</th>
         <td>
            <a href="../file/${board.file3}">${board.file3}</a>
            <input type="file" name="multi3">
            <a href="javascript:file_delete3()">[첨부파일삭제]</a></td>
      </tr>
      </c:if>
      <tr style="height:30px;">
         <td colspan="2" style="text-align:center;">
         <input type="submit" value="등록"><input type="button" id="list" value="목록">
         </td>
      </tr>
   </table>
</form:form>
</body>
</html>