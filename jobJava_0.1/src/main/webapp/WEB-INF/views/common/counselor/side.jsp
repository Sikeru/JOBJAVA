<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet"
	type="text/css" media="screen">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script>
	function jobMactching(userID) {
	 	let f = document.createElement('form');
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'ID');
	    obj.setAttribute('value', userID);
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '${contextPath}/counselor/jobMatchingView.do');
	    document.body.appendChild(f);
	    f.submit();
	}
	
</script>

<!-- 
 <div id='wrap'> -->

<div id='side'>
	<div id="logo">
		<a href="${contextPath}/counselor/main.do"><img
			src="${contextPath}/resources/image/mainlogo.png" /></a>
	</div>
	<ul id='navi'>
		<li class='group'>
			<div class='title'>
			<i class="bi bi-card-checklist"></i>
			&nbsp뉴리더
			</div>
			<ul class="sub">
				<li><a href="${contextPath}/counselor/uniregList.do"
					id="sub_01">대학 관리</a></li>
				<li><a href="${contextPath}/counselor/studenList.do" 
					id="sub_02">학생, 기업 관리</a></li>
				<li><a href="${contextPath}/counselor/programPermission.do" 
					id="sub_03">프로그램 승인</a></li>
				<li><a href="${contextPath}/counselor/attendance.do"
					id="sub_04">출퇴근 및 일지 관리</a></li>
				<li><a href="${contextPath}/counselor/studentSalary.do" 
					id="sub_05">급여관리</a></li>
				<li><a href="#" 
					id="sub_06">설문조사 관리</a></li>
			</ul>
		</li>
		<li class='group'>
			<div class='title'>
			<i class="bi bi-envelope"></i>
			&nbsp꿈터
			</div>
			<ul class="sub">
				<li><a href="${contextPath}/counselor/alarmSend.do" 
						id="sub_12">알림보내기</a></li>
				<li><a href="${contextPath}/counselor/surveylist.do" 
						id="sub_13">설문조사 관리</a></li>
			</ul>
		</li>

		<li class='group'>
			<div class='title'>
				<a href="${contextPath}/counselor/jobregList.do">
				<i class="bi bi-calendar-date"></i>
				&nbsp일자리 등록
				</a>
			</div>
		</li>

		<li class='group'>
			<div class='title'>
				<a href="${contextPath}/counselor/consultation.do">
				<i class="bi bi-send"></i>
				&nbsp상담 일지 관리
				</a>
			</div>
		</li>

		<li class='group'>
			<div class='title'>
			 <a href="javascript:jobMactching('${pageContext.request.userPrincipal.name}')">
			<i class="bi bi-link-45deg"></i>
			&nbsp일자리 매칭
			</a>
			</div>
		</li>

	</ul>
</div>
<!--</div>  -->

</html>
