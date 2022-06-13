<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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

.g-th {
  	text-align : center;
}
</style>

<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet"
	type="text/css" media="screen">
<title>Insert title here</title>
</head>
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
   width: 500px;
   margin: 0 auto;
   position: relative;
   left: 100px;
   top: 100px;
}
#boardwrap2 {
   width: 500px;
   margin: 0 auto;
   position: relative;
   left: 700px;
   top: -298px;
   
}


#board {
   width: 500px;
   margin: 0 auto;
}
#board2 {
   width: 500px;
   margin: 0 auto;
}


#board table {
   width: 1000px;
   margin: 0 auto;
   font-weight: bold;
}

#board td {
   width: 500px;
   border-bottom: 1px solid #A4A4A4;;
   border-right: 1px solid #A4A4A4;
   height: 40px;
}

#board td:last-child {
   border-right: none;
}

#board2 table {
   width: 1000px;
   margin: 0 auto;
   font-weight: bold;
}

#board2 td {
   width: 500px;
   border-bottom: 1px solid #A4A4A4;;
   border-right: 1px solid #A4A4A4;
   height: 40px;
}

#board2 td:last-child {
   border-right: none;
}

#board th {
   border-bottom: 1px solid black;
   border-top: 1.5px solid black;
   height: 50px;
   background-color: #0F4C75;
   font-size: 16px;
}

#board2 th {
   border-bottom: 1px solid black;
   border-top: 1.5px solid black;
   height: 50px;
   background-color: #0F4C75;
   font-size: 16px;
}

#board tbody td a {
   color: black;
   text-decoration: none;
}

#board table {
   width: 500px;
   margin: 0 auto;
   font-weight: bold;
}

#board2 tbody td a {
   color: black;
   text-decoration: none;
}

#board2 table {
   width: 500px;
   margin: 0 auto;
   font-weight: bold;
}


#th-1 {
   width: 20%;
}

#th-2 {
   width: 20%;
}

#th-3 {
   width: 60%;
}

#th-4 {
   width: 20%;
}
#th-5 {
   width: 25%;
}
#th-6 {
   width: 25%;
}
#th-7 {
   width: 30%;
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

h2 {
   text-align: center;
   margin-top: 40px;
   font-size: 30px;
}



/* searchType {
   width: 100px;
} */

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
 
/* th {
	background: #f2f2f2;
} */

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

#registration{
	position: relative;
	left: 200px;
}
 th{
	color:#fff;
} 
</style>
<body>
		<div id="boardwrap">
			<h5>구직자 정보 리스트</h5>
			<div id="board" text>
				<table>
            <thead>
               <tr>
		                <th id=th-1>이름</th>
						<th id=th-2>나이</th>
						<th id=th-3>전화 번호</th>
					</tr>
            </thead>
            <tbody>
			<c:forEach var="counselor" items="${counselor}" begin="0" end="9">
				<tbody>
						<tr>
							<td>${counselor.NAME}</td>
							<td>${counselor.AGE}</td>
							<td>${counselor.HP}</td>
						</tr>
						</c:forEach>
            </tbody>
         </table>
      </div>
      </div>

		<div id="boardwrap2">
			<h5>일자리 정보 리스트</h5>
			<div id="board2" text>
			<table>
            <thead>
               <tr>
		                <th id=th-4>경력</th>
						<th id=th-5>학력</th>
						<th id=th-6>지역</th>
						<th id=th-7>회사</th>
					</tr>
				</thead>
				<c:forEach var="counselor1" items="${counselor1}" begin="0" end="9">
					<tbody>
						<tr>
							<td>${counselor1.CAREER}</td>
							<td>${counselor1.EDU}</td>
							<td>${counselor1.AREA}</td>
							<td>${counselor1.COMPANY}</td>
						</tr>
						</c:forEach>
            </tbody>
         </table>
      </div>
      </div>
</body>
</html>
