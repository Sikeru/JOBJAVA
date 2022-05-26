<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
<body>
	 
            <div id="side">
          <li><a href="${contextPath}/cafe/jobposting.do">채용공고</a></li>
                <li><a href="${contextPath}/cafe/celender.do">채용일정</a></li>
                <li id="menu1">
                    <label class="program" for="program" style="cursor: pointer">프로그램</label>
                    <input id="program" type="checkbox">
                    <nav id="main_nav">
                        <ul>
                            <li><a href="${contextPath}/cafe/lecture.do">취업특강</a></li>
                            <li><a href="${contextPath}/cafe/consulting.do">취업컨설팅</a></li>
                        </ul>
                    </nav>
                </li>
                <li id="menu2">
                    <label class="mypage" for="mypage" style="cursor: pointer">마이페이지</label>
                    <input id="mypage" type="checkbox">
                    <nav id="main_nav1">
                        <ul>
                            <li><a href="${contextPath}/cafe/mypage.do">사업참여신청</a></li>
                            <li><a href="${contextPath}/cafe/jobapp.do">구직등록</a></li>
                        </ul>
                    </nav>
                </li>
                <li><a href="${contextPath}/cafe/addsurveryfrom.do">설문조사</a></li>


            </div>

        </body>
        </html>

