<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="Append" value="${fn:length(fileList)}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var maxAppend = ${Append} + 1;
 function file_add(){
	 if(maxAppend >= 5){
	        alert("파일 업로드 최대 개수는 5개 입니다.");
	        return;
	    } else{
	        $('.file_add').append('<li><input class="filelist" type="file"name="fileName'+maxAppend+'" class="files"> <button type="button" onclick="fileDel(this);">삭제</button></li>'); 
	        maxAppend ++;
	 }
 }
 
 function fileDel(e) {
	 $(e).parent().detach();
	 maxAppend--;
}
 
 function existingFileDel(e, filename,i) {
	 $('#delfile'+i).val(filename);
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
//	 let fileNames = $('.fileNames');
	 //let newfileNames = $('.newfileNames');
	 
	 //for(let i=0;i<newfileNames.length;i++){
		 //let newfileName = $(newfileNames[i]).val().substring($(newfileNames[i]).val().lastIndexOf('\\')+1);
		 //for(let j=0;i<fileNames.length;j++){
			 //let fileName = $(fileNames[j]).val();
			 //if(fileName == newfileName) {
				 //alert("파일 이름이 같습니다.");
				 //return false;
			 //}
		 //}
	 //}
	$('#join').submit();
 }
 
</script>

</head>
<body>
<form id="join" action="${contextPath}/board/supportUpdateTable.do" method="post" enctype="multipart/form-data">
제목 : <input type="text" id="TITLE" name="TITLE" value="${board.TITLE}"> <br>
작성자 : <input type="text" value="${board.NAME}" disabled> <br>
내용 : <input type="text" id="CONTENT" name="CONTENT" value="${board.CONTENT }"> <br>
<input type="hidden" name="BOARD_NO" value="${board.BOARD_NO}"/>
<ul class="file_add">
<c:forEach var="file" items="${fileList}" varStatus="i">
 <li>
	파일 : <a href="${contextPath}/main/download.do?fileName=${file.BOARD_FILENAME}&fileNO=${file.BOARD_NO}&folderName=support">${file.BOARD_FILENAME}</a>
	<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
	<input type="hidden" class="fileNames" value="${file.BOARD_FILENAME}"/>
	<button type="button" onclick="existingFileDel(this, '${file.BOARD_FILENAME}', ${i.count});">삭제</button>
	</s:authorize>
 </li>
 <input type="hidden" id="delfile${i.count}" name="delfile${i.count}" />
</c:forEach>
<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
	<li>
		<input class="newfileNames" type="file" name="fileName"> <input type="button" value="파일추가" onclick="file_add()"/>
	</li>
</ul>

<button class="btn btn-secondary" type="button" onclick="joinform_check()">등록하기</button>
</form>
<form action="${contextPath}/board/supportDeleteTable.do" method="post">
<input type="submit" value="삭제" />
<input type="hidden" name="BOARD_NO" value="${board.BOARD_NO}"/>
</form>
</s:authorize>
</body>
</html>