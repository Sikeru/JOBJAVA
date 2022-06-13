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


//취소
function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) { //확인
		window.location.href = '/JJ/counselor/studenList.do';
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
   		  		
 label {
   font-weight :800;
 }   	

   </style>
	<body>
	<div id = "stubox">
		<div class = "stu">
		
		<div class = "stureg"><h1>학생 수정창</h1></div>
			
		<form name = "frm" method = "post" role='form' action="${contextPath}/counselor/studenupdate.do"> 
			<input type = "hidden" name ="CM_NO" value = "${studenlist.CM_NO}" readonly/>
				
			
			
			<hr>

		<br>
			<div class = "ID" name = "ID" >
			<label>아이디</label><br>
			<input type = "text" name ="ID" value = "${studenlist.ID}" readonly/>
		</div> 			
		<div class = "NAME" name = "NAME" >
			<label>이름</label><br>
			<input type= "text" id="NAME" name="NAME" value="${studenlist.NAME }" size=10 readonly />
		</div> 
		
		<div class = "BIRTH" name = "BIRTH">
			<label>생년월일</label><br>
			<input type= "text" id="BIRTH" name="BIRTH" value="${studenlist.BIRTH }" size=30 readonly />
			</div> 
		
		<div class = "U_NAME" name = "U_NAME">
			<label>대학교</label><br>
			<input type= "text" id="U_NAME" name="U_NAME" value="${studenlist.u_NAME }" size=30  />
		</div>
		
		<div class = "DEPT" name = "DEPT">
			<label>학과</label><br>
			<input type= "text" id="DEPT" name="DEPT" value="${studenlist.DEPT }"size=30  />
		</div>
		
		<div class = "ADDR" name ="ADDR">
			<label>주소</label><br>
			<input type= "text" id="ADDR" name="ADDR" value="${studenlist.ADDR }"size=100 />
		</div>
		
		<div class = "HP" name ="HP">
			<label>전화번호</label><br>
			<input type= "text" id="HP" name="HP" value="${studenlist.HP }" size=30 />
		</div>
		
		
		<div class = "EMAIL" name ="EMAIL">
			<label>E-MAIL</label><br>
			<input type= "text" id="EMAIL" name="EMAIL" value="${studenlist.EMAIL }" size=50 />
		</div>
		
		
		
		<br>

	
	<button type="submit" >저장</button>
	
	 
	 </form>
	

	 <button type="submit" OnClick="cancel()">취소</button>
	
		</div>
	</div>

	
	</body>
	
</html>