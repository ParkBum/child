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
<title>�Խù� �� ����</title>
<style type="text/css">
.cmain {
	clear: both;
	width: 1200px;
	margin: 0 315px 0 315px;
}

.subMenu {
	float: left;
	width: 200px;
	margin: 0 auto;
	margin-bottom: 300px;
	border-bottom: 2px solid #dddddd;
}

.subMenu ul, li {
	margin: 0;
	margin-bottom: 1px;
	padding: 0;
	list-style: none;
}

.subMenu a {
	text-decoration: none;
}

.menu1 {
	height: 100px;
	background: #F6A5BC;
	color: white;
}

.active {
	display: block;
	height: 40px;
	background-color: #CE5B7C;
	color: white;
}

.active a {
	display: block;
	height: 100%;
	width: 100%;
	line-height: 40px;
}

.menu2 {
	height: 40px;
	background: #f7f7f7;
}

.menu2 a {
	display: block;
	height: 100%;
	width: 100%;
	line-height: 40px;
}

.board {
	float: right;
	width: 1000px;
	padding-left: 50px;
}

.btns {
	margin: 20px;
}

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

function comment(){
	var check = confirm("����� ����Ͻðڽ��ϱ�?");
	if(check){ 
		return true;
	} else return false;
} 

function commentDelete(bnum, cnum){
      var del = confirm("����� �����Ͻðڽ��ϱ�?")
      if(del){
         location.href = "commentDelete.child?bnum="+bnum+"&cnum="+cnum;
         alert("���� �Ϸ�");
      }
      return false;
}

