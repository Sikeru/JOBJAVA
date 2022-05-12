<%@page import="com.jobjava.JJ.cafe.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>

<!-- 스타일 적용시켜주기 -->
<style type="text/css">
/* 기본스타일  */
table {
	background-color: #FFF;
	border: 1px solid #000;
	width: 100%;
}

th {
	border: 1px solid #000;
}

tr {
	height: 60px;
}

td {
	width: 100px;
	text-align: right;
	font-size: 15pt;
	border: 1px solid #000;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
/* 타이틀 스타일 */
#title {
	font-size: 20pt;
	font-weight: bold;
	color: #000;
	font-family: D2coding;
}

#cal_title {
	width: 100%;
}

/* 요일 스타일 */
th.sunday {
	text-align: center;
	font-weight: bold;
	color: red;
	font-family: D2coding;
}

th.saturday {
	text-align: center;
	font-weight: bold;
	color: blue;
	font-family: D2coding;
}

th.etcday {
	text-align: center;
	font-weight: bold;
	color: black;
	font-family: D2coding;
}

/* 날짜 스타일 */
td.sun {
	text-align: center;
	font-size: 15pt;
	color: red;
	font-family: D2coding;
	vertical-align: top;
}

td.sat {
	text-align: center;
	font-size: 15pt;
	color: blue;
	font-family: D2coding;
	vertical-align: top;
}

td.etc {
	text-align: center;
	font-size: 15pt;
	color: black;
	font-family: D2coding;
	vertical-align: top;
}

td.redbefore {
	text-align: right;
	font-size: 12pt;
	color: red;
	font-family: D2coding;
	vertical-align: top;
}

td.before {
	text-align: right;
	font-size: 12pt;
	color: gray;
	font-family: D2coding;
	vertical-align: top;
}

.calendar_next {
	width: 10px;
	height: 14px;
	background-image: url('../resources/image/btn-calendar-next.png');
	border: 0;
}

.calendar_prev {
	width: 10px;
	height: 14px;
	background-image: url('../resources/image/btn-calendar-prev.png');
	border: 0;
}

#body {
	width: 1600px;
}

.list>li{
	color: #000;
	list-style: none;
	text-align: left;
}
.list>li>a{
	text-decoration: none;
	color: #000;
	font-size: 16px;
}
.list>li>span{
	font-size: 16px;
	margin-right: 10px;
}
.list>li>span.start {
	border: 1px solid blue;
	color: blue;
}

.list>li>span.end {
	border: 1px solid red;
	color: red;
}
</style>
</head>

<body>
	<%
		// 컴퓨터 시스템의 년, 월 받아오기
	Date date = new Date();
	int year = date.getYear() + 1900;
	int month = date.getMonth() + 1;

	//	오류사항 걸러주기	
	try {
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));

		if (month >= 13) {
			year++;
			month = 1;
		} else if (month <= 0) {
			year--;
			month = 12;
		}
	} catch (Exception e) {

	}
	%>
	<script type="text/javascript">
		
	</script>
	<div id=calendar>
		<div id=cal_title>
			<!-- 이전달 버튼 만들기 -->

			<%-- <a href ="?year=<%=year%>&month=<%month-1%>">이전 달</a> --%>
			<button type="button" value="이전 달" class="calendar_prev"
				onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'"></button>


			<!-- 제목 만들기 -->
			<strong id="title"><%=year%>년 <%=month%>월</strong>

			<!-- 다음달 버튼 만들기 -->
			<%-- <a href ="?year=<%=year%>&month=<%month+1%>">다음 달</a> --%>
			<button type="button" class="calendar_next"
				onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'"></button>
		</div>

		<div id="cal_sub">
			<!-- 달력 만들기 -->
			<table cellpadding="5" cellspacing="0">
				<!-- 요일 표시칸 만들어주기(단, 토,일요일은 색을 다르게 하기위해 구분해주기) -->
				<tr>
					<th class="sunday">일</th>
					<th class="etcday">월</th>
					<th class="etcday">화</th>
					<th class="etcday">수</th>
					<th class="etcday">목</th>
					<th class="etcday">금</th>
					<th class="saturday">토</th>
				</tr>

				<!-- 날짜 집어 넣기 -->
				<tr>
					<%
						//	1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
					int first = Calendar.weekDay(year, month, 1);

					//	1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
					int start = 0;
					start = month == 1 ? Calendar.lastDay(year - 1, 12) - first : Calendar.lastDay(year, month - 1) - first;

					//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
					for (int i = 1; i <= first; i++) {
						if (i == 1) {
							/* 일요일(빨간색)과 다른날들의 색을 구별주기  */
							out.println("<th class = 'redbefore'>" + "</th>");
						} else {
							out.println("<th class = 'before'>" + "</th>");

						}
					}

					/* 1일부터 달력을 출력한 달의 마지막 날짜까지 반복하며 날짜를 출력 */
					for (int i = 1; i <= Calendar.lastDay(year, month); i++) {
						/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
						switch (Calendar.weekDay(year, month, i)) {
						case 0:
					%>
					<c:set var="i" value="<%=i%>" />
					<c:set var="year" value="<%=year%>" />
					<c:set var="month" value="<%=month%>" />
					<c:set var="list" value="list${i}" />
					<td class='sun'>${i}
						<ul class='list'>
							<c:forEach var="s" items="${requestScope[sdate]}">
								<li><span class="start">등록</span><a href="#">${s}</a></li>
							</c:forEach>
							<c:forEach var="d" items="${requestScope[ddate]}">
								<li><span class="end">마감</span><a href="#">${d}</a></li>
							</c:forEach>
						</ul>
					</td>
					<%
						break;
					case 6:
					%>
					<c:set var="i" value="<%=i%>" />
					<c:set var="year" value="<%=year%>" />
					<c:set var="month" value="<%=month%>" />
					<c:set var="list" value="list${i}" />
					<td class='sat'>${i}
						<ul class='list'>
							<c:forEach var="s" items="${requestScope[sdate]}">
								<li><span class="start">등록</span><a href="#">${s}</a></li>
							</c:forEach>
							<c:forEach var="d" items="${requestScope[ddate]}">
								<li><span class="end">마감</span><a href="#">${d}</a></li>
							</c:forEach>
						</ul>
					</td>
					<%
						break;
					default:
					%>
					<c:set var="i" value="<%=i%>" />
					<c:set var="year" value="<%=year%>" />
					<c:set var="month" value="<%=month%>" />
					<c:set var="sdate" value="sdate${i}" />
					<c:set var="ddate" value="ddate${i}" />
					<td class='etc'>${i}
						<ul class='list'>
							<c:forEach var="s" items="${requestScope[sdate]}">
								<li><span class="start">등록</span><a href="#">${s}</a></li>
							</c:forEach>
							<c:forEach var="d" items="${requestScope[ddate]}">
								<li><span class="end">마감</span><a href="#">${d}</a></li>
							</c:forEach>
						</ul>
					</td>
					<%
						break;
					}

					/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
					if (Calendar.weekDay(year, month, i) == 6 && i != Calendar.lastDay(year, month)) {
						out.println("</tr><tr>");
					}
					}
					if (Calendar.weekDay(year, month, Calendar.lastDay(year, month)) != 6) {
					for (int i = Calendar.weekDay(year, month, Calendar.lastDay(year, month)) + 1; i < 7; i++) {
						out.println("<td></td>");
					}
					}
					%>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>