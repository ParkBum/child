<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 요청 목록</title>
<style type="text/css">
.wrap {
	clear: both;
	width: 1200px;
	margin-left: 400px;
}
</style>
</head>
<body>
	<div class="wrap">
	<h2>거래 요청 목록</h2>
		<font size="2">거래 수락시에만 요청 회원 정보에 연락처가 보이며, 거래완료 후에는 연락처가 자동 삭제됩니다.</font><br>
		<font size="2">거래 수락 후 7일이 지난 거래는 완료로 자동 전환됩니다.</font>
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>거래 상태</th>
				<th>게시글</th>
				<th>요청 회원 정보</th> <!-- 연락처 여기에 포함 -->
				<th>수락 여부</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>