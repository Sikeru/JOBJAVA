<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style type="text/css">
	
	#content>form>table>tbody>tr>td {
		border: 1px solid #D7DDE2;
		width: 30%;
		padding-left: 10px;
		color: #1E3D6B;
	}
	#content>form>table>tbody>tr>th{
		border: 1px solid #D7DDE2;
		text-align: center;
		width: 10%;
		background: #5995DD;
		color: #F6F8F8;
	}
	#content>form>table{
		font-size: 1.3rem; 
		width: 100%;
		height: 300px;
	}
	#content{
		margin: 0% 10%;
		height: 600px;
	}
	.appbtn{
		width: 100px;
		background : #ffffff00;
		height: 50px;
		border: 2px solid #D7DDE2;
		color: #1E3D6B;
		font-weight: 300;
	}
	.appbtn:hover {
		background : #2C5E9E;
		color: #F6F8F8;
	}
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function relode(){
		location.reload();
	}
	$(function(){
		$(".selectpicker").hide();
	})
	function switchbtn() {
		let modbtn = document.getElementById("modbtn");
		let modsub = document.getElementById("modsub");
		let hopeJob = document.getElementsByName("hopeJob")[0];
		let reason = document.getElementsByName("reason")[0];
		let fileName = document.getElementsByName("fileName")[0];
		let inputbox = document.getElementsByClassName("inputbox");

		modbtn.setAttribute('type', 'hidden');
		modsub.setAttribute('type', 'submit');
		hopeJob.setAttribute('type', 'text');
		reason.setAttribute('type', 'text');
		$(".selectpicker").show();
		for (var i = 0; i < 3; i++) {
			inputbox[i].style.display = "none";
		}

	};
</script>
</head>
<body>
	<div id="content">
		<br>
		<h3>사업참여</h3>
		<form method="post" action="${contextPath}/leader/appUpdate.do">
			<input name="uniBNO" value="${uniBNO}" type="hidden">
			<table>
				<tr>
					<th>사업명</th>
					<td colspan="3"><h3>${uniInfo.b_NAME}</h3></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userInfo.name}</td>
					<th>사업기간</th>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd"
							value='${uniInfo.s_DATE}' /> ~ <fmt:formatDate pattern="yyyy-MM-dd"
							value='${uniInfo.e_DATE}' />
						</td>
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
					<td colspan="3"><span class='inputbox'>${appInfo.HOPE_JOB}</span> 
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
					<td colspan="3"><span class='inputbox'>${appInfo.APP_REASON}</span> <input
						type="hidden" name="reason" value='${appInfo.APP_REASON}'>
					</td>
				</tr>
				<tr>
					
				</tr>
			</table>
			<br>
			<input class="appbtn" type="button" value="수정하기" id="modbtn" onclick="switchbtn()">
			<input class="appbtn" type="hidden" value="수정완료" id="modsub">
			<input class="appbtn" type="button" value="신청취소" onclick="location.href='${contextPath}/leader//appDelete.do?uniBNO=${uniBNO}'"> 
			<input class="appbtn" type="button" value="목록으로" onclick="location.href='${contextPath}/leader/companyLegisterList.do'">
		</form>
	</div>
</body>
</html>