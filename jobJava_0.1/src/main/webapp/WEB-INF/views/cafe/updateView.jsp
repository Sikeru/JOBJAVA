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
<script type="text/javascript">

/* var cnt = 1;
function fn_addFile() {
   $("#d_file").append(
         "<br>" + "<input  type='file' name='file"+cnt+"' />");
   cnt++; 
   } */
   
   
    $(document).ready(function() {

      $(".cancel_btn").on("click", function() {
         event.preventDefault();
         location.href = "/cafe/updateView";
      })
   }) 
   
 var maxAppend = ${Append} + 1;
 function file_add(){
    if(maxAppend >= 5){
           alert("파일 업로드 최대 개수는 5개 입니다.");
           return;
       } else{
           $('.file_add').append('<li><input type="file"name="fileName'+maxAppend+'" class="files"> <button type="button" onclick="fileDel(this);">삭제</button></li>'); 
           maxAppend ++;
    }
 }
 
 function fileDel(e) {
    $(e).parent().detach();
    maxAppend--;
}
   function filedelete(e, filename,i) {
       $('#delete'+i).val(filename);
       $(e).parent().detach();
       maxAppend--;
    }





   
</script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
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

#texttitle {
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

#btn1 {
	margin-top: 20px;
}

#filesection {
	margin-left: 60px;
	margin-top: 40px;
}

#filelist {
	margin-top: 20px;
	list-style: none;
	margin-left: 130px;
}

#filelist a {
	color: black;
	text-decoration: none;
}

button {
	border: 1px solid #e6e6e6;
	border-radius: 5px;
}

.save_btn {
	width: 80px;
	height: 40px;
	border: none;
	border: 1px solid #e6e6e6;
	font-size: 14px;
	margin-left: 5px;
	margin-top: 30px;
}

.cancel_btn {
	width: 80px;
	height: 40px;
	border: none;
	border: 1px solid #e6e6e6;
	font-size: 14px;
	margin-left: 5px;
	margin-top: 30px;
}

form {
	height: 700px;
}

.file_add {
	margin-top: 30px;
}

#root {
	heigth: 500px;
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
		<header id=programheader>
			<h2 id=programhead>프로그램 게시판</h2>
			<br>
			<p>
				프로그램 목록 게시판 수정 뷰입니다.<br> 수정은 신중히 해주십시오.
			</p>
		</header>

		<section id="procontainer">
			<form name="updateForm" role="form" method="post"
				action="${contextPath}/cafe/update" enctype="multipart/form-data"
				accept-charset="UTF-8">


				<table>
					<tbody>
						<div id="content1">

							<label for="noform"><span class="red"></span></label>
							<div class="body_item_inner1">
								<input type="hidden" id="PROGRAM_NO"
									value="${update.PROGRAM_NO}" name="PROGRAM_NO" readonly />

							</div>

						</div>
						<tr>
							<dl>
								<br> 프로그램 기간 &nbsp; | &nbsp;

								<fmt:formatDate value="${update.s_DATE}" pattern="yyyy-MM-dd " />
								~
								<fmt:formatDate value="${update.e_DATE}" pattern=" yyyy-MM-dd" />
							</dl>
							<hr>
						</tr>


						<tr>
							<td><label for="title"></label> <textarea id="texttitle"
									name="TITLE" cols="130" rows="3"><c:out
										value="${update.TITLE}" /></textarea></td>

						</tr>

						<br>

						<tr>
							<td><label for="content"></label> <textarea id="textcontent"
									name="CONTENT" cols="130" rows="5"><c:out
										value="${update.CONTENT}" /></textarea></td>

						</tr>




					</tbody>
				</table>
				<table>
					<div class="file_add">
						<input type="file" width="20px" name="fileName"> <img
							src="${contextPath}/resources/image/fileplus.png"
							style="width: 30px; higth: 30px;" value="파일추가"
							onclick="file_add()" type=button />


						<c:forEach var="file" items="${empFile}" varStatus="i">
							<li id=filelist><img
								src="${contextPath}/resources/image/cafefileadd.jpg"
								style="width: 20px; higth: 23px;" /> : <a
								href="${contextPath}/Cafedownload.do?fileName=${file.EMP_FILENAME}&fileNO=${file.PROGRAM_NO}">${file.EMP_FILENAME}</a>

								<button type="button"
									onclick="filedelete(this, '${file.EMP_FILENAME}', ${i.count});">삭제</button></li>
							<input type="hidden" id="delete${i.count}"
								name="delete${i.count}" />

						</c:forEach>

					</div>
				</table>
				<div id="btn1">
					<button type="submit" class="save_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>

	</div>
</body>
</html>
