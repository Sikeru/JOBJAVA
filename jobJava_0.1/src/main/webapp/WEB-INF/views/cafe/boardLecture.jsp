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
<head>
<style>

#mainWrapper {
	width: 1500px;
	height: 2000px;
	margin: 0 auto; /*가운데 정렬*/
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
#cafe a{

text-decoration:none;

}
        #banner{
        
              box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.3);
        }


        #banner1{
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.3);
           
        }
        
         #banner2{
          box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.3);
        }

#banner3{
           width: 1000px;
            height: 393px;
            margin-left: 450px;
            margin-top: 50px;
            margin-bottom: 50px;
            background: white;
            border: 2px solid lightgray;
            display: inline-block;
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.3);
        }

#cafename1{
background-color: #0F4C75;
 color : white;
  font-weight: 800;
   font-size : 25px;
   padding:8px;
   border-radius: 8px;
   height: 24px;
	width: 90px;
	

}
#cafedate
{
background-color : #FAFAFA;
 color : black;
  padding:8px;
   border-radius: 8px;
   height: 24px;
	width: auto;

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
	
<form role="form" method="get" id="form1">
		<div id="mainWrapper">
		
		
   <c:forEach var="list3" items="${list3}" begin="0" end="0">
	<div id="banner">
		<img width="560px" height="390px"
			src="${contextPath}/Cafedownload.do?fileNO=${list3.PROGRAM_NO}&fileName=${list3.EMP_FILENAME}">
		<div id="cafe">
			<a id="cafename1" href="${contextPath}/cafe/hireInfoDetail.do?PROGRAM_NO=${list3.PROGRAM_NO}">${list3.TITLE}</a><br> <br> 
			<a id="cafecontent">  <a id="cafedate"><fmt:formatDate
											value="${list3.S_DATE}" pattern="yyyy-MM-dd " />~<fmt:formatDate
											value="${list3.E_DATE}" pattern=" yyyy-MM-dd" /> </a><br> 
				<hr>       ${list3.CONTENT}  
			</a>

		</div>

	</div>
	
	</c:forEach>
	
	
	 <c:forEach var="list3" items="${list3}" begin="1" end="1">
	<div id="banner1">
		<img width="560px" height="390px"
			src="${contextPath}/Cafedownload.do?fileNO=${list3.PROGRAM_NO}&fileName=${list3.EMP_FILENAME}">
		<div id="cafe">
			<a id="cafename1" href="${contextPath}/cafe/hireInfoDetail.do?PROGRAM_NO=${list3.PROGRAM_NO}">${list3.TITLE}</a><br> <br> 
			<a id="cafecontent"> <a id="cafedate"> <fmt:formatDate
											value="${list3.S_DATE}" pattern="yyyy-MM-dd " />~<fmt:formatDate
											value="${list3.E_DATE}" pattern=" yyyy-MM-dd" /> </a><br> 
				    <hr>   ${list3.CONTENT}  
			</a>

		</div>

	</div>
	
	</c:forEach>
	
	
	 <c:forEach var="list3" items="${list3}" begin="2" end="2">
	<div id="banner2">
		<img width="560px" height="390px"
			src="${contextPath}/Cafedownload.do?fileNO=${list3.PROGRAM_NO}&fileName=${list3.EMP_FILENAME}">
		<div id="cafe">
			<a id="cafename1" href="${contextPath}/cafe/hireInfoDetail.do?PROGRAM_NO=${list3.PROGRAM_NO}">${list3.TITLE}</a><br> <br> 
			<a id="cafecontent"> <a id="cafedate"> <fmt:formatDate
											value="${list3.S_DATE}" pattern="yyyy-MM-dd " />~<fmt:formatDate
											value="${list3.E_DATE}" pattern=" yyyy-MM-dd" /></a> <br> 
				    <hr>   ${list3.CONTENT}  
			</a>

		</div>

	</div>
	
	</c:forEach>
	
		 <c:forEach var="list3" items="${list3}" begin="3" end="3">
	<div id="banner3">
		<img width="560px" height="390px" id="imgimg"
			src="${contextPath}/Cafedownload.do?fileNO=${list3.PROGRAM_NO}&fileName=${list3.EMP_FILENAME}">
		<div id="cafe">
			<a id="cafename1" href="${contextPath}/cafe/hireInfoDetail.do?PROGRAM_NO=${list3.PROGRAM_NO}">${list3.TITLE}</a><br> <br> 
			<a id="cafecontent"> <a id="cafedate"> <fmt:formatDate
											value="${list3.S_DATE}" pattern="yyyy-MM-dd " />~<fmt:formatDate
											value="${list3.E_DATE}" pattern=" yyyy-MM-dd" /> </a><br>
				    <hr>   ${list3.CONTENT}  
			</a>

		</div>

	</div>
	
	</c:forEach>
	
	</div>
	</form>

</body>




