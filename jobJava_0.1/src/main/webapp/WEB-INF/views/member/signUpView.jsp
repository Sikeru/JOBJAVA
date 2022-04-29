<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>

</head>
<body>
<h1>
	회원가입
</h1>
<div id="singup">

<form action="${contextPath}/member/signUp.do" method="post">
	<h4>ID</h4>
	<input type="text" name="ID"><br>
	<h4>PW</h4>
	<input type="password" name="PWD"><br>
	<input type="hidden" name="HP" value="010-1111-2222"/>
	<input type="hidden" name="ADDR" value="주소테스트"/>
	<input type="hidden" name="EMAIL" value="test@test.com"/>
	학생 : <input type="radio" name="AUTHORITY" value="ROLE_STU">
	일반 : <input type="radio" name="AUTHORITY" value="ROLE_USER"><br>
	<input type="submit" value="회원등록">
</form>
</div>
</body>
</html>