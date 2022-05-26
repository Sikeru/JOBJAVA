<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	function aaa(){
		if ($('.selectsdate').val()='' || $('.selectedate').val()=''){
			console.log('둘중하나가 공백이면 실행되요');
		} else{
			console.log($('널일때 실행되요').val());
		}	
	};
	$(function(){
	});
</script>
</head>
<body>
	<h1>출퇴근 조회 페이지입니다!!!</h1>
	<h3>현재접속중인 아이디는 ${userID}입니다!!!</h3>

	<form id="form" method="post" action="${contextPath}/leader/commuteCheck.do">
		<input type="hidden" name="userID" value="${userID}">
		<input type="date" name="sdate" class="selectsdate"> 
		<input type="date" name="edate" class="selectedate">
		<input type="button" value="검색" onclick="aaa()">
	</form>
	
	<table>
		<tr>
			<td>일자</td>
			<td>요일</td>
			<td>출근시간</td>
			<td>퇴근시간</td>
			<td>결근사유</td>
			<td>상태</td>
		</tr>
	</table>
</body>
</html>