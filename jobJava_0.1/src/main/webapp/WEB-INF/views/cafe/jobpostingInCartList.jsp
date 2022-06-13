<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <fmt:parseDate value="${list}" var="list" pattern="yyyy-MM-dd"/> --%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canvas</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 1300px;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: absoulute;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 50px;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 200px;
} /*기업 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 400px;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 100px;
} /*경력 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 300px;
} /*지역 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li {
	width: 100px;
} /*학력 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li {
	width: 50px;
} /*시작일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li {
	width: 50px;
} /*종료일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li+li {
	width: 50px;
} /*관리 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li+li+li+li+li+li {
	width: 50px;
}

#divPaging {
	clear: both;
	margin: 0 auto;
	width: 220px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#liSearchOption {
	clear: both;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

.left {
	text-align: left;
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
	margin-left: 300px;
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

</style>

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
	<form role="form" method="get">
		<div id="mainWrapper">

			<ul>
				<!-- 게시판 제목 -->
				<br>
				<li>채용정보</li>
				<br>

				<!-- 게시판 목록  -->
				<li>
					<ul id="ulTable">
						<li>
							<ul>
								<li>no</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<c:forEach var="list" items="${list}">
							<li>
								<ul>
								<li class="left"><a
										href="${contextPath}/cafe/jobpostingdetail.do?JOB_NO=${list.JOB_NO}">${list.JOB_NO}</a></li>



									<!-- 신청 수정버튼영역(학생)-->

								</ul>
							</li>
						</c:forEach>
					</ul>

				</li>


				<!-- 게시판 페이징 영역 -->



				<li>
					<div id="divPaging">
						<ul class="paging">
							<c:if test="${paging.prev}">
								<span><a
									href='<c:url value="jobposting.do?page=${paging.startPage-1}"/>'>이전</a></span>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
								var="num">
								<span><a
									href='<c:url value="jobposting.do?page=${num}"/>'>${num}</a></span>
							</c:forEach>
							<c:if test="${paging.next && paging.endPage>0}">
								<span><a
									href='<c:url value="jobposting.do?page=${paging.endPage+1}"/>'>다음</a></span>
							</c:if>
						</ul>
					</div>
				</li>

				<!-- 검색 폼 영역 -->
				<li id='liSearchOption'>

					<div class="search">
						<select name='searchType'>
							<option value='T'
								<c:out value="${scri.searchType eq 'T' ? 'selected' : ''}"/>>기업</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${scri.keyword}" />
						<button id="searchBtn" type="button">검색</button>
						<script src="http://code.jquery.com/jquery-latest.js"></script>
						<script>
							$(function() {
								$('#searchBtn')
										.click(
												function() {
													self.location = "jobposting.do"
															+ '${paging.makeQuery(1)}'
															+ "&searchType="
															+ $(
																	"select option:selected")
																	.val()
															+ "&keyword="
															+ encodeURIComponent($(
																	'#keywordInput')
																	.val());
												});
							});
						</script>
						<script>
							$('input[type="submit"]').keydown(function() {
								if (event.keyCode === 13) {
									event.preventDefault();
								}
								;
							});
						</script>
					</div>
				</li>


			</ul>

		</div>

	</form>


</body>
</html>
