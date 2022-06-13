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
<title>학생마이페이지</title>
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
   width: 1000px;
   height: 700px;
   margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
   text-align: center;
   font-size: 14pt;
   height: 40px;
   vertical-align: middle;
   line-height: 30px;
}

#ulTable {
   margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
   background-color: #99999;
   font-weight: bold;
   text-align: center;
  
	font-size:15px;
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
   width: 50%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
   width: 25%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
   width: 15%;
} /*작성자 열 크기*/
 /*조회수 열 크기*/
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
   text-align: center;
}

#mytitle{
font-size :40px;
}

li a{
 text-decoration:none;
 color:black;
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
	margin-top: 8px;
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

</style>

</head>
<body>
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

<form role="form" method="get">
   <div id="mainWrapper">
 <input type="hidden"
					value="${pageContext.request.userPrincipal.name}" name="ID"><br>     
 <input type="hidden"
					value="${EMP_PAR_NO}" name="EMP_PAR_NO"><br>   
      <ul>
         <!-- 게시판 제목 -->
         <br><li id="mytitle">프로그램 신청 현황</li><br>

         <!-- 게시판 목록  -->
         <li>
            <ul id="ulTable">
               <li>
                  <ul>
                     <li>No</li>
                     <li>프로그램명</li>
                     <li>프로그램 종류</li>
                     <li>신청현황</li>
               
                  </ul>
               </li>
               <!-- 게시물이 출력될 영역 -->
               <c:forEach var="studentmypagelist" items="${studentmypagelist}">
                  <li>
                     <ul>
                        <li>${studentmypagelist.PROGRAM_NO}</li>
                         <li class="left"><a
                           href="${contextPath}/cafe/studentmypageview.do?PROGRAM_NO=${studentmypagelist.PROGRAM_NO}">${studentmypagelist.TITLE}</a></li>
                        <li>${studentmypagelist.DIVISION}</li>
                        <li>${studentmypagelist.APP}</li>
                     </ul>
                  </li>
               </c:forEach>
               <li></li>
            </ul>

         </li>


    

      </ul>
   </div>
   </form>
</body>
</html>
