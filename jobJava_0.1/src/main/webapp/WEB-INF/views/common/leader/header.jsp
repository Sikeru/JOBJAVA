<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="userID"><s:authentication property="name" /></c:set>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
	<div id="loginMenu">
		<ul>
			<li><a href="#">일자리지원센터</a></li>
			<c:if test="${not empty pageContext.request.userPrincipal}">
				<li><a
					href="${contextPath}/logout.do?ID=${pageContext.request.userPrincipal.name}">로그아웃</a></li>
				<li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
			</c:if>

			<c:if test="${empty pageContext.request.userPrincipal}">
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
				<li><a href="${contextPath}/member/termsgree.do">회원가입</a></li>
			</c:if>

		</ul>
	</div>



	<div id="topMenu">
		<ul>
		<li><a href="${contextPath}/member/loginForm.do">서식자료실</a></li>
			<li><a href="${contextPath}/cafe/main.do">일자리카페</a></li>
			<li><a href="${contextPath}/leader/companyLegisterList.do">사업참여</a></li>
			<li><a href="${contextPath}/leader/bessinfo.do?mnName=사업안내">사업안내</a></li>
		</ul>
	</div>

	<div id="topLogo">

		<a href="${contextPath}/main/main.do"><img width="250px" height="250px"
			src="${contextPath}/resources/image/jobleader_logo.png"></a>
	</div>

</body>
</body>
</html>