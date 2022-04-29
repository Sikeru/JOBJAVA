<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> FOR ADMIN! </h1>
	<s:authorize access="isAuthenticated()">
		<p> Session On </p>
	</s:authorize>
	<s:authorize access="isAnonymous()">
		<p> Session Off </p>
	</s:authorize>
	<p> HELLO <s:authentication property="name"/> </p>
	<a href="${pageContext.request.contextPath}/security_logout">Log Out</a>
</body>
</html>