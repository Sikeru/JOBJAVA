<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

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
				<li><a href="${contextPath}/logout.do">로그아웃</a></li>
				<li><a href="${contextPath}/member/mypageForm.do">마이페이지</a></li>
				<s:authorize access="hasRole('ROLE_EMP')">
				 <li><a href="${contextPath}/counselor/main.do"><img src="${contextPath}/resources/image/counselorMainGoImg.png" style="width: 70px;height: 26px;"/></a></li>
				</s:authorize>
				<s:authorize access="hasRole('ROLE_ADMIN')">
				 <li><a href="${contextPath}/admin/main.do"><img src="${contextPath}/resources/image/counselorMainGoImg.png" style="width: 70px;height: 26px;"/></a></li>
				</s:authorize>
			</c:if>
	        <c:if test="${empty pageContext.request.userPrincipal}">
				<li><a href="${contextPath}/member/termsgree.do">회원가입</a></li>
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			</c:if>
            </ul>
        </div>


        <div id="topMenu">
            <ul>
	            <li><a href="${contextPath}/main/supportTable.do">일자리지원센터</a></li>
                <li><a href="#">프로그램목록</a></li>
                <li><a href="${contextPath}/main/alarmCenter.do?mnName=알림마당">알림마당</a></li>
                <li><a href="${contextPath}/main/bestCompany.do?mnName=기업홍보">기업홍보</a></li>
                <li><a href="${contextPath}/main/bessinfo.do?mnName=사업안내">사업안내</a></li>

            </ul>
        </div>
        
        <div id="topLogo">

            <a href="${contextPath}/main/main.do"><img width="250px" height="250px" src="${contextPath}/resources/image/mainlogo.png"></a>
        </div>
	
</body>
</html>