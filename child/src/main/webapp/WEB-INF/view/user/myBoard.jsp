<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� Ȯ���ϱ�</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript">
/* function list(pageNum) {
	location.href = "myBoard.child?mnum="+${user.mnum}+"&pageNum=" + pageNum;
return true;
} 
 */
function allchkbox(chk) {
	var chks = document.getElementsByName("checkBoard"); 
	for(var i=0; i<chks.length; i++) {
		chks[i].checked = chk.checked;
	}
}

function deleteCheck(){
	var chk = confirm("�Խñ��� �����Ͻðڽ��ϱ�?");
	if(chk){
		alert("�����߽��ϴ�.");
		return true;
	} else return false;
}
</script>
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
	text-align: left;
}

.btns {
	margin: 30px 500px 0px 500px;
}

th {
	background-color: #f7f7f7;
}

th, td {
	text-align: center !important;
	vertical-align: middle !important;
	height: 40px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="cmain" align="center">
		<div class="subMenu">
			<ul>
				<li class="menu1"><font style="line-height:100px;" size="5">ȸ�� ����</font></li>
				<li class="menu2"><a href="../user/list.child?mnum=${sessionScope.loginUser.mnum}">ȸ�� ����</a></li>
				<li class="active"><a href="../user/myBoardList.child?mnum=${sessionScope.loginUser.mnum}">�ۼ��� ���</a></li>
				<li class="menu2"><a href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">�ŷ���û ���</a></li>
			</ul>
		</div>
		<div class="board">
			<div style="margin-top: 30px; margin-bottom: 30px;">
			<h3>�ۼ��� �Խñ� ���</h3>
			</div>
			<font size="2">�Խñ۸��� Ŭ���ϸ� �ش� �Խñ۷� �̵��մϴ�.</font><br>
			<font size="2">�Խñ��� ������ �� ������ư�� ������ �ش� ���� �����˴ϴ�.</font>
			<form:form action="../user/myBoardDelete.child" onsubmit="return deleteCheck()" name="f" method="post">
			<input type="hidden" name="bnum" value="${board.bnum}">
			<input type="hidden" name="mnum" value="${sessionScope.loginUser.mnum}">
			<table  border="1" style="border-collapse: collapse;" class="w3-table w3-border w3-bordered">
				<tr>  
					<th width="7%" style="padding-left:8px;">��ü&nbsp;<input type="checkbox" name="allchk" onchange="allchkbox(this)"></th> 
					<th width="7%">�۹�ȣ</th>
					<th width="7%">�Խ���</th>
					<th width="45%">����</th>
					<th width="7%">��� ��</th>
					<th width="12%">�ۼ� ��¥</th>
					<th width="15%">���</th>
				</tr>
				<c:forEach items="${myboard}" var="myboard">
					<tr>
						<td style="padding-left:8px;"><input type="checkbox" name="checkBoard" value="${myboard.bnum}"></td>
						<td>${myboard.bnum}</td>
						<td>${(myboard.bType == 1)?"����":(myboard.bType == 2)?"�ı�":"�ŷ�"}</td>
						<td  style="text-align: left  !important; padding-left:20px; padding-right:20px;">
							<a href="../board/info.child?bnum=${myboard.bnum}"><c:if 
							test="${myboard.bType == 1}">[<c:if test="${myboard.head == 1}">���Ʋ���</c:if><c:if test="${myboard.head == 2}">�ü���õ</c:if>]</c:if><c:if 
							test="${myboard.bType == 2}">[${myboard.dcname}]</c:if><c:if 
							test="${myboard.bType == 3}">[<c:if test="${myboard.head == 1}">��ϴ�</c:if><c:if test="${myboard.head == 2}">�˴ϴ�</c:if>]</c:if>
						${myboard.subject}</a></td>
						<td>${myboard.commentcnt}</td>
						<td><fmt:formatDate value="${myboard.regdate}" pattern="YYYY-MM-dd" /></td>
						<td><c:if test="${myboard.bType == 3}"><a href="../user/myMessageList.child?mnum=${sessionScope.loginUser.mnum}">${(myboard.boarddeal == 1)?"�ŷ���":(myboard.boarddeal == 2)?"�ŷ� �Ϸ�":"�ŷ� ���"}</a></c:if></td>
					</tr>
				</c:forEach>
				</table>
				<div class="btns">
					<input type="submit" value="����" class="w3-bar" style="width:100px;">
				</div>
			</form:form>
		</div>
	</div> 
</body>
</html>