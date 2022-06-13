<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#content h2{
text-align: center;
}
#content>table {
	width: 100%;
	text-align: center;
	font-size: 1.2rem;
}

#content>table>tbody>tr>td {
	border: 1px solid #D7DDE2;
}

#content>table>tbody>tr>th {
	border: 1px solid #D7DDE2;
	background: #2C5E9E;
	color: #F6F8F8;
}

#content {
	margin: 2% 10%;
}
#divPaging{
	text-align: center;
	margin-top: 15px;
}
#divPaging > ul > span > a{
	text-decoration: none;
	font-weight: 900;
	color: 000;
}
#divPaging > ul > span > a:hover{
	border: 1px solid #000;
	background: #1E3D6B;
	color: #F6F8F8;
}

.combtn{
		width: 125px;
		background : #ffffff00;
		height: 50px;
		border: 2px solid #D7DDE2;
		color: #1E3D6B;
		font-weight: 300;
		margin-top: 40px;
	}
	.combtn:hover {
		background : #2C5E9E;
		color: #F6F8F8;
	}
	.selectdate{
		border: 2px solid #D7DDE2;
		color: #1E3D6B;
	}
	
	#listMenu{
width:100%;
height: auto;
color: #fff;
background: #BBE1FA;

}

#listMenu ul{
width:100%;
height:50px;
margin:0;
margin-left:25%;
padding:0;
text-align: center;

}

#listMenu li{
width:200px;
height:100%;
text-align: center;
list-style: none;
font-size: 20px;
float:left;
margin-left: 1px;
background: #3282B8;
}

#listMenu li p{

margin:0;
margin-top:10px;

}

#listMenu li a{

text-decoration: none;
color:white;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">	
	function check() {
		var ch = true;
		$("#from").submit(
				function() {
					if ($('.selectsdate').val() == ''
							|| $('.selectedate').val() == '') {
						alert("검색할 날짜를 선택해주세요");
						return ch = false;
					}
					;
				});
		return ch
	};

	function ahffk() {
		if ("${checkATT}" == 0) {
			alert("출근부터눌러주세요");
			return false;
		}
		return mac_get();
	}
	function mac_get() {
		$.ajax({
			type : "GET",
			url : "${contextPath}/member/macGet.do",
			data : {},
			success : function(mac) {
				console.log(mac)
				/* $('input[name=MAC_ADDR]').attr('value', mac); */
				if (mac != "${checkMac}") {
					alert("Mac 주소일치하지않습니다");
					return false;
				}
				$('#commuteCheck').submit();
			}
		})
	}
</script>
</head>
<body>
	<s:authorize access="hasRole('ROLE_STU')">
		 <div id="listMenu">
			<ul>
				<li><p><a href="${contextPath}/leader/companyLegisterList.do">사업참여</a></p></li>
				<li><p><a href="${contextPath}/leader/viewJournal.do">업무일지</a></p></li>
				<li><p><a href="${contextPath}/leader/commuteCheck.do">출퇴근조회</a></p></li>
				<li><p><a href="${contextPath}/leader/surveylist.do">설문조사</a></p></li>
			</ul>
		</div>
	</s:authorize>
	
	<div id="content">
	<h2>출퇴근조회</h2>
	<div id="listheader">
		<form id="commuteCheck" method="post"
			action="${contextPath}/leader/addCommute.do">
			<c:choose>
				<c:when test="${checkATT>=1}">
					<input type="button" value="출근" name="commutebtn" disabled class="combtn">
				</c:when>
				<c:otherwise>
					<input type="button" value="출근" name="commutebtn" onclick="mac_get()" class="combtn">
					<input type="hidden" value="출근" name="commutebtn" class="combtn">
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${checkQUT>=1}">
					<input type="button" value="퇴근" name="commutebtn" disabled class="combtn">
				</c:when>
				<c:otherwise>
					<input type="button" value="퇴근" name="commutebtn" onclick="ahffk()" class="combtn">
					<input type="hidden" value="퇴근" name="commutebtn" class="combtn">
				</c:otherwise>
			</c:choose>
		</form>

		<form id="from" method="post"
			action="${contextPath}/leader/commuteCheck.do">
			<input type="hidden" name="userID" value="${userID}"> 
 			<input type="date" name="sdate" class="selectdate" value="${sdate}">
			<input type="date" name="edate" class="selectdate" value="${edate}">
			<input type="submit" value="검색">
		</form>
		</div>

		<br>
		<table>
			<tr>
				<th style="width:10%;">일자</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
			</tr>
			<c:forEach var="clist" items="${commuteList}">
				<tr>
					<td>${clist.COM_DATE}</td>
					<td>${clist.ATT_TIME}</td>
					<td>${clist.QUT_TIME}</td>
				</tr>
			</c:forEach>
		</table>
	
	<!-- 페이징영역 -->
	<div id="divPaging">
		<ul class="paging">
			<c:if test="${paging.prev}">
				<span><a
					href='<c:url value="commuteCheck?page=${paging.startPage-1}"/>'>이전</a></span>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<span><a
					href="commuteCheck.do${paging.makeSearch(num)}">${num}</a></span>
			</c:forEach>
			<c:if test="${paging.next && paging.endPage>0}">
				<span><a
					href='<c:url value="commuteCheck?page=${paging.endPage+1}"/>'>다음</a></span>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>