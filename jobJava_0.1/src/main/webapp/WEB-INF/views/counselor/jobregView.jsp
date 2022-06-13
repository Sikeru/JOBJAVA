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
         .job{
          position: absolute;
   top: 100px;
    left: -50px;
    border: 5px solid #0F4C75;
    padding: 40px;
    border-radius: 10px;
    width: 1100px;
      
         }
         
         #jobbox{
         width: 500px;
         height: 1000px;
         position: absolute;
         left: 600px;
         }
         
      
         
         label{
             display: inline-block;
             background: #0F4C75;
          color: white;
          padding: 5px;
          border-radius: 5px;
          width: 100;
          text-align: center;
          margin-bottom: 10px;
          margin-right: 3px;
         }
         
         #JOB_D{
         height : 100px;
         }
         
         #jobregh2{
         text-align: center;
       
         }
         
         .jobreg{
         border-bottom: 4px solid #0F4C75;
         padding-bottom: 8px;
    margin-bottom: 4px
   
         }
         
         #buttonset2{
         margin-left : 400px;
         }
         
          #update:hover {
         color: white;
         background: #E16106;
 
}
   #delete:hover {
   color: white;
   background: #E16106;
}

      #update{
      background-color:  #0F4C75;
      border:none;
      color: white;
      margin-right: 20px;
      }
      
      #delete{
      background-color:  #0F4C75;
      border:none;
      color: white;
      }
         
    #frm{
    padding-left: 50px;
    }

   </style>
   <body>
   <div id = "jobbox">
      <div class = "job">
      
      <div class = "jobreg"><h1 id = "jobregh2">기업 상세창</h1></div>
      
      <form id = "frm" method = "post">
         <input type = "hidden" name = "JOB_NO" value = "${job.JOB_NO }" readonly/>
   

      <br>
   
      <div class = "comtitle" name = "TITLE">
         <label>제목</label>
         <input type = "text" id = "TITLE" name = "TITLE" value = "${job.TITLE }" size = 50/>
   
         <label>기업 이름</label>
         <input type = "text" id = "TITLE" name = "TITLE" value = ${job.COMPANY } " size = 50 disabled/>
      </div> 
      
      <div class = "B_TYPE" name = "B_TYPE">
         <label>업종</label>
         <input type = "text" id = "B_TYPE" name = "B_TYPE" value = "${job.b_TYPE}" size = 50/>

         <label>경력</label>
         <input type = "text" id = "CAREER" name = "CAREER" value = "${job.CAREER }" size = 50/>
      </div>
      
      <div class = "EDU" name = "EDU">
         <label>학력</label>
         <input type = "text" id = "EDU" name = "EDU" value = "${job.EDU }" size = 50/>

         <label>임금</label>
         <input type = "text" id = "SAL" name = "SAL" value = "${job.SAL } " size = 50/>
      </div>
      
      <div class = "EMP_TYPE" name = "EMP_TYPE">
         <label>고용형태</label>
         <input type = "text" id = "EMP_TYPE" name = "EMP_TYPE" value = "${job.EMP_TYPE }" size = 50/>

         <label>근무형태</label>
         <input type = "text" id = "WORK_TYPE" name = "WORK_TYPE" value = "${job.WORK_TYPE }" size = 50/>
      </div>
      
      <div class = "AREA" name = "AREA">
         <label>지역</label>
         <input type = "text" id = "AREA" name = "AREA" value = "${job.AREA }" size = 50/>

         <label>복리후생</label>
         <input type = "text" id = "WELFARE" name = "WELFARE" value = "${job.WELFARE }" size = 50/>
      </div>
      
      <div class = "SCALE" name = "SCALE">
         <label>기업규모</label>
         <input type = "text" id = "SCALE" name = "SCALE" value = "${job.SCALE }" size = 50/>

         <label>설립년도</label>
         <input type = "text" id = "ESTABLISH" name = "ESTABLISH" value = "${job.ESTABLISH }" size = 50/>
      </div>
      
      <div class = "Y_SALES" name = "Y_SALES">
         <label>연매출액</label>
         <input type = "text" id = "Y_SALES" name = "Y_SALES" value = "${job.y_SALES }" size = 50/>

         <label>홈페이지</label>
         <input type = "text" id = "HP" name = "HP" value = "${job.HP }" size = 50/>
      </div>
      
      <div class = "EMP_NUM" name = "EMP_NUM">
         <label>근로자수</label>
         <input type = "text" id = "EMP_NUM" name = "EMP_NUM" value = "${job.EMP_NUM }" size = 50/>
         
         <label name = "S_DATE">사업기간</label> 
         <input type = "date" id = "s_date" name = "S_DATE" value = "${job.s_DATE }"/> -
         <input type = "date" id = "e_date" name = "D_DATE" value = "${job.d_DATE }"/>
      </div>
      
      <label>업무내용</label>
      <div class = "JOB_D" name = "JOB_D">
         <textarea name="JOB_D" cols="119" rows="6"><c:out value="${job.JOB_D}" /></textarea>
      </div>
      
      
      
      
      
      <br>

      </form>
      
      
   <div id = "buttonset2">
   <input type = "button" id = "update" value = "수정하기">
   <input type = "button" id = "delete" value = "삭제하기">
    </div>
    <script type="text/javascript">
    
    $("#jobupdate").on("click", function(){
         var frm = $("#frm")[0];
         frm.action = "jobupdate.do";
         frm.submit();
     });

     $("#jobdelete").on("click", function(){
         var frm = $("#frm")[0];
         frm.action = "jobdelete.do";
         frm.submit();
     });
    
    </script>
    
      </div>
   </div>

   
   </body>
   
</html>