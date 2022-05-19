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
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gugi&display=swap');
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
<body>
	<div id='main'>
		<div id="jobseeker">
			<a> 구직자 정보 리스트</a>
			<P>이름 나이 전화번호</P>
			<c:forEach var="counselor" items="${counselor }">
				<p>
				${counselor.NAME} 
				${counselor.AGE} 
				${counselor.HP}
				</p>
			</c:forEach>
		</div>

		<div id="company">
			<a>일자리 정보 리스트</a>
			<table class='g-table'>
				<thead>
					<tr class='g-tr'>
						<th class='g-th'>경력</th>
						<th class='g-th'>학력</th>
						<th class='g-th'>지역</th>
						<th class='g-th'>회사</th>
					</tr>
				</thead>
				<c:forEach var="counselor1" items="${counselor1}" begin="0" end="9">
					<tbody>
						<tr>
							<td class='g-td'>${counselor1.CAREER}</td>
							<td class='g-td'>${counselor1.EDU}</td>
							<td class='g-td'>${counselor1.AREA}</td>
							<td class='g-td'>${counselor1.COMPANY}</td>
				</c:forEach>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
