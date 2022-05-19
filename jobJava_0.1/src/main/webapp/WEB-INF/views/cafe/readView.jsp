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
			formObj.attr("action", "/JJ/cafe/updateView");
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

			location.href = "/JJ/cafe/hireinfopaging";
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

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="programNO" name="PROGRAM_NO"
					value="${detail.PROGRAM_NO}" />

				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="TITLE" value="${detail.TITLE}" readonly /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label> <textarea id="content"
									name="CONTENT" readonly><c:out
										value="${detail.CONTENT}" /></textarea></td>
						</tr>
						<tr>
							<td><label for="regdate">작성날짜</label> <fmt:formatDate
									value="${detail.s_DATE}" pattern="yyyy-MM-dd" /></td>
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

	<hr />
</body>
</html>