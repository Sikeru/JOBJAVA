<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var i = 0
	
	window.onload=function(){
		$('.spanNum').hide();
	}
	function sw(cnt) {
		let modbtn = document.getElementById("modbtn");
		let modsub = document.getElementById("modsub");

		modbtn.setAttribute('type', 'hidden');
		modsub.setAttribute('type', 'button');
		$('.addbtn').attr("type", "button")
		$('.inputbox').attr("type", "text")
		$('.spanNum').show();
		$('.qnosub').hide();
		
		for (var i=1; i<=cnt; i++) {
			/*$("#modform>table:last").append("<tr><td>"+i+"<input class='inputbox' type='text' name = 'qno"+i+"'></td></tr>");*/
		}
	}
	
	function s_add(cnt){
		if(i>=(30-cnt)){
			alert('항목은 최대 30개까지 추가할 수 있습니다.');
			return false;
		}
		$("#modform>table:last").append("<tr><td>"+(cnt+i+1)+" <input class='inputbox' type='text' name = 'insertno"+(i+1)+"'></td></tr>")
		i++;
	}
	
	function s_del(cnt){
		if(cnt+i<2){
			alert('문항은 1개이상 입력해야합니다.');
			return false;
		}
		$('tbody>tr:last').remove();
		i--;
	}
	
	function submit(cnt){
		let f = document.getElementById('modform');
	    let obj;
	    
	    for(var j=0;j<cnt+i+1;j++){
	    	if(document.getElementsByClassName("inputbox")[j].value==""){
	    		alert("입력하지 않은 항목이 있습니다");
	    		return false;
	    	}else{
	    		obj = document.createElement('input');
	    	    obj.setAttribute('type', 'hidden');
	    	    obj.setAttribute('name', 'cnt');
	    	    obj.setAttribute('value', i+cnt);	
	    	    
	    	    f.appendChild(obj);
	    	    document.body.appendChild(f);
	    	    f.submit();
	    	}
	    }
	}
	
</script>
</head>
<body>
	<h3>상담사에서 설문상세페이지입니다!</h3>
	
	<c:set var="cnt" value="${fn:length(surveyinfo)}" />
	<input type="hidden" value="문항추가" onclick="s_add(${cnt})" class="addbtn"/>
	<input type="hidden" value="문항삭제" onclick="s_del(${cnt})" class="addbtn"/>
	<table>
		<tr>
			<td>글번호</td>
			<td colspan="6">${svNO}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="6">${surveyDetail.TITLE}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${surveyDetail.NAME}</td>
			<td>시작날짜</td>
			<td>${surveyDetail.s_DATE}</td>
			<td>종료날짜</td>
			<td>${surveyDetail.e_DATE}</td>
		</tr>
		<tr>
			<td>구분</td>
			<c:if test="${surveyDetail.DIVISION eq 'all'}">
				<td>전체</td>
			</c:if>
			<c:if test="${surveyDetail.DIVISION eq 'leader'}">
				<td>뉴리더</td>
			</c:if>
			<c:if test="${surveyDetail.DIVISION eq 'cafe'}">
				<td>카페꿈터</td>
			</c:if>
		</tr>
	</table>
	<form action="${contextPath}/counselor/surveyUpdate.do?svNO=${svNO}" method="post" id="modform">
		<table>
			<c:forEach var="survey" items="${surveyinfo}" varStatus="status">
				<p class="qnosub">${status.count} ${survey.q_TXT}</p>
				<tr>
					<td>
						<span class="spanNum">${status.count}</span>
						<input type="hidden" name="${survey.q_NO}" class="inputbox">
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
		
		<input value="수정하기" type="button" onclick="sw(${cnt})" id="modbtn">
		<input value="수정완료" type="hidden" id="modsub" onclick="submit(${cnt})">
		<input value="삭제하기" type="button" onclick="location.href='${contextPath}/counselor/surveyDelete.do?svNO=${svNO}'">

</body>
</html>