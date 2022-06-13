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
    
    
        #Business-inform {
            width: 1600px;
            height: auto;
            margin: 0 auto;

        }
        #BInfo {
            width: 114px;
            height: 56px;
            background: rgb(0,93,197);
        }
        #BInfo p{
            color:white;
            text-align: center;
            padding-top: 15px;
        }
        #topText {
            margin-top: 60px;
            width: 100%;
            height: 80px;
            background: rgb(247,248,250);
        }
        #topText p {
            padding: 20px;
        }
        #mainText {
            width: 100%;
            height: auto;
            border: 1px solid rgb(204,206,207);
            margin-top: 30px;
            margin-bottom: 40px;
        }
        
        footer {
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
    }
    </style>
</head>
<body>
    <div id="Business-inform">
        <div id="BInfo">
            <p>사업안내</p>
        </div>
        <div id="topText">
        <p>
        대학 재학생들에게 연구소기업, 벤처기업, 중소기업 등 직무체험 기회를 확대하여 경력개발, 조기 취업 및 청년 실업 ZERO화 추진<br>
        * 캐나다 워털루 대학교 프로그램 도입(마이크로소프트사의 빌게이츠 인재채용방식)
        </p>
        </div>
        <br>
        <h3>( •̀ ω •́ )　사업개요</h3>
        <div id="mainText">
            <div class="mainArttcle">
                <img src="${contextPath}/resources/image/BInfo.png" style="width: 1600px;"/>
            </div>
                
        </div>
    </div>
</body>
</html>

</body>
</html>