function phonecheck() {
   if (f.phone1.value.length == 3){      
      if (f.phone2.value.length == 4) {
         if (f.phone3.value.length == 4) {
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
					<td width="15%" style="text-align: center;">�ۼ���</td>
					<td width="90%">&nbsp;${board.nickname} 
					<c:if test="${board.bType == 3}">
					<c:set var="cnt" value="0"/>
 					<c:forEach items="${messageList}" var="msg">
						<c:if test="${msg.buynum == sessionScope.loginUser.mnum}">
							<c:set var="cnt" value="${cnt + 1}"/>
						</c:if>
					</c:forEach> 
					<c:if test="${cnt > 0}">
						&nbsp;<img src="${path}/decorator/siren.png" id="siren" style="cursor: pointer;">
						<font id="addred" size="1" color="red"><b>�Ű�Ϸ�</b></font>
					</c:if>
					</c:if></td>
				</tr>
				<tr style="height: 30px;">
					<td style="text-align: center;">����</td>
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
						<th style="text-align: center;">����</th>
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
					<td style="text-align: center; height: 400px;">����</td>
					<td>
						<table width="100%" height="100%">
							<tr>
								<td>&nbsp;${board.content}</td>
							</tr>
							<c:if
								test="${!empty board.file1 || !empty board.file2 || !empty board.file3}">
								<tr>
									<td>&nbsp; <c:if test="${!empty board.file1}">
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
						<c:if test="${deal != 3}">
							<input type="button" value="���ſ�û" name="buy"
								onclick="document.getElementById('id01').style.display='block'" />
						</c:if>
						<c:if test="${deal == 3}">
							<input type="button" value="���ſϷ�" disabled="disabled">
						</c:if>
							<form action="buyItem.child" method="Post" name="f"
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
					<td colspan="2" style="text-align: center; height: 30px;"><c:if
							test="${sessionScope.loginUser.mnum == board.mnum}">
							<input type="button" id="update" value="����">
							<input type="button" id="delete" value="����">
						</c:if> <input type="button" id="list" value="���"></td>
				</tr>
				<!-- ����ۼ� -->
				<tr style="height: 30px;">
					<td style="text-align: center;">���</td>
					<td><form:form action="commentWrite.child" method="Post"
							modelAttribute="comment" name="f" onsubmit="return comment()">
							<input type="hidden" name="bnum" value="${board.bnum}">
							<input type="hidden" name="mnum" value="${loginUser.mnum}">
                    	 ��� �ۼ��� : ${sessionScope.loginUser.nickname}
               <form:textarea path="recomment"
								style="width:100%;height:100px;border:0;resize:none;"
								placeholder="����� �Է��ϼ���."></form:textarea>
							<div align="right">
								<input type="checkbox" name="secret" id="secret" value="0"
									onchange="chkSecret()">��д��&nbsp; <input type="submit"
									value="���">
							</div>
						</form:form></td>
				</tr>
				<!-- --------------------------------------------------------------------------------------------------------- -->
				<tr>
					<td colspan="2"><c:forEach var="c" items="${commentList}"
							varStatus="stat">
							<div>
								<c:if test="${c.secret == 1}">
									<i class="fa fa-lock" style="font-size: 24px"></i>
								</c:if>
								<c:if test="${c.refstep == 0}">
									<input type="button" id="recom" value="���"
										onclick="$('#comm${stat.index}').show();">
								</c:if>
								<c:if
									test="${sessionScope.loginUser.mnum == c.mnum || sessionScope.loginUser.email=='admin@aaa.bbb'}">
									<!-- ��ۼ�����ư -->
									<input type="button" id="commentUpdate" value="����"
										onclick="$('#recomment${stat.index}').hide();$('#recommentupd${stat.index}').show();">
									<input type="button" id="commentDelete" value="����"
										onclick="commentDelete(${c.bnum},${c.cnum})">
								</c:if>
								<br>
								<c:if test="${c.refstep > 0}">
									<div style="margin-left: 2%">��>�г��� : ${c.nickname}</div>
								</c:if>
								<c:if test="${c.refstep == 0}">
									<div>�г��� : ${c.nickname}</div>
								</c:if>
							</div>

							<!-- ��� ���-->
							<div id="recontent${stat.index}">
								<div id="recomment${stat.index}" style="display: block;">
									<c:if test="${c.refstep>0}">
										<div style="margin-left: 3%">${c.recomment}</div>
									</c:if>

									<c:if test="${c.secret == 1}">
										<c:choose>
											<c:when
												test="${c.mnum == sessionScope.loginUser.mnum || 
                           		sessionScope.loginUser.email == 'admin@aaa.bbb' || board.mnum == sessionScope.loginUser.mnum}">
                           			${c.recomment}
                           	</c:when>
											<c:otherwise>
                           		�غ�д���Դϴ�.
                           	</c:otherwise>
										</c:choose>
									</c:if>

									<c:if test="${c.refstep==0 && c.secret == 0}">
                           	${c.recomment}
                           </c:if>
									<br>
								</div>
							</div>
							<!-- ������ư ������ ��ۼ���â ����-->
							<div id="recommentupd${stat.index}" style="display: none">
								<form:form action="commentUpdate.child" method="Post"
									modelAttribute="comment">
									<input type="hidden" name="bnum" value="${c.bnum}">
									<input type="hidden" name="cnum" value="${c.cnum}">
									<form:input path="recomment" value="${c.recomment}" />
									<input type="submit" value="����">
									<input type="button" id="x" value="�������"
										onclick="$('#recomment${stat.index}').show();$('#recommentupd${stat.index}').hide();">
								</form:form>
							</div>

							<div id="rere${stat.index}">
								<!-- ��۹�ư ������ ����â ����-->
								<div id="comm${stat.index}" style="display: none">
									<form:form action="recomment.child" method="Post"
										modelAttribute="comment"
										style="border:1px solid black; background-color:#f7f7f7;">
										<input type="hidden" name="bnum" value="${c.bnum}">
										<input type="hidden" name="cnum" value="${c.cnum}">
										<input type="hidden" name="mnum" value="${loginUser.mnum}">
                           ��� �ۼ��� : ${sessionScope.loginUser.nickname}<br>
										<form:textarea path="recomment"
											style="width:80%;height:100px;border:0;resize:none;"
											placeholder="����� �Է��ϼ���."></form:textarea>
										<div align="right">
											<input type="submit" value="���"> <input type="button"
												id="x" value="���"
												onclick="$('#comm${stat.index}').show();$('#comm${stat.index}').hide();">
										</div>
									</form:form>
								</div>
							</div>
							<%-- </c:otherwise>
               </c:choose> --%>
							<!--���� -->

							<hr>
						</c:forEach></td>
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