<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var maxAppend = 1;
 function file_add(){
	 if(maxAppend >= 5){
	        alert("파일 업로드 최대 개수는 5개 입니다.");
	        return;
	    } else{
	        $('.file_add').append('<li><input type="file"name="fileName'+maxAppend+'" class="files"> <button type="button" onclick="fileDel(this);">삭제</button></li>'); 
	        maxAppend ++;
	 }
 }
 
 function fileDel(e) {
	 $(e).parent().detach();
	 maxAppend--;
}
 
 function joinform_check() {
	 var TITLE = $('#TITLE').val();
	 var CONTENT = $('#CONTENT').val();
	 
	 if (TITLE == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("제목를 입력하세요.");
		    $('#TITLE').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	};
	if (CONTENT == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	    alert("내용를 입력하세요.");
	    $('#CONTENT').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	};
	$('#join').submit();
 }

</script>

</head>
<body>
<form id="join" action="${contextPath}/board/supportAddTable.do" method="post" enctype="multipart/form-data">
TITLE : <input id="TITLE" type="text" name="TITLE"> <br>
CONTENT : <input type="text" id="CONTENT" name="CONTENT"> <br>
<ul class="file_add">
	<li>
		<input type="file" name="fileName"> <input type="button" value="파일추가" onclick="file_add()"/>
	</li>

</ul>
<button class="btn btn-secondary" type="button" onclick="joinform_check()">등록하기</button>

</form>

</body>
</html>