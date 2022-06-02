<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="Append" value="${fn:length(fileList)}"/>
<c:set var="USER_ID">
<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
 		a{
 			color: black;
 			text-decoration: none;
 		}
 		li {
 			list-style: none;
 		}
  		input {
  			background-color:transparent;
			border : 0px solid transparent;
  		}
        #tableTotal {
        	position: relative;
        	top: 50px;
            width: 1140px;
            height: auto;
            margin: 0 auto;
        }
        
        #title {
            position: relative;
            width: 1140px;
            height: 60px;
            background: rgb(244,245,249);
            border-top: 1.5px solid rgb(83,90,117);
            border-bottom: 1px solid rgb(213,213,219);
        }
        #title input{
            position: absolute;
            font-size: 20px;
        }
            
        #nameDate {
            position: relative;
            width: 1140px;
            height: auto;
            border-top: 3px solid rgb(83,90,117);
            border-bottom: 1px solid rgb(213,213,219);
        }
        
        #nameDate table{
            width: 1140px;
            height: auto;
        }
        #nameDate table{
            border-collapse: collapse;
        }
        #nameDate tr,td{
            border: 1px solid black;
            border-collapse: collapse;
        }
        #content{
            position: relative;
            width: 1140px;
            top: 30px;
            height: auto;
            text-align: center;
        }
       
</style>

<script>
	var maxAppend = ${Append} + 1;
 function file_add(){
	 if(maxAppend >= 5){
	        alert("파일 업로드 최대 개수는 5개 입니다.");
	        return;
	    } else{
	        $('.file_add').append('<li><input class="filelist" type="file"name="fileName'+maxAppend+'" class="files"> <img src="${contextPath}/resources/image/쓰레기통.jpg" style="width: 25px;" onclick="fileDel(this);"/></li>'); 
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

	$('#join').submit();
 }
 
</script>

</head>
<body>

<div id="tableTotal">
	<h1>파일 테이블</h1><br>
	<form id="join" action="${contextPath}/board/supportUpdateTable.do" method="post" enctype="multipart/form-data">
        <div id="title">
        	<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
            <span><strong><input type="text" id="TITLE" name="TITLE" value="${board.TITLE }"></strong></span>
            </s:authorize>
            <s:authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
            <span><strong><input type="text" id="TITLE" name="TITLE" value="${board.TITLE }" disabled></strong></span>
            </s:authorize>
        </div>
        <br>
        <div id="nameDate">
            <table>
                <tr>
                    <td style="width: 228px;text-align: center;background: rgb(244,245,249);">작성자</td>
                    <td style="width: 340px;">　<input type="text" value="${board.NAME}" disabled></td>
                    <td style="width: 228px;text-align: center;background: rgb(244,245,249);">등록일</td>
                    <td style="width: 340px;">　<input type="text" value="${board.F_DATE}" disabled></td>
                </tr>
                <tr>
                    <td style="width: 228px;text-align: center;background: rgb(244,245,249);">첨부파일</td>
                    <td colspan="3" style="height: auto;">
                    <ul class="file_add">
                    <c:forEach var="file" items="${fileList}" varStatus="i">
                    <li>
                    <img src="${contextPath}/resources/image/cafefileadd.jpg" style="width: 20px;"/>
                    <a href="${contextPath}/main/download.do?fileName=${file.BOARD_FILENAME}&fileNO=${file.BOARD_NO}&folderName=support">${file.BOARD_FILENAME}</a>
					<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
					<input type="hidden" class="fileNames" value="${file.BOARD_FILENAME}"/>
					<img src="${contextPath}/resources/image/쓰레기통.jpg" style="width: 25px;" onclick="existingFileDel(this, '${file.BOARD_FILENAME}', ${i.count});"/><br>
					<input type="hidden" id="delfile${i.count}" name="delfile${i.count}" />
					</s:authorize>
					</li>
                    </c:forEach>
                    <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
                    	<li>
                    		<input class="newfileNames" type="file" name="fileName"> <img src="${contextPath}/resources/image/fileplus.png" style="width: 25px;" onclick="file_add()"/>
                    	</li>
                    </s:authorize>
                    </ul>
                    </td>
                </tr>
            </table>
        </div>
        <div id="content">
            <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
            <span><input type="text" id="CONTENT" name="CONTENT" value="${board.CONTENT }"></span>
            </s:authorize>
            <s:authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
            <span><input type="text" id="CONTENT" name="CONTENT" value="${board.CONTENT }" disabled></span>
            </s:authorize>
            <br><br><br><br>
            <hr>
            
        </div>
        <br><br>
        <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
			<input type="hidden" name="BOARD_NO" value="${board.BOARD_NO}"/>
  			<input type="hidden" name="RESPON" value="${pageContext.request.userPrincipal.name}"/>	
  			<button class="btn btn-secondary" type="button" onclick="joinform_check()" style="float: letf;">수정</button>
  			</s:authorize>
  			</form>
  				 		
  		<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
  			<form action="${contextPath}/board/supportDeleteTable.do" method="post">
			<input class="btn btn-secondary" type="submit" value="삭제" />
			<input type="hidden" name="BOARD_NO" value="${board.BOARD_NO}"/>
  			</form>
  		</s:authorize>
  		
  		<hr>
  		
  		
  		<br><br><br><br><br><br>
		</div>

</body>
</html>