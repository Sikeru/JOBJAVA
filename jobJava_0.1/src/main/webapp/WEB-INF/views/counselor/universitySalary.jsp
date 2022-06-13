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

<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet"
	type="text/css" media="screen">
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
</head>
<title>대학사업비 조회</title>
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
	
// 	승인 저장
	function updateMember(cnt, unibNO){
		let f = document.createElement('form');
		let process = document.getElementById("PERMISSION"+cnt).value;
	    let obj;
	    let obj1;
	    
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'permission');
	    obj.setAttribute('value', process);
	    
	    obj1 = document.createElement('input');
	    obj1.setAttribute('type', 'hidden');
	    obj1.setAttribute('name', 'unibNO');
	    obj1.setAttribute('value', unibNO);
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', ' ${contextPath}/counselor/updateSalaryList.do');
	    document.body.appendChild(f);
	    f.submit();
	     
	    }
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
   width: 15%;
}

#th-2 {
   width: 15%;
}

#th-3 {
   width: 15%;
}

#th-4 {
   width: 15%;
}

#th-5 {
   width: 20%;
}
#th-6 {
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
   border: 1px solid #0F4C75 ;
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

th {
	background: #e6e6e6;
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
<br>
		<br>
		<h4>
		<a href="${contextPath}/counselor/studentSalary.do">학생 급여 조회</a>
		/
		<a href="${contextPath}/counselor/universitySalary.do">대학 별 사업비 조회</a>
		</h4>
			<br>
			<hr>
		<div id="boardwrap">
			<div id="board" text>
		<table>
			<thead>
					<tr>
						<th id=th-1>시작일</th>
						<th id=th-2>종료일</th>
						<th id=th-3>대학명</th>
						<th id=th-4>급액</th>
						<th id=th-5>승인 여부</th>
						<th id=th-6>수정</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}" begin="0" end="${paging.endPage}" varStatus="status">
						<tr>
							<td>${list.SD}</td>
							<td>${list.ED}</td>
							<td>${list.U_NAME}</td>
							<td>${list.B_EXPENSE}</td>
<!-- 							승인 -->
							<td><select id="PERMISSION${status.count}" name="PERMISSION">
                       			<option hidden="${list.PERMISSION}" selected>${list.PERMISSION}</option>
                       			<option value="접수진행중">접수진행중</option>
                       			<option value="승인">승인</option>
                       			<option value="거부">거부</option>
                  			</select></td>
                  			<td><input id="subbtn" type="button" value="수정" onclick="updateMember(${status.count}, ${list.UNI_B_NO})"/></td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
</div>
	<!-- 게시판 페이징 영역 -->
		<div id="divPaging">
			<ul class="paging">
				<c:if test="${paging.prev}">
					<span>
						<a href='<c:url value="universitySalary?page=${paging.makeSearch(paging.startPage-1)}"/>'>이전
						</a>
					</span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
					<span>
						<a href="universitySalary.do${paging.makeSearch(num)}">${num}
						</a>
					</span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span>
						<a href='<c:url value="universitySalary?page=${paging.makeSearch(paging.startPage-1)}"/>'>다음
						</a>
					</span>
				</c:if>
			</ul>
		</div>
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
				          self.location = "universitySalary.do" + '${paging.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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