<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
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
			window.location.href = '/JJ/cafe/main.do';
		} else { //취소
			return false;
		}
	}
	
/* 	var imgFile = $('#imgFile').val();
 	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|tiff|jfif|webp)$/;
 	var fileSize; */
 
 	
	 //유효성
 	function mypageCheck() {
		var form = document.mypageform;

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
		if( $("#imgFile").val() != "" ){

	 		var ext = $('#imgFile').val().split('.').pop().toLowerCase();

	 		      if($.inArray(ext, ['gif','png','jpg','jpeg','tiff','jfif','bmp','webp']) == -1) {

	 			 alert('첫번째 파일은 이미지 파일만 업로드 할수 있습니다.');

	 			 return;

	 		      }

	 		
	 	
	
	 form.submit();
	 
	 alert('사업참여등록이 완료되었습니다.');
	 
	 }
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

#mypagetotal{
height: 1300px;
padding-left:450px;

padding-top:50px;}
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

.box {
   border-top: 1px solid silver;
    margin-top: 10px;
    padding-top: 10px;
    width: 565px;

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
	<div id="mypagetotal">
		<section id="protitle">
			<h1>사업참여등록 페이지</h1>
		</section>
		<section id="proarticle">
			<form name="mypageform" action="${contextPath}/cafe/result.do"
				method="post" enctype="multipart/form-data" accept-charset="UTF-8">


				제목<br> <input type="text" name="TITLE" value=""
					placeholder="제목을 입력해주세요." size=69><br> <br>내용<br>
				<textarea name="CONTENT" cols="70" rows="15"
					placeholder="내용을 입력해주세요."></textarea>
				<br> <br> 시작날짜&nbsp; <input type="date" name="S_DATE">
				종료날짜&nbsp; <input type="date" name="E_DATE"><br> <br>
				
				
				<div class="box">
					<strong>파일첨부</strong><br>
					 <span class="filetype">
						<span class="file-text"></span> <span class="file-btn">이미지 첨부하기 (*필수)</span>
						<span class="file-select"><input type="file"
							class="input-file" size="3" onchange="uploadChange(this);"
							multiple="multiple" name="EMP_FILE" accept="image/*"></span>
					</span><p></p>
					 <span class="filetype"> <span class="file-text"></span>
						<span class="file-btn">첨부하기</span> <span class="file-select"><input
							type="file" class="input-file" size="3"
							onchange="uploadChange(this);" multiple="multiple"
							name="EMP_FILE"></span>
					</span> <p></p><span class="filetype"> <span class="file-text"></span>
						<span class="file-btn">첨부하기</span> <span class="file-select"><input
							type="file" class="input-file" size="3"
							onchange="uploadChange(this);" multiple="multiple"
							name="EMP_FILE"></span>
					</span>
				</div>
				

				
				

				<div id=programadd>
					<br>프로그램 선택 <br> 취업특강 <input type="radio" name="DIVISION"
						value="취업특강" checked /> 취업컨설팅 <input type="radio" name="DIVISION"
						value="취업컨설팅" /><br>
					<br>
				</div>
				<input type="hidden"
					value="${pageContext.request.userPrincipal.name}" name="ID"><br>


                 
				
			
			
			<div id="buttonset">
			<button class="button_2" OnClick="javascript:mypageCheck();">사업참여하기</button>

			&nbsp; &nbsp; &nbsp;
			<button class="button_2" OnClick="cancel()">취소</button>
					 </div>
			
		</form>
			
		</section>
	</div>
</body>
</html>
