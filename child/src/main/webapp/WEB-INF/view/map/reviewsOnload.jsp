<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
	<form action="../board/list.child" method="post">
	<div id="#reload">
		<input type="hidden" name="bType" value="${bType}">
		<table border='1'
			style='border-collapse: collapse; width: 100%; margin: 10px auto;'
			class='w3-table w3-border w3-bordered'>
				<tr style="vertical-align: middle;">
					<td colspan='2' height='41' style="text-align: center;">후기 게시물</td> 
				</tr>
			<tr>
				<th width='80%' height='26' style='text-align: center'>제목</th>
				<th width='20%' height='26' style='text-align: center'>점수</th>
			</tr>
			<c:if test="${empty lists}">
				<tr>
					<td  colspan='2'>등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty lists}">
				<c:forEach items="${lists}" var="list">
					<tr align='center' valign='middle' bordercolor='#333333'
						onmouseover='this.style.backgroundColor="#FFF1F5"'
						onmouseout='this.style.backgroundColor="white"'>

						<td height='23' style='text-align: center'><a
							href='../board/info.child?bnum=${list.bnum}&bType=2'
							style='text-decoration: none;'>[${list.dcname}]${list.subject}</a></td>
						<td height='23' style='text-align: center'>★${list.score}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr><td colspan='2' style='text-align:right'><button>더보기</button></td></tr>
		</table>
		</div>
	</form>
