<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<%-- 
	isErrorPage="true" : 현재 페이지가 error 페이지임. 
						 exception 객체 전달. 
						 exception 객체 = exception.CartEmptyException 객체임
	${exception.message} : exception.CartEmptyException.getMessage() 호출 (RuntimeException)	
	${exception.url} : exception.CartEmptyException.getUrl() 호출 (CartEmptyException)			 
--%>
<script>
alert("${exception.message}");
location.href="${exception.url}"
</script>