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
  <title>일자리 등록 페이지</title>
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
 
        table{
            border:3px solid gray
        }
        
        td{
            border:1px solid gray
        }
        
        #regtitle{
            background-color:gray
        }
    </style>

<body>
	<div id = "reg">
		<br><br>
		<b><font size = "6" color = "gray">일자리 등록</font></b>
		<br><br><br>
		
		<form action="${contextPath}/counselor/addJob.do" method = "post">
			<table>
				<tr>
					<td id = "regtitle">경력</td>
					<td>
					<input type = "text" name = "CAREER">
					</td>
				</tr>
			
				<tr>
					<td id = "regtitle">학력</td>
					<td>
					<input type = "text" name = "EDU">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">지역</td>
					<td>
					<input type = "text" name = "AREA">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">임금</td>
					<td>
					<input type = "text" name = "SAL">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">고용형태</td>
					<td>
					<input type = "text" name = "EMP_TYPE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">근무형태</td>
					<td>
					<input type = "text" name = "WORK_TYPE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">복리후생</td>
					<td>
					<input type = "text" name = "WELFARE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">기업명</td>
					<td>
					<input type = "text" name = "COMPANY">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">업종</td>
					<td>
					<input type = "text" name = "B_TYPE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">기업규모</td>
					<td>
					<input type = "text" name = "SCALE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">설립년도</td>
					<td>
					<input type = "date" name = "ESTABLISH">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">연매출액</td>
					<td>
					<input type = "text" name = "Y_SALES">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">홈페이지</td>
					<td>
					<input type = "text" name = "HP">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">근로자수</td>
					<td>
					<input type = "text" name = "EMP_NUM">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">시작일</td>
					<td>
					<input type = "date" name = "S_DATE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">종료일</td>
					<td>
					<input type = "date" name = "D_DATE">
					</td>
				</tr>
				
				<tr>
					<td id = "regtitle">상세설명</td>
					<td>
					<input type = "text" name = "JOB_D">
					</td>
				</tr>
				
			</table>
			<br>
			
			<input type = "submit" value = "등록하기">
			<input type = "reset" value = "다시입력">
		</form>
		
	</div>

</body>
</html>
