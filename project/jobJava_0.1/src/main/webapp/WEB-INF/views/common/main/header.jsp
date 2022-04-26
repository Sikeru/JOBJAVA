<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<body>
	<div id="logo">
	<a href="${contextPath}/main/main.do">
		<img width="176" height="80" alt="booktopia" src="${contextPath}/resources/image/mainlogo.png">
		</a>
	</div>

	<div id="head_link">
		<ul>
			<c:if test="${not empty pageContext.request.userPrincipal}">
				<li><a href="/JJ/security_logout">로그아웃</a></li>
			</c:if>
	        <c:if test="${empty pageContext.request.userPrincipal}">
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			</c:if>
		    <li><a href="${contextPath}/member/signUpView.do">회원가입</a></li>
		    <br><br>
	    </ul>

		<ul>
			   <li><a href="${contextPath}/mypage/myPageMain.do">일자리지원센터</a></li>
			   <li><a href="${contextPath}/cart/myCartList.do">사업 안내</a></li>
			   <li><a href="#">기업홍보</a></li>
			   <li><a href="#">고객센터</a></li>
	   	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
        </ul>
	</div>
</body>
</html>