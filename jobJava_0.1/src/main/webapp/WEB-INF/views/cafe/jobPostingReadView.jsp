

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

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/jobPostingUpdateView.do");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/jobPostingDelete.do");
			formObj.attr("method", "post");
			formObj.submit();
		})

		// 목록
		$(".list_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/jobposting.do");
			formObj.attr("method", "post");
			formObj.submit();
		});

	});
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

#root {
	width: 100%;
	margin: 0 auto;
	margin-top: 60px;
	height: 2800px;
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

#programtitle {
	width: 900px;
	height: 70px;
	border-bottom: 2px solid #A4A4A4;
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
	margin-left: 100px;
}

#btn1 {
	margin-top: 20px;
}

textarea {
	border: none;
	border-bottom: 2px solid #A4A4A4;
	margin-top: 20px;
}

.label1 {
	margin-top: 20px;
	border: 1px solid #A4A4A4;
	padding: 5 20 5 20px;
	width: 0 auto;
	border-radius: 5px;
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
</head>



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
		<header id=programheader>
			<h2 id=programhead>프로그램 게시판</h2>
			<br>
			<p>
				프로그램 목록 게시판 수정 뷰입니다.<br> 수정은 신중히 해주십시오.
			</p>
		</header>

		<section id="procontainer">
			<form name="readForm" role="form" method="post"
				accept-charset="UTF-8">


				<table>
					<tbody>
						<div id="content1">

							<label for="noform"><span class="red"></span></label>
							<div class="body_item_inner1">
								<input type="hidden" id="JOB_NO" value="${detail.JOB_NO}"
									name="JOB_NO" />

							</div>

						</div>
						<tr>
							<td><br> 프로그램 기간 &nbsp; | &nbsp; <fmt:formatDate
									value="${detail.s_DATE}" pattern="yyyy-MM-dd " /> <input
								type="hidden" value="${detail.s_DATE}" name="S_DATE"> ~
								<fmt:formatDate value="${detail.d_DATE}" pattern=" yyyy-MM-dd" />
								<input type="hidden" value="${detail.d_DATE}" name="D_DATE">
								<hr></td>

						</tr>


						<tr>
							<td><label class="label1" for="title">제목 </label> <textarea
									id="texttitle" class="totalcontent" name="TITLE" cols="130"
									rows="3"><c:out value="${detail.TITLE}" /></textarea></td>

						</tr>



						<tr>
							<td><label class="label1" for="jobd">내용</label> <textarea
									id="textjob_d" class="totalcontent" name="JOB_D" cols="130"
									rows="3"><c:out value="${detail.JOB_D}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="career">경력</label> <textarea
									id="textcareer" class="totalcontent" name="CAREER" cols="130"
									rows="3"><c:out value="${detail.CAREER}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="edu">학력</label> <textarea
									id="textedu" class="totalcontent" name="EDU" cols="130"
									rows="3"><c:out value="${detail.EDU}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="area">지역</label> <textarea
									id="textarea" class="totalcontent" name="AREA" cols="130"
									rows="3"><c:out value="${detail.AREA}" /></textarea></td>

						</tr>

						<tr>
							<td><label class="label1" for="sal">급여</label> <textarea
									id="textsal" class="totalcontent" name="SAL" cols="130"
									rows="3"><c:out value="${detail.SAL}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="emptype">고용형태</label> <textarea
									id="textemptype" class="totalcontent" name="EMP_TYPE"
									cols="130" rows="3"><c:out
										value="${detail.EMP_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="work_type">근무형태</label> <textarea
									id="textwork_type" class="totalcontent" name="WORK_TYPE"
									cols="130" rows="3"><c:out
										value="${detail.WORK_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="welfare">복리후생</label> <textarea
									id="textwelfare" class="totalcontent" name="WELFARE" cols="130"
									rows="3"><c:out value="${detail.WELFARE}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="company">기업명</label> <textarea
									id="textcompany" class="totalcontent" name="COMPANY" cols="130"
									rows="3"><c:out value="${detail.COMPANY}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="btype">업종</label> <textarea
									id="textbtype" class="totalcontent" name="b_TYPE" cols="130"
									rows="3"><c:out value="${detail.b_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="scale">기업규모</label> <textarea
									id="textscale" class="totalcontent" name="SCALE" cols="130"
									rows="3"><c:out value="${detail.SCALE}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="establish">설립연도</label> <textarea
									id="textestablish" class="totalcontent" name="ESTABLISH"
									cols="130" rows="3"><c:out
										value="${detail.ESTABLISH}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="ysales">연매출액</label> <textarea
									id="textysales" class="totalcontent" name="y_SALES" cols="130"
									rows="3"><c:out value="${detail.y_SALES}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="hp">홈페이지</label> <textarea
									id="texthp" class="totalcontent" name="HP" cols="130" rows="3"><c:out
										value="${detail.HP}" /></textarea></td>

						</tr>
						<tr>
							<td><label class="label1" for="empnum">근로자수</label> <textarea
									id="textempnum" class="totalcontent" name="EMP_NUM" cols="130"
									rows="3"><c:out value="${detail.EMP_NUM}" /></textarea></td>

						</tr>

					</tbody>
				</table>
			</form>
			
			 <s:authorize access="hasAnyRole('ROLE_EMP','ROLE_COM')">
				<div id="btn1">
				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="submit" class="list_btn">목록</button>
			   </div>
	           </s:authorize>
	           
	           	<s:authorize access="hasAnyRole('ROLE_USER','ROLE_STU')">
				<div id="btn1">
				
				<button type="submit" class="list_btn">목록</button>
			</div>
	           </s:authorize>
			

			
			
			
			
		</section>


	</div>



</body>

</html>
