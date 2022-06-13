<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="abcd" value="gkrtod2" />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gugi&display=swap');
</style>

<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet"
	type="text/css" media="screen">

<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
</head>
<title>직무체험관리</title>
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
	
	function selectFx() {
		var id = $('#cId').val();
		$( '#appNO' ).empty();
		$.ajax({
			type: "GET",
			url: "${contextPath}/counselor/selectAppNO.do", 
			data: {"ID" : id},
			success: function(mac) {
				for(var i = 0; i < mac.length; i++) {
					$('#appNO').append('<input type="radio" class="APP_NO" name="APP_NO" value="' + mac[i].APP_NO +'">'+ mac[i].B_NAME +'<br>');
				}
			}
		})

	} // 안되고,,, 폼에 보내고 파라미터로 다시 받아와야 함,,, 자바스크립트에 있는 jsp에 있는 변수에 넘겨주는게 안된담,,,
</script>
		


<body>

<div id = "check">

		<br>
		<br> <b><font size="6" color="gray">직무 체험 확인</font></b>
		<br>
		
		<br>
		<br>
		
		<form  action="${contextPath}/counselor/jobcheck.do" method = "get">
		
		<select id="cId" name="ID"  onchange="selectFx()">
		 <option selected> 이름 </option>
		<c:forEach var = "stulist" items = "${selectID}" varStatus="status">
			<option value = "${stulist.ID}" >${stulist.NAME}</option> 
		</c:forEach> 
		</select>
		
		<c:forEach var = "appNO" items = "${listAppNO}" varStatus="status">
			<p>${appNO.B_NAME}</p>
		</c:forEach>
		
		<div id="appNO">
		
		</div>
		
<br>
		<br>
		<label> 성실성에 대한 점수를 체크해주세요. </label>
		<br>
		<br>
			<input type = "radio" name = "SINCERITY" value = "1"> 매우 불만족
			<input type = "radio" name = "SINCERITY" value = "2"> 불만족
			<input type = "radio" name = "SINCERITY" value = "3"> 보통
			<input type = "radio" name = "SINCERITY" value = "4"> 만족
			<input type = "radio" name = "SINCERITY" value = "5"> 매우 만족
		<br>
		<br>
		<label>적극성에 대한 점수를 체크해주세요. </label> 
			<input type = "radio" name = "POSITIVENESS" value = "1"> 매우 불만족
			<input type = "radio" name = "POSITIVENESS" value = "2"> 불만족
			<input type = "radio" name = "POSITIVENESS" value = "3"> 보통
			<input type = "radio" name = "POSITIVENESS" value = "4"> 만족
			<input type = "radio" name = "POSITIVENESS" value = "5"> 매우 만족
		
		<br>
		<br>
		<label> 창의성에 대한 점수를 체크해주세요. </label>	
			<input type = "radio" name = "CREATIVITY" value = "1"> 매우 불만족
			<input type = "radio" name = "CREATIVITY" value = "2"> 불만족
			<input type = "radio" name = "CREATIVITY" value = "3"> 보통
			<input type = "radio" name = "CREATIVITY" value = "4"> 만족
			<input type = "radio" name = "CREATIVITY" value = "5"> 매우 만족
		<br>
		<br>
		<label> 참여율에 대한 점수를 체크해주세요. </label>	
			<input type = "radio" name = "PAR_RATE" value = "1"> 매우 불만족
			<input type = "radio" name = "PAR_RATE" value = "2"> 불만족
			<input type = "radio" name = "PAR_RATE" value = "3"> 보통
			<input type = "radio" name = "PAR_RATE" value = "4"> 만족
			<input type = "radio" name = "PAR_RATE" value = "5"> 매우 만족
		<br>
		<br>
		<label> 기타 내용을 입력해주세요. 	</label>
		<textarea rows = "10" clos = "30" name = "CONTENT"></textarea>
		
		<input type = "submit" value = "전송">
		<input type = "reset" value = "취소">
		
		</form>
		
</div>

</body>
</html>