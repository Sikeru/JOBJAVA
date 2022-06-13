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
<title>일자리 등록 페이지</title>
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
				<h1>일자리 등록</h1>
				<br>
				
			</div>
				<form action="${contextPath}/counselor/addjob.do" method="post">
				<hr>
			
				<div class="uniname">
					<input id="uniname" type="text" name="CAREER" size="51"
						placeholder="경력"> 
					<input id="unihp" type="text" name="EDU" size="51" 
						placeholder="학력">
				</div>
				
				<br>
				
				<div class="uniname">
					<input id="uniname" type="text" name="AREA" size="51"
						placeholder="지역"> 
					<input id="unihp" type="text" name="SAL" size="51" 
						placeholder="임금">
				</div>
				
				<br>

				<div class="uniname">
					<input id="uniname" type="text" name="EMP_TYPE" size="51"
						placeholder="고용형태"> 
					<input id="unihp" type="text" name="WORK_TYPE" size="51" 
						placeholder="근무형태">
				</div>
				
				<br>
				
				<div class="uniname">
					<input id="uniname" type="text" name="WELFARE" size="51"
						placeholder="복리후생"> 
					<input id="unihp" type="text" name="COMPANY" size="51" 
						placeholder="기업명">
				</div>
				
				<br>
								
				<div class="uniname">
					<input id="uniname" type="text" name="B_TYPE" size="51"
						placeholder="업종"> 
					<input id="unihp" type="text" name="SCALE" size="51" 
						placeholder="기업규모">
				</div>
				
				<br>
				
				<div class="unidate">
					설립년도 <input id="unistart" type="date" name="ESTABLISH" size="103">
				</div>
				
				<br>
				
				<div class="uniname">
					<input id="uniname" type="text" name="Y_SALES" size="51"
						placeholder="연매출액"> 
					<input id="unihp" type="text" name="HP" size="51" 
						placeholder="홈페이지">
				</div>
				
				<br>

				<div class="uniname">
					<input id="uniname" type="text" name="EMP_NUM" size="111"
						placeholder="근로자수"> 
				</div>
				
				<br>
				
				<div class="unidate">
					시작날짜 <input id="unistart" type="date" name="S_DATE" size="51">
					~ 종료날짜 <input id="uniend" type="date" name="D_DATE" size=51>
				</div>
				
				<br>
				
				<div class="uniname">
					<input id="unihp" type="text" name="TITLE" size="51" 
						placeholder="제목">
					<input id="uniname" type="text" name="JOB_D" size="51"
						placeholder="상세설명"> 
				</div>
				
			<br> <input type="submit" value="등록하기"> <input
				type="reset" value="다시입력">
		</form>
			</div>
	</div>

</body>
</html>