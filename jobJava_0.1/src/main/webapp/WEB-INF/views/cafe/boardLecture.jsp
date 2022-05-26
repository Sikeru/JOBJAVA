<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- <fmt:parseDate value="${list}" var="list" pattern="yyyy-MM-dd"/> --%>


<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canvas</title>


<style type="text/css">

body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 800px;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

.board .list_in {display:inline-block; padding: 5px; width: 420px; height: 130px; border: 1px solid #dedede; overflow: hidden;}
.board .list_in li {background:none; background-color: #fff; }
.board .list_in span img {width: 180px; height: 120px;}
.board .list_in dl {margin: -112px 0 0 190px;} 
.board .list_in dt {padding:6px 0 8px;font-size: 16px; font-weight: bold; color:#666;}
.board .list_in dt strong {color:#0052c3;}
.board .list_in dd {font-size: 12px; overflow: hidden;text-overflow:ellipsis;white-space:nowrap;}
.board .list_in dd strong {color:#555;}



/* 1번 디비전 */
#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 20%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}


/* 2번 디비전 */
#ulTable2 {
	margin-top: 10px;
}

#ulTable2>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable2>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable2>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable2>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable2>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable2>li>ul>li:first-child+li+li {
	width: 20%;
} /*작성일 열 크기*/
#ulTable2>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable2>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}


/* 3번 디비전 */
#ulTable3 {
	margin-top: 10px;
}

#ulTable3>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable3>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable3>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable3>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable3>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable3>li>ul>li:first-child+li+li {
	width: 20%;
} /*작성일 열 크기*/
#ulTable3>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable3>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}




/* 4번 디비전 */
#ulTable4 {
	margin-top: 10px;
}

#ulTable4>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable4>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable4>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable4>li>ul>li:first-child {
	width: 10%;
} /*No 열 크기*/
#ulTable4>li>ul>li:first-child+li {
	width: 45%;
} /*제목 열 크기*/
#ulTable4>li>ul>li:first-child+li+li {
	width: 20%;
} /*작성일 열 크기*/
#ulTable4>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*작성자 열 크기*/
#ulTable4>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}


} /*조회수 열 크기*/
#divPaging {
	clear: both;
	margin: 0 auto;
	width: 220px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#liSearchOption {
	clear: both;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

.left {
	text-align: left;
}
</style>

</head>
<body>
	<form role="form" method="get">
		<div id="mainWrapper">

			<ul>
				<!-- 게시판 제목 -->
				<br>
				<li><h2>취업특강</h2></li>
				<br>


				<!-- 게시판 목록  -->
				<li>
					<ul id="ulTable">
						<li>
							<ul>
								<li>NO</li>
								<li>제목</li>
								<li>시작날짜</li>
								<li>종료날짜</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<c:forEach var="list" items="${list}" begin="1" end="1">
							<li>
								<ul>
									<li>${list.PROGRAM_NO}</li>
									<li class="left"><a
										href="${contextPath}/cafe/hireInfoDetail.do?programNO=${list.PROGRAM_NO}">${list.TITLE}</a></li>
									<li><fmt:formatDate value="${list.S_DATE}"
											pattern="yyyy-MM-dd" /></li>
									<li><fmt:formatDate value="${list.E_DATE}"
											pattern="yyyy-MM-dd" /></li>
								</ul>
							</li>
						</c:forEach>


						<li></li>
					</ul> <!-- 2번 디비젼 -->
					<ul id="ulTable2">
						<li>
							<ul>
								<li>NO</li>
								<li>제목</li>
								<li>시작날짜</li>
								<li>종료날짜</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<c:forEach var="list" items="${list}" begin="2" end="2">
							<li>
								<ul>
									<li>${list.PROGRAM_NO}</li>
									<li class="left"><a
										href="${contextPath}/cafe/hireInfoDetail.do?programNO=${list.PROGRAM_NO}">${list.TITLE}</a></li>
									<li><fmt:formatDate value="${list.S_DATE}"
											pattern="yyyy-MM-dd" /></li>
									<li><fmt:formatDate value="${list.E_DATE}"
											pattern="yyyy-MM-dd" /></li>
								</ul>
							</li>
						</c:forEach>


					
					</ul> 
					<!-- 3번 디비젼 -->
					<ul id="ulTable3">
						<li>
							<ul>
								<li>NO</li>
								<li>제목</li>
								<li>시작날짜</li>
								<li>종료날짜</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<c:forEach var="list" items="${list}" begin="3" end="3">
							<li>
								<ul>
									<li>${list.PROGRAM_NO}</li>
									<li class="left"><a
										href="${contextPath}/cafe/hireInfoDetail.do?programNO=${list.PROGRAM_NO}">${list.TITLE}</a></li>
									<li><fmt:formatDate value="${list.S_DATE}"
											pattern="yyyy-MM-dd" /></li>
									<li><fmt:formatDate value="${list.E_DATE}"
											pattern="yyyy-MM-dd" /></li>
								</ul>
							</li>
						</c:forEach>

					</ul>
					
					<!-- 4번 디비젼 -->
						<ul id="ulTable4">
						<li>
							<ul>
								<li>NO</li>
								<li>제목</li>
								<li>시작날짜</li>
								<li>종료날짜</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<c:forEach var="list" items="${list}" begin="4" end="4">
							<li>
								<ul>
									<li>${list.PROGRAM_NO}</li>
									<li class="left"><a
										href="${contextPath}/cafe/hireInfoDetail.do?programNO=${list.PROGRAM_NO}">${list.TITLE}</a></li>
									<li><fmt:formatDate value="${list.S_DATE}"
											pattern="yyyy-MM-dd" /></li>
									<li><fmt:formatDate value="${list.E_DATE}"
											pattern="yyyy-MM-dd" /></li>
								</ul>
							</li>
						</c:forEach>

					</ul>
					


















				</li>



				<!-- 게시판 페이징 영역 -->

				<!-- 게시판 검색 영역 -->





			</ul>
		</div>
	</form>
</body>
</html>
