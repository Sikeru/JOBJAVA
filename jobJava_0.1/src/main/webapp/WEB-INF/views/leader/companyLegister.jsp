<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
section {
	width: 100%;
	height: auto;
}

#listMenu {
	width: 100%;
	height: auto;
	color: #fff;
	background: #BBE1FA;
}

#listMenu ul {
	width: 100%;
	height: 50px;
	margin: 0;
	margin-left: 25%;
	padding: 0;
	text-align: center;
}

#listMenu li {
	width: 200px;
	height: 100%;
	text-align: center;
	list-style: none;
	font-size: 20px;
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

/* #legisterView{
width:100%;
height: auto;
} */
#proarticle {
	width: 100%;
	height: 600px;
	margin-top: 50px;
	margin-bottom: 80px;
}
#proarticle h2{
	text-align: center;
}

#formArticle {
	width: 805px;
	height: 600px;
	border: 1px solid #b4b4b4;
	margin-left: 25%;
	padding: 35px 130px 35px 130px;
}

#join {
	width: 100%;
	height: 525px;
	margin: 0;
}

.joinArticle {
	width: 545px;
	height: 525px;
}

.file_add {
	padding: 0;
}

.file_add li {
	list-style: none;
}

/* botton style */
.submit_btn {
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	background: white;
	color: #4169E1;
	border: 1px solid #4169E1;
	width: 100px;
	height: 40px;
}

.submit_btn:hover {
	background: #4169E1;
	color: white;
	border: 0px solid;
}

.reset_btn {
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	background: white;
	color: #4169E1;
	border: 1px solid #4169E1;
	width: 100px;
	height: 40px;
}

.reset_btn:hover {
	background: #4169E1;
	color: white;
	border: 0px solid;
}
</style>

<script type="text/javascript">
	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append(
				"<br>" + "<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}

	//취소
	function cancel() {
		if (confirm("정말 취소하시겠습니까?") == true) { //확인
			window.location.href = '../main.do';
		} else { //취소
			return false;
		}
	}

	//클릭시 알림창
	function d_click() {
		alert("마이페이지에서 정보를 변경해주세요.");
		if (confirm("마이페이지로 이동하시겠습니까??") == true) { //확인
			location.href = "${contextPath}/member/mypageForm.do";

		} else { //취소

			return false;
		}
	}

	//유효성
	function legisterCheck() {
		var form = document.legisterForm;

		if (!form.TITLE.value) {
			alert("제목을 입력해주세요");
			form.TITLE.focus();
			return;
		}

		if (!form.CONTENT.value) {
			alert("내용을 입력해주세요");
			form.CONTENT.focus();
			return;
		}

		if (!form.S_DATE.value) {
			alert("시작날짜를 설정해주세요");
			form.S_DATE.focus();
			return;
		}

		if (!form.E_DATE.value) {
			alert("종료날짜를 설정해주세요");
			form.E_DATE.focus();
			return;
		}
	}
	form.submit();

	alert('사업참여등록이 완료되었습니다.');
	window.location.href = "${contextPath}/leader/main.do"
</script>
</head>
<body>
	<div id="legisterView">
		<s:authorize access="hasRole('ROLE_COM')">
			<div id="listMenu">
				<ul>
					<li><p>
							<a href="${contextPath}/leader/companyLegisterList.do">사업참여</a>
						</p></li>
					<li><p>
							<a href="${contextPath}/leader/companyLegisterStuList.do">참여학생조회</a>
						</p></li>
					<li><p>
							<a href="${contextPath}/leader/commuteCheck.do">출퇴근조회</a>
						</p></li>
					<li><p>
							<a href="${contextPath}/leader/surveylist.do">설문조사</a>
						</p></li>
				</ul>
			</div>
		</s:authorize>
		<div id="proarticle">
			<h2>사업 참여</h2>
			<div id=formArticle>
				<form name="" id="join" action="${contextPath}/leader/legister.do"
					method="post" enctype="multipart/form-data">
					<div class="joinArticle">
						사업자번호<br> <input type="text" name="B_NO" value="${list.b_NO}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> 대표자<br> <input type="text"
							name="AGENT" value="${list.AGENT}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> 업종<br> <input type="text"
							name="B_TYPE" value="${list.b_TYPE}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> 기업구분<br> <input type="text"
							name="C_DIV" value="${list.c_DIV}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> 근로자수<br> <input type="text"
							name="EMP_NUM" value="${list.EMP_NUM}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> 홈페이지<br> <input type="text"
							name="HOMEPAGE" value="${list.HOMEPAGE}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> 회사명<br> <input type="text"
							name="C_NAME" value="${list.c_NAME}"
							placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
							readonly><br> <input type="hidden" id="uniBNO"
							name="UNI_B_NO" value="${param.uniBNO}" /> <input type="hidden"
							id="REGI_NO" name="REGI_NO" value="" /> <br> 파일첨부<br>
						<input type="file" name="REGI_FILENO" multiple="multiple" /> <input
							type="button" value="파일추가" onClick="fn_addFile()">
						<div id="d_file"></div>

						<input type="hidden"
							value="${pageContext.request.userPrincipal.name}" name="ID"><br>
						<div>
							<input type="submit" class="submit_btn" value="사업참여"
								OnClick="javascript:legisterCheck();"> &nbsp; &nbsp;
							&nbsp; <input type="reset" class="reset_btn" value="취소"
								OnClick="javascript:cancle();">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
