<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/css/total.css">
<title>�Խù� �� ����</title>
<style type="text/css">
td {
	text-align: left;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript">
function list(pageNum) {
		location.href = "info.child?bnum="+${board.bnum}+"&pageNum=" + pageNum;
	return true;
} 

function chkSecret(){
	var secret = document.f.secret.value;
	if($("#secret").is(":checked")){
		secret = 1;
		document.f.secret.value	= secret;
		return true;
	}else {
		return true;
	}
}

function rechkSecret(){
	var secret = document.recomf.resecret.value;
	if($("#resecret").is(":checked")){
		return true;
	}else {
		return true;
	} 
}

function comment(){
	if(f.com.value.length == 0){
		alert("������ �Է��ϼ���");
		return false;
	} else return true;
	
} 

function commentDelete(bnum, cnum){
      var del = confirm("����� �����Ͻðڽ��ϱ�?")
      if(del){
         location.href = "commentDelete.child?bnum="+bnum+"&cnum="+cnum;
      }
      return false;
}

function phonecheck() {
   if (document.mf.phone1.value.length == 3){      
      if (document.mf.phone2.value.length == 4) {
         if (document.mf.phone3.value.length == 4) {
            alert("�Ǹ��ڿ��� ���ſ�û�� �����Ͽ����ϴ�.");
            return true;
         }
      }
   } 
   alert("�޴��� ��ȣ�� �Է��ϼ���");
   return false;
}

$(function() {         
   $(".inputs").keyup (function () {
      var charLimit = $(this).attr("maxlength");
      if (this.value.length >= charLimit) {
         $(this).next('.inputs').focus();
      }
      
      var phone1 = $("#phone1").val();
      var phone2 = $("#phone2").val();
      var phone3 = $("#phone3").val();
      var msg="";            
      if(phone1.length < 3) {
         msg = "�޴��� ��ȣ�� �Է��ϼ���";               
      } else if (phone2.length == 4 && phone3.length == 4) {
         msg = "�Է� Ȯ��";
         $("#check").css("color","green");
         $("#send").removeAttr("disabled");
      } else {
         msg = "�޴��� ��ȣ�� �Է��ϼ���"
         $("#check").css("color","red");
      }
      $('#check').html(msg);
   })
});

   $(document).ready(function() {
      $('#addred').hide()
      
      var btype = $('input[name=bType]').val();
      var score = $('input[name=score]').val();

      if (btype == 2) {
         switch (score) {
         case "0.5":
            $('#left1').addClass('on').prevAll('span').addClass('on');
            break;
         case "1.0":
            $('#right1').addClass('on').prevAll('span').addClass('on');
            break;
         case "1.5":
            $('#left2').addClass('on').prevAll('span').addClass('on');
            break;
         case "2.0":
            $('#right2').addClass('on').prevAll('span').addClass('on');
            break;
         case "2.5":
            $('#left3').addClass('on').prevAll('span').addClass('on');
            break;
         case "3.0":
            $('#right3').addClass('on').prevAll('span').addClass('on');
            break;
         case "3.5":
            $('#left4').addClass('on').prevAll('span').addClass('on');
            break;
         case "4.0":
            $('#right4').addClass('on').prevAll('span').addClass('on');
            break;
         case "4.5":
            $('#left5').addClass('on').prevAll('span').addClass('on');
            break;
         case "5.0":
            $('#right5').addClass('on').prevAll('span').addClass('on');
            break;
         }
      }

      $('#update').click(function() {
         var bnum = $('input[name=bnum]').val();
         location.href = "updateForm.child?bnum=" + bnum;
      })

      $('#delete').click(function() {
         var bnum = $('input[name=bnum]').val();
         var check = confirm("�����Ͻðڽ��ϱ�?");
         if (check) {
            location.href = "delete.child?bnum=" + bnum;
         }
      })

      $('#list').click(function() {
         var btype = $('input[name=bType]').val();
         location.href = "list.child?bType=" + btype;
      })
      
      $('#siren').click(function() {
         var check = confirm("�Ű��Ͻðڽ��ϱ�?");
         if (check) {
            $.ajax({
               url : "addRed.child",
               type : "get",
               data : {
                  "mnum" : $('input[name=mnum]').val()
               }
            })
            $('#siren').hide()
            $('#addred').show()
         }
      })
         
      $("input:text[numberOnly]").on("keyup", function() {
          $(this).val($(this).val().replace(/[^0-9]/g,""));
      });
      
   });
</script>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height: 100px;" size="5">�Խ���</font></li>
				<c:if test="${board.bType == 1}">
					<li class="active">
				</c:if>
				<c:if test="${board.bType != 1}">
					<li class="menu2">
				</c:if>
				<a href="../board/list.child?bType=1">�����Խ���</a>
				</li>
				<c:if test="${board.bType == 2}">
					<li class="active">
				</c:if>
				<c:if test="${board.bType != 2}">
					<li class="menu2">
				</c:if>
				<a href="../board/list.child?bType=2">�ı�Խ���</a>
				</li>
				<c:if test="${board.bType == 3}">
					<li class="active">
				</c:if>
				<c:if test="${board.bType != 3}">
					<li class="menu2">
				</c:if>
				<a href="../board/list.child?bType=3">�ŷ��Խ���</a>
				</li>
			</ul>
		</div>
		<div class="board">
			<img src="${path}/decorator/visual_05.gif" title="�Խ���">
			<div style="margin-top: 30px; margin-bottom: 30px; text-align: left;">
				<c:choose>
					<c:when test="${board.bType == 1}">
						<h3>���� �Խ���</h3>
					</c:when>
					<c:when test="${board.bType == 2}">
						<h3>�ı� �Խ���</h3>
					</c:when>
					<c:when test="${board.bType == 3}">
						<h3>�ŷ� �Խ���</h3>
					</c:when>
				</c:choose>
			</div>
			<input type="hidden" name="bType" value="${board.bType}"> <input
				type="hidden" name="mnum" value="${board.mnum}"> <input
				type="hidden" name="score" value="${board.score}">
			<table style="border-collapse: collapse; width: 100%;"
				class="w3-table w3-border w3-bordered">
				<tr style="height: 30px;">
					<td width="15%" style="text-align: center; padding-left: 8px;">�ۼ���</td>
					<td width="90%">&nbsp;${board.nickname} <c:if
							test="${board.bType == 3}">
							<c:set var="flag" value="0" />
							<c:forEach items="${messageList}" var="msg">
								<c:if test="${msg.buynum == sessionScope.loginUser.mnum}">
									<c:set var="flag" value="${flag + 1}" />
								</c:if>
							</c:forEach>
							<c:if test="${flag > 0}">
						&nbsp;<img src="${path}/decorator/siren.png" id="siren"
									style="cursor: pointer;">
								<font id="addred" size="1" color="red"><b>�Ű�Ϸ�</b></font>
							</c:if>
						</c:if></td>
				</tr>
				<tr style="height: 30px;">
					<td style="text-align: center; padding-left: 8px;">����</td>
					<td>&nbsp;[<c:if test="${board.bType == 1}">
                           ${(board.head==1)?"���Ʋ���":"�ü���õ"}</c:if> <c:if
							test="${board.bType == 3}">
                           ${(board.head==1)?"��ϴ�":"�˴ϴ�"}</c:if> <c:if
							test="${board.bType == 2}">
                           ${board.dcname}</c:if>] <c:if
							test="${board.bType == 3}">
                           [${(board.mkinds==1)?"�ϱ�":(board.mkinds==2?"����":(board.mkinds==3?"�Ƿ�":"��Ÿ"))}]
                        </c:if> ${board.subject}
					</td>
				</tr>
				<c:if test="${board.bType == 2}">
					<tr style="height: 30px;">
						<th style="text-align: center; padding-left: 8px;">����</th>
						<td style="padding-left: 5px;">
							<div class="starRev">
								<span class="starR1" id="left1">��1_����</span> <span
									class="starR2" id="right1">��1_������</span> <span class="starR1"
									id="left2">��2_����</span> <span class="starR2" id="right2">��2_������</span>
								<span class="starR1" id="left3">��3_����</span> <span
									class="starR2" id="right3">��3_������</span> <span class="starR1"
									id="left4">��4_����</span> <span class="starR2" id="right4">��4_������</span>
								<span class="starR1" id="left5">��5_����</span> <span
									class="starR2" id="right5">��5_������</span>
							</div>
						</td>
					</tr>
				</c:if>
				<tr>
					<td style="text-align: center; height: 400px; padding-left: 8px;">����</td>
					<td>
						<table width="100%" height="100%">
							<tr>
								<td style="padding-left: 8px;">&nbsp;${board.content}</td>
							</tr>
							<c:if
								test="${!empty board.file1 || !empty board.file2 || !empty board.file3}">
								<tr>
									<td style="padding-left: 8px;">&nbsp; <c:if
											test="${!empty board.file1}">
											<img src="${path}/file/${board.file1}"
												style="width: 150px; height: 150px;">
										</c:if>&nbsp; <c:if test="${!empty board.file2}">
											<img src="${path}/file/${board.file2}"
												style="width: 150px; height: 150px;">
										</c:if>&nbsp; <c:if test="${!empty board.file3}">
											<img src="${path}/file/${board.file3}"
												style="width: 150px; height: 150px;">
										</c:if>
									</td>
								</tr>
							</c:if>
						</table>
					</td>
				</tr>

				<!--  ���ſ�û  -->
				<c:if
					test="${board.bType == 3 && board.head == 2 && sessionScope.loginUser.mnum != board.mnum }">
					<tr>
						<td colspan="2"
							style="text-align: center; border-top: hidden; padding: 30px;">
							<c:if test="${board.boarddeal == 0}">
								<c:set var="flag" value="0" />
								<c:forEach items="${messageList}" var="msg">
									<c:if test="${msg.buynum == sessionScope.loginUser.mnum}">
										<c:set var="flag" value="${flag + 1}" />
									</c:if>
								</c:forEach>
								<c:if test="${flag > 0}">
									<input type="button" value="��û��" class="w3-disabled"
										title="�̹� �ŷ���û ���Դϴ�.">
								</c:if>
								<c:if test="${flag == 0}">
									<input type="button" value="���ſ�û" name="buy"
										onclick="document.getElementById('id01').style.display='block'">
								</c:if>
							</c:if> <c:if test="${board.boarddeal == 1}">
								<input type="button" value="�ŷ���" class="w3-disabled"
									title="�ŷ����� �Խñ��Դϴ�.">
							</c:if> <c:if test="${board.boarddeal == 2}">
								<input type="button" value="�ŷ��Ϸ�" class="w3-disabled"
									title="�ŷ��Ϸ�� �Խñ��Դϴ�.">
							</c:if>
							<form action="buyItem.child" method="Post" name="mf"
								onsubmit="return phonecheck()">
								<input type="hidden" name="bnum" value="${board.bnum }">
								<input type="hidden" name="sellnum" value="${board.mnum }">
								<input type="hidden" name="buynum"
									value="${sessionScope.loginUser.mnum }">
								<div id="id01" class="w3-modal"
									style="z-index: 4; padding-top: 280px;">
									<div class="w3-modal-content w3-animate-zoom"
										style="width: 20%">
										<div class="w3-container w3-padding"
											style="background-color: #FFF1F5;">
											<a class="w3-button"
												style="background-color: #FFF1F5; float: right;"
												onclick="document.getElementById('id01').style.display='none'">
												<i class="material-icons">clear</i>
											</a>
											<h2>���� ��û</h2>
										</div>
										<div class="w3-panel">
											�޴��� ��ȣ �Է� : <input type="text" name="phone1" id="phone1"
												class="inputs" maxlength="3" style="width: 40px;" numberOnly
												required> - <input type="text" name="phone2"
												id="phone2" class="inputs" maxlength="4"
												style="width: 50px;" numberOnly required> - <input
												type="text" name="phone3" id="phone3" class="inputs"
												maxlength="4" style="width: 50px;" numberOnly required>
											<br> <font id="check" size="3" color="red"></font>
											<div class="w3-section">
												<input type="submit" id="send"
													onclick="document.getElementById('id01').style.display='none'"
													class="w3-button w3-light-grey w3-center" value="Ȯ��"
													disabled="disabled">
											</div>
										</div>
									</div>
								</div>
							</form>
						</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="2"
						style="text-align: center; height: 30px; padding-left: 8px;"><c:if
							test="${sessionScope.loginUser.mnum == board.mnum || sessionScope.loginUser.email == 'admin@aaa.bbb'}">
							<input type="button" id="update" value="����">
							<input type="button" id="delete" value="����">
						</c:if> <input type="button" id="list" value="���"></td>
				</tr>
				<!-- --------------------------------------------------------------------------------------------------------- -->
				<c:forEach var="c" items="${commentList}" varStatus="stat">
					<tr style="background: #f7f7f7;">
						<td colspan="2" style="padding-left: 8px;">
							<div>
								<!-- ������ ��� ��,��¥ �� ���� ��-->
								<div id="recontent${stat.index}">
									<div id="recomment${stat.index}" style="display: block;">
										<c:if test="${c.refstep > 0}">
											<div style="margin-left: 18px">
												��&nbsp; ${c.nickname}&nbsp;
												<!-- ����̸� �ڹ���ǥ�� -->
												<c:if test="${c.secret == 1}">
													<i class="fa fa-lock" style="font-size: 18px;"></i>
												</c:if>
												<!-- ��ۼ�����ư -->
												<c:if
													test="${sessionScope.loginUser.mnum == c.mnum || sessionScope.loginUser.email=='admin@aaa.bbb'}">
													<input type="button" id="commentDelete" value="����"
														style="float: right;"
														onclick="commentDelete(${c.bnum},${c.cnum})">
													<c:if test="${sessionScope.loginUser.mnum == c.mnum}">
														<input type="button" id="commentUpdate" value="����"
															style="float: right;"
															onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();">
													</c:if>
												</c:if>

												<c:if test="${c.refstep == 0}">
													<input type="button" id="recom" value="���"
														style="float: right;"
														onclick="$('#comm${stat.index}').show();">
												</c:if>
												<br>&nbsp;
												<!-- ��д����� ��� -->
												<c:if test="${c.secret == 1}">
													<c:choose>
														<c:when
															test="${c.mnum == sessionScope.loginUser.mnum || 
                           		sessionScope.loginUser.email == 'admin@aaa.bbb' || board.mnum == sessionScope.loginUser.mnum}">
                           						&nbsp;&nbsp;&nbsp;&nbsp;${c.recomment}
                           						<div
																style="color: gray; font-size: 12px;">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"
																	var="t" />
																<fmt:formatDate value="${c.comdate}"
																	pattern="YYYY-MM-dd" var="r" />
																<c:choose>
																	<c:when test="${t==r}">
																		<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
																	</c:when>
																	<c:otherwise>
																		<f:formatDate value="${c.comdate}"
																			pattern="yy/MM/dd HH:mm:ss" />
																	</c:otherwise>
																</c:choose>
															</div>
														</c:when>
														<c:otherwise>
                           						&nbsp;&nbsp;&nbsp;&nbsp;��� ����Դϴ�.
                           						<div
																style="color: gray; font-size: 12px;">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"
																	var="t" />
																<fmt:formatDate value="${c.comdate}"
																	pattern="YYYY-MM-dd" var="r" />
																<c:choose>
																	<c:when test="${t==r}">
																		<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
																	</c:when>
																	<c:otherwise>
																		<f:formatDate value="${c.comdate}"
																			pattern="yy/MM/dd HH:mm:ss" />
																	</c:otherwise>
																</c:choose>
															</div>
														</c:otherwise>
													</c:choose>
												</c:if>
												<!-- ��д��� �ƴѰ�� -->
												<c:if test="${c.secret == 0}">
                           						&nbsp;&nbsp;&nbsp;&nbsp;${c.recomment}
                           						<div
														style="color: gray; font-size: 12px;">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"
															var="t" />
														<fmt:formatDate value="${c.comdate}" pattern="YYYY-MM-dd"
															var="r" />
														<c:choose>
															<c:when test="${t==r}">
																<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
															</c:when>
															<c:otherwise>
																<f:formatDate value="${c.comdate}"
																	pattern="yy/MM/dd HH:mm:ss" />
															</c:otherwise>
														</c:choose>
													</div>
												</c:if>
											</div>
										</c:if>

										<!-- �Ϲ� ����� ��� -->
										<c:if test="${c.refstep == 0}">
											<div>
												${c.nickname}&nbsp;
												<!-- ����̸� �ڹ���ǥ�� -->
												<c:if test="${c.secret == 1}">
													<i class="fa fa-lock" style="font-size: 18px;"></i>
												</c:if>
												<c:if
													test="${sessionScope.loginUser.mnum == c.mnum || sessionScope.loginUser.email=='admin@aaa.bbb'}">
													<!-- ��ۼ�����ư -->
													<input type="button" id="commentDelete" value="����"
														style="float: right;"
														onclick="commentDelete(${c.bnum},${c.cnum})">
													<c:if test="${sessionScope.loginUser.mnum == c.mnum}">
														<input type="button" id="commentUpdate" value="����"
															style="float: right;"
															onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();">
													</c:if>
												</c:if>

												<c:if test="${c.refstep == 0}">
													<input type="button" id="recom" value="���"
														style="float: right;"
														onclick="$('#comm${stat.index}').show();">
												</c:if>
												<br>
												<!-- �Ϲݺ�д���� ��� -->
												<c:if test="${c.secret == 1}">
													<c:choose>
														<c:when
															test="${c.mnum == sessionScope.loginUser.mnum || 
                           		sessionScope.loginUser.email == 'admin@aaa.bbb' || board.mnum == sessionScope.loginUser.mnum}">
                           						${c.recomment}
                           						<div
																style="color: gray; font-size: 12px;">
																<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"
																	var="t" />
																<fmt:formatDate value="${c.comdate}"
																	pattern="YYYY-MM-dd" var="r" />
																<c:choose>
																	<c:when test="${t==r}">
																		<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
																	</c:when>
																	<c:otherwise>
																		<f:formatDate value="${c.comdate}"
																			pattern="yy/MM/dd HH:mm:ss" />
																	</c:otherwise>
																</c:choose>
															</div>
														</c:when>
														<c:otherwise>��д���Դϴ�.
                           						<div
																style="color: gray; font-size: 12px;">
																<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"
																	var="t" />
																<fmt:formatDate value="${c.comdate}"
																	pattern="YYYY-MM-dd" var="r" />
																<c:choose>
																	<c:when test="${t==r}">
																		<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
																	</c:when>
																	<c:otherwise>
																		<f:formatDate value="${c.comdate}"
																			pattern="yy/MM/dd HH:mm:ss" />
																	</c:otherwise>
																</c:choose>
															</div>
														</c:otherwise>
													</c:choose>
												</c:if>
												<!-- ��д���� �ƴѰ�� -->
												<c:if test="${c.secret == 0}">${c.recomment}
                           						<div
														style="color: gray; font-size: 12px;">
														<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"
															var="t" />
														<fmt:formatDate value="${c.comdate}" pattern="YYYY-MM-dd"
															var="r" />
														<c:choose>
															<c:when test="${t==r}">
																<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
															</c:when>
															<c:otherwise>
																<f:formatDate value="${c.comdate}"
																	pattern="yy/MM/dd HH:mm:ss" />
															</c:otherwise>
														</c:choose>
													</div>
												</c:if>
											</div>
										</c:if>
									</div>
								</div>
							</div> <!-- ������ư ������ ��ۼ���â ����-->
							<div id="recommentupd${stat.index}" style="display: none">
								<form:form action="commentUpdate.child" method="Post"
									modelAttribute="comment">
									<input type="hidden" name="bnum" value="${c.bnum}">
									<input type="hidden" name="cnum" value="${c.cnum}">
										<div>
										<c:if test="${c.refstep > 0}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;
										</c:if>
										${c.nickname}&nbsp;
										<!-- ����̸� �ڹ���ǥ�� -->
										<c:if test="${c.secret == 1}">
											<i class="fa fa-lock" style="font-size: 18px;"></i>
										</c:if>
										<br>
										<c:if test="${c.refstep > 0}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
										<form:input path="recomment" value="${c.recomment}"/>
										<input type="submit" value="����"> <input type="button"
											id="x" value="�������"
											onclick="$('#recomment${stat.index}').show();$('#recommentupd${stat.index}').hide();">
									<div style="color: gray; font-size: 12px;">
										<c:if test="${c.refstep > 0}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
										<fmt:formatDate value="${today}" pattern="YYYY-MM-dd" var="t" />
										<fmt:formatDate value="${c.comdate}" pattern="YYYY-MM-dd"
											var="r" />
										<c:choose>
											<c:when test="${t==r}">
												<f:formatDate value="${c.comdate}" pattern="HH:mm:ss" />
											</c:when>
											<c:otherwise>
												<f:formatDate value="${c.comdate}"
													pattern="yy/MM/dd HH:mm:ss" />
											</c:otherwise>
										</c:choose>
									</div>
									</div>
								</form:form>
							</div>
							<div id="rere${stat.index}">
								<!-- ��۹�ư ������ ����â ����-->
								<div id="comm${stat.index}" style="display: none">
									<form:form action="recomment.child" method="Post"
										modelAttribute="comment" name="recomf"
										style="border:1px solid black; background-color:#f7f7f7;">
										<input type="hidden" name="bnum" value="${c.bnum}">
										<input type="hidden" name="cnum" value="${c.cnum}">
										<input type="hidden" name="mnum" value="${loginUser.mnum}">
										<form:textarea path="recomment"
											style="width:80%;height:100px;border:0;resize:none;"
											placeholder="����� �Է��ϼ���."></form:textarea>
										<div align="right">
											<input type="checkbox" name="secret" id="resecret" value="1"
												onchange="rechkSecret()">��д��&nbsp; <input
												type="submit" value="���"> <input type="button"
												id="x" value="���" onclick="$('#comm${stat.index}').hide();">
										</div>
									</form:form>
								</div>
							</div> <!--���� --> <br>
						</td>
					</tr>
				</c:forEach>
				<!-- ����ۼ� -->
				<tr style="height: 30px; background: #f7f7f7;">
					<td style="text-align: center; padding-left: 8px;">���</td>
					<td><form:form action="commentWrite.child" method="Post"
							modelAttribute="comment" name="f" onsubmit="return comment()">
							<input type="hidden" name="bnum" value="${board.bnum}">
							<input type="hidden" name="mnum" value="${loginUser.mnum}">
							<form:textarea path="recomment" id="com"
								style="width:100%;height:100px;border:0;resize:none;"
								placeholder="����� �Է��ϼ���."></form:textarea>
							<div align="right">
								<input type="checkbox" name="secret" id="secret" value="0"
									onchange="chkSecret()">��д��&nbsp; <input type="submit"
									value="���">
							</div>
						</form:form></td>
				</tr>
			</table>
			<div class="btns">
				<c:if test="${pageNum > 1}">
					<a href="javascript:list(${pageNum - 1})"><i
						class="material-icons" style="vertical-align: middle;">arrow_back</i></a>&nbsp;
					</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a==pageNum}">
						<font size="4" class="w3-pale-red">&nbsp; ${a} &nbsp;</font>&nbsp;</c:if>
					<c:if test="${a!=pageNum}">
						<a href="javascript:list(${a})"><font size="4">&nbsp;
								${a} &nbsp;</font></a>&nbsp;</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}">
					&nbsp;<a href="javascript:list(${pageNum + 1})"><i
						class="material-icons" style="vertical-align: middle;">arrow_forward</i></a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>