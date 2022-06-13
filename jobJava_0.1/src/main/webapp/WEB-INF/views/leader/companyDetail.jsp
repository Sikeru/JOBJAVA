<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	width: 100%;
	border: 1px solid #000;
}

th {
	border: 1px solid #000;
}

tr {
	border: 1px solid #000;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<th colspan="3">${detailList.TITLE}</th>
		</tr>
		<tr>
			<th>글번호</th>
			<td>${detailList.REGI_NO}</td>
			<th>사업자등록번호</th>
			<td>${detailList.b_NO}</td>
		</tr>
		<tr>
			<td>${detailList.CONTENT}</td>
		</tr>
		<tr>
			<th>파일</th>
			<td>${detailList.FILENAME}</td>
		</tr>
		<tr>
			<th>시작일</th>
			<td>${detailList.s_DATE}</td>
			<th>종료일</th>
			<td>${detailList.e_DATE}</td>
		</tr>
	</table>
</body>
</html>