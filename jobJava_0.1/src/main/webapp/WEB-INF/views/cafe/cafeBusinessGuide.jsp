<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
<style>
#listMenu {
	width: 100%;
	height: auto;
	color: #fff;
	background: #BBE1FA;
	text-align: center;
}
#listMenu ul {
	width: 100%;
	height: 50px;
	margin: 0;
	padding: 0;
	margin-left: 200px;
}


#listMenu li {
	width: 200px;
	height: 100%;
	text-align: center;
	list-style: none;
	font-size: 17px;
	float: left;
	margin-left: 1px;
	background: #3282B8;
}

#listMenu li p {
	margin: 0;
	margin-top: 10px;
}

#listMenu li a {
	text-decoration: none;
	color: white;
}
#content_wrap {
	margin-top: 40px;
	position: relative;
	margin-bottom: 50px;
	width: 1600px;
	overflow: hidden;
}

p {
	margin-left: 50px;
}

li {
	margin-left: 50px;
}

article #banner5 {
	width: 1000px;
	height: 393px;
	margin-left: 400px;
	margin-top: 50px;
	background: white;
	border: 2px solid lightgray;
	display: inline-block;
}

h2 {
	margin-top: 40px;
	font-size: 30px;
	margin-left: 100px;
}

body {
	line-height: 1.5;
	color: #000;
	font-family: Dream, "맑은 고딕", Malgun Gothic, "돋움", Dotum, "굴림", Gulim,
		Tahoma, Verdana, AppleGothic, UnDotum, sans-serif;
}

.depth2_title02, .depth3_title02, .promotion_work>li>strong {
	font-weight: 500;
}

.depth2_title02 {
	margin-top: 60px;
}

[class^="depth2_title"] {
	position: relative;
	margin-bottom: 1.5rem;
	padding-left: 24px;
	color: #000;
	font-size: 1.8rem;
	font-weight: 400;
}

[class^="depth2_title"]::before {
	display: block;
	position: absolute;
	top: 6px;
	left: 0;
	width: 15px;
	height: 15px;
	border: 4px solid #324395;
	border-radius: 100%;
	content: '';
}

#imagesection {
	float: left;
}

#imgsize1 {
	width: 380
}

#imgsize2 {
	width: 380
}

#imgsize3 {
	width: 380
}

#imgsize4 {
	width: 380
}

table {
	margin: 0 auto;
	width: 1200px;
}

		.dropdown-menu {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	display: inline-block;
	color: black;
}

.dropdown-content {
	display: none;
	background-color: rgba(50, 130, 184, 0.4);
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	margin-top: 15px;
	color: black;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: rgba(50, 130, 184, 0.7);
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropdown-menu {
	background-color: #3e8e41;
}
</style>

<head>

</head>
<body>
	<s:authorize access="hasRole('ROLE_COM')" >
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/celender.do">채용일정</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/jobposting.do">채용공고</a>
					</p></li>
				<li class="dropdown"><p>
						<a>프로그램 목록</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/consulting.do">취업컨설팅</a> <a
							href="${contextPath}/cafe/lecture.do">취업특강</a>
					</div>
					</p></li>
				<li><p>
						<a href="${contextPath}#">설문조사</a>
					</p></li>
				<li class="dropdown"><p>
						<a>마이페이지</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/mypage.do">사업참여등록</a> 
						<a href="${contextPath}/cafe/companymypagelist.do">신청자관리</a>
					</div>
					</p></li>
			</ul>
		</div>
	</s:authorize>
	
	<s:authorize access="hasAnyRole('ROLE_USER','ROLE_STU')">
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/celender.do">채용일정</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/jobposting.do">채용공고</a>
					</p></li>
				<li class="dropdown"><p>
						<a>프로그램 목록</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/consulting.do">취업컨설팅</a> <a
							href="${contextPath}/cafe/lecture.do">취업특강</a>
					</div>
					</p></li>
				<li><p>
						<a href="${contextPath}#">설문조사</a>
					</p></li>
				<li class="dropdown"><p>
						<a>마이페이지</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/jobapp.do">구직등록</a> 
						<a href="${contextPath}/cafe/studentmypagelist.do">내 신청현황</a>
					</div>
					</p></li>
			</ul>
		</div>
	</s:authorize>
	
<s:authorize access="hasRole('ROLE_EMP')" >
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/celender.do">채용일정</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/jobposting.do">채용공고</a>
					</p></li>
				<li class="dropdown"><p>
						<a>프로그램 목록</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/consulting.do">취업컨설팅</a> <a
							href="${contextPath}/cafe/lecture.do">취업특강</a>
					</div>
					</p></li>
				<li><p>
						<a href="${contextPath}#">설문조사</a>
					</p></li>
					<li><p>
						<a href="${contextPath}/counselor/main.do">상담사페이지</a>
					</p></li>
				
			</ul>
		</div>
	</s:authorize>


	<div id="content" class="container" style="margin-bottom: 0px;">
		<section id="content_wrap">
			<h2 class="depth2_title02">일자리카페 꿈터란?</h2>
			<p>대전시 구직자들을 위해 대학가 주변 편의 생활권 내에 취업관련 커뮤니티 공간을 제공하여 취·창업 정보를 공유하고
				취업지원 프로그램을 운영하는 잡(JOB) 카페</p>
			<h2 class="depth2_title02">지원내용</h2>
			<ul class="lstyle_dot">
				<li>구직자들의 진로, 취업 고민을 함께하기 위해 진로/취업 상담, 취업멘토링(직무/기업분석, 입사서류 컨설팅,
					면접 컨설팅 등), 취업특강, 모의/현장면접, 취업스터디 등<br> 전반적인 취업지원 서비스 제공
				</li>
				<li>편안한 공간에서 상담을 받으실 수 있도록 카페에서 진행되며, 음료는 무료로 제공</li>
			</ul>
			<h2 class="depth2_title02">카페 안내</h2>

			<div id="banner">
				<img width="560px" height="390px"
					src="${contextPath}/resources/image/cafemain2.jpg">
				<div id="cafe">
					<a id="cafename">청춘나들목(대전역)</a><br> <br> <a
						id="cafecontent"> 주소 : 대전 동구 중앙로 218 지하3층 <br> <br>
						청춘나들목은 대전광역시에서 청년들이 편하게 이용할 수 있는 공간으로써 조성했습니다. 나들목, 너나들이, 두두두 등 청년
						활동 공유공간을 마련한 것은 장소, 명칭, 공간 콘셉까지 청년들의 의견을 적극적으로 반영하였습니다.
					</a>

				</div>

			</div>

			<div id="banner5">
				<img width="560px" height="390px"
					src="${contextPath}/resources/image/cafemain1.jpg">
				<div id="cafe">
					<a id="cafename">카이로스(궁동)</a><br> <br> <a
						id="cafecontent"> 주소 : 대전 유성구 궁동로 14번길 22<br> <br>
						따듯함과 행복함이 공존하는 곳
					</a>
				</div>

			</div>

			<div id="banner2">
				<img width="560px" height="390px"
					src="${contextPath}/resources/image/cafemain3.jpg">
				<div id="cafe">
					<a id="cafename">할리스(한남대점)</a><br> <br> <a
						id="cafecontent"> 주소 : 대전 대덕구 한남로 65 <br> <br>
						할리스커피는 1998년 국내 첫 에스프레소 커피전문점을 개점한 순수 국내브랜드로서 현재 서울을 비롯한 전국 주요 상권
						및 영화관 등에 매장을 운영하고 있습니다.
					</a>
				</div>
			</div>
		</section>
	</div>

</body>



</html>
