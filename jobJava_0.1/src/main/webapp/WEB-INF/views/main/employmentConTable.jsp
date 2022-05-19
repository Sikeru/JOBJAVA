<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
   body{
        line-height:2em;        
        font-family:"맑은 고딕";
}
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
        
        
}
 	a{
         color: black;
         text-decoration: none;
			list-style: none;
}
    #mainWrapper{
        width: 800px;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color: rgb(253,131,82);
        font-weight:bold;
        text-align:center;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

    #divPaging {
          clear:both; 
        margin:0 auto; 
        width:320px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

}

    .left {
        text-align : left;
}


</style>


</head>
<body>
<Table>
<div id="mainWrapper">
        <ul>
            <!-- 게시판 제목 -->
            <li>온라인상담</li>
			
				
            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>답변여부</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
		  <c:choose>
  		    <c:when test="${empty employment}" >
  		    	<ul height="10">
  		    		<li>
  		    			<p align="center">
            				<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        				</p>
  		    		</li>
  		    	</ul>
  		    </c:when>
  		    <c:when test="${!empty employment}" >
          <c:forEach var="employment" items="${employment}" varStatus="employmentNUM">
			<li>
				<ul>
							<li>${employmentNUM.count}</li>
							<li class="left"><a href="${contextPath}/board/employmentTableView.do?EMP_CON_NO=${employment.EMP_CON_NO}">${employment.TITLE}</a></li>
							<li>${employment.EC_DATE}</li>
							<li>${employment.ID}</li>
							<li>${employment.PROCESS}</li>
				</ul>
			</li>
			</c:forEach>
			</c:when>
			</c:choose>


            <!-- 게시판 페이징 영역 -->
            <li>
                <div id="divPaging">
                <c:if test="${employmentTotal != null }" >
                <c:choose>
                <c:when test="${employmentTotal >100 }">
                <c:forEach   var="page" begin="1" end="10" step="1" >
                	<c:if test="${paging.section >1 && page==1 }">
                	  <c:choose>
			           <c:when test="${search.search != null }">
			           <a class="no-uline" href="${contextPath}/board/searchEmploymentTable.do?search=${search.search}&txtKeyWord=${search.txtKeyWord}&section=${paging.section-1}&pageNum=1">&nbsp; ◀ </a>
			           </c:when>
			           <c:otherwise>
			           <a class="no-uline" href="${contextPath }/board/employmentConTable.do?section=${paging.section-1}&pageNum=1">&nbsp; ◀ </a>
			           </c:otherwise>
			          </c:choose>
	    		    </c:if>
	    		      <c:choose>
	          		   <c:when test="${search.search != null }">
			           <a class="no-uline" href="${contextPath}/board/searchEmploymentTable.do?search=${search.search}&txtKeyWord=${search.txtKeyWord}&search=${search.search}&txtKeyWord=${search.txtKeyWord}&section=${paging.section}&pageNum=${page}">${(paging.section-1)*10 +page } </a>
			           </c:when>
			           <c:otherwise>
			           <a class="no-uline" href="${contextPath }/board/employmentConTable.do?section=${paging.section}&pageNum=${page}">${(paging.section-1)*10 +page } </a>
			           </c:otherwise>
			          </c:choose>
	         		<c:if test="${page ==10 }">
	         		 <c:choose>
	          		  <c:when test="${search.search != null }">
			           <a class="no-uline" href="${contextPath}/board/searchEmploymentTable.do?search=${search.search}&txtKeyWord=${search.txtKeyWord}&section=${paging.section+1}&pageNum=1">&nbsp; ▶</a>
			           </c:when>
			           <c:otherwise>
			           <a class="no-uline" href="${contextPath }/board/employmentConTable.do?section=${paging.section+1}&pageNum=1">&nbsp; ▶</a>
			           </c:otherwise>
			          </c:choose>
	         		</c:if>
	      		</c:forEach>
        		</c:when>
        		<c:when test="${employmentTotal ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      			<c:forEach   var="page" begin="1" end="10" step="1" >
	        		  <a class="no-uline"  href="#">${page } </a>
	      		  </c:forEach>
        		</c:when>
        		
        		<c:when test="${employmentTotal< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	     			 <c:forEach   var="page" begin="1" end="${employmentTotal/10 +1}" step="1" >
	         		<c:choose>
	           		<c:when test="${page==paging.pageNum }">
	           		  <c:if test="${empty search.search}">
	           		  <strong><a class="no-uline" href="${contextPath }/board/employmentConTable.do?section=${paging.section}&pageNum=${page}">${page }</a></strong>
	            		</c:if>
	            	   <c:if test="${search.search != null}">
	            		<a class="sel-page"  href="${contextPath}/board/searchEmploymentTable.do?search=${search.search}&txtKeyWord=${search.txtKeyWord}&section=${paging.section}&pageNum=${page}">${page } </a>
	            		</c:if>
	          		</c:when>
	          		<c:otherwise>
	          		<c:if test="${empty search.search}">
	          			<a class="no-uline" href="${contextPath }/board/employmentConTable.do?section=${paging.section}&pageNum=${page}">${page }</a>
	            		</c:if>
	            		<c:if test="${search.search != null}">
	            		<a class="sel-page"  href="${contextPath}/board/searchEmploymentTable.do?search=${search.search}&txtKeyWord=${search.txtKeyWord}&section=${paging.section}&pageNum=${page}">${page } </a>
	            		</c:if>
	          		</c:otherwise>
	        		</c:choose>
	      		</c:forEach>
        		</c:when>
      		</c:choose>
    		</c:if>
        		
        		
        		
                </div>
            </li>
            <c:if test="${not empty pageContext.request.userPrincipal}">
            <li>
               <strong><a href="${contextPath}/board/employmentAddTableView.do">글쓰기</a></strong>
            </li>
			</c:if>
            <!-- 검색 폼 영역 -->
            <li id='liSearchOption'>
                <div>
                	<form id="search" action="${contextPath}/board/searchEmploymentTable.do" method="get">
                    <select id='selSearchOption' name='search'>
                        <option value='TC' >제목+내용</option>
                        <option value='T' >제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input type="text" id='txtKeyWord' name="txtKeyWord"/>
                    <input class="btn-secondary" type="submit" value="검색"/>
                    </form>
                </div>
                </li>

        </ul>
        </li>
        </ul>
        
    </div>
</Table>
</body>
</html>