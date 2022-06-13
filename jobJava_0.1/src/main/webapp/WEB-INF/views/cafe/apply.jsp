<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
//취소
function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) { //확인
		window.location.href = '/JJ/cafe/hireinfopaging.do';
	} else { //취소
		return false;
	}
}

	 function applyCheck() {
		var form = document.applyform;


		if (!form.QUESTION.value) {
			alert("내용을 입력해주세요");
			form.QUESTION.focus();
			return false;
		}

	
		form.submit();
		
		
		alert('사업참여등록이 완료되었습니다.');
	
 	} ;
	
		</script> 
<style>

#mypagetotal{
width: auto;
	height: 850px;
	padding-left :450px;
	padding-top : 30px;

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
	margin-left: 300px;
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

button.button_2 {
	border: 0;
	outline: none;
	font-size: 15px;
	margin: 30px;
	background: black;
	color: white;
	padding: 10px;
	cursor: pointer;
	border-radius: 10px;
}

button.button_2:hover {
	color: white;
	background: #E16106;
}

#buttonset{
padding-left: 130px;

}
 
</style>

<body>
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
	<div id="mypagetotal">
		<section id="protitle">
			<h1>신청서작성하기</h1>
		</section>
		<section id="proarticle">
			<form name="applyform" action="${contextPath}/cafe/applyresult.do" method="post">
			신청프로그램<br>
			<input type="text" name="PROGRAM_NO" id="PROGRAM_NO" value="${detail.PROGRAM_NO}"
					readonly />

				<br> 신청자<br> <input type="text" name="ID" value="${pageContext.request.userPrincipal.name}"
					size=69, readonly><br>
				<br> 내용<br>
				<textarea name="QUESTION" cols="70" rows="15"
					placeholder="내용을 입력해주세요."></textarea>
			<br><br>
			
			<input type="hidden"
					value="미승인" name="APP"><br>
			
				 
			
					 
			</form>
				
				<div id="buttonset">
			<button class="button_2" OnClick="javascript:applyCheck();">신청하기</button>

			&nbsp; &nbsp; &nbsp;
			<button class="button_2" OnClick="cancel()">취소</button>
					 </div>
			
		</section>
	</div>
</body>
</html>
