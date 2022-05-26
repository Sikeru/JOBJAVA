<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
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
		var form = document.updateForm;

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
	}
	form.submit();

	alert('사업참여등록이 완료되었습니다.');
	window.location.href = "${contextPath}/leader/legister.do"
</script>
<body>
	<div id="mypagetotal">
		<section id="protitle">
			<h1>기업등록 수정 페이지</h1>
		</section>
		<section id="proarticle">
			<form name="updateForm" action="${contextPath}/leader/legisterUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" id="REGI_NO" name="REGI_NO" value="${detailList.REGI_NO}" />
				제목<br> <input type="text" name="TITLE" id="TITLE" value="${detailList.TITLE}" size=69><br> <br> 내용<br>
				<textarea name="CONTENT" id="CONTENT" cols="70" rows="10">${detailList.CONTENT}</textarea>
				<br> <br>
				
			<!-- 	 시작날짜&nbsp; <input type="date" name="S_DATE">
				종료날짜&nbsp; <input type="date" name="E_DATE"> -->
				
				<br> <br>

				<div>
					<p>등록된 파일</p>
					<c:forEach var="file" items="${regiFile}" varStatus="i">
						<%-- 	<th><input type="hidden" name="fileNO" value="${regiFileNO}"/></th> --%>
						<p>${file.REGI_FILENAME}</p>
					</c:forEach>
				</div>
				<input type="file" name="REGI_FILENO" multiple="multiple" /> <input
					type="button" value="파일추가" onClick="fn_addFile()">
				<div id="d_file"></div>
				<br> <input type="hidden"
					value="${pageContext.request.userPrincipal.name}" name="ID"><br>
				<input type="submit" value="완료"
					OnClick="javascript:legisterCheck();"> &nbsp; &nbsp; &nbsp;
				<input type="reset" value="취소" OnClick="javascript:cancle();">
				<br> <br>
			</form>
		</section>
	</div>
</body>
