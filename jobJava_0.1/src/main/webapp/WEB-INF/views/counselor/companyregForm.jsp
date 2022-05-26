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

<link href="${contextPath}/resources/css/counselor.css" rel="stylesheet" type="text/css" media="screen">

<!DOCTYPE html>
<html>
<head>


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
.company{
   		position: absolute;
   		top: 180px;
   		
   	
   		}
   		
   		#companybox{
   		width: 500px;
   		height: 1000px;
   		position: absolute;
   		left: 600px;
 
   		}
.companyagent {
	width: 100%;
}

.companydivi {
	width: 100%;
}
.companynum {
	width: 100%;
}
.companypage {
	width: 100%;
}


</style>
<body>
<div id = "companybox">
	<div class = "company">

	
		<div class = "companyreg"><h1>기업 등록</h1></div>
		
		<form action="${contextPath}/counselor/addcompany.do"  method = "post"> 
	
		<hr>
		
		<input type="hidden" name="B_NO">
		<input type="hidden" name="ID"><br>
		
		
		<br>
		
		<div class = "companyagent">
			<input id = "companyagent" type = "text" name = "AGENT" size="51" placeholder = "대표자명">
			<input id = "companytype" type = "text" name = "b_TYPE" size="51"  placeholder = "업종">
		</div>
		<br>
		
		
		<div class = "companydivi">
			<input id = "companydivi" type = "text" name = "c_DIV" size="51"  placeholder = "기업구분">
		</div>
		
		<br>
		
		
		<div class = "companynum">
			<input id = "companynum" type = "text" name = "EMP_NUM" size="51" placeholder = "근로자수">
		</div>
		
		<br>
		
		<div class = "companypage">
		<input id = "companyname" type = "date" name = "c_NAME" size="50" placeholder = "기업명">
		 <input id = "companypage" type = "date" name = "HOMEPAGE" size="50" placeholder = "홈페이지">
		</div>
		
		<br>
		
		
		<br>
	

		<input type = submit value = "등록하기">
		
		</form>
		
	</div>
</div>

</body>
</html>