<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
section {
	width: 100%;
	height: auto;
}
</style>

<script type="text/javascript">
	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append(
				"<br>" + "<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}

	//취소
	function cancel() {
		if (confirm("정말 취소하시겠습니까?") == true) { //확인
			window.location.href = '../main.do';
		} else { //취소
			return false;
		}
	}

	//유효성
	function legisterCheck() {
		var form = document.legisterForm;

		if (!form.TITLE.value) {
			alert("제목을 입력해주세요");
			form.TITLE.focus();
			return;
		}

		if (!form.CONTENT.value) {
			alert("내용을 입력해주세요");
			form.CONTENT.focus();
			return;
		}

		if (!form.S_DATE.value) {
			alert("시작날짜를 설정해주세요");
			form.S_DATE.focus();
			return;
		}

		if (!form.E_DATE.value) {
			alert("종료날짜를 설정해주세요");
			form.E_DATE.focus();
			return;
		}
	}
	form.submit();

	alert('사업참여등록이 완료되었습니다.');
	window.location.href = "${contextPath}/leader/main.do"
</script>
</head>
<body>

	<section>
		<h1>기업등록 페이지</h1>
	</section>
	<section>
		<form name="" action="${contextPath}/leader/legister.do" method="post" enctype="multipart/form-data">
			<!--그냥 번호<br> <input type="text" name="REGI_NO" placeholder="아이디 입력"><br>-->
		<!-- B_NO 자동추가 -->
			<!--  사업자번호<br> <input type="text" name="B_NO" placeholder=""><br> -->
			제목<br> <input type="text" name="TITLE" value=""><br>
			<br> 내용<br> <input type="text" name="CONTENT" value="">
			<br> 파일첨부<br> <input type="file" name="FILENAME" multiple="multiple" onClick="fn_addFile()">
			
			<br> 시작날짜 <input type="date" name="S_DATE"><br> <br>
			종료날짜 <input type="date" name="E_DATE"><br> <br> <br>
			<input type= "hidden" value="${pageContext.request.userPrincipal.name}" name="ID">
			<input type="submit"  value="사업 참여" OnClick="javascript:mypageCheck();"> <br> <br>


		</form>
	</section>


</body>
</html>