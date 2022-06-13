<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
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



<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
</head>


<meta charset="UTF-8">
<title>프로그램 신청목록</title>
</head>
<script>

//승인 저장
function updateMember(cnt, EMP_PAR_NO){
   let f = document.createElement('form');
   let APP = document.getElementById("APP"+cnt).value;
    let obj;
    let obj1;
    
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'APP');
    obj.setAttribute('value', APP );
    
    obj1 = document.createElement('input');
    obj1.setAttribute('type', 'hidden');
    obj1.setAttribute('name', 'EMP_PAR_NO');
    obj1.setAttribute('value', EMP_PAR_NO);
    
    f.appendChild(obj);
    f.appendChild(obj1);
    f.setAttribute('method', 'post');
    f.setAttribute('action', ' ${contextPath}/cafe/companymypageupdate.do');
    document.body.appendChild(f);
    f.submit();

   alert('승인여부가 수정되었습니다.');
     
}
    

</script>
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
	margin-left:10px;
	
}

#mainWrapper {
	width: 1300px;
	height: 1000px;
	margin: 0 auto; /*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
	
}

#ulTable{
	margin-top: 10px;

}

#ulTable>li:first-child>ul>li {
	background-color: #99999;
	font-weight: bold;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size:15px;
	

}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
	border-bottom: 1px solid silver;
	margin-top: 15px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	vertical-align: baseline;
	
}

#ulTable>li>ul>li:first-child {
	width: 5%;
	
} /*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 50%;
} /*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 10%;
} /*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 10%;
} /*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}
#ulTable>li>ul>li:first-child+li+li+li+li {
width: 15%;
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

#mytitle {
	font-size: 40px;
}
h2{
width:100px;
font-size : 15px;
font-weight: bold;
background-color : #192E7E;
color : white;
margin-left :265px;
border-radius : 8px;
padding:2px;
}

#subbtn{
width : 50px;
height: 30px;
font-size : 13px;


}

select{
border:none;
}

summary {
display: block;

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
	margin-top: 9px;
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
	
	
	<form role="form" method="post"
		action="${contextPath}/cafe/companymypagelist.do">
		<div id="mainWrapper">
			<input type="hidden"
				value="${pageContext.request.userPrincipal.name}" name="ID"><br>

			<ul>
				<!-- 게시판 제목 -->
				<br>
				<li id="mytitle">신청자 관리창</li>
				<br>

				<!-- 게시판 목록  -->
				<li>
					<ul id="ulTable">
						<li>
							<ul id="titi">
								<li>No</li>
								<li>프로그램명</li>
								<li>구분</li>
								<li>신청자</li>
								<li>승인여부</li>
								<li>수정</li>

							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						
						<c:forEach var="companymypagelist" items="${companymypagelist}" varStatus="status">
							
							<li>
								<ul>
									<li>${companymypagelist.PROGRAM_NO}</li>
									<li>
									 <details>
											<summary>${companymypagelist.TITLE}</summary>
											<h2>신청번호</h2>
											<p>NO.&nbsp;${companymypagelist.EMP_PAR_NO}</p>
											<h2>질문</h2>
											<p>${companymypagelist.QUESTION }</p>
									
										</details>

									</li>
									<li>${companymypagelist.DIVISION}</li>
									<li>${companymypagelist.ID}</li>
									
									<li><select id="APP${status.count}" name="APP">
                                  <option hidden="${companymypagelist.APP}" selected>${companymypagelist.APP}</option>
                                   <option value="미승인">미승인</option>
                                   <option value="승인">승인</option>
                                 </select>
                           </li>
                           
                         <li> <input type= "button" id= "subbtn" value="수정" style="background-color:silver; border: 1px solid white; color:white; margin-top:4px; padding-bottom:2px; opacity:0.7;" onclick="updateMember(${status.count}, ${companymypagelist.EMP_PAR_NO})"/>	</li>
								</ul>
							</li>
						</c:forEach>
						
					</ul>

				</li>

			</ul>


		</div>

	</form>
</body>
</html>
