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

<link href="${contextPath}/resources/css/cafe.css" rel="stylesheet" type="text/css" media="screen">
 <c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>프로그램 신청서 상세뷰</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>


<script type="text/javascript">
//승인 저장
function updateMember(cnt, EMP_PAR_NO){
   let f = document.createElement('form');
   let process = document.getElementById("APP"+cnt).value;
    let obj;
    let obj1;
    
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'APP');
    obj.setAttribute('value', APP);
    
    obj1 = document.createElement('input');
    obj1.setAttribute('type', 'hidden');
    obj1.setAttribute('name', 'PROGRAM_NO');
    obj1.setAttribute('value', PROGRAM_NO);
    
    f.appendChild(obj);
    f.appendChild(obj1);
    f.setAttribute('method', 'post');
    f.setAttribute('action', ' ${contextPath}/cafe/companymypagelist.do');
    document.body.appendChild(f);
    f.submit();
     
    }
 

</script>
        
<style>
/*    		.pro{
   		position: absolute;
   		top: 180px;
   		
   	
   		}
   		
   		#probox{
   		width: 500px;
   		height: 1000px;
   		position: absolute;
   		left: 600px;
 
   		} */
    
 
    #QUESTIONS1{
        border: none;
        border-bottom: 1px solid black;
        border-top: 1px solid black;
        width: 500px;
        height: 300px;
    }	

   </style>
	<body>
	<div id = "probox">
		<div class = "pro">
		
		<div class = "proreg"><h1>프로그램 신청서 승인창</h1></div>
		
		<form id = "frm" method = "post" >
		<input type = "hidden" name = PROGRAM_NO value = "${companymypageview.PROGRAM_NO}" />
	
			<hr>

		<br>
		 <c:forEach var="companymypageview" items="${companymypageview}" varStatus="status"> 
		
		
		<div class = "TITLE" name = "TITLE">
			<label>프로그램명</label>
			${companymypageview.TITLE }
		</div>
		
		
		
		<div class = "EMP_PAR_NO" name = "EMP_PAR_NO">
			<label>신청 번호</label>
			${companymypageview.EMP_PAR_NO}
		</div>
		
		
		<div class = "DIVISION" name = "DIVISION">
			<label>목록</label>
			${companymypageview.DIVISION}
		</div>
		
		<div class = "ID" name = "ID">
			<label>신청자</label>
			${companymypageview.ID}
		</div>
		
		<br>
		
		
		<div class = "QUESTION" name = "QUESTION">
			<label>신청서 내용</label><input type= text id="QUESTIONS1"
									name="QUESTION" readonly
										value="${companymypageview.QUESTION}" />
			</div>
			
			<br>
		 <!--  승인 -->
                     <div><select id="APP${status.count}" name="APP">
                                <option hidden="${companymypageview.APP}" selected>${companymypageview.APP}</option>
                                <option value="접수확인중">접수확인중</option>
                                <option value="승인">승인</option>
                           </select>
                  
			   <input type="button" id = "subbtn" value="접수수정"  onclick="updateMember(${status.count}, ${companymypageview.PROGRAM_NO})"/>
			   
			    
                  </div>
                 </c:forEach>        
		</form>
	 
		</div>
	</div>

	
	</body>
	
</html>