<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#boardwrap {
	width: 1400px;
	margin: 0 auto;
}

#board {
	width: 1400px;
	margin: 0 auto;
	margin-top: 30px;
}

#board table {
	width: 1000px;
	margin: 0 auto;
	font-weight: bold;
}

#board td {
	width: 1000px;
	border-bottom: 1px solid #A4A4A4;;
	border-right: 1px solid #A4A4A4;
	height: 40px;
}

#board td:last-child {
	border-right: none;
}

#board th {
	border-bottom: 1px solid #192E7E;
	border-top: 1.5px solid #192E7E;
	height: 50px;
	background-color: #f4f5f9;
	font-size: 16px;
}

#board tbody td a {
	color: black;
	text-decoration: none;
}

#th-1 {
	width: 10%;
}

#th-2 {
	width: 40%;
}

#th-3 {
	width: 20%;
}

#th-4 {
	width: 20%;
}

#th-5 {
	width: 20%;
}

table {
	text-align: center;
}

h2 {
	text-align: center;
	margin-top: 40px;
	font-size: 30px;
}

#divPaging {
	text-align: center;
	font-size: 0;
	list-style: none;
	left: 500px;
	clear: both;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	margin: 0 auto;
}

.paging {
	display: inline-block;
	list-style: none;
	margin: 15px 0px;
}

.paging .none {
	display: none;
}

.paging a {
	display: block;
	margin: 0 4px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
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
</style>
</head>
<body>
	<h2>설문조사</h2>
	<div id="boardwrap">
		<div id="board">
			<table>
				<tr>
					<th id=th-1>번호</th>
					<th id=th-2>제목</th>
					<th id=th-3>시작날짜</th>
					<th id=th-4>종료날짜</th>
					<th id=th-5>작성자</th>
				</tr>

				<c:forEach var="slist" items="${surverList}" varStatus="status">
					<tr>
						<td>${slist.SV_NO}</td>
						<td><a href="${contextPath}/counselor/surveyDetail.do?svNO=${slist.SV_NO}">${slist.TITLE}</a></td>
						<td>${slist.s_DATE}</td>
						<td>${slist.e_DATE}</td>
						<td>${slist.NAME}</td>
						<td><input type="button" value="결과보기" onclick="location.href='${contextPath}/counselor/surveyResult.do?svNO=${slist.SV_NO}'"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<br>

	<!-- 페이징영역 -->
	<div id="divPaging">
		<ul class="paging">
			<c:if test="${paging.prev}">
				<span><a
					href='<c:url value="surveylist?page=${paging.startPage-1}"/>'>이전</a></span>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<span><a href="surveylist.do${paging.makeSearch(num)}">${num}</a></span>
			</c:forEach>
			<c:if test="${paging.next && paging.endPage>0}">
				<span><a
					href='<c:url value="surveylist?page=${paging.endPage+1}"/>'>다음</a></span>
			</c:if>
		</ul>
	</div>
	<a href="${contextPath}/counselor/addsurveryfrom.do">설문조사등록</a>
</body>
</html>