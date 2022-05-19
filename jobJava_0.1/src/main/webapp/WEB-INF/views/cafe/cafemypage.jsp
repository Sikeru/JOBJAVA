<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
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
		window.location.href = '/JJ/cafe/main.do';
	} else { //취소
		return false;
	}
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
	}
		form.submit();
		
	
	     </script> 

<body>
	<div id="mypagetotal">
		<section id="protitle">
			<h1>사업참여등록 페이지</h1>
		</section>
		<section id="proarticle">
			<form name="mypageform" action="${contextPath}/cafe/result.do" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

				
				제목<br> <input type="text" name="TITLE" value=""
					placeholder="제목을 입력해주세요." size=69><br>
				
				<br> 내용<br>
				<textarea name="CONTENT" cols="70" rows="15"
					placeholder="내용을 입력해주세요."></textarea>
				<br> <br> 시작날짜&nbsp; <input type="date" name="S_DATE">
				종료날짜&nbsp; <input type="date" name="E_DATE"><br>
				
				<br> 파일첨부<br> <input type="file" name="EMP_FILE" multiple="multiple" onClick="fn_addFile()" />
				<div id="d_file"></div>
				
				<div id =programadd>
				 <br>프로그램 선택 <br>
                취업특강 <input type="radio" name="DIVISION" value="취업특강" checked />
             취업컨설팅 <input type="radio" name="DIVISION" value="취업컨설팅" /><br><br>
             </div>
				<input type="hidden"
					value="${pageContext.request.userPrincipal.name}" name="ID"><br>
					
				<input type="submit" value="사업참여하기" OnClick="mypageCheck();" >
					
					&nbsp; &nbsp; &nbsp; 
					 <input type="reset" value="취소" OnClick="cancel()">
				<br> <br>
			</form>
		</section>
	</div>
</body>
</html>
