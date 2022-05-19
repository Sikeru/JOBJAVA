<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<style>
    #jobSottopMenu ul {
        width: 100%;
        overflow: hidden;
        margin:0;
    }

    #jobSottopMenu li {
        display: inline-block;
        list-style: none;
        text-decoration: none;
        margin: 20px;
        float: right;
        position: relative;
        right: 42%;
        top: 30%;
        z-index: 2;
    }

    #jobSottopMenu li a {
        text-decoration: none;
        color: white;
    }
</style>
<script>
 function myPage(userID) {
	 let f = document.createElement('form');
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'ID');
	    obj.setAttribute('value', userID);
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '${contextPath}/member/mypageForm.do');
	    document.body.appendChild(f);
	    f.submit();
 }

</script>

<body>
        <div id="loginMenu">
            <ul>
                <c:if test="${not empty pageContext.request.userPrincipal}">
				<li><a href="${contextPath}/logout.do?ID=${pageContext.request.userPrincipal.name}">로그아웃</a></li>
				<li><a href="javascript:myPage('${pageContext.request.userPrincipal.name}')">마이페이지</a></li>
				<!-- <li><a href="${contextPath}/member/mypageForm.do?ID=${pageContext.request.userPrincipal.name}">마이페이지</a> -->
			</c:if>
	        <c:if test="${empty pageContext.request.userPrincipal}">
				<li><a href="${contextPath}/member/signUpView.do">회원가입</a></li>
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			</c:if>
            </ul>
        </div>


        <div id="jobSottopMenu">
            <ul>
                <li><a href="${contextPath}/board/employmentConTable.do">취업상담</a></li>
                <li><a href="${contextPath}/board/onlineConTable.do">온라인상담</a></li>
                <li><a href="${contextPath}/board/qnATable.do">질의응답</a></li>
            </ul>
        </div>
        
        <div id="topLogo">

            <a href="${contextPath}/main/main.do"><img width="250px" height="250px" src="${contextPath}/resources/image/mainlogo.png"></a>
        </div>
	
</body>
</html>