<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${contextPath}/board/qnAAddTable.do" method="post">
  <input type="text" name="ID" value="${pageContext.request.userPrincipal.name}" readonly><br>
  <input type="text" name="TITLE" style="width:50%">
  <input type="text" name="CONTENT" style="width: 50%; height: 100%">
  <input type="submit" value="등록">

</form>
</body>
</html>