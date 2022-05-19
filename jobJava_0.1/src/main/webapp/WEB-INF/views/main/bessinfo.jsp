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