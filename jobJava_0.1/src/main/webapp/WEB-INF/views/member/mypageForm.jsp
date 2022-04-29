<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function mac_get() {
		$.ajax({
			type: "GET",
			url: "${contextPath}/member/macGet.do", 
			data: {},
			success: function(mac) {
				console.log(mac)
				$('input[name=MAC_ADDR]').attr('value',mac);
			} 
		})
	}
</script>

</head>
<body>
<form action="${contextPath}/member/myPageUpDate.do" method="post">
		ID : <input type="text" name="ID" value="${member.ID}"><br>
		PW : <input type="password" name="passwd"><br>
		HP : <input type="text" name="HP" value="${member.HP}"/><br>
		ADDR : <input type="text" name="ADDR" value="${member.ADDR}"/><br>
		EMAIL : <input type="text" name="EMAIL" value="${member.EMAIL}"/><br>
	<s:authorize access="hasRole('ROLE_USER')">
		NAME : <input type="text" name="NAME" value="${member.NAME}"/><br>
		J_SEARCH : <input type="text" name="J_SEARCH" value="${member.j_SEARCH}"/><br>
		BIRTH : <input type="text" name="BIRTH" value="${member.BIRTH}"/><br>
		LAST_DEU : <input type="text" name="LAST_DEU" value="${member.LAST_EDU}"/><br>
	</s:authorize>
	<s:authorize access="hasRole('ROLE_STU')">
		NAME : <input type="text" name="NAME" value="${member.NAME}"/><br>
		DEPT : <input type="text" name="DEPT" value="${member.DEPT}"/><br>
		MAC : <input type="text" name="MAC_ADDR" value="${member.MAC_ADDR}"/>
		<input type="button" onclick="mac_get()" value="맥정보가져오기"><br>
		BIRTH : <input type="text" name="BIRTH" value="${member.BIRTH}"/><br>
		U_NAME : <input type="text" name="U_NAME" value="${member.u_NAME}"/><br>
	</s:authorize>
		<input type="submit" value="정보수정">
</form>


</body>
</html>