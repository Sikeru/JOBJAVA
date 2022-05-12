<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


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
		<h1>기업등록 상세 페이지</h1>
	</section>
	<section>
		<form name="" action="${contextPath}/leader/legister.do" method="post">
			<a href='<c:url value='/board/boardDetail?idx=${bList.IDX }'/>' >${bList.TITLE }</a>

		</form>
	</section>


</body>
</html>