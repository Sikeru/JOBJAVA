<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" -->
<!-- 	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" -->
<!-- 	crossorigin="anonymous"></script> -->
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

<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
</head>
<title>출석관리 페이지</title>
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
	width: 800px;
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
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
} /*이름 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 45%;
} /*날짜 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 20%;
} /*출근 시간 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*퇴근 시간 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
} /*처리 여부 열 크기*/
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
</style>
<body>

	
		<div id="mainWrapper">
			<%-- 	<p>${list}</p> --%>
			<ul>
				<!-- 게시판 제목 -->
				<li>출퇴근 조회</li>
				<form role="form" action="${contextPath}/counselor/attendance.do"
		method="post">

				<!-- 게시판 목록  -->
				<ul id="ulTable">
					<input type="date" name='one' />
					<input type="date" name='two' />
					<input type='submit' value='검색' />

					<li>
						<ul>
							<li>이름</li>
							<li>날짜</li>
							<li>출근 시간</li>
							<li>퇴근 시간</li>
							<li>처리 여부</li>
						</ul>
					</li>
					<!-- 게시물이 출력될 영역 -->
					<c:forEach var="list" items="${list}" begin="0"
						end="${paging.endPage}">
						<li>
							<ul>
								<li>${list.ID}</li>
								<li>${list.CD}</li>
								<li>${list.AT}</li>
								<li>${list.QT}</li>
								<li>${list.PROCESS}</li>
							</ul>
						</li>
					</c:forEach>
					<c:forEach var="commuteCheck" items="${commuteCheck}" begin="0"
						end="${paging.endPage}">
						<li>
							<ul>
								<li>${commuteCheck.ID}</li>
								<li>${commuteCheck.CD}</li>
								<li>${commuteCheck.AT}</li>
								<li>${commuteCheck.QT}</li>
								<li>${commuteCheck.PROCESS}</li>
							</ul>
						</li>
					</c:forEach>
				</ul>
				</form>
			</ul>
		</div>

	<!-- 게시판 페이징 영역 -->

	<li>
		<div id="divPaging">
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span><a
						href='<c:url value="attendance?page=${paging.makeSearch(paging.startPage-1)}"/>'>이전</a></span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="num">
					<span> <a href="attendance.do${paging.makeSearch(num)}">${num}</a>
						<%-- <span><a href='<c:url value="companyLegisterList.do?page=${num}"/>'>${num}</a></span> --%>
					</span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span><a
						href='<c:url value="attendance?page=${paging.makeSearch(paging.startPage-1)}"/>'>다음</a></span>
				</c:if>

			</ul>
		</div>
	</li>

	<!-- 검색 폼 영역 -->
	<form role="form" method="get">
		<li id='liSearchOption'>

			<div class="search">

				<input type="text" name="keyword" id="keywordInput"
					value="${scri.keyword}" />
				<button id="searchBtn" type="button">검색</button>
				<script src="http://code.jquery.com/jquery-latest.js"></script>
				<script>
					    $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "attendance.do" + '${paging.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
			</div>

		</li>

	</form>

	<script>
		$('input[type="submit"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
			;
		});
	</script>

</body>
</html>


