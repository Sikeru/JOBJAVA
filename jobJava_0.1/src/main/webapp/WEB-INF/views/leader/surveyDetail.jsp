<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function check(cnt) {
		var c=0;
		for(var j=0; j<cnt; j++){
			let que = document.getElementsByName("question"+(j+1));
			for(var i=0; i<cnt*2; i++){
				if (que[i].checked == true) {
					c++;
				}
			}
		}
		
		if(c==cnt){
			return true;
		}else{
			alert('입력하지않은 항목이있습니다.');
			return false;
		}
		
	};
</script>

<style type="text/css">
#content {
	font-size: 1.2rem;
	width: 60%;
	margin: 0 auto;
}

#surveyinfo {
	margin-top: 30px;
}

#surveyinfo>h2{
	margin-left: 110px;
	margin-bottom: 20px;
}

#surveyinfo>table {
	width: 80%;
	font-size: 1.2rem;
	margin: 0 auto;
}

#surveyinfo>table>tbody>tr>td {
	border: 1px solid #000;
}

#surveyinfo>table>tbody>tr>th {
	border: 1px solid #000;
	background: #5995DD;
	text-align: center;
	width: 10%;
}

.max {
	width: 70px;
	height: 70px;
}

.med {
	width: 49px;
	height: 49px;
}

.min {
	width: 34px;
	height: 34px;
}

.question {
	vertical-align: middle;
	appearance: none;
	border-radius: 100%;
	margin: 10px 20px 30px 20px;
}

#QnA {
	display: inline-block;
	margin-top: 50px;
	margin-bottom: 30px;
	border-bottom: 1px solid #000;
}

#QnAchunk {
	text-align: center;
	width: 1140px;
	margin-bottom: 50px;
}

.dis {
	border: 2px solid #6D64DE;
}

.like {
	border: 2px solid #4EDADE;
}

.neu {
	border: 2px solid #5995DD;
}

.dis:hover, .dis:checked {
	background: #6D64DE;
}

.like:hover, .like:checked {
	background: #4EDADE;
}

.neu:hover, .neu:checked {
	background: #5995DD;
}

.surbtn {
	width: 125px;
	background: #ffffff00;
	height: 50px;
	border: 2px solid #D7DDE2;
	color: #1E3D6B;
	font-weight: 300;
}

.surbtn:hover {
	background: #2C5E9E;
	color: #F6F8F8;
}
</style>
</head>
<body>
	<div id="content">
		<div id="surveyinfo">
			<h2>설문조사</h2>
			<table>
				<tr>
					<th>제목</th>
					<td colspan="3">${surveyDetail.TITLE}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td style="width: 30%;">${surveyDetail.NAME}</td>
					<th>기간</th>
					<td style="width: 30%;">${surveyDetail.s_DATE}~
						${surveyDetail.e_DATE}</td>
				</tr>
			</table>
		</div>
		<c:set var="cnt" value="${fn:length(surveyinfo)}"></c:set>
		<div id="QnAchunk">
			<form name="addQuestion" method="post"
				action="${contextPath}/leader/surveyDetail.do"
				onsubmit="return check(${cnt});">
				<!-- ID 반환을 위한 input -->
				<input name="userID" value="${userID}" type="hidden">

				<!-- 문항표시와 결과를 넘기기위함-->
				<c:forEach var="survey" items="${surveyinfo}" varStatus="status">
					<div id="QnA">
						${status.count}. ${survey.q_TXT} <input
							name="content${status.count}" value="${survey.q_TXT}"
							type="hidden"> <br> 
							비동의
							<input name="qno"type="hidden" value="${survey.q_NO}"> 
							<input name="question${status.count}" type="hidden" value="${survey.q_NO}"> 
							<input class="question max dis"	name="question${status.count}" type="radio" value="G_DISLIKE">

							<input name="question${status.count}" type="hidden"	value="${survey.q_NO}"> 
							<input class="question med dis"	name="question${status.count}" type="radio" value="DISLIKE">

							<input name="question${status.count}" type="hidden"	value="${survey.q_NO}"> 
							<input class="question min neu"	name="question${status.count}" type="radio" value="MIDDLE">

							<input name="question${status.count}" type="hidden"	value="${survey.q_NO}">
							<input class="question med like" name="question${status.count}" type="radio" value="M_LIKE">

							<input name="question${status.count}" type="hidden"	value="${survey.q_NO}">
							<input class="question max like" name="question${status.count}" type="radio" value="G_LIKE">
						동의
					</div>
				</c:forEach>
				<br> 
				<input class="surbtn" type="submit" value="완료"/> 
				<input class="surbtn" type="button" value="취소" onclick="location.href='${contextPath}/leader/surveylist.do'" />
			</form>
		</div>
	</div>
</body>
</html>