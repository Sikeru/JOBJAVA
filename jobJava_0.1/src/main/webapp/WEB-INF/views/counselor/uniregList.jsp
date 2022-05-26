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
<meta charset="EUC-KR">
<title>사업참여 관리 목록</title>
<script>
	$(function() {
		$('.sub').hide();
		$('.title').click(function() {
			$('.sub').hide(500);
			$('.title').removeClass('on');
			$('.title').css({
				color : '#000'
			})
			$(this).next().show(500);
			$(this).addClass('on');

		}); //title click끝 

		$('.sub li').hover(function() {
			$(this).find('a').css({
				fontWeight : 'bold'
			});

		}, function() {
			$(this).find('a').css({
				fontWeight : 'normal'
			});

		}); //sub li hover 끝

	}); //첫 function 끝
</script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	line-height: 24px;
}

table td, th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 10px;
}

th {
	background: rgb(221, 221, 221);
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
}

li{
	list-style: none;
}
</style>

</head>

<body>

	<div id="unilist">
		<h3>참여목록</h3>

		<form role="form" method="post"
			action="${contextPath}/counselor/uniregForm.do">
			<table>
				<thead>
					<tr>
						<th>사업번호</th>
						<th>사업명</th>
						<th>대학명</th>
						<th>승인여부</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.UNI_B_NO}</td>
							<td><a
								href="${contextPath}/counselor/uniregView.do?UNI_B_NO=${list.UNI_B_NO}">${list.B_NAME}</a></td>
							<td>${list.U_NAME}</td>
							<td>${list.PERMISSION}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<tr>
				<td colspan="5" style="border: white:text-align:right;">
				<a href="${contextPath}/counselor/uniregForm.do">대학 등록</a></td>
			</tr>

		</form>
		
		<li>
            <div id="divPaging">
               <ul class="paging">
                  <c:if test="${paging.prev}">
                     <span><a
                        href='<c:url value="uniregList.do?page=${paging.startPage-1}"/>'>이전</a></span>
                  </c:if>
                  <c:forEach begin="${paging.startPage}" end="${paging.endPage}"
                     var="num">
                     <span><a
                        href='<c:url value="uniregList.do?page=${num}"/>'>${num}</a></span>
                  </c:forEach>
                  <c:if test="${paging.next && paging.endPage>0}">
                     <span><a
                        href='<c:url value="uniregList.do?page=${paging.endPage+1}"/>'>다음</a></span>
                  </c:if>
               </ul>
            </div>
         </li>
			
	</div>

</body>
</html>