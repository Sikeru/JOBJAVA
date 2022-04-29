<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<body>
        <div id="loginMenu">
            <ul>
                <c:if test="${not empty pageContext.request.userPrincipal}">
				<li><a href="/JJ/security_logout">로그아웃</a></li>
				<li><a href="${contextPath}/member/mypageForm.do?ID=${pageContext.request.userPrincipal.name}">마이페이지</a>
			</c:if>
	        <c:if test="${empty pageContext.request.userPrincipal}">
				<li><a href="${contextPath}/member/signUpView.do">회원가입</a></li>
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			</c:if>
            </ul>
        </div>


        <div id="topMenu">
            <ul>
	            <li><a href="#">일자리지원센터</a></li>
                <li><a href="${contextPath}/main/bessinfo.do">프로그램목록</a></li>
                <li><a href="${contextPath}/member/loginForm.do">알림마당</a></li>
                <li><a href="${contextPath}/member/loginForm.do">기업홍보</a></li>
                <li><a href="${contextPath}/main/bessinfo.do?mnName=사업안내">사업안내</a></li>
                <s:authorize access="hasRole('ROLE_ADMIN')">
				 <li class="no_line"><a href="">관리자</a></li>
				</s:authorize>

            </ul>
        </div>
        
        <div id="topLogo">

            <a href="${contextPath}/main/main.do"><img width="250px" height="250px" src="${contextPath}/resources/image/mainlogo.png"></a>
        </div>
	
</body>
</html>