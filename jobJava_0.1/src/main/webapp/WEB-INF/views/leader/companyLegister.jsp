<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
section {
	width: 100%;
	height: auto;
}
</style>
</head>
<body>

	<section>
		<h1>기업등록 페이지</h1>
	</section>
	<section>
		<form name="" action="${contextPath}/leader/legister.do" method="post">
		<!--그냥 번호<br> <input type="text" name="REGI_NO" placeholder="아이디 입력"><br>-->
		<!-- B_NO 자동추가 -->
			<!--  사업자번호<br> <input type="text" name="B_NO" placeholder=""><br> -->
			제목<br> <input type="text" name="TITLE" value=""><br>
			<br> 내용<br> <input type="text" name="CONTENT" value="">
			<br> 파일명<br> <input type="text" name="FILENAME" value="">
			
			<br> 시작날짜 <input type="date" name="S_DATE"><br> <br>
			종료날짜 <input type="date" name="E_DATE"><br> <br> <br>
			<input type= "hidden" value="${pageContext.request.userPrincipal.name}" name="ID">
			<input type="submit"  value="사업 참여"> <br> <br>
			
			
		</form>
	</section>


</body>
</html>