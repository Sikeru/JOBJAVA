<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
	<title>Home</title>

	<style>

		a{
         	color: black;
        	text-decoration: none;
			list-style: none;
		}
		#contain {
		  width: 100%;
  		  height: 700px;
  		  background: linear-gradient(#fff, rgb(215,229,251) 50%);
		}
		#carouselExampleControls{
			position: relative;
    		left: 50px;
    		top: 30px;
			width: 900px;
			height: 700px;
			float: left;
		}

		.d-block {
			width: 700px;
			height: 650px;
			margin: 0 auto;
		}
		#cafeleader{
			width: 100%;
			height: 300px;
			margin: 0 auto;
			background: rgb(89,166,255);
		}
		.cafeleader {
			width: 76px; 
			height: 76px;
			
			
		}
		
		#mainArticle {
			position: absolute;
    		right: 140px;
    		top: 100px;
			width: 700px; 
			height: 500px;
		}
		hr{
			color: blue;
		}
		.cafeleaderArticle{
			position: relative;
			width: 165px; 
			height: 170px;
			float: left;
			background: rgb(66,152,251);
			border-radius: 15px;
			margin-left: 40px;
			text-align: center;
			top: 50px;
			left: 300px;
		}
		.cafeleaderArticle img{
			margin-top: 25px;
		}
		
		.cafeleaderArticle span{
			color: #fff;
		}
		
		.carousel-control-prev{
			height: 650px;
		}
		.carousel-control-next{
			height: 650px;
		}
		
		.cafeleaderArticle:hover{
			background: rgb(0,93,197);
		}

		
	</style>
</head>
<body>
<div id="contain">
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${contextPath}/resources/image/mainimg1.png" class="d-block" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/mainimg2.png" class="d-block" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/mainimg3.jpg" class="d-block" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>



<div id="mainArticle">
	<img src="https://www.jobdaejeon.or.kr/images/mps/new/copy.svg" ><br><br><br>
	<span style="font-size: 20px;">서식 자료실</span> <a href="${contextPath}/main/supportTable.do" style="float: right;">+</a><br><hr>
	<c:forEach var="fboard" items="${fboard}">
		<a href="${contextPath}/board/supportTableView.do?BOARD_NO=${fboard.BOARD_NO}" style="font-size: 17px;">${fboard.TITLE} </a> <span style="float: right;">${fboard.F_DATE}</span> <br><hr>
	</c:forEach>
</div>

</div>
<div id="cafeleader">
	
	<a  href="${contextPath}/cafe/main.do">
	<div class="cafeleaderArticle">
	<img class="cafeleader" src="https://www.jobdaejeon.or.kr/images/mps/new/icon-01.svg">
	<br><span>일자리카페</span>
	</div>
	</a>
	<a  href="${contextPath}/leader/main.do">
	<div class="cafeleaderArticle">
	<img class="cafeleader" src="https://www.jobdaejeon.or.kr/images/mps/new/icon-02.svg" >
	<br><span>뉴리더사업</span>
	</div>
	</a>
	<a href="${contextPath}/main/alarmCenter.do?mnName=알림마당">
	<div class="cafeleaderArticle">
	<img class="cafeleader" src="https://www.jobdaejeon.or.kr/images/mps/new/icon-03.svg" >
	<br><span>알림마당</span>
	</div>
	</a>
	<a href="http://jobdaejeon.jobkorea.co.kr/Home/Main">
	<div class="cafeleaderArticle">
	<img class="cafeleader" src="https://www.jobdaejeon.or.kr/images/mps/new/icon-04.svg" >
	<br><span>2020 대전 온라인<br> 일자리 박람회</span>
	</div>
	</a>
	<a href="${contextPath}/main/bessinfo.do?mnName=사업안내">
	<div class="cafeleaderArticle">
	<img class="cafeleader" src="https://www.jobdaejeon.or.kr/images/mps/new/icon-05.svg" >
	<br><span>사업안내</span>
	</div>
	</a>
	
	<a href="${contextPath}/main/bestCompany.do?mnName=기업홍보">
	<div class="cafeleaderArticle">
	<img class="cafeleader" src="https://www.jobdaejeon.or.kr/images/mps/new/icon-06.svg" >
	<br><span>우수기업</span>
	</div>
	</a>

</div>

</body>
</html>
