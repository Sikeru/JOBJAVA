<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
</head>
<body>
<table border=0  width="100%">
  <tr>
     <td>
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/duke_swing.gif"  />
		</a>
     </td>
     <td>
       <h1><font size=30>스프링실습 홈페이지!!</font></h1>
     </td>  
     <td>
       <!-- <a href="#"><h3>로그인</h3></a> -->
     </td>
  </tr>
</table>
</body>
</html>
