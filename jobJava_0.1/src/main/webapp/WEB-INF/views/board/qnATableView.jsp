<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="USER_ID">
<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function deleteTable(QNA_NO) {
	 location.href="${contextPath}/board/qnADeleteTable.do?QNA_NO="+QNA_NO;
	 
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
<form id="join" action="${contextPath}/board/qnAUpDateTable.do" method="post">
  <input type="text" name="ID" value="${qna.ID}" readonly><br>
  <input type="hidden" name="QNA_NO" value="${qna.QNA_NO}">
  <c:choose>
	<c:when test="${qna.ID == USER_ID}">
  	<input type="text" id="TITLE" name="TITLE" value="${qna.TITLE }" style="width:50%">
  	<input type="text" id="CONTENT" name="CONTENT" value="${qna.CONTENT }" style="width: 50%; height: 100%"><br>
  	<c:if test="${not empty qna.RESPON}">
  	<input type="text" value="${qna.ANSWER }" style="width: 50%" disabled><br>
  	<input type="text" value="${qna.RESPON }" style="width: 50%" disabled><br>
  	</c:if>
  	<button class="btn btn-secondary" type="button" onclick="joinform_check()">수정</button>
  	<input type="button" value="삭제" onclick="deleteTable(${qna.QNA_NO})"/>
	</c:when>
  
    <c:otherwise>
    <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
  	<input type="text" name="TITLE" value="${qna.TITLE }" style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" style="width: 50%; height: 100%"><br>
  	<input type="text" value="${qna.RESPON }" style="width: 50%" readonly><br>
  	<input type="text" name="ANSWER" value="${qna.ANSWER }" style="width: 50%"><br>
  	<input type="hidden" name="RESPON" value="${pageContext.request.userPrincipal.name}">
    <input type="button" value="삭제" onclick="deleteTable(${qna.QNA_NO})"/><br>
  
  	<button class="btn btn-secondary" type="button" onclick="joinform_check()">수정</button>
  	
    </s:authorize>
 	<s:authorize access="hasAnyRole('ROLE_COM', 'ROLE_MAG')">
 	<input type="text" name="TITLE" value="${qna.TITLE }" readonly style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" readonly style="width: 50%; height: 100%">
  	</s:authorize>
 	<s:authorize access="isAnonymous()">
 	<input type="text" name="TITLE" value="${qna.TITLE }" readonly style="width:50%">
  	<input type="text" name="CONTENT" value="${qna.CONTENT }" readonly style="width: 50%; height: 100%">
  </s:authorize>
  </c:otherwise>
  </c:choose>
</form>
</body>
</html>