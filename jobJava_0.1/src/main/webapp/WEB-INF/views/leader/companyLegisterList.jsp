<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <fmt:parseDate value="${list}" var="list" pattern="yyyy-MM-dd"/> --%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<title>Canvas</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">

 * {
        margin: 0;
        padding: 0;
    }
    
    wrap{
    width: 100%;
    height: auto;
    }

#top{
  width: 100%;
  height: 300px;
        background: #0F4C75;
        border-bottom: 1px solid;
  }     


    header {
      
        
    
    width: 1600px;
    margin: 0 auto;


    }

    header #loginMenu ul {
        width: 100%;
        height: 200px;
        background: #0F4C75;
        overflow: hidden;
        margin:0;
       
    }

    header #loginMenu li {
        display: inline-block;
        list-style: none;
        text-decoration: none;
        margin: 15px;
        float: right;
        position: relative;
        right: 100px;
        z-index: 1;
    }

    header #loginMenu li a {
        text-decoration: none;
        color: white;
    }

    /*    logo style start*/
    header #topLogo {
        width: 100%;
        height: 250px;
        position: relative;
        left: 45%;
        bottom: 250px;
         z-index: 0;
        
        

    }



    /*    logo style end*/
    
    

    header #topMenu ul {
        width: 100%;
        background: #0F4C75;
        overflow: hidden;
        margin:0;
        



    }

    header #topMenu li {
        display: inline-block;
        list-style: none;
        text-decoration: none;
        margin: 20px;
        float: right;
        position: relative;
        right: 35%;
        top: 30%;
        z-index: 2;
    }

    header #topMenu li a {
        text-decoration: none;
        color: white;
    }
    
    /* header style End */

  #listMenu{
width:100%;
height: auto;
color: #fff;
background: #BBE1FA;

}

#listMenu ul{
width:100%;
height:50px;
margin:0;
margin-left:25%;
padding:0;
text-align: center;

}

#listMenu li{
width:200px;
height:100%;
text-align: center;
list-style: none;
font-size: 20px;
float:left;
margin-left: 1px;
background: #3282B8;
}

#listMenu li p{

margin:0;
margin-top:10px;

}

#listMenu li a{

text-decoration: none;
color:white;
}

 #comListMenu{
width:100%;
height: auto;
color: #fff;
background: #BBE1FA;

}

#comListMenu ul{
width:100%;
height:50px;
margin:0;
margin-left:30%;
padding:0;
text-align: center;

}

#comListMenu li{
width:200px;
height:100%;
text-align: center;
list-style: none;
font-size: 20px;
float:left;
margin-left: 1px;
background: #3282B8;
}

#comListMenu li p{

margin:0;
margin-top:10px;

}

#comListMenu li a{

text-decoration: none;
color:white;
}

#boardwrap {
   width: 1400px;
   margin: 0 auto;
}

#board {
   width: 1400px;
   margin: 0 auto;
   margin-top: 60px;
}

#board table {
   width: 1000px;
   margin: 0 auto;
   font-weight: bold;
}

#board td {
   width: 1000px;
   border-bottom: 1px solid #A4A4A4;;
   border-right: 1px solid #A4A4A4;
   height: 40px;
}

#board td:last-child {
   border-right: none;
}

#board th {
   border-bottom: 1px solid #192E7E;
   border-top: 1.5px solid #192E7E;
   height: 50px;
   background-color: #f4f5f9;
   font-size: 16px;
}

#board tbody td a {
   color: black;
   text-decoration: none;
}

#th-1 {
   width: 10%;
}

#th-2 {
   width: 40%;
}

#th-3 {
   width: 10%;
}

#th-4 {
   width: 10%;
}
#th-5 {
   width: 10%;
}
#th-6 {
   width: 10%;
}
#th-7 {
   width: 10%;
}

table {
   text-align: center;
}

.legister_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 50px;
    height: 30px;
}

.legister_btn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}

.update_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    width: 50px;
    height: 30px;
    background: #4169E1;
    color: white;
    border: 0px solid;
}

.update_btn:hover {
background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    
}

.disabled_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 50px;
    height: 30px;
}

.disabled_btn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}



/* #liSearchOption {
   clear: both;
} */

/* #liSearchOption>div {
   margin: 0 auto;
   margin-top: 30px;
   width: auto;
   height: 100px;
} */
#divPaging {
   text-align: center;
   font-size: 0;
   list-style: none;
   left: 500px;
   clear: both;
   text-align: center;
   text-decoration: none;
   font-size: 20px;
   margin: 0 auto;
}

.paging {
   display: inline-block;
   list-style: none;
   margin-top: 60px;
}

.paging .none {
   display: none;
}

