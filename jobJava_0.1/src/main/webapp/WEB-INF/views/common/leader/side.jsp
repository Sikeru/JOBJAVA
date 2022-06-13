<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<div id="side">
		<ul>
			<c:if test="${not empty pageContext.request.userPrincipal}">
				<li id="menu1"><label class="program" for="program" style="cursor: pointer">업무일지</label> 
				<input id="program" type="checkbox">
					<nav id="main_nav">
						<ul>
							<li><a href="${contextPath}/leader/addJournal.do">업무일지
									등록</a></li>
							<li><a href="${contextPath}/leader/viewJournal.do">업무일지
									조회</a></li>
						</ul>
					</nav></li>

				<li><a href="${contextPath}/leader/commuteCheck.do">출퇴근조회</a></li>


				<li><a href="${contextPath}/leader/surveylist.do">설문조사</a></li>

			</c:if>
			<c:if test="${empty pageContext.request.userPrincipal}">
				<li id="menu1">
					<label class="program" for="program" style="cursor: pointer">업무일지</label>
						<input id="program" type="checkbox">
							<nav id="main_nav">
								<ul>
									<li><a href="${contextPath}/member/loginForm.do">업무일지
											등록</a></li>
									<li><a href="${contextPath}/member/loginForm.do">업무일지
											조회</a></li>
								</ul>
							</nav></li>

					<li><a href="${contextPath}/member/loginForm.do">출퇴근조회</a></li>
	
	
					<li><a href="${contextPath}/member/loginForm.do">설문조사</a></li>
			</c:if>

			<li id="menu2"><label class="mypage" for="mypage"
				style="cursor: pointer">마이페이지</label> <input id="mypage"
				type="checkbox">
				<nav id="main_nav1">
					<ul>
						<li><a href="#">회원정보수정</a></li>
					</ul>
				</nav></li>
		</ul>
	</div>
</body>
</html>


