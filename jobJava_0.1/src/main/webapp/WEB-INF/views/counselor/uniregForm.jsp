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


<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet" type="text/css" media="screen">
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<head>

<script type="text/javascript">

function uniregCheck() {
	var form = document.getElementById("uniregForm");

	if (!form.U_NAME.value) {
		alert("대학교를 입력해주세요");
		form.U_NAME.focus();
		return false;
	};

	if (!form.UNI_HP.value) {
		alert("전화번호를 입력해주세요");
		form.UNI_HP.focus();
		return false;
	};

	if (!form.UNI_ADDR.value) {
		alert("주소를 입력해주세요");
		form.UNI_ADDR.focus();
		return false;
	}

	if (!form.B_NAME.value) {
		alert("사업명을 입력해주세요");
		form.B_NAME.focus();
		return false;
	}
	
	if (!form.B_EXPENSE.value) {
		alert("사업비를 설정해주세요");
		form.B_EXPENSE.focus();
		return false;
	}
	
	if (!form.S_DATE.value) {
		alert("시작날짜를 설정해주세요");
		form.S_DATE.focus();
		return false;
	}

	if (!form.E_DATE.value) {
		alert("종료날짜를 설정해주세요");
		form.E_DATE.focus();
		return false;
	}
	
	if (!form.E_DATE.value) {
		alert("종료날짜를 설정해주세요");
		form.E_DATE.focus();
		return false;
	}
	
	if (!form.B_CONTENT.value) {
		alert("사업내용을 입력해주세요");
		form.B_CONTENT.focus();
		return false;
	}


	form.submit()
	alert("사업등록이 완료되었습니다.");
}

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
.uni {
	 position: absolute;
    top: 180px;
    border: 5px solid #0F4C75;
    padding: 40px;
    border-radius: 10px;
    width: 800px;
   	
   		}


#unibox {
	width: 500px;
	height: 1000px;
	position: absolute;
	left: 600px;
	}
	
button.button_2 {
   border: 0;
   outline: none;
   font-size: 15px;
   margin: 30px;
   background: black;
   color: white;
   padding: 10px;
   cursor: pointer;
   border-radius: 10px;
   margin-left : 300px;
}

button.button_2:hover {
   color: white;
   background: #E16106;
}

</style>
<body>
	<div id="unibox">
		<div class="uni">


			<div class="unireg">
				<h1>대학교 사업계획서 등록</h1>
			</div>

			<form action="${contextPath}/counselor/adduni.do" id="uniregForm" method="post">

				<hr>

				<input type="hidden" name="UNI_B_NO"> <input type="hidden"
					name="ID"><br> <br>

				<div class="uniname">
					<input id="uniname" type="text" name="U_NAME" size="51"
						placeholder="대학교명">
				      <input id="unihp" type="text"
						name="UNI_HP" size="51" placeholder="전화번호">
				</div>
				<br>


				<div class="uniaddr">
					<input id="uniaddr" type="text" name="UNI_ADDR" size=111
						placeholder="대학교 주소">
				</div>

				<br>


				<div class="unibname">
					<input id="unibname" type="text" name="B_NAME" size=51
						placeholder="사업명"> <input id="uniexpenses" type="text"
						name="B_EXPENSE" size=51 placeholder="사업비">
				</div>

				<br>

				<div class="unidate">
					시작날짜 <input id="unistart" type="date" name="S_DATE" size="50">
					~ 종료날짜 <input id="uniend" type="date" name="E_DATE" size=50>
				</div>

				<br>

				<div class="unicontent">
					<textarea id="unicontent" cols=82 name="B_CONTENT"
						placeholder="사업내용을 입력해주세요."></textarea>
				</div>
				
				<input type="hidden" name="PERMISSION">

				<br>  
				<button class="button_2" type="button" onclick="uniregCheck()">등록하기</button>


			</form>

		</div>
	</div>

</body>
</html>
