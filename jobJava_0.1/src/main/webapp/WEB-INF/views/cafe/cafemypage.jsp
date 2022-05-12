<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	//파일업로드
	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append(
				"<br>" + "<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}
	//유효성
	function mypageCheck() {
		var form = document.mypageform;

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
		form.submit();
		
		 alert('사업참여등록이 완료되었습니다.') ;
	     window.location.href = "${contextPath}/cafe/main.do"
	        	
	   
	}
</script>
<body>
	<div id="mypagetotal">
		<section id="protitle">
			<h1>사업참여등록 페이지</h1>
		</section>
		<section id="proarticle">
			<form name="mypageform" action="${contextPath}/result.do"
				method="post">
				<!--	프로그램번호<br> <input type="text" name="PROGRM_NO" placeholder="아이디 입력" ><br>
		 B_NO 자동추가
		 사업자번호<br> <input type="text" name="B_NO" placeholder="아이디 입력" value="${pageContext.request.userPrincipal.name}"><br>  -->
				제목<br> <input type="text" name="TITLE" value=""
					placeholder="제목을 입력해주세요." size=69><br>
				<!--			<br> 내용<br> <input type="text" name="CONTENT" value="">-->
				<br> 내용<br>
				<textarea name="CONTENT" cols="70" rows="15"
					placeholder="내용을 입력해주세요."></textarea>
				<br> <br> 시작날짜&nbsp; <input type="date" name="S_DATE">
				종료날짜&nbsp; <input type="date" name="E_DATE"><br>
				<!--			<br> 파일명<br> <input type="text" name="FILENAME" value="">-->
				<br> 파일명<br> <input type="text" name="FILENAME"
					placeholder="파일추가하기" onClick="fn_addFile()" size=35 />
				<div id="d_file"></div>
				<br>구분 <br> <input type="text" name="DIVISION" size=35><br>
				<input type="hidden"
					value="${pageContext.request.userPrincipal.name}" name="ID"><br>
					
				<input type=button value="사업참여하기"
					OnClick="javascript:mypageCheck();">
					
					&nbsp; &nbsp; &nbsp; 
					 <input type="reset" value="취소">
				<br> <br>
			</form>
		</section>
	</div>
</body>
</html>