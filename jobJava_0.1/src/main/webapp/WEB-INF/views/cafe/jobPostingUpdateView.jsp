<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<%-- <fmt:parseDate value="${list}" var="list" pattern="yyyy-MM-dd"/> --%>


<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>

<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {

		$(".cancel_btn").on("click", function() {
			formObj.attr("action", "/JJ/cafe/jobPostingUpdateView.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
</script>
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container1">
			<form name="updateForm" role="form" method="post"
				action="${contextPath}/cafe/jobpostingupdate.do">
				<input type="hidden" name="JOB_NO" value="${update.JOB_NO}" readonly />



				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="TITLE" value="${update.TITLE}" /></td>
						</tr>
						<tr>
							<td><label for="jobd">내용</label> <textarea id="jobd"
									name="JOB_D"><c:out value="${update.JOB_D}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="career">경력</label> <textarea id="career"
									name="CAREER"><c:out value="${update.CAREER}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="edu">학력</label> <textarea id="edu"
									name="EDU"><c:out value="${update.EDU}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="area">지역</label> <textarea id="area"
									name="AREA"><c:out value="${update.AREA}" /></textarea></td>

						</tr>
						<tr>
						<tr>
							<td><label for="sal">급여</label> <textarea id="sal"
									name="SAL"><c:out value="${update.SAL}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="emptype">고용형태</label> <textarea id="emptype"
									name="EMP_TYPE"><c:out value="${update.EMP_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="worktype">근무형태</label> <textarea
									id="worktype" name="WORK_TYPE"><c:out
										value="${update.WORK_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="welfare">복리후생</label> <textarea id="welfare"
									name="WELFARE"><c:out value="${update.WELFARE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="company">기업명</label> <textarea id="company"
									name="COMPANY"><c:out value="${update.COMPANY}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="btype">업종</label> <textarea id="btype"
									name="B_TYPE"><c:out value="${update.b_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="scale">기업규모</label> <textarea id="scale"
									name="SCALE"><c:out value="${update.SCALE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="establish">설립연도</label> <input type="date"
								id="establish" name="ESTABLISH" value="${update.ESTABLISH}"
								pattern="yyyy-mm-dd" /></td>

						</tr>
						<tr>
							<td><label for="ysales">연매출액</label> <textarea id="ysales"
									name="Y_SALES"><c:out value="${update.y_SALES}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="hp">홈페이지</label> <textarea id="hp" name="HP"><c:out
										value="${update.HP}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="empnum">근로자수</label> <textarea id="empnum"
									name="EMP_NUM"><c:out value="${update.EMP_NUM}" /></textarea></td>

						</tr>
						<tr>
						<tr>
							<td><label for="regdate">시작일</label> <input type="date"
								value="${update.s_DATE}" pattern="yyyy-mm-dd" /></td>
						</tr>
						<tr>
							<td><label for="regdate1">종료일</label> <input type="date"
								value="${update.d_DATE}" pattern="yyyy-mm-dd" /></td>
						</tr>



					</tbody>
				</table>




				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>