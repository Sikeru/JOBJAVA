<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet" type="text/css" media="screen">	

<!-- 
 <div id='wrap'> -->

        <div id='side'>
            <div id="logo">
                <a href="${contextPath}/counselor/main.do"><img src="${contextPath}/resources/image/mainlogo.png" /></a>
            </div>
            <ul id='navi'>
                <li class='group'>
                    <div class='title'>
                        뉴리더
                    </div>
                    <ul class="sub">
                        <li><a href="#" id="sub_01">대학 관리</a></li>
                        <li><a href="#" id="sub_02">학생, 기업 관리</a></li>
                        <li><a href="#" id="sub_03">출퇴근 및 일지 관리</a></li>
                        <li><a href="#" id="sub_04">급여관리</a></li>
                        <li><a href="#" id="sub_05">직무체험 관리</a></li>
                        <li><a href="#" id="sub_06">설문조사 관리</a></li>
                    </ul>
                </li>
                <li class='group'>
                    <div class='title'>
                        꿈터
                    </div>
                    <ul class="sub">
                        <li><a href="#" id="sub_11">프로그램관리</a></li>
                        <li><a href="#" id="sub_12">알림보내기</a></li>
                        <li><a href="#" id="sub_13">상담일지 </a></li>
                        <li><a href="#" id="sub_14">설문조사 관리</a></li>
                    </ul>
                </li>
                
                
                <li class='group'>
                    <div class='title'>
                        <a href = "${contextPath}/counselor/jobregForm.do"> 일자리 등록</a>
                    </div>
                </li>
                
                <li class='group'>
                    <div class='title'>
                        상담 관리
                    </div>
                    <ul class="sub">
                        <li><a href="#" id="sub_17">상담일지 등록</a></li>
                        <li><a href="#" id="sub_18">상담일지 결과</a></li>
                        <li><a href="#" id="sub_18">구직자 정보</a></li>
                    </ul>
                </li>
                
                <li class='group'>
                    <div class='title'>
                        일자리 매칭
                    </div>
                </li>
                
                 <li class='group'>
                    <div class='title'>
                        협약서 관리
                    </div>
                </li>
                
            </ul>
        </div>
        <!--</div>  -->

</html>
