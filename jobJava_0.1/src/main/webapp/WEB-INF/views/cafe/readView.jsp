<!DOCTYPE html>
<html>
<head>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/updateView.do");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})

		// 목록
		$(".list_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/hireinfopaging.do");
			formObj.attr("method", "post");
			formObj.submit();
			/*    location.href = "/JJ/cafe/hireinfopaging.do)"; */
		})

		$(".app_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/apply.do");
			formObj.attr("method", "post");
			formObj.submit();
			/*    location.href = "/JJ/cafe/hireinfopaging.do)"; */
		})

		/* 		// 이미지 업로드
		 $('#img').on('change', function() {
		 ext = $(this).val().split('.').pop().toLowerCase(); //확장자
		 //배열에 추출한 확장자가 존재하는지 체크
		 if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
		 resetFormElement($(this)); //폼 초기화
		 } else {
		 file = $('#img').prop("files")[0];
		 blobURL = window.URL.createObjectURL(file);
		 $('#image_preview img').attr('src', blobURL);
		 $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
		 $(this).slideUp(); //파일 양식 감춤
		 }
		 }); */

	})
</script>
<style>
#listMenu {
	width: 100%;
	height: auto;
	color: #fff;
	background: #BBE1FA;
	text-align: center;
}
#listMenu ul {
	width: 100%;
	height: 50px;
	margin: 0;
	padding: 0;
	margin-left: 200px;
}

#listMenu li {
	width: 200px;
	height: 100%;
	text-align: center;
	list-style: none;
	font-size: 17px;
	float: left;
	margin-left: 1px;
	background: #3282B8;
}

#listMenu li p {
	margin: 0;
	margin-top: 10px;
}

#listMenu li a {
	text-decoration: none;
	color: white;
}

#programheader {
	width: 1200px;
	height: 120px;
	margin-left: 300px;
	margin-top: 100px;
	margin-bottom: 20px;
}

#programhead {
	font-size: 40px;
	margin-bottom: 5px;
}

#procontainer {
	width: 1000px;
	height: 800px;
	font-weight: 800px;
	margin-left: 300px;
	border-top: 3px solid #192E7E;
}

#root {
	width: 100%;
	margin: 0 auto;
	margin-top: 60px;
	height: 1000px;
}

#programtitle {
	width: 900px;
	height: 70px;
	border-bottom: 2px solid #A4A4A4;
}

#textcontent {
	border: none;
	border-bottom: 2px solid #A4A4A4;
	margin-top: 20px;
}

#tt {
	font-size: 20px;
	font-weight: 800px;
}

li {
	list-style: none;
}

#profile {
	margin-top: 20px;
	margin-bottom: 20px;
}

dl {
	font-weight: 800px;
}

li a {
	text-decoration: none;
	color: black;
}

.delete_btn {
	width: 80px;
	height: 40px;
	border: none;
	border: 1px solid #e6e6e6;
	font-size: 14px;
	margin-left: 5px;
}

.list_btn {
	width: 80px;
	height: 40px;
	border: none;
	border: 1px solid #e6e6e6;
	font-size: 14px;
	margin-left: 5px;
}

.app_btn {
	width: 80px;
	height: 40px;
	border: 1px solid #e6e6e6;
	font-size: 14px;
	margin-left: 5px;
}

.update_btn {
	width: 80px;
	height: 40px;
	border: 1px solid #e6e6e6;
	font-size: 14px;
	margin-left: 5px;
}

#ssdate {
	margin-left: 300px;
}

.dropdown-menu {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	display: inline-block;
	color: black;
}

