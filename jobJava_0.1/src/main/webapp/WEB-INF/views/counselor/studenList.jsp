<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gugi&display=swap');
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
        $(function() {
            $('.sub').hide();
            $('.title').click(function() {
                $('.sub').hide(500);
                $('.title').removeClass('on');
                $('.title').css({
                    color: '#000'
                })
                $(this).next().show(500);
                $(this).addClass('on');
                



            }); //title click끝 

            $('.sub li').hover(function() {
                $(this).find('a').css({
                    fontWeight: 'bold'
                });


            }, function() {
                $(this).find('a').css({
                    fontWeight: 'normal'
                });


            }); //sub li hover 끝
            


        }); //첫 function 끝

    </script>
     <style>
    	#stulist{
    		width: 1000px;
    		margin: auto;
    		position: absolute;
   			top: 180px;
    	}
    	
    	table{
    		width: 100%;
    		border-collapse: collapse;
    		line-height: 24px;
    	}
    	table td,th {
    border-top:1px solid black;
    border-bottom:1px solid black;
    border-collapse: collapse;
    text-align: center;
    padding: 10px;
}
th {
	background: rgb(221, 221, 221);
}
a{
    text-decoration: none;
    color: black;
}
a:hover{
    text-decoration: underline;
}

    </style>
</head>
<body>

	<div id = "stulist">
	
	
		<a href="${contextPath}/counselor/studenList.do">대학생 목록</a>
		<a href="${contextPath}/counselor/companyregList.do">기업 목록</a>
		
		<form role = "form" method = "post" action="${contextPath}/counselor/studenregForm.do">
		<table>
	<thead>
			<tr>
				<th>학생번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>대학교</th>
				<th>학과</th>
			</tr>
	</thead>
	<tbody>
	
	<c:forEach var="studenlist" items = "${studenlist }">
			<tr>
			<td>${studenlist.ST_NO}</td>
			<td>${studenlist.ID}</td>
			<td>${studenlist.NAME}</td>
			<td>${studenlist.U_NAME}</td>
			<td>${studenlist.DEPT}</td>
			</tr>
</c:forEach>
			</tbody>
		</table>
		<tr>
				<td colspan = "5" style = "border:white:text-align:right;">
				<a href = "${contextPath}/counselor/studenregForm.do">학생 등록</a></td>
			</tr>
			
	</form>
	</div>

</body>
</html>