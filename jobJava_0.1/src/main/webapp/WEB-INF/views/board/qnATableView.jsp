<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="USER_ID">
<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${contextPath}/board/qnAUpDateTable.do" method="post">
  <input type="text" name="ID" value="${qna.ID}" readonly><br>
  <c:choose>
  <c:when test="${qna.ID == USER_ID}">
  	<input type="text" name="TITLE" value="${qna.TITLE }" style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" style="width: 50%; height: 100%">
  	<input type="submit" value="수정">
  </c:when>
  <c:otherwise>
  	<input type="text" name="TITLE" value="${qna.TITLE }" readonly style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" readonly style="width: 50%; height: 100%">
  </c:otherwise>
  </c:choose>
</form>
</body>
</html>