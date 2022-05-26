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
			사업자번호<br> <input type="text" name="B_NO" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					대표자<br> <input type="text" name="AGEMT" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					업종<br> <input type="text" name="B_TYPE" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					기업구분<br> <input type="text" name="C_DIV" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					근로자수<br> <input type="text" name="EMP_NUM" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					홈페이지<br> <input type="text" name="HP" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					회사명<br> <input type="text" name="C_NAME" value=""
					placeholder="제목을 입력해주세요." size=69><br>
					매칭결과<br> <input type="text" name="M_RESULT" value=""
					placeholder="제목을 입력해주세요." size=69><br>
				
				<br> 파일첨부<br> <input type="file" name="REGI_FILENO" multiple="multiple" />
				<input type= "button" value = "파일추가" onClick="fn_addFile()" >
				<div id="d_file"></div>
				
				<input type="hidden" value="${pageContext.request.userPrincipal.name}" name="ID"><br>
				<input type="submit" value="사업참여하기" OnClick="javascript:legisterCheck();" >
					&nbsp; &nbsp; &nbsp; 
					 <input type="reset" value="취소" OnClick="javascript:cancle();">
				<br> <br>
		</form>
	</section>


</body>
</html>