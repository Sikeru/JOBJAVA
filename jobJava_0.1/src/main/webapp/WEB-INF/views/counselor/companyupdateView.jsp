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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<script type="text/javascript">
//취소
function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) { //확인
		window.location.href = '/JJ/counselor/companyList.do';
	} else { //취소
		return false;
	}
}  


           $(function() {
            $('.sub').hide();
            $('.title').click(function() {
                $('.sub').hide(500);
                $('.title').removeClass('on');
                $('.title').css({
                    color: '#fff'
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
         
           
      
           
</script>
        
<style>
   		.com{
   		position: absolute;
   		top: 180px;
   		
   	
   		}
   		
   		#combox{
   		width: 500px;
   		height: 1000px;
   		position: absolute;
   		left: 600px;
 
   		}
 label {
   font-weight :800;
 }   		

   </style>
	<body>
	<div id = "combox">
		<div class = "com">
		
		<div class = "comreg"><h1>기업 수정창</h1></div>
		
		<form name = "frm" method = "post" role='form' action="${contextPath}/counselor/companyupdate.do"> 
		<input type = "hidden" name = "CM_NO" value = "${companylist.CM_NO}" readonly/>
			
			
			<hr>

		<br>
		
		<div class = "AGENT" name = "AGENT" >
			<label>대표자</label><br>
			<input type= "text" id="AGENT" name="AGENT" value="${companylist.AGENT }" size=10 readonly />
		</div> 
		
	 	<div class = "C_NAME" name = "C_NAME" readonly>
	 	<label>회사명</label><br>
	 	<input type= "text" id="C_NAME" name="C_NAME" value="${companylist.c_NAME }" size=30 readonly />
		</div> 
		
		<div class = "B_TYPE" name = "B_TYPE">
			<label>업종</label><br>
			<input type= "text" id="B_TYPE" name="B_TYPE" value="${companylist.b_TYPE }" size=30 />
		</div>
		
		<div class = "C_DIV" name = "C_DIV">
			<label>기업구분</label><br>
			<input type= "text" id="C_DIV" name="C_DIV" value="${companylist.c_DIV }"size=30  />
		</div>
		
		<div class = "HOMEPAGE" name ="HOMEPAGE">
			<label>HOMEPAGE</label><br>
			<input type= "text" id="HOMEPAGE" name="HOMEPAGE" value="${companylist.HOMEPAGE }"size=100  />
		</div>
		
		<div class = "EMP_NUM" name ="EMP_NUM">
			<label>근로자수</label><br>
			<input type= "text" id="EMP_NUM" name="EMP_NUM" value="${companylist.EMP_NUM }" size=10 />
		</div>
		
		<br>



       <button type="submit" >저장</button>
		</form>
	
	
	<button type="submit" OnClick="cancel()">취소</button>
	   
	 
	
	 
	 

 
	 
	
	 
		</div>
	</div>

	
	</body>
	
</html>