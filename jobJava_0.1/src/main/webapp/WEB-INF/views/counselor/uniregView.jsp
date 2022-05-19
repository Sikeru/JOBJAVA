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
<head>



<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function fn_modify_unireg_state(UNI_B_NO){
	var uni_reg_state = document.getElementById("uni_reg_state");
	
	var value
	if (uni_reg_state == 'uniregallow'){
		value = '승인'
	}
	else if(uni_reg_state == 'uniregcancle'){
		value = '거부'
	}
	else{
		
	}	
	
/* 	var index = uni_reg_state.selectIndex;
	var value = uni_reg_state[index].value();
	console.log("value: " +value); */
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/counselor/modifyuniregState.do",
		data : {
			UNI_B_NO: UNI_B_NO, 
			PERMISSION : value ,
			},
		success : function(data) {
			if(data.trim()=='mod_success'){
				alert("접수상태가 수정되었습니다.");
				location.href = "${contextPath}/counselor/uniregList.do?UNI_B_NO="+UNI_B_NO;
				} else if(data.trim()=='failde'){
					alert("다시 시도해 주세요.");
				}
			
			},
			error : function(data){
				alert("에러가 발생했습니다." + data);
			},
			
			complete : function(data){
				//alert("작업을 완료했습니다.");
	}
	});
} 

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
</script>
        
<style>
   		.uni{
   		position: absolute;
   		top: 180px;
   		
   	
   		}
   		
   		#unibox{
   		width: 500px;
   		height: 1000px;
   		position: absolute;
   		left: 600px;
 
   		}
   		

   </style>
    
<body>
<div id = "unibox">
	<div class = "uni">

	
		<div class = "unireg"><h1>대학교 사업계획서 등록</h1></div>
		
		<form method = "post"> 
	
		<hr>
	
		<input type="hidden" name="ID"><br>
		
		
		<br>
		
		<div class = "uninum">
			<label>사업번호</label>
			${uniread.UNI_B_NO }
		</div>
		
		<div class = "uniname">
			<label>대학교 이름</label>
			${uniread.u_NAME }
		</div>
		<br>
		
		
		<div class = "uniaddr">
			<label>대학교 주소</label>
			${uniread.UNI_HP }
		</div>
		
		<br>
		
		
		<div class = "unibname">
			<label>사업명</label>
			${uniread.b_NAME }
			<label>사업비</label>
			${uniread.b_EXPENSE }
		</div>
		
		<br>
		
		<div class = "unidate">
			<label>시작날짜</label> ${uniread.s_DATE } - <label>종료날짜</label> ${uniread.e_DATE }
		</div>
		
		<br>
		
		<div class = "unicontent">
			<label>사업내용</label>
			${uniread.b_CONTENT }
		</div>
		
		<br>
			<p>배송상태</p>
			<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
				
	
					
					<form action="${contextPath}/counselor/regcheck.do"  method = "post">
					
				<select name="uni_reg_state"  id="uni_reg_state">

				     <option  value="unireg_prepared" selected>접수진행중</option>
				     <option  value="uniregallow">수락</option>
				     <option  value="uniregcancle">거절</option>

				 </select> 
				
			
				  <input  type="hidden" name="UNI_B_NO" value="${uniread.UNI_B_NO }" />
				
				
				<td width=10%>
			     <input  type="button" value="접수수정" name="PERMISSION" onClick="fn_modify_unireg_state(${uniread.UNI_B_NO})"/>
			    </td>
			    </form>
				</tr>
			</tbody>
		</table>
	</div>
		
	
		</form>
	</div>
</div>
</body>
</html>
