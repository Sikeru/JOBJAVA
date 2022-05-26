<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

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
         <br><li>파일 게시판</li><br>

         <!-- 게시판 목록  -->
         <li>
            <ul id="ulTable">
               <li>
                  <ul>
                     <li>No</li>
                     <li>제목</li>
                     <li>내용</li>
                     <li>작성자</li>
                     <li>작성일</li>

                  </ul>
               </li>
               <!-- 게시물이 출력될 영역 -->
               <c:forEach var="list" items="${list}">
                  <li>
                     <ul>
                        <li>${list.BOARD_NO}</li>
                        <li><a href="${contextPath}/board/supportTableView.do?BOARD_NO=${list.BOARD_NO}">${list.TITLE}</a></li>
                        <li>${list.CONTENT }</li>
                        <li>${list.NAME}</li>
                        <li>${list.F_DATE }</li>
                     </ul>
                  </li>
               </c:forEach>
               <li></li>
            </ul>

         </li>

         <!-- 게시판 페이징 영역 -->

         <li>
            <div id="divPaging">
               <ul class="paging">
                  <c:if test="${paging.prev}">
                     <span><a
                        href='<c:url value="supportTable.do?page=${paging.startPage-1}"/>'>이전</a></span>
                  </c:if>
                  <c:forEach begin="${paging.startPage}" end="${paging.endPage}"
                     var="num">
                     <span><a
                        href='<c:url value="supportTable.do?page=${num}"/>'>${num}</a></span>
                  </c:forEach>
                  <c:if test="${paging.next && paging.endPage>0}">
                     <span><a
                        href='<c:url value="supportTable.do?page=${paging.endPage+1}"/>'>다음</a></span>
                  </c:if>
               </ul>
            </div>
         </li>
         <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
			<li><a href="${contextPath}/board/supportAddTableView.do?">글쓰기</a></li>
		 </s:authorize>
         <!-- 검색 폼 영역 -->
         <li id='liSearchOption'>
         
            <div class = "search">
               <select name='searchType'>
                  <option value='TC' <c:out value="${scri.searchType eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
                  <option value='T' <c:out value="${scri.searchType eq 'T' ? 'selected' : ''}"/>>제목</option>
                  <option value='C' <c:out value="${scri.searchType eq 'C' ? 'selected' : ''}"/>>내용</option>
               </select> 
                <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
                <button id="searchBtn" type="button">검색</button>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
    $(function(){
        $('#searchBtn').click(function() {
          self.location = "supportTable.do" + '${paging.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
            </div>
         </li>

      </ul>
   </div>
   </form>
</body>
</html>
