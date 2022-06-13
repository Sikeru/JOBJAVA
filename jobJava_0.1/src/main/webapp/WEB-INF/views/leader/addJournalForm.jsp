<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<h3>업무일지 등록페이지입니다.</h3>
	
	<form method = "post" action="${contextPath}/leader/addJournal.do">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name = "title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name = "content"></td>
			</tr>
		</table>
		<input type="submit" value="등록">
	</form>
</body>
</html>