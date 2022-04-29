<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<script src="${contextPath}/resources/jquery/jquery-dropbutton.js"
   type="text/javascript"></script>
<link href="${contextPath}/resources/css/leader.css" rel="stylesheet" type="text/css" media="screen">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title><tiles:insertAttribute name="title" /></title>


	
</head>
<body style="overflow-x:hidden">
		<div id="wrap">
		<div id="top">
			<header>
				   <tiles:insertAttribute name="header" />
			</header>
		</div>
			<div id="container">
			<aside>
				<tiles:insertAttribute name="side" />
			</aside>
			<article>
			 	<tiles:insertAttribute name="body" />
			</article>
			</div>
			<footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
        	</div>
</body>      
        
        