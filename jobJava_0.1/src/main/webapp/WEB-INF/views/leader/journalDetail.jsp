<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="userID"><s:authentication property="name" /></c:set>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
	function switchbtn() {
		let modbtn = document.getElementById("modbtn");
		let modsub = document.getElementById("modsub");
		let title = document.getElementsByName("title")[0];
		let content = document.getElementsByName("content")[0];
		let article = document.getElementsByClassName("article");
		
		modbtn.setAttribute('type', 'hidden');
		modsub.setAttribute('type', 'submit');
		title.setAttribute('type', 'text');
		content.setAttribute('type', 'text');
		for (var i = 0; i < 2; i++) {
			article[i].style.display = "none";
		}
	}
	</script>
</head>
<body>
	<form method="post" action="${contextPath}/leader/journalUpdate.do"> 
		<input type="hidden" name="jnNO" value = "${journalDetailList.JN_NO}">
		<table>
			<tr>
				<td>제목</td>
				<td>
					<span class="article">${journalDetailList.TITLE}</span>
					<input type="hidden" name="title">
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${journalDetailList.J_DATE}"/></td>
				
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<span class="article">${journalDetailList.CONTENT}</span>
					<input type="hidden" name="content">
				</td>
			</tr>
		</table>
		<input id="modbtn" value="수정하기" type="button" onclick="switchbtn()">
		<input id="modsub" value="수정완료" type="hidden">
		<input value="삭제하기" type="button" onclick="location.href = '${contextPath}/leader/journalDelete.do?jnNO=${journalDetailList.JN_NO}'">
		<input value="목록으로" type="button" onclick="location.href = '${contextPath}/leader/viewJournal.do'">
	</form>
</body>
</html>