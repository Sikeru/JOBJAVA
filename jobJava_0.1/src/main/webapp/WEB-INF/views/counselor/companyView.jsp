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
          
           $(document).ready(function() {
              var formObj = $("form[name='frm']");
                  
                    //수정
                  $('.companyupdate').on("click", function(){
                      formObj.attr("action", "/JJ/counselor/companyupdateView.do?CM_NO=${companylist.CM_NO}");
                     formObj.attr("method", "get");
                     formObj.submit();
                 }) 

                 // 삭제
                 $('.companydelete').on("click", function() {
                    formObj.attr("action", "/JJ/counselor/companydelete.do");
                    formObj.attr("method", "post");
                    formObj.submit();
                 })
               
                 
           })
          
</script>
        
<style>
         .com{
         position: absolute;
    top: 180px;
    border: 5px solid #0F4C75;
    padding: 40px;
    border-radius: 10px;
    width: 600px;
      
         }
         
         #combox{
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
    width: 100;
    text-align: center;
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
      padding: 5;
    border-radius: 3px;
      }
      
      #delete{
      background-color:  #0F4C75;
      border:none;
      color: white;
      padding: 5;
    border-radius: 3px;
      }
      
      #comregh{
      text-align: center;
      }
      
      .comreg{
      border-bottom: 4px solid #0F4C75;
      }
      
          #buttonset{
         margin-left : 180px;
         }

   </style>
   <body>
   <div id = "combox">
      <div class = "com">
      
      <div class = "comreg"><h1 id = "comregh">기업 상세창</h1></div>
      
      <form name = "frm" method = "post" role='form'>
         <input type = "hidden" name = "CM_NO" value = "${companylist.CM_NO}" readonly/>
         
   

      <br>
      
      <div class = "AGENT" name = "AGENT">
         <label>대표자</label> &nbsp;
         ${companylist.AGENT }
         </div> 
      <br>
       <div class = "C_NAME" name = "C_NAME">
       <label>회사명</label> &nbsp;
         ${companylist.c_NAME }
      </div> 
      <br>
      
      <div class = "B_TYPE" name = "B_TYPE">
         <label>업종</label> &nbsp;
         ${companylist.b_TYPE }
      </div>
      <br>
      <div class = "C_DIV" name = "C_DIV">
         <label>기업구분</label> &nbsp;
         ${companylist.c_DIV }
      </div>
      <br>
      <div class = "HOMEPAGE" name ="HOMEPAGE">
         <label>HOMEPAGE</label> &nbsp;
         ${companylist.HOMEPAGE }
      </div>
      <br>
      <div class = "EMP_NUM" name ="EMP_NUM">
         <label>근로자수</label> &nbsp;
         ${companylist.EMP_NUM }
      </div>
      
      
      <br>
      
         <div id = "buttonset">
   <button type="submit" id="update">수정하기</button>
   &nbsp;&nbsp;&nbsp;
   <button type="submit" id="delete">삭제하기</button>
   </div>
   
   
      </form>
   

   
    
      </div>
   </div>

   
   </body>
   
</html>