<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Latest compiled and minified CSS 셀렉트-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript 셀렉트-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files 셀렉트-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/i18n/defaults-*.min.js"></script>


<script>
	//파일업로드
	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append(
				"<br>" + "<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}

	//취소
	function cancel() {
		if (confirm("정말 취소하시겠습니까?") == true) { //확인
			window.location.href = '/JJ/cafe/main.do';
		} else { //취소
			return false;
		}
	}

	//유효성
	function jobappCheck() {
		var form = document.jobboxform;

		if (!form.E_DATE.value) {
			alert("구직마감희망날짜를 설정해주세요.");
			form.E_DATE.focus();
			return;
		}

		form.submit();

	}

	$('select').selectpicker();

	function uploadChange(file) {
		var el = file.parentNode.parentNode.getElementsByTagName("*");
		for (var i = 0; i < el.length; i++) {
			var node = el[i];
			if (node.className == "file-text") {
				node.innerHTML = file.value;
				break;
			}
		}
	}
</script>
<style>

#ttotal{
height: 1100px;
padding-left:200px;
}

#totaljobbox {
	border: 2px solid #E6E2E2;
	width: 800px;
	height: 1050px;
	margin-left: 250px;
	margin-top: 50px;
	padding-top: 20px;
	padding-bottom: 50px;
	border-radius: 30px;
	]
}

#box1 {
	text-align: center;
}

.select {
	padding: 15px 10px;
}

.select input[type=radio] {
	display: none;
}

.select input[type=radio]+label {
	display: inline-block;
	cursor: pointer;
	height: 24px;
	width: 90px;
	border: 1px solid #E6E2E2;
	line-height: 24px;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
	border-radius: 10px;
}

.select input[type=radio]+label {
	background-color: #fff;
	color: #333;
}

.select input[type=radio]:checked+label {
	background-color: #585858;
	color: #fff;
}

.box {
	margin: 50px auto;
	width: 500px;
}

.filetype {
	position: relative;
	display: inline-block;
	vertical-align: top;
	*margin-right: 4px;

}

.filetype * {

	vertical-align: middle;
}

.filetype .file-text {
	position: relative;
	width: 200px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	display: inline-block;
	height: 20px;
	background-color: #fff;
	margin: 0;
	border: 1px solid #cdd3d4;
	line-height: 20px;
	z-index: 10;
}

.filetype .file-select {
	position: absolute;
	top: 0;
	right: 0;
	width: 80px;
	overflow: hidden;
}

.filetype .file-select .input-file {
	width: 60px;
	filter: alpha(opacity = 0);
	opacity: 0;
	height: 20px;
}

.filetype .file-text+.file-btn {
	display: inline-block;
	background-color: #585858;
	height: 22px;
	line-height: 22px;
	padding: 0 15px;
	color: #fff !important;
	cursor: pointer;
	*margin-left: 4px;
	border-radius: 10px;
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
 	.dropdown-menu {
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
	/* box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2); */
	z-index: 1;
	margin-top: 15px;
	/* color: black; */
}

.dropdown-content a {
/* 	color: black; */
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
/* 	background-color: #3e8e41; */
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
}   */


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
   <div id="ttotal">
   
	<div id="totaljobbox">
		<div id="box1">
			<h1>구직등록페이지</h1>
			<p>구직활동을 위해 정보를 등록해주세요.</p>

			<form name="jobboxform" id="jobboxform"
				action="${contextPath}/cafe/jobresult.do" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<br>

				<div id="jobselect">
					<span><strong>선호지역</strong></span> <select name="AREA"
						class="selectpicker">
						<option value="서울특별시">서울특별시</option>
						<option value="인천광역시">인천광역시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="광주광역시">광주광역시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="제주특별자치도">제주특별자치도</option>
						<option value="세종특별자치시">세종특별자치시</option>
						<option value="강원도">강원도</option>
						<option value="경기도">경기도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
					</select> &nbsp; &nbsp; <span><strong>선호직종</strong></span> <select
						name="OCC_TYPE" class="selectpicker">
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
				</div>
				<br> <br>

				<p>
					<strong>여성가장여부</strong>
				</p>

				<div class="select">
					<input type="radio" id="select" name="F_FAMILY" value="Y" checked><label
						for="select">예</label>&nbsp;&nbsp;&nbsp; <input type="radio" id="select2"
						name="F_FAMILY" value="N"><label for="select2">아니오</label>
				</div>



				<p>
					<strong>장애여부</strong>
				</p>


				<div class="select">
					<input type="radio" id="select3" name="DISABILITY" value="Y"
						checked><label for="select3">예</label>&nbsp;&nbsp; &nbsp; <input type="radio"
						id="select4" name="DISABILITY" value="N"><label
						for="select4">아니오</label>
				</div>

				<p>
					<strong>군대여부</strong>
				</p>


				<div class="select">
					<input type="radio" id="select5" name="MILITARY" value="Y" checked><label
						for="select5">예</label>&nbsp;&nbsp;&nbsp; <input type="radio" id="select6"
						name="MILITARY" value="N"><label for="select6">아니오</label>
				</div>
				<p>
					<strong>공개여부</strong>
				</p>

				<div class="select">
					<input type="radio" id="select7" name="DISCLOSURE" value="Y"
						checked><label for="select7">예</label> &nbsp;&nbsp;&nbsp;<input type="radio"
						id="select8" name="DISCLOSURE" value="N"><label
						for="select8">아니오</label>
				</div>
				<br>
				<p>
					<strong>구직마감희망날짜</strong>
				</p>
				<div class="jobdate">
					&nbsp; <input type="date" name="E_DATE"> <input
						type="hidden" value="${pageContext.request.userPrincipal.name}"
						name="ID"><br>
				</div><br>


				<!-- input type="file" name="JA_FILENO" multiple="multiple"/><br>  -->



				<div class="box">
					<strong>파일첨부</strong><br>
					 <span class="filetype">
						<span class="file-text"></span> <span class="file-btn">첨부하기</span>
						<span class="file-select"><input type="file"
							class="input-file" size="3" onchange="uploadChange(this);"
							multiple="multiple" name="JA_FILENO"></span>
					</span><p></p>
					 <span class="filetype"> <span class="file-text"></span>
						<span class="file-btn">첨부하기</span> <span class="file-select"><input
							type="file" class="input-file" size="3"
							onchange="uploadChange(this);" multiple="multiple"
							name="JA_FILENO"></span>
					</span> <p></p><span class="filetype"> <span class="file-text"></span>
						<span class="file-btn">첨부하기</span> <span class="file-select"><input
							type="file" class="input-file" size="3"
							onchange="uploadChange(this);" multiple="multiple"
							name="JA_FILENO"></span>
					</span>
				</div>




			</form>
			
			<button class="button_2" OnClick="javascript:jobappCheck();">구직등록하기</button>

			&nbsp; &nbsp; &nbsp;
			<button class="button_2" OnClick="cancel()">취소</button>
</div>
		</div>
	</div>
</body>
</html>
