<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #fileMain {
        width: 700px;
        height: 850px;
        margin: 0 auto;
        position: relative;
        top: 100px;
        
    }
    #TITLE{
         width: 700px;
    }
    #CONTENT{
        width: 700px;
        height: 300px;
    }
    .btn{
    	position: relative;
    	top: 20px;
        left: 300px;
    }
</style>
<script>
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
<div id="fileMain">
<h1>취업상담게시판</h1>
<form id="join" action="${contextPath}/board/employmentAddTable.do" method="post">
  작성자<br>
 <input type="text" name="ID" value="${pageContext.request.userPrincipal.name}" readonly><br>
  제목<br>
 <input type="text" id="TITLE" name="TITLE">
 내용<br>
  <input type="text" id="CONTENT" name="CONTENT" >
  <button class="btn btn-secondary" type="button" onclick="joinform_check()">등록하기</button>

</form>
</div>
</body>
</html>