.dropdown-content {
	display: none;
	background-color: rgba(50, 130, 184, 0.4);
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	margin-top: 15px;
	color: black;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: rgba(50, 130, 184, 0.7);
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropdown-menu {
	background-color: #3e8e41;
}

</style>

<body>
	<s:authorize access="hasRole('ROLE_COM')" >
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/celender.do">채용일정</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/jobposting.do">채용공고</a>
					</p></li>
				<li class="dropdown"><p>
						<a>프로그램 목록</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/consulting.do">취업컨설팅</a> <a
							href="${contextPath}/cafe/lecture.do">취업특강</a>
					</div>
					</p></li>
				<li><p>
						<a href="${contextPath}#">설문조사</a>
					</p></li>
				<li class="dropdown"><p>
						<a>마이페이지</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/mypage.do">사업참여등록</a> 
						<a href="${contextPath}/cafe/companymypagelist.do">신청자관리</a>
					</div>
					</p></li>
			</ul>
		</div>
	</s:authorize>
	
	<s:authorize access="hasAnyRole('ROLE_USER','ROLE_STU')">
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/celender.do">채용일정</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/jobposting.do">채용공고</a>
					</p></li>
				<li class="dropdown"><p>
						<a>프로그램 목록</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/consulting.do">취업컨설팅</a> <a
							href="${contextPath}/cafe/lecture.do">취업특강</a>
					</div>
					</p></li>
				<li><p>
						<a href="${contextPath}#">설문조사</a>
					</p></li>
				<li class="dropdown"><p>
						<a>마이페이지</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/jobapp.do">구직등록</a> 
						<a href="${contextPath}/cafe/studentmypagelist.do">내 신청현황</a>
					</div>
					</p></li>
			</ul>
		</div>
	</s:authorize>
<s:authorize access="hasRole('ROLE_EMP')" >
		<div id="listMenu">
			<ul>
				<li><p>
						<a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/celender.do">채용일정</a>
					</p></li>
				<li><p>
						<a href="${contextPath}/cafe/jobposting.do">채용공고</a>
					</p></li>
				<li class="dropdown"><p>
						<a>프로그램 목록</a>
					</p>
					<div class="dropdown-content">
						<a href="${contextPath}/cafe/consulting.do">취업컨설팅</a> <a
							href="${contextPath}/cafe/lecture.do">취업특강</a>
					</div>
					</p></li>
				<li><p>
						<a href="${contextPath}#">설문조사</a>
					</p></li>
					<li><p>
						<a href="${contextPath}/counselor/main.do">상담사페이지</a>
					</p></li>
				
			</ul>
		</div>
	</s:authorize>
	<div id="root">
		<header id="programheader">
			<h2 id="programhead">프로그램 게시판</h2>
			<br>
			<p>
				프로그램 목록 게시판입니다.<br> 취업컨설팅과 취업특강을 확인 후 신청하시길 바랍니다.
			</p>
		</header>
		<div id="ssdate">
			<tr>
				<th>프로그램 기간 &nbsp; | &nbsp; <fmt:formatDate
						value="${detail.s_DATE}" pattern="yyyy-MM-dd " /> ~ <fmt:formatDate
						value="${detail.e_DATE}" pattern=" yyyy-MM-dd" />
				</th>
				<br>
			</tr>
		</div>
		<section id="procontainer">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="PROGRAM_NO" name="PROGRAM_NO"
					value="${detail.PROGRAM_NO}" />

				<table>
					<tbody>
						<tr id="programtitle">
							<td id="tt"><label for="title">${detail.TITLE}</label></td>
						</tr>
						<br>
						<tr>
							<td><label for="content"></label> <textarea id="textcontent"
									name="CONTENT" cols="130" rows="15" readonly><c:out
										value="${detail.CONTENT}" /></textarea></td>

						</tr>




					</tbody>
				</table>
				<table id="profile">
					<tr>
						<th>첨부파일 &nbsp; &nbsp;</th>

						<td><c:forEach var="file" items="${empFile}" varStatus="i">
								<li><a
									href="${contextPath}/Cafedownload.do?fileNO=${detail.PROGRAM_NO}&fileName=${file.EMP_FILENAME}">${file.EMP_FILENAME}</a></li>
							</c:forEach></td>

					</tr>
				</table>
				
				
                <s:authorize access="hasAnyRole('ROLE_EMP','ROLE_COM')">
				<div id="buttonset">
                 <button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="submit" class="list_btn">목록</button>
					

                </div>
	           </s:authorize>
	           
	           	<s:authorize access="hasAnyRole('ROLE_USER','ROLE_STU')">
				<div id="buttonset">
				
					<button type="submit" class="list_btn">목록</button>
					<button type="submit" class="app_btn">신청하기</button>

                </div>
	           </s:authorize>
			</form>
		</section>
	</div>

</body>
</html>
