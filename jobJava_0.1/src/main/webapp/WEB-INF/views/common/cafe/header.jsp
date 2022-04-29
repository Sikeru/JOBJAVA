<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<body>
    
        <div id="loginMenu">
            <ul>
                <li><a href="#">일자리지원센터</a></li>
                
                    <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
                    <li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>

            
                    <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
                    <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
              

            </ul>
        </div>


        <div id="topMenu">
            <ul>
                
                <li><a href="${contextPath}/member/loginForm.do">프로그램목록</a></li>
                <li><a href="${contextPath}/member/loginForm.do">일자리카페</a></li>
                <li><a href="${contextPath}/member/loginForm.do">사업참여</a></li>
                <li><a href="${contextPath}/member/loginForm.do">사업안내</a></li>

            </ul>
        </div>

        <div id="topLogo">

            <img width="250px" height="250px" src="${contextPath}/resources/image/logo.png">
        </div>


    
</body>
</html>