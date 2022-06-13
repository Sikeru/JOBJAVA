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
<title>Canvas</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
#listMenu {
	width: 100%;
	height: auto;
	color: #fff;
	background: #BBE1FA;
}

#listMenu ul {
	width: 100%;
	height: 50px;
	margin: 0;
	margin-left: 30%;
	padding: 0;
	text-align: center;
}

#listMenu li {
	width: 200px;
	height: 100%;
	text-align: center;
	list-style: none;
	font-size: 20px;
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

#boardwrap {
	width: 1400px;
	margin: 0 auto;
}

#board {
	width: 1400px;
	margin: 0 auto;
	margin-top: 60px;
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
	width: 10%;
}

#th-4 {
	width: 10%;
}

#th-5 {
	width: 10%;
}

#th-6 {
	width: 10%;
}

#th-7 {
	width: 10%;
}

table {
	text-align: center;
}

/* #liSearchOption {
   clear: both;
} */

/* #liSearchOption>div {
   margin: 0 auto;
   margin-top: 30px;
   width: auto;
   height: 100px;
} */

.noti{
width: 300px;
height: 100px;
text-align: center;
margin:0 auto;
padding:0;
}

.noti p{
width:100%;
height:100%;
margin:0;
font-size: 15px;
font-weight: bold;
margin-top:30px;

}


/* 승인, 취소 버튼 */

#appCheckBtn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 50px;
    height: 30px;
}

#appCheckBtn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}

#appCheckDelBtn{
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    width: 50px;
    height: 30px;
    background: #4169E1;
    color: white;
    border: 0px solid;
}

#appCheckDelBtn:hover {
background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    
}

/* 페이징 */
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

.search {
	margin-left: 495px;
	margin-bottom: 40px;
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
	width: 130px;
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
</style>


<script type="text/javascript">
	
</script>

</head>
<body>
	<s:authorize access="hasRole('ROLE_COM')">
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/leader/companyLegisterList.do">사업참여</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/leader/companyLegisterStuList.do">참여학생조회</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/leader/surveylist.do">설문조사</a>
					</p></li>
			</ul>
		</div>
	</s:authorize>
	<div id="boardwrap">
		<div id="board" text>
			<table>
				<thead>
					<tr>
						<th id=th-1>No</th>
						<th id=th-2>사업명</th>
						<th id=th-3>학생명</th>
						<th id=th-4>대학명</th>
						<th id=th-5>사업시작일</th>
						<th id=th-6>사업종료일</th>
						<s:authorize access="hasAnyRole('ROLE_STU,ROLE_COM')">
							<th id=th-7>관리</th>
						</s:authorize>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="list" items="${list}">
								<tr align="center">
									<td>${list.UNI_B_NO}</td>
									<td>${list.B_NAME}</td>
									<td>${list.NAME}</td>
									<td>${list.U_NAME}</td>
									<td><fmt:formatDate value="${list.S_DATE}"
											pattern="yyyy-MM-dd" /></td>
									<td id=lastborder><fmt:formatDate value="${list.E_DATE}"
											pattern="yyyy-MM-dd" /></td>

									<!-- 신청 수정버튼영역(학생)-->
									<!-- 신청 수정버튼영역(기업)-->
									<td><s:authorize access="hasRole('ROLE_COM')">
											<c:if test="${list.PERMISSION eq '신청대기중'}">
												<input type="button" id="appCheckBtn" value="승인"
													onclick="location.href='${contextPath}/leader/studentApprove.do?uniBNO=${list.UNI_B_NO}'">
											</c:if>
											<c:if test="${list.PERMISSION eq '승인'}">
												<input type="button" id="appCheckDelBtn" value="취소"
													onclick="location.href='${contextPath}/leader/studentApproveDel.do?uniBNO=${list.UNI_B_NO}'">
											</c:if>
										</s:authorize></td>
								</tr>

							</c:forEach>

						</c:when>
				
					</c:choose>
				</tbody>
			</table>
			<c:if test="${empty list}">
					<div class="noti"><p>사업에 참여한 학생이 없습니다</p></div>
					</c:if>
		</div>
	</div>



	<!-- 게시판 페이징 영역 -->

	<form role="form" method="get">

		<div id="divPaging">
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span><a
						href='<c:url value="companyLegisterStuList?page=${paging.startPage-1}"/>'>이전</a></span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="num">
					<span><a
						href="companyLegisterStuList.do${paging.makeSearch(num)}">${num}</a></span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span><a
						href='<c:url value="companyLegisterStuList?page=${paging.endPage+1}"/>'>다음</a></span>
				</c:if>
			</ul>
		</div>
	</form>
</body>
</html>
