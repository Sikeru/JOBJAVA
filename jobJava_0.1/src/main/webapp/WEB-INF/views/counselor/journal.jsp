<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
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
<title>일지관리</title>
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

/* #mainWrapper>ul>li:first-child { */
/* 	text-align: center; */
/* 	font-size: 14pt; */
/* 	height: 40px; */
/* 	vertical-align: middle; */
/* 	line-height: 30px; */
/* } */

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
	width: 15%;
} /*이름 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 20%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 65%;
} /*내용 열 크기*/
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
	<ul>
		<li>업무 일지</li>
		<form role="form" action="${contextPath}/counselor/journal.do" method="post">
			<ul id="ulTable">
				<li>
					<ul>
						<li>이름</li>
						<li>제목</li>
						<li>내용</li>
					</ul>
				</li>
				<c:forEach var="list" items="${list}" begin="0" end="${paging.endPage}">
					<li>
						<ul>
							<li>${journalCheck.ID}</li>
							<li>${journalCheck.TITLE}</li>
							<li>${journalCheck.CONTENT}</li>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</form>
	</ul>
	<!-- 게시판 페이징 영역 -->

	<li>
		<div id="divPaging">
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span>
						<a href='<c:url value="journal?page=${paging.makeSearch(paging.startPage-1)}"/>'>이전
						</a>
					</span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
					<span>
						<a href="journal.do${paging.makeSearch(num)}">${num}
						</a>
					</span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span>
						<a href='<c:url value="journal?page=${paging.makeSearch(paging.startPage-1)}"/>'>다음
						</a>
					</span>
				</c:if>
			</ul>
		</div>
	</li>
	<!-- 검색 폼 영역 -->
	<form role="form" method="get">
		<li id='liSearchOption'>
			<div class="search">
				<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					<button id="searchBtn" type="button">검색
					</button>
				<script src="http://code.jquery.com/jquery-latest.js"></script>
				<script>
				    $(function(){
				        $('#searchBtn').click(function() {
				          self.location = "journal.do" + '${paging.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
			};
		});
	</script>
</div>
</body>
</html>