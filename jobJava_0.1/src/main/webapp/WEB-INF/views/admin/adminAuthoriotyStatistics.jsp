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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script>
    $(window).on("load",function loadingProcess(){
        openLoading();
        setTimeout(closeLoading, 1000);
    });

    //그래프

    
window.onload = function() {
	var ctx = document.getElementById('test1').getContext('2d');
	var chart = new Chart(ctx, {
		type: 'pie', 
		data: { labels: ['ROLE_STU', 'ROLE_USER', 'ROLE_EMP', 'ROLE_COM', 'ROLE_MAG'],
		datasets: [{ label: '권한별 사용자 수',
		backgroundColor: [ 'rgb(70, 163, 196)', 'rgb(158, 194, 228)', 'rgb(197, 107, 171)', 'rgb(246, 154, 193)',
			'rgb(78, 127, 185)'],
		
		data: [${authority[1]},${authority[2]} ,${authority[3]}, ${authority[0]}, ${authority[4]}] 
		}] },
		options: { title: { display: true, text: '권한별 사용자 수',
		fontSize: 30, fontColor: 'rgba(46, 49, 49, 1)' },
		legend: { labels: { fontColor: 'rgba(0, 0, 0, 1)',
		fontSize: 15 } },
		 }
		});

};
    
    
    
    
    
    
    
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
   width: 45%;
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
           <div class="chart-container" style="position: relative; height:40vh; width:80vw; top:50px;"> <canvas id="test1"></canvas>
    		</div>
    
	</div>
</div>
    <img src="${contextPath}/resources/image/adminMain.jpg">
</body>
</html>