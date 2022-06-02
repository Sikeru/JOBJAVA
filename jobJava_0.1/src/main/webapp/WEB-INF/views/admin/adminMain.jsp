<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    $(window).on("load",function loadingProcess(){
        openLoading();
        setTimeout(closeLoading, 1000);
    });

// 로딩창 키는 함수
function openLoading() {
    let maskHeight = $(document).height();
    let maskWidth = window.document.body.clientWidth;
    //출력할 마스크를 설정해준다.
    let mask ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none;left:0; top:0;'></div>";
    // 로딩 이미지 주소 및 옵션
       
    //레이어 추가
    $('body').append(mask);
    
    $('#mask').css({
        'width' : maskWidth,
        'height': maskHeight,
    });

    //마스크 표시
    $('#mask').show().animate({
            width: '0px',
            opacity :'0.4'
           }, 1000);;  

    }
    // 로딩창 끄는 함수
    function closeLoading() {
        $('#mask').hide();
        $('#mask').empty(); 
    }
    
    function updateMember(ID, EMAIL, i){
		$.ajax({
			type: "POST",
			url: "${contextPath}/admin/updateMember.do",
			data: {ID: ID,
				EMAIL: EMAIL,
				AUTHORITY :$('#AUTHORITY'+i).val(),
				ENABLED:$('#ENABLED'+i).val() },
			success: function(Success) {
				if(Success == 'true') {
					alert('뀨!ㅎㅅㅎ');
				}
				else{
					alert('뀨뀨뀨뀨뀨뀨');
				}
				console.log(mac)
			}
		})
    }
   

</script>
<style>
    *{
        margin: 0;
        padding: 0;
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
    #adminwrap{
        position:absolute;
        width: 100%;
        height: 969px;   
    }
    
    #adminwrap img{
        position:absolute;
        width: 100%;
        height: 100%;
        z-index: 0;
    }
    #adminside{
        width: 300px;
        height: 100%;
        background-color: rgba( 0,0,0, 0.3 );
        float: left;
        z-index: 9999;
        
    }
    #adminside ul{
        position: absolute;
        text-align: center;
        width: 300p;
        top: 30%;
        left: 50px;
        list-style: none;
        font-size: 23px;
        
    }
    #adminside li{
        margin-bottom: 40px;
        
            
    }
    
    #adminside a{
        color: white;
        text-decoration: none;
        
    }
    #amdinmain {
        position: absolute;
        width: 100%;
        height: 100%;
        left: 300px;
        z-index: 9000;
        float: left;
    }
    
    #mainWrapper{
        width: 1000px;
        top: 200px;
        left: 200px;
        position: absolute;

    }

 #mainWrapper>ul>li:first-child {
   text-align: center;
   font-size: 30pt;
   height: 50px;
   vertical-align: middle;
   line-height: 40px;
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
   font-size: 18pt;
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
.m_select{
	background-color:transparent;
	border : 0px solid transparent;
}

#subbtn{
	background-color:transparent;
	border : 0px solid transparent;
}
   
</style> 
</head>
<body>
<div id="adminwrap">
    <div id="adminside">
        <ul>
            <li><a href="${contextPath}/admin/main.do">사용자 권한변경</a></li>
            <li><a href="${contextPath}/admin/loginStatistics.do">사용자 로그 통계</a></li>
            <li><a href="${contextPath}/admin/menuStatistics.do">메뉴별 접속 통계</a></li>
            <li><a href="${contextPath}/admin/authorityStatistics.do">회원 권한 별 사용자 수</a></li>
        </ul>
    </div>
    <div id="amdinmain">
           <div id="mainWrapper">
	
      <ul>
      	 
         <!-- 게시판 제목 -->
         <li><h2>사용자 조회</h2></li>
	
         <!-- 게시판 목록  -->
         <li>
            <ul id="ulTable">
               <li>
                  <ul>
                     <li>아이디</li>
                     <li>이메일</li>
                     <li>권한</li>
                     <li>회원여부</li>
                     <li>수정</li>
                  </ul>
               </li>
               <!-- 게시물이 출력될 영역 -->
               
               
               <c:forEach var="member" items="${member}" varStatus="i">
                  <li>
                     <ul>
                        <li>${member.ID}</li>
                        <li>${member.EMAIL}</li>
                        <li><select class="m_select" id="AUTHORITY${i.count}" name="AUTHORITY" >
   							<option hidden="${member.AUTHORITY }" selected>${member.AUTHORITY }</option>
   							<option value="ROLE_MAG">ROLE_MAG</option>
   							<option value="ROLE_EMP">ROLE_EMP</option>
   							<option value="ROLE_STU">ROLE_STU</option>
   							<option value="ROLE_CMP">ROLE_CMP</option>
  							</select></li>
  						<li><select class="m_select" id="ENABLED${i.count}" name="ENABLED">
   							<option hidden="${member.ENABLED}" selected>${member.ENABLED}</option>
   							<option value="true">true</option>
   							<option value="false">false</option>
  							</select></li>
  						
  						<li><input id="subbtn" type="button" value="수정" onclick="updateMember('${member.ID}','${member.EMAIL}', ${i.count})"/></li>
                     </ul>
                  </li>
                  
                 
               </c:forEach>
        			
            </ul>

         </li>
		

         <!-- 게시판 페이징 영역 -->

         <li>
            <div id="divPaging">
               <ul class="paging">
                  <c:if test="${paging.prev}">
                     <span><a
                        href='<c:url value="main.do?page=${paging.startPage-1}"/>'>이전</a></span>
                  </c:if>
                  <c:forEach begin="${paging.startPage}" end="${paging.endPage}"
                     var="num">
                     <span><a
                        href='<c:url value="main.do?page=${num}"/>'>${num}</a></span>
                  </c:forEach>
                  <c:if test="${paging.next && paging.endPage>0}">
                     <span><a
                        href='<c:url value="main.do?page=${paging.endPage+1}"/>'>다음</a></span>
                  </c:if>
               </ul>
            </div>
         </li>
         
         <li id='liSearchOption'>

            <div class = "search">
               <select name='searchType' id="search">
                  <option value='ID' <c:out value="${scri.searchType eq 'ID' ? 'selected' : ''}"/>>아이디</option>
                  <option value='EM' <c:out value="${scri.searchType eq 'EM' ? 'selected' : ''}"/>>이메일</option>
                  <option value='A' <c:out value="${scri.searchType eq 'A' ? 'selected' : ''}"/>>권한</option>
                  <option value='E' <c:out value="${scri.searchType eq 'E' ? 'selected' : ''}"/>>회원여부</option>
               </select> 
                <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
                <button id="searchBtn" type="button">검색</button>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
    $(function(){
        $('#searchBtn').click(function() {
          self.location = "main.do" + '${paging.makeQuery(1)}' + "&searchType=" + $("#search").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
    </div>
    
</div>
    <img src="${contextPath}/resources/image/adminMain.jpg">
</body>
</html>