<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/demo/resources/sample.css">
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>LOGIN</h1>
	<form action="/JJ/login_check" method="post">
		<c:if test="${LoginFailMessage!=null}">
			<p> Error : <c:out value="${LoginFailMessage}"/> </p>
		</c:if>
		USER : <input type="text" name="user_id"><br>
		PASSWORD : <input type="password" name="user_pw"><br>
	<s:authorize access="isAnonymous()">
		<input type="submit" value="Login">
	</s:authorize>
	</form>
</body>
</html>