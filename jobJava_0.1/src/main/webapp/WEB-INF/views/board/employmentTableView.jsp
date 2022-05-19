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
<script>
 function deleteTable(EMP_CON_NO) {
	 location.href="${contextPath}/board/employmentDeleteTable.do?EMP_CON_NO="+EMP_CON_NO;
	 
 }
</script>
</head>
<body>
<form action="${contextPath}/board/upDateEmploymentTable.do" method="post">
  <input type="text" name="ID" value="${employment.ID}" readonly><br>
  <input type="hidden" name="EMP_CON_NO" value="${employment.EMP_CON_NO}">
  <c:choose>
	<c:when test="${employment.ID == USER_ID}">
  	<input type="text" name="TITLE" value="${employment.TITLE }" style="width:50%">
  	<input type="text" name="CONTENT" value="${employment.CONTENT }" style="width: 50%; height: 100%"><br>
  	<c:if test="${not empty employment.RESPON}">
  	<input type="text" value="${employment.ANSWER }" style="width: 50%" disabled><br>
  	<input type="text" value="${employment.RESPON }" style="width: 50%" disabled><br>
  	</c:if>
  	<input type="submit" value="수정"><br>
  	<input type="button" value="삭제" onclick="deleteTable(${employment.EMP_CON_NO})"/>
	</c:when>
  
    <c:otherwise>
    <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
  	<input type="text" name="TITLE" value="${employment.TITLE }" style="width:50%">
  	<input type="text" name="CONTENT" value="${employment.CONTENT }" style="width: 50%; height: 100%"><br>
  	<input type="text" value="${employment.RESPON }" style="width: 50%" readonly><br>
  	<input type="text" name="ANSWER" value="${employment.ANSWER }" style="width: 50%"><br>
  	<input type="hidden" name="RESPON" value="${pageContext.request.userPrincipal.name}">
    <input type="button" value="삭제" onclick="deleteTable(${employment.EMP_CON_NO})"/>
  
  	<input type="submit" value="수정">
  	
    </s:authorize>
 	<s:authorize access="hasAnyRole('ROLE_COM', 'ROLE_MAG')">
 	<input type="text" name="TITLE" value="${employment.TITLE }" readonly style="width:50%">
  	<input type="text" name="CONTENT" value="${employment.CONTENT }" readonly style="width: 50%; height: 100%">
  	</s:authorize>
 	<s:authorize access="isAnonymous()">
 	<input type="text" name="TITLE" value="${employment.TITLE }" readonly style="width:50%">
  	<input type="text" name="CONTENT" value="${employment.CONTENT }" readonly style="width: 50%; height: 100%">
  </s:authorize>
  </c:otherwise>
  </c:choose>
</form>
</body>
</html>