.paging a {
   display: block;
   margin: 0 4px;
   float: left;
   border: 1px solid #e6e6e6;
   width: 28px;
   height: 28px;
   line-height: 28px;
   text-align: center;
   background-color: #fff;
   font-size: 13px;
   color: black;
   text-decoration: none;
}

.paging .ul {
   list-style: none;
   text-align: center;
}

.paging .arrow {
   border: 1px solid #ccc;
}

.paging .pprev {
   background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
   margin-left: 0;
}

.paging .prev {
   background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
   margin-right: 7px;
}

.paging .next {
   background: #f8f8f8 url('img/page_next.png') no-repeat center center;
   margin-left: 7px;
}

.paging .nnext {
   background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
   margin-right: 0;
}

.paging a.active {
   background-color: #42454c;
   color: #fff;
   border: 1px solid #42454c;
}

.search {
   margin-left: 495px;
   margin-top: 40px;
   margin-bottom: 50px;
}

h2 {
   text-align: center;
   margin-top: 40px;
   font-size: 30px;
}

#searchBtn {
   width: 70px;
   heigth: 40px;
   border: none;
   border: 1px solid #e6e6e6;
}

#keywordInput {
   width: 200px;
}

/* searchType {
   width: 100px;
} */
#searchtitle {
   width: 110px;
   heigth: 80px;
   text-align: center;
   margin: 0 auto;
   border: 1px solid #e6e6e6;
   font-size : 14px;
}

#keywordInput {
   border: 1px solid #e6e6e6;
   text-align: center;
}

/*  footer {
        width: 100%;
        margin: 0 auto;
        clear: both;
    }
	footer #service{
		width: 100%;
		height:50px;
		background: #0F4C75;
	}
    footer #service ul {
    	width:100%;
        text-align: center;
        margin:0;
    }

    footer #service li {
        list-style: none;
        text-decoration: none;
        display: inline-block;
        margin-right:30px;
        line-height: 50px;
        
        

    }

    footer #service li a {
        text-decoration: none;
        color: white;
    }

    footer #copyrights {
        width: 0 auto;
        height: 200px;
        
        
    }
    footer .copyright-wrap{
        width: 80%;
        height: 100%;
        background: #3282B8;
        float: left;
        
    }
    footer .copyright{
        width: 0 auto;
        margin-top: 20px;
        margin-left: 30px;
    }
    footer .copyright a{
        color: white;
        line-height: 20px;
       
    }
    footer .footerLogo{
        width: 20%;
        height: 100%;
        float: left;
        background: #3282B8;
        
        
    }
    footer .footerLogo img{
        width: 100%;
        height: 100%;
    }
    footer #company{
        width: 100%;
        height: 50px;
        
    }
    footer #company ul{
        text-align: center;
        background: #BBE1FA;
    }
    footer #company li{
        list-style: none;
        text-decoration: none;
        display: inline-block;
        margin-right: 70px;
    }
    footer #company img{
        width: 100%;
        height: 150px;
    } */
    
    
</style>

</head>
<body>
<s:authorize access="hasRole('ROLE_COM')">
 <div id="comListMenu">
<ul>
<li><p><a href="${contextPath}/leader/companyLegisterList.do">사업참여</a></p></li>
<li><p><a href="${contextPath}/leader/companyLegisterStuList.do">참여학생조회</a></p></li>
<li><p><a href="${contextPath}/leader/surveylist.do">설문조사</a></p></li>
</ul>
</div>
</s:authorize>
<s:authorize access="hasRole('ROLE_STU')">
 <div id="listMenu">
