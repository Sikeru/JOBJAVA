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
</head>
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
.stu{
   		position: absolute;
   		top: 180px;
   		
   	
   		}
   		
   		#stubox{
   		width: 500px;
   		height: 1000px;
   		position: absolute;
   		left: 600px;
 
   		}
.stuname {
	width: 100%;
}

.uname {
	width: 100%;
}
</style>
<body>
<div id = "stubox">
	<div class = "stu">

	
		<div class = "stureg"><h1>담당 학생 등록 페이지</h1></div>
		
		<form action="${contextPath}/counselor/addstu.do"  method = "post"> 
	
		<hr>
		
		<input type="hidden" name="ST_NO">
		<input type="hidden" name="ID"><br>
		
		
		<br>
		
		<div class = "stuname">
			<input id = "stuname" type = "text" name = "NAME" size="51" placeholder = "학생이름">
			<input id = "stuemain" type = "text" name = "BIRTH" size="51" placeholder = "생년월일">
			
		</div>
		<br>
		
		<br>
		
		<div class = "uname">
		
		<input id = "u_name" type = "text" name = "U_NAME" size = "51" placeholder = "대학교">
		<input id = "studept" type = "text" name = "DEPT" size="51"  placeholder = "학과">
			
		</div>
		
		<br>
		
		<input type = submit value = "등록하기">
		
		</form>
		
	</div>
</div>

</body>
</html>