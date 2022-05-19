<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td {
	border: 1px solid #000;
}
</style>
</head>
<body>
	<h1>사업참여(학생용)신청페이지입니다!</h1>
	현재 로그인중인 아이디은
	<h2>${userID}입니다!</h2>
	나중에 꼭지울것!
	<div>
		<form method="post" action="${contextPath}/leader/addApplicationfrom.do">
			<table>
				<tr>
					<td>사업명</td>
					<td>${title}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${userInfo.name}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${userInfo.addr}</td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td>${userInfo.hp}</td>
					<td>이메일</td>
					<td>${userInfo.email}</td>
				</tr>
				<tr>
					<td>희망직무</td>
					<td><input type="text" name="desiredJob"></td>
				</tr>
				<tr>
					<td>신청사유</td>
					<td><input type="text" name="reason"></td>
				</tr>
				<tr>
					<td>체험가능기간</td>
					<td><input type="date" name="sdate" value="${sdate}"></td>
				</tr>
				<tr>
					<td>파일 업로드</td>
					<td>fileuplode</td>
				</tr>
			</table>
			<input type="submit" value="신청완료" >
		</form>
	</div>


</body>
</html>