<ul>
<li><p><a href="${contextPath}/leader/companyLegisterList.do">사업참여</a></p></li>
<li><p><a href="${contextPath}/leader/viewJournal.do">업무일지</a></p></li>
<li><p><a href="${contextPath}/leader/commuteCheck.do">출퇴근조회</a></p></li>
<li><p><a href="${contextPath}/leader/surveylist.do">설문조사</a></p></li>
</ul>
</div>
</s:authorize>
   <div id="boardwrap">
      <div id="board" text>
         <table>
            <thead>
               <tr>
							<th id=th-1>No</th>
							<th id=th-2>사업명</th>
							<th id=th-3>대학명</th>
							<th id=th-4>진행상태</th>
							<s:authorize access="hasAnyRole('ROLE_STU,ROLE_COM')">
								<th id=th-5>관리</th>
							</s:authorize>
							<s:authorize access="hasAnyRole('ROLE_STU')">
								<th id=th-5>승인여부</th>
							</s:authorize>
				</tr>
							
				
					<!-- 게시물이 출력될 영역 -->
					 </thead>
            <tbody>
               <c:choose>
                  <c:when test="${not empty list }">
					<c:forEach var="list" items="${list}">

						 <tr align="center">
								<td>${list.UNI_B_NO}</td>
								<td>${list.B_NAME}</td>
								<td>${list.U_NAME}</td>
								<td class="left">${list.STATE}</td>
								

								<!-- 신청 수정버튼영역(학생)-->
								<s:authorize access="hasRole('ROLE_STU')">
											<td><c:if test='${appCheck eq null}'>
												<c:if test="${list.STATE eq '마감'}">
													<input type="button" class="disabled_btn" disabled value="신청">
												</c:if>
												<c:if test="${list.STATE eq '진행중'}">
													<input type="button"  class="legister_btn" value="신청">
												</c:if>
											</c:if>
											<c:if test="${appCheck ne null}">
												<c:choose>
													<c:when test="${fn:contains(appCheck, list.UNI_B_NO)}">
														<input type="button" class="update_btn" value="수정" onclick="location.href='${contextPath}/leader/appDetail.do?uniBNO=${list.UNI_B_NO}'">
													</c:when>
													<c:otherwise>
														<c:if test="${list.STATE eq '마감'}">
															<input type="button" class="disabled_btn" disabled value="신청">
														</c:if>
														<c:if test="${list.STATE eq '진행중'}">
															<input type="button" class="legister_btn" value="신청" onclick="location.href='${contextPath}/leader/viweApplicationfrom.do?uniBNO=${list.UNI_B_NO}'">
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if></td>
											<input value="${userID}" name="userID" type="hidden">
											
									</s:authorize> 
									<!-- 신청 수정버튼영역(기업)--> 
									<s:authorize access="hasRole('ROLE_COM')">
											<td><c:if test='${appCheckCom eq null}'>
												<c:if test="${list.STATE eq '마감'}">
													<input type="button" class="disabled_btn" disabled value="신청">
												</c:if>
												<c:if test="${list.STATE eq '진행중'}">
													<input type="button" class="legister_btn" value="신청" onclick="location.href='${contextPath}/leader/company.do?uniBNO=${list.UNI_B_NO}'">
												</c:if>
											</c:if>
											<c:if test="${appCheckCom ne null}">
												<c:choose>
													<c:when test="${fn:contains(appCheckCom, list.UNI_B_NO)}">
														<input type="button" class="update_btn" value="수정" onclick="location.href='${contextPath}/leader/legisterUpdateView.do?uniBNO=${list.UNI_B_NO}'">
													</c:when>
													<c:otherwise>
														<c:if test="${list.STATE eq '마감'}">
															<input type="button" class="disabled_btn" disabled value="신청">
														</c:if>
														<c:if test="${list.STATE eq '진행중'}">
															<input type="button" class="legister_btn" value="신청" onclick="location.href='${contextPath}/leader/company.do?uniBNO=${list.UNI_B_NO}'">
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if></td>
									</s:authorize>
									<s:authorize access="hasRole('ROLE_STU')">
									<c:choose>
										<c:when test="${userID eq list.ID }">
										<td>${list.PERMISSION}</td>
										</c:when>
										<c:otherwise>
										<td></td>
										</c:otherwise>
									</c:choose>
									</s:authorize>
									</tr>
					</c:forEach>
</c:when>
</c:choose>
</tbody>
</table>
</div>
</div>

			<!-- 게시판 페이징 영역 -->
			<form role="form" method="get">
			
				<div id="divPaging">
					<ul class="paging">
						<c:if test="${paging.prev}">
							<span><a
								href='<c:url value="companyLegisterList?page=${paging.startPage-1}"/>'>이전</a></span>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="num">
							<span><a
								href="companyLegisterList.do${paging.makeSearch(num)}">${num}</a></span>
						</c:forEach>
						<c:if test="${paging.next && paging.endPage>0}">
							<span><a
								href='<c:url value="companyLegisterList?page=${paging.endPage+1}"/>'>다음</a></span>
						</c:if>
					</ul>
				</div>
			

			<!-- 검색 폼 영역 -->
			
			

					<div class="search">
						<select name='searchType'>
							<option value='T'
								<c:out value="${scri.searchType eq 'T' ? 'selected' : ''}"/>>사업명</option>
							<option value='C'
								<c:out value="${scri.searchType eq 'C' ? 'selected' : ''}"/>>대학명</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${scri.keyword}" />
						<button id="searchBtn" type="button">검색</button>

 <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "companyLegisterList.do"
								+ '${paging.makeQuery(1)}' + "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					});
		});
	</script>

	<script>
		$('input[type="submit"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
			;
		});
		
		
	</script>
	
	<script>
    // id="test"를 가진 input를 disabled 처리
    $(".disabled_btn").attr("disabled",true);
 
    // id="test"를 가진 input의 disabled 삭제
    $(".disabled_btn").removeAttr("disabled");
    
    $(".disabled_btn").click(function(){
    	alert("마감 된 사업입니다.");
    });
</script>
	</div>
	</form>
</body>
</html>