<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#content>form>table>tbody>tr>td {
	border: 1px solid #D7DDE2;
	width: 30%;
	padding-left: 10px;
	color: #1E3D6B;
}

#content>form>table>tbody>tr>th {
	border: 1px solid #D7DDE2;
	text-align: center;
	width: 10%;
	background: #5995DD;
	color: #F6F8F8;
}

#content>form>table {
	font-size: 1.3rem;
	width: 100%;
	height: 300px;
}

#content {
	margin: 0% 10%;
	height: 600px;
}

.appbtn {
	width: 100px;
	background: #F6F8F8;
	height: 50px;
	border: 2px solid #D7DDE2;
	color: #1E3D6B;
	font-weight: 900;
}

.appbtn:hover {
	background: #2C5E9E;
	color: #F6F8F8;
}
</style>

</head>
<body>
	<div id="content">
		<br>
		<h2>사업참여</h2>
		<form method="post"
			action="${contextPath}/leader/addApplicationfrom.do?uniBNO=${uniBNO}">
			<input name="userID" value="${userID}" type="hidden">
			<table>
				<tr>
					<th>사업명</th>
					<td colspan="3">${uniInfo.b_NAME}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userInfo.name}</td>
					<th>사업기간</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${uniInfo.s_DATE}" />~<fmt:formatDate pattern="yyyy-MM-dd"
							value="${uniInfo.e_DATE}" /></td>
				</tr>
				<tr>
					<th rowspan="2">주소</th>
					<td rowspan="2">${userInfo.addr}</td>
					<th>핸드폰 번호</th>
					<td>${userInfo.hp}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${userInfo.email}</td>
				</tr>
				<tr>
					<th>희망직무</th>
					<td colspan="3"> 
					<select	name="hopeJob" class="selectpicker">
							<option value="건설·채굴직">건설·채굴직</option>
							<option value="경영·사무·금융·보험직">경영·사무·금융·보험직</option>
							<option value="교육·법률·사회복지·경찰·소방직 및 군인직">교육·법률·사회복지·경찰·소방직
								및 군인직</option>
							<option value="농림어업직">농림어업직</option>
							<option value="미용·여행·숙박·음식·경비·돌봄·청소직">미용·여행·숙박·음식·경비·돌봄·청소직</option>
							<option value="보건·의료직">보건·의료직</option>
							<option value="기계·금속·재료">기계·금속·재료</option>
							<option value="인쇄·목재·공예 및 제조 단순">인쇄·목재·공예 및 제조 단순</option>
							<option value="전기·전자·정보통신">전기·전자·정보통신</option>
							<option value="화학·환경·섬유·의복·식품가공">화학·환경·섬유·의복·식품가공</option>
							<option value="연구 및 공학기술직">연구 및 공학기술직</option>
							<option value="영업·판매·운전·운송직">영업·판매·운전·운송직</option>
							<option value="예술·디자인·방송·스포츠직">예술·디자인·방송·스포츠직</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>신청사유</th>
					<td colspan="3"><input type="text" name="reason"></td>
				</tr>
				<tr>

				</tr>
			</table>
			<br> <input class="appbtn" type="submit" value="신청완료"> <input
				class="appbtn" type="button" value="목록"
				onclick="location.href='${contextPath}/leader/companyLegisterList.do'">
		</form>
	</div>


</body>
</html>