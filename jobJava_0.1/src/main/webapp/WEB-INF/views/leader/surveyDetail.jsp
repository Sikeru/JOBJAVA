<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<c:set var="userID"><s:authentication property="name" /></c:set>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function check() {
		var c;
		c = document.querySelector('input[class="question"]').checked;
		console.log(c);
		if (c == false) {
			alert("응답하지 않은 문항이 있습니다.");
			return false;
		}
	};
</script>
<style type="text/css">
td {
	border: 1px solid #000;
}
</style>
</head>
<body>
	<h1>설문조사 상세페이지 학생용입니다!</h1>
	로그인중인 ID : ${userID} 나중에 꼭지울것
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
	</table>
	<form name="addQuestion" method="post" action="${contextPath}/leader/surveyDetail.do" onsubmit="return check();">
		<!-- ID 반환을 위한 input -->
		<input name="userID" value="${userID}" type="hidden">
		
		<!-- 문항표시와 결과를 넘기기위함-->
		<c:forEach var="survey" items="${surveyinfo}" varStatus="status">
			${status.count}, ${survey.q_TXT}
			<input name="content${status.count}" value="${survey.q_TXT}" type="hidden">
			<br>
			<input name="qno" type="hidden" value="${survey.q_NO}">
			
			<input name="question${status.count}" type="hidden" value="${survey.q_NO}">
			<input class="question" name="question${status.count}" type="radio"
				value="G_DISLIKE">매우불만족
			
			<input name="question${status.count}" type="hidden" value="${survey.q_NO}">
			<input class="question" name="question${status.count}" type="radio"
				value="DISLIKE">불만족
			
			<input name="question${status.count}" type="hidden" value="${survey.q_NO}">	
			<input class="question" name="question${status.count}" type="radio"
				value="MIDDLE">보통
			
			<input name="question${status.count}" type="hidden" value="${survey.q_NO}">
			<input class="question" name="question${status.count}" type="radio"
				value="M_LIKE">만족
			
			<input name="question${status.count}" type="hidden" value="${survey.q_NO}">
			<input class="question" name="question${status.count}" type="radio"
				value="G_LIKE">매우만족 <br>
		</c:forEach>
		<input type="submit" value="완료" /> 
		<input type="button" value="취소" onclick="location.href='${contextPath}/leader/surveylist.do'" />
	</form>

</body>
</html>