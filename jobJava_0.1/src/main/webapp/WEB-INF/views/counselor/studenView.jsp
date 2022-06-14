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
<%@ page session="true"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html> 
<head>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>

<script type="text/javascript">

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
   
  });

$(document).ready(function() {
	var formObj = $("form[name='frm']");
 	   
         //수정
	    $(".update").on("click", function(){
		     formObj.attr("action", "/JJ/counselor/studenupdateView.do?CM_NO=${studenlist.CM_NO}");
			 formObj.attr("method", "get");
			 formObj.submit();
		}) 

		// 삭제
		$(".delete").on("click", function() {
			formObj.attr("action", "/JJ/counselor/studendelete.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	 
		
})
		
   
          
         
</script>
        
<style>
   		.stu{
   		
   		position: absolute;
    top: 180px;
    border: 5px solid #0F4C75;
    padding: 40px;
    border-radius: 10px;
    width: 600px;

   		
   	
   		}
   		
   		#stubox{
   		width: 500px;
   		height: 1000px;
   		position: absolute;
   		left: 600px;
 
   		}
   		  		
	label {
    display: inline-block;
    background: #0F4C75;
    color: white;
    padding: 5px;
    border-radius: 5px;
    width: 80;
    text-align: center;
}

	#sturegh{
text-align: center;
   	}
   	
   	.stureg{
   	border-bottom: 4px solid #0F4C75;
   	}
   	
   	 .update:hover {
   color: white;
   background: #E16106;
}
	.delete:hover {
   color: white;
   background: #E16106;
}

   	.update{
   	background-color:  #0F4C75;
   	border:none;
   	color: white;
   	padding: 5;
    border-radius: 3px;
   	}
   	
   	.delete{
   	background-color:  #0F4C75;
   	border:none;
   	color: white;
   	padding: 5;
    border-radius: 3px;
   	}
   	
   	#buttonset{
   		margin-left : 180px;
   		}

   </style>
	<body>
	<div id = "stubox">
		<div class = "stu">
		
		<div class = "stureg"><h1 id = "sturegh">학생 상세창</h1></div>
		
		<form name = "frm" method = "post" role='form' >
			<input type = "hidden" name = "CM_NO" value = "${studenlist.CM_NO}" readonly/>
			


		<br>
		
		
		<div class = "ID" name = "ID" >
			<label>아이디</label> &nbsp;
			${studenlist.ID}
		</div> 		
		<br>
		<div class = "NAME" name = "NAME">
			<label>이름</label> &nbsp;
			${studenlist.NAME }
		</div> 
		<br>
		<div class = "BIRTH" name = "BIRTH">
			<label>생년월일</label> &nbsp;
			${studenlist.BIRTH }
		</div> 
		
		<br>
		<div class = "U_NAME" name = "U_NAME">
			<label>대학교</label> &nbsp;
			${studenlist.u_NAME }
		</div>
		<br>
		<div class = "DEPT" name = "DEPT">
			<label>학과</label> &nbsp;
			${studenlist.DEPT }
		</div>
		<br>
		<div class = "ADDR" name ="ADDR">
			<label>주소</label>  &nbsp;
			${studenlist.ADDR }
		</div>
		<br>
		<div class = "HP" name ="HP">
			<label>전화번호</label> &nbsp;
			${studenlist.HP } 
		</div>
		<br>
		
		<div class = "EMAIL" name ="EMAIL">
			<label>E-MAIL</label> &nbsp;
			${studenlist.EMAIL } 
		</div>
		
		<br>
		
		

		<div id = "buttonset">
	<button type="submit" class="update">수정하기</button>
	&nbsp;&nbsp;&nbsp;
	<button type="submit" class="delete">삭제하기</button>
	</div>
	
	 </form>
	 
	
		</div>
	</div>

	
	</body>
	
</html>
