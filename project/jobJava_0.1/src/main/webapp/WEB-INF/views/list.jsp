<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> USERS </h1>
	<c:forEach items="${users}" var="user" varStatus="status">
		<strong> ${status.count}. id : ${user.user_id}, pw : ${user.user_pw} </strong><br>
	</c:forEach>
</body>
</html>