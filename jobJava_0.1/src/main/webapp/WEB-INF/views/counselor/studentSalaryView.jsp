<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gugi&display=swap')
	;
</style>

<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet"
	type="text/css" media="screen">
<!DOCTYPE html>
<html>
<head>
<title>학생 급여 조회 상세</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$(".cancel_btn").on("click", function() {
			formObj.attr("action", "/JJ/counselor/salaryInformation.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
</script>
<body>

	<div id="root">
		<header>
			<h2>학생 급여 조회 상세</h2>
		</header>
		<hr />
		<hr />

		<section id="container1">
			<form name="updateForm" role="form" method="post"
				action="${contextPath}/cafe/studentSalary.do">
				<input type="hidden" name="COM_NO" value="${update.COM_NO}" readonly />
				<table>
					<tbody>
						<tr>
							<td><label for="title">이름</label><input type="text"
								id="title" name="ID" value="${update.ID}" /></td>
						</tr>
						<tr>
							<td><label for="jobd">날짜</label> <textarea id="jobd"
									name="CD"><c:out value="${update.CD}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="career">급여</label> <textarea id="career"
									name="SAL"><c:out value="${update.SAL}" /></textarea></td>

						</tr>
						<tr>
							<td><label for="edu">승인여부</label> <textarea id="edu"
									name="PROCESS"><c:out value="${update.PROCESS}" /></textarea></td>

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