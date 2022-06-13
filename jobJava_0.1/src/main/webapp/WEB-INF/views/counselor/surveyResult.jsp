<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
	<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style type="text/css">
#can {
	width: 500px;
	height: 500px;
}

.myChart {
	margin: 30px 0px 50px 0px;
	padding: 20px;
	box-shadow: 0px 0px 7px 4px #0F4C75;
}

#content {
	margin: 30px 20%;
}

#title {
	text-align: center;
}
</style>
</head>
<body>
	<div id="content">
		<h2 style="margin-bottom: 50px;">설문조사결과</h2>
		<div id="can"></div>
	</div>


	<script>
	window.onload=function(){
		<c:forEach var="resList" items="${resultList}">
			newchart("${resList.Q_TXT}", ${resList.G_DISLIKE},${resList.DISLIKE},${resList.MIDDLE},
					${resList.M_LIKE},${resList.G_LIKE});
		</c:forEach>
	}
	
	function newchart(title, gdislike, dislike, middle, mlike, glike){
		let obj = document.getElementById("can");
		let newcanvas = document.createElement("canvas");
		let newh = document.createElement("h3");
		
		newcanvas.setAttribute("class", "myChart");
		newcanvas.setAttribute("width", "100%");
		newcanvas.setAttribute("height", "100%");
		
		newh.innerHTML=title;
		newh.setAttribute("id", "title");

		var myChart = new Chart(newcanvas, {
			type : 'bar',
			data : {
				labels : [ '매우불만족', '불만족', '보통', '만족', '매우만족'],
				datasets : [ {
					data : [ gdislike, dislike, middle, mlike, glike],
					backgroundColor :['	#F6B6CA', '#F7BFA8', '#CBE2B4', '#9BD5BD','	#1FBCD3'],
/* 					borderColor : '#002742', */
					borderWidth : 2
				} ]
			},
			options : {
				legend: {
		        	display: false
		        },
				scales : {
					yAxes: [{
						ticks: {
							stepSize:1,
							beginAtZero : true
						},
		                gridLines: {
		                    lineWidth: 0
		                }
					}],
					
					xAxes: [{
		                gridLines: {
		                    lineWidth: 0
		                }
					}]
					
				}
			}
		});
		obj.appendChild(newh);
		obj.appendChild(newcanvas);
	}
	
	</script>
</body>
</html>