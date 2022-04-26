<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
</head>
<body>
<h1>
	Sign up
</h1>
<form action="signUp.html" method="post">
	ID : <input type="text" name="id"><br>
	PW : <input type="password" name="password"><br>
	<input type="submit" value="회원등록">
</form>
</body>
</html>