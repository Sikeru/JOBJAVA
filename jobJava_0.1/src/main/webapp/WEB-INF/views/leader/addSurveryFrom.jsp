<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<c:set var="userID"><s:authentication property="name" /></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	var cnt = 1
	$(document).ready(
			function() {
				for (var i = 0; i < 5; i++) {
					$("#surver>tbody:last").append(
							"<tr><td>" + cnt
									+ "</td><td><input name = 'qno"+cnt+"'></td></td></tr>");
					cnt++;
				}
			})

	function s_add() {
		$("#surver>tbody:last").append(
				"<tr><td>" + cnt + "</td><td><input name = 'qno"+cnt+"'></td></td></tr>");
		cnt++;
	}
	function s_del() {
		$('#surver>tbody>tr:last').remove();
		cnt--;
	}
</script>
</head>
<body>

	<input type="button" value="문항추가" onclick="s_add()" />
	<input type="button" value="문항삭제" onclick="s_del()" />
	<form name="addSurveryForm" method="post"
		action="${contextPath}/leader/addsurveryfrom.do">
		<table id="surver">
			<thead>
				<tr>
					<td>작성자</td>
					<td>${userID}</td>
					<td><input type="hidden" name="name" value="${userID}"></td>
				</tr>
				<tr>
					<td>설문제목</td>
					<td><input name="title"></td>
				</tr>
				<tr>
					<td>시작날짜</td>
					<td><input type="date" name="sDate" id="sDate"></td>
				</tr>
				<tr>
					<td>종료날짜</td>
					<td><input type="date" name="eDate" id="eDate"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>문항번호</td>
					<td>문항내용</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="설문조사 등록" /> 
		<input type="button" value="취소" onclick="location.href='${contextPath}/leader/surveylist.do'">
	</form>

</body>
</html>