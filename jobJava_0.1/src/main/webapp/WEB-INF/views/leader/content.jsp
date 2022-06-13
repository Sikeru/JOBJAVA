<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
        
    /* header style End */


#article_wrap {
	width: 100%;
	height: 700px;
}

#contents {
	width: 100%;
	height: 100%;
	background: url('${contextPath}/resources/image/main_backgroud.png')
		no-repeat center;
	background-size: cover;
}

#flex_container {
	width: 50%;
	height: 100%;
	float: right;
	/* background: yellow; */
	
	
}
.flex_item{
width:100%;
height: 100%;
}

.copy-img{
width: 500px;
margin-left: 200px;
margin-top: 130px;
}

/* 
.content_section h1 {
	width: 100%;
	margin: 0;
	text-align: center; line-height : 100px;
	margin-right: 40px;
	line-height: 100px;
} */



</style>

<body>
	<div id="article_wrap">
		<div id="contents">
			<div id="flex_container">
				<div class="flex_item">
				<img src="	https://www.jobdaejeon.or.kr/images/mps/new/copy-center.svg" alt="풍성한 일자리로 살찌는 새로운 대전" class="copy-img">
			</div>
		</div>
	</div>
	</div>
</body>


