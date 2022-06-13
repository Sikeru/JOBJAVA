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
<title>상담일지관리 등록</title>
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

<style>
.uni {
	position: absolute;
	top: 80px;
}

#unibox {
	width: 500px;
	height: 1000px;
	position: absolute;
	left: 500px;
}
</style>
<body>
	<div id="unibox">
		<div class="uni">
			<div class="unireg">
			<h2>상담 일지 관리 등록</h2>
			</div>

			<form action="${contextPath}/counselor/addjou.do" method="post">

				<input type="hidden" name="CON_NO"> 
				<input type="hidden" name="EMP_NO">
				
				<hr>

					
				<div class="uniname">
				상담일 <input id="unistart" type="date" name="CJ_DATE" size="30">
					<input id="unihp" type="text" name="ID" size="30" 
						placeholder="학생 이름">
				</div>
				
				<br>

				<div class="unicontent">
					<textarea id="unicontent" cols=90 name="CONTENT"
						placeholder="상담내용"></textarea>
				</div>

				<br> <input type=submit value="등록하기">

			</form>

		</div>
	</div>

</body>
</html>