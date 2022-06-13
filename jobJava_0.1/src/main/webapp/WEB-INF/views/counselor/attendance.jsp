<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
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
				color : '#fff'
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
   border-bottom: 1px solid #A4A4A4 ;
   border-right: 1px solid #A4A4A4 ;
   height: 40px;
}

#board td:last-child {
   border-right: none;
}

#board th {
   border-bottom: 1px solid black;
   border-top: 1.5px solid black;
   height: 50px;
   background-color: #0F4C75 ;
   font-size: 16px;
}

#board tbody td a {
   color: black;
   text-decoration: none;
}

#th-1 {
   width: 20%;
}

#th-2 {
   width: 20%;
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

/* #liSearchOption { */
/*    clear: both; */
/* } */

/* #liSearchOption>div {
   margin: 0 auto;
   margin-top: 30px;
   width: auto;
   height: 100px;
} */
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
   border: 1px solid #e6e6e6 ;
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
   margin-left: 600px;
   margin-top: 40px;
}

h2 {
   text-align: center;
   margin-top: 40px;
   font-size: 30px;
}

#searchBtn {
   width: 70px;
   height: 30px;
   border: none;
   border: 1px solid #e6e6e6 ;
}
#searchBtn1 {
   width: 70px;
   height:30px;
   border: none;
   border: 1px solid #e6e6e6 ;
}

#keywordInput {
   width: 200px;
}

/* searchType {
   width: 100px;
} */
#searchtitle {
   width: 110px;
   height: 80px;
   text-align: center;
   margin: 0 auto;
   border: 1px solid #e6e6e6;
   font-size : 14px;
}

#keywordInput {
   border: 1px solid #e6e6e6;
   text-align: center;
}
table {
	width: 100%;
	border-collapse: collapse;
	line-height: 24px;
}

table td, th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 10px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
}

li{
	list-style: none;
}
h4{
	font-size : 20px;
	position: absolute;
	left: 700px;	
}
#datebox{
	position: relative;
	left: 200px;
}
th{
	color:#fff;
}
</style>
<body>
			<%-- 	<p>${list}</p> --%>
			<br>
			<br>
			<h4>
			<a href="${contextPath}/counselor/attendance.do">출퇴근 조회</a>
			/
			<a href="${contextPath}/counselor/journal.do">업무 일지</a>
			</h4>
			<br>
			<hr>
			
			<div id="boardwrap">
			<div id="datebox">
						<input type="date" id="keywordInput2" name='keyword' />
						<input type="date" id="keywordInput3" name='keyword1' />
						<button id="searchBtn1" type="button">검색</button>
			</div>
			<script>
					    $(function(){
					    	$('#searchBtn1').click(function() {self.location = "attendance2.do" + '${paging.makeQuery(1)}' + "&keyword=" + $('#keywordInput2').val() + "&keyword1=" + $('#keywordInput3').val();
					        });
					     });   
			</script>
			
			<form role="form" action="${contextPath}/counselor/attendance.do" method="post">
			 <div id="board" text>
			<table>
				<thead>
					<tr>
						<th id=th-1>이름</th>
						<th id=th-2>날짜</th>
						<th id=th-3>출근 시간</th>
						<th id=th-4>퇴근 시간</th>
						<th id=th-5>처리여부</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시물이 출력될 영역 -->
					<c:forEach var="list" items="${list}" begin="0" end="${paging.endPage}">
						<tr align="center">
							<td>${list.ID}</td>
							<td>${list.CD}</td>
							<td>${list.AT}</td>
							<td>${list.QT}</td>
							<td>${list.PROCESS}</td>
						</tr>
					</c:forEach>
			</table>
			</div>
		</form>
	</div>
	<!-- 게시판 페이징 영역 -->

		<div id="divPaging">
		
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span><a
						href='<c:url value="attendance?page=${paging.makeSearch(paging.startPage-1)}"/>'>이전</a></span>
				</c:if>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="num">
					<c:if test="${paging.cri.keyword1 == ''}">
					<span> <a href="attendance.do${paging.makeSearch(num)}">${num}</a>
					</span>
					</c:if>
					<c:if test="${paging.cri.keyword1 != ''}">
					<span> <a href="attendance2.do${paging.makeSearch(num)}">${num}</a>	
					</span>
					</c:if>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span><a
						href='<c:url value="attendance?page=${paging.makeSearch(paging.startPage-1)}"/>'>다음</a></span>
				</c:if>

			</ul>
		</div>

	<!-- 검색 폼 영역 -->
	<form role="form" method="get">

			<div class="search">

				<input type="text" name="keyword" id="keywordInput"
					value="${scri.keyword}" />
				<button id="searchBtn" type="button">검색</button>
				<script src="http://code.jquery.com/jquery-latest.js"></script>
				<script>
					    $(function(){
					        $('#searchBtn').click(function() {self.location = "attendance.do" + '${paging.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
				
						
			</div>
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


