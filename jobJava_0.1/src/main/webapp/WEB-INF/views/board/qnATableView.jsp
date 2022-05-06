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
  <input type="hidden" name="QNA_NO" value="${qna.QNA_NO}">
  <c:if test="${qna.ID == USER_ID}">
  	<input type="text" name="TITLE" value="${qna.TITLE }" style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" style="width: 50%; height: 100%"><br>
  	<c:if test="${not empty qna.RESPON}">
  	<input type="text" value="${qna.ANSWER }" style="width: 50%" disabled><br>
  	<input type="text" value="${qna.RESPON }" style="width: 50%" disabled><br>
  	</c:if>
  	<input type="submit" value="수정">
  </c:if>
  <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
  <input type="text" name="TITLE" value="${qna.TITLE }" style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" style="width: 50%; height: 100%"><br>
  	<input type="text" name="ANSWER" value="${qna.ANSWER }" style="width: 50%"><br>
  	<input type="text" name="RESPON" value="${qna.RESPON }" style="width: 50%"><br>
  	<input type="submit" value="수정">
  </s:authorize>
 <s:authorize access="isAnonymous()">
 	<input type="text" name="TITLE" value="${qna.TITLE }" readonly style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" readonly style="width: 50%; height: 100%">
  </s:authorize>
</form>
</body>
</html>