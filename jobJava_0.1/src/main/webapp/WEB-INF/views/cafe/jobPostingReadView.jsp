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
		})
		
		// 장바구니
		$(".cart-btn").click(function() {
			var check = confirm("장바구니에 담겼습니다. 확인하시겠습니까?");
			if (check) {
				location.assign("/cafe/jobposting.do");
			} 
		});



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

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="jobNO" name="JOB_NO"
					value="${detail.JOB_NO}" />

				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="TITLE" value="${detail.TITLE}" readonly /></td>
						</tr>
						<tr>
							<td><label for="jobd">내용</label> <textarea id="jobd"
									name="JOB_D" readonly><c:out value="${detail.JOB_D}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="career">경력</label> <textarea id="career"
									name="CAREER" readonly><c:out
										value="${detail.CAREER}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="edu">학력</label> <textarea id="edu"
									name="EDU" readonly><c:out value="${detail.EDU}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="area">지역</label> <textarea id="area"
									name="AREA" readonly><c:out value="${detail.AREA}" /></textarea></td>

						</tr>
						<tr>
						<tr>
							<td><label for="sal">급여</label> <textarea id="sal"
									name="SAL" readonly><c:out value="${detail.SAL}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="emptype">고용형태</label> <textarea id="emptype"
									name="EMP_TYPE" readonly><c:out
										value="${detail.EMP_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="worktype">근무형태</label> <textarea
									id="worktype" name="WORK_TYPE" readonly><c:out
										value="${detail.WORK_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="welfare">복리후생</label> <textarea id="welfare"
									name="WELFARE" readonly><c:out
										value="${detail.WELFARE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="company">기업명</label> <textarea id="company"
									name="COMPANY" readonly><c:out
										value="${detail.COMPANY}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="btype">업종</label> <textarea id="btype"
									name="B_TYPE" readonly><c:out
										value="${detail.b_TYPE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="scale">기업규모</label> <textarea id="scale"
									name="SCALE" readonly><c:out value="${detail.SCALE}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="establish">설립연도</label> <textarea
									id="establish" name="ESTABLISH" readonly><c:out
										value="${detail.ESTABLISH}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="ysales">연매출액</label> <textarea id="ysales"
									name="Y_SALES" readonly><c:out
										value="${detail.y_SALES}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="hp">홈페이지</label> <textarea id="hp" name="HP"
									readonly><c:out value="${detail.HP}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="empnum">근로자수</label> <textarea id="empnum"
									name="EMP_NUM" readonly><c:out
										value="${detail.EMP_NUM}" /></textarea></td>

						</tr>
						<tr>
						<tr>
							<td><label for="regdate">시작일</label> <input type="date"
								value="${detail.s_DATE}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td><label for="regdate1">종료일</label> <input type="date"
								value="${detail.d_DATE}" pattern="yyyy-MM-dd" /></td>
						</tr>



					</tbody>
				</table>

				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>
				</div>
			</form>
		</section>
	</div>
	<button class="btn btn-default cart-btn">장바구니</button>
	<hr />
</body>
</html>