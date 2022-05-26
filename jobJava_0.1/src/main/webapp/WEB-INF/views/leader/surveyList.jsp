<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>설문조사 페이지입니다!!!</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>시작날짜</td>
			<td>종료날짜</td>
			<td>작성자</td>
		</tr>

		<c:forEach var="slist" items="${surverList}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a
					href="${contextPath}/leader/surveyDetail.do?svNO=${slist.SV_NO}">${slist.TITLE}</a></td>
				<td>${slist.s_DATE}</td>
				<td>${slist.e_DATE}</td>
				<td>${slist.NAME}</td>
			</tr>
		</c:forEach>
	</table>
	<s:authorize access="hasAnyRole('ROLE_EMP')">
		<a href="${contextPath}/leader/addsurveryfrom.do">설문조사등록</a>
	</s:authorize>
</body>
</html>