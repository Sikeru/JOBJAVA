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
      
 	a{
         color: black;
         text-decoration: none;
			list-style: none;
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
   width: 50%;
}

#th-3 {
   width: 10%;
}

#th-4 {
   width: 20%;
}

table {
   text-align: center;
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
   margin-left: 745px;
   margin-top: 40px;
   margin-bottom: 100px;
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

</style>

</head>
<body>
<h2>파일게시판</h2>
   <div id="boardwrap">
      <div id="board" text>
         <table>
            <thead>
               <tr>
                  <th id=th-1>No</th>
                  <th id=th-2>제목</th>
                  <th id=th-3>작성자</th>
                  <th id=th-4>작성일</th>
               </tr>
            </thead>
            <tbody>
               <c:choose>
                  <c:when test="${not empty list }">
                     <c:forEach var="list" items="${list}">

                        <tr align="center">
                        <td>${list.BOARD_NO}</td>
                        <td><a href="${contextPath}/board/supportTableView.do?BOARD_NO=${list.BOARD_NO}">${list.TITLE}</a></td>
                        <td>${list.NAME}</td>
                        <td>${list.F_DATE }</td>
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
      
       <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
			<li style="margin-top:15px;"><a href="${contextPath}/board/supportAddTableView.do?">글쓰기</a></li>
		 </s:authorize>

      <!-- 검색 폼 영역 -->

      <div class="search">
         <select name='searchType' id="searchtitle">
            <option value='TC'
               <c:out value="${scri.searchType eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
            <option value='T'
               <c:out value="${scri.searchType eq 'T' ? 'selected' : ''}"/>>제목</option>
            <option value='C'
               <c:out value="${scri.searchType eq 'C' ? 'selected' : ''}"/>>내용</option>
         </select> <input type="text" name="keyword" id="keywordInput"
            value="${scri.keyword}" />
         <button id="searchBtn" type="button">search</button>
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
   </form>


</body>
</html>
