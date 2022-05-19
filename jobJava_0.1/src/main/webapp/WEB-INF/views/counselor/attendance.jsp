<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gugi&display=swap')
	;
</style>
<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet"
	type="text/css" media="screen">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출석관리 페이지</title>
</head>

<script>
	$(function() {
		$('.sub').hide();
		$('.title').click(function() {
			$('.sub').hide(500);
			$('.title').removeClass('on');
			$('.title').css({
				color : '#000'
			})
			$(this).next().show(500);
			$(this).addClass('on');

		}); //title click끝 

		$('.sub li').hover(function() {
			$(this).find('a').css({
				fontWeight : 'bold'
			});

		}, function() {
			$(this).find('a').css({
				fontWeight : 'normal'
			});

		}); //sub li hover 끝

	}); //첫 function 끝
</script>
<style>
/* table {
	border: 3px solid gray
}

td {
	border: 1px solid gray
}

#regtitle {
	background-color: gray
}

#divPaging {
	clear: both;
	margin: 0 auto;
	width: 150px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
} */
</style>

<body>
	<a>출퇴근 조회</a>
	<form action="${contextPath}/counselor/commuteCheck.do" method="post">
		<input type="date" name='one' /> <input type="date" name='two' /> <input
			type='submit' value='검색' />
	</form>
	<table class='g-table'>
		<thead>
			<tr class='g-tr'>
				<th class='g-th'>이름</th>
				<th class='g-th'>날짜</th>
				<th class='g-th'>출근 시간</th>
				<th class='g-th'>퇴근 시간</th>
				<th class='g-th'>처리 여부</th>
			</tr>
		</thead>
		<c:forEach var="attendanceCheck" items="${attendanceCheck}" begin="0"
			end="9">
			<tbody>
				<tr>
					<td>${attendanceCheck.ID}</td>
					<td>${attendanceCheck.CD}</td>
					<td>${attendanceCheck.AT}</td>
					<td>${attendanceCheck.QT}</td>
					<td>${attendanceCheck.PROCESS}</td>
				</tr>
			</tbody>
		</c:forEach>

		<c:forEach var="commuteCheck" items="${commuteCheck}" begin="0"
			end="9">
			<tbody>
				<tr>
					<td>${commuteCheck.ID}</td>
					<td>${commuteCheck.CD}</td>
					<td>${commuteCheck.AT}</td>
					<td>${commuteCheck.QT}</td>
					<td>${commuteCheck.PROCESS}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<%-- <li>
		<div id="divPaging">
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span><a
						href='<c:url value="companyLegisterList?page=${paging.startPage-1}"/>'>이전</a></span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="num">
					<span><a
						href='<c:url value="companyLegisterList.do?page=${num}"/>'>${num}</a></span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span><a
						href='<c:url value="companyLegisterList?page=${paging.endPage+1}"/>'>다음</a></span>
				</c:if>
			</ul>
		</div>
	</li> --%>
</body>
</html>


