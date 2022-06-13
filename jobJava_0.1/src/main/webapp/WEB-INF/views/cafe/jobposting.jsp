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

#board {
	width: 1400px;
	margin: 0 auto;
	margin-top: 60px;
}

#board table {
	width: 1200px;
	margin: 0 auto;
	font-weight: bold;
	font-size: 12px;
	word-spacing: -5px;
}

#board td {
	width: 1000px;
	border-bottom: 1px solid #A4A4A4;;
	border-right: 1px solid #A4A4A4;
	height: 40px;
	font-size: 14px;
	word-spacing: -5px;
}

#board td:last-child {
	border-right: none;
}

#board th {
	border-bottom: 1px solid #192E7E;
	border-top: 1.5px solid #192E7E;
	height: 50px;
	background-color: #f4f5f9;
	font-size: 12px;
	word-spacing: -5px;
}

#board tbody td a {
	color: black;
	text-decoration: none;
}

/* 기업*/
#th-2 {
	width: 20%;
}
/* 제목*/
#th-3 {
	width: 37%;
}
/* 경력 */
#th-4 {
	width: 16%;
}
/* 학력 */
#th-5 {
	width: 14%;
}
/* 종료일 */
#th-6 {
	width: 8%;
}
/* 관리 */
#th-7 {
	width: 5%;
}

table {
	text-align: center;
}

#divPaging {
	text-align: center;
	font-size: 0;
	list-style: none;
	clear: both;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	margin: 0 auto;
}

.paging {
	display: inline-block;
	list-style: none;
	margin-top: 60px;
}

.paging .none {
	display: none;
}

.paging a {
	display: block;
	margin: 0 4px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 35px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: black;
	text-decoration: none;
}

.paging .ul {
	list-style: none;
	text-align: center;
}

.paging .arrow {
	border: 1px solid #ccc;
}

.paging .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.paging .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.paging .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.paging .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.paging a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.search {
	margin-top: 40px;
	text-align: center;
	margin-bottom: 70px;
}

h2 {
	text-align: center;
	margin-top: 40px;
	font-size: 30px;
}

#searchBtn {
	width: 70px;
	heigth: 40px;
	border: none;
	border: 1px solid #e6e6e6;
}

#keywordInput {
	width: 200px;
}

/* searchType {
	width: 100px;
} */
#searchtitle {
	width: 110px;
	heigth: 80px;
	text-align: center;
	margin: 0 auto;
	border: 1px solid #e6e6e6;
	font-size: 14px;
}

#keywordInput {
	border: 1px solid #e6e6e6;
	text-align: center;
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

</head>
<body>
	<div id="boardwrap">
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
		<h2>채용정보</h2>
		<!-- 게시판 목록  -->
		<div id="board">
			<table>
				<thead>
					<tr>
						<!-- 		<th id=th-1>번호</th> -->
						<th id=th-2>기업</th>
						<th id=th-3>제목</th>
						<th id=th-4>경력</th>
						<th id=th-5>학력</th>
						<th id=th-6>종료일</th>
						<th id=th-7>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="list" items="${list}">
								<tr align="center">

									<td>${list.COMPANY}</td>


									<td><a
										href="${contextPath}/cafe/jobpostingdetail.do?JOB_NO=${list.JOB_NO}">${list.TITLE}</a></td>


									<td>${list.CAREER}</td>

									<td>${list.EDU}</td>

									<td><fmt:formatDate value="${list.D_DATE}"
											pattern="yyyy-MM-dd" /></td>

									<!-- 신청 수정버튼영역(학생)-->
									<td>${list.STATE}<s:authorize access="hasRole('ROLE_EMP')">
											<c:if test='${JOB_NO eq null}'>
												<input type="button" value="담기"
													onclick="location.href='${contextPath}/cafe/jobPostingInsertInCart.do?JOB_NO=${list.JOB_NO}'">
											</c:if>
											<c:if test="${JOB_NO ne null}">
												<c:choose>
													<c:when test="${fn:contains(JOB_NO, list.JOB_NO)}">
														<input type="button" value="삭제"
															onclick="location.href='${contextPath}/cafe/jobPostingInCartDelete.do?JOB_NO=${list.JOB_NO}'">
													</c:when>
													<c:otherwise>
														<input type="button" value="담기"
															onclick="location.href='${contextPath}/cafe/jobPostingInsertInCart.do?JOB_NO=${list.JOB_NO}'">
													</c:otherwise>
												</c:choose>
											</c:if>
											<input value="${userID}" name="userID" type="hidden">

										</s:authorize></td>

								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>





	<!-- 게시판 페이징 영역 -->
	<form role="form" method="get">

		<div id="divPaging">
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span><a
						href='<c:url value="jobposting.do?page=${paging.startPage-1}"/>'>이전</a></span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="num">
					<span><a href='<c:url value="jobposting.do?page=${num}"/>'>${num}</a></span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span><a
						href='<c:url value="jobposting.do?page=${paging.endPage+1}"/>'>다음</a></span>
				</c:if>
			</ul>
		</div>


		<!-- 검색 폼 영역 -->
		<div class="search">
			<select name='searchType' id="searchtitle">
				<option value='TC'
					<c:out value="${scri.searchType eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
				<option value='T'
					<c:out value="${scri.searchType eq 'T' ? 'selected' : ''}"/>>제목</option>
				<option value='C'
					<c:out value="${scri.searchType eq 'C' ? 'selected' : ''}"/>>내용</option>
			</select> <input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" />
			<button id="searchBtn" type="button">search</button>
			<script src="http://code.jquery.com/jquery-latest.js"></script>
			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "jobposting.do"
										+ '${paging.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
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
	</form>
</body>
</html>
