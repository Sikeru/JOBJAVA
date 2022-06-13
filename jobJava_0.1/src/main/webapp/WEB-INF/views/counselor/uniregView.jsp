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
         .uni{
         
    position: absolute;
    top: 100px;
    left: -50px;
    border: 5px solid #0F4C75;
    padding: 40px;
    border-radius: 10px;
    width: 600px;

      
         }
         
         #unibox{
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
         }
         
         #buttonset{
         margin-left : 180px;
         }
         
         #hrset{
          background-color: #0F4C75;
         }
         
         .unireg{
         border-bottom: 4px solid #0F4C75;
         
         }
         
         #uniregh{
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
      }
      
      #delete{
      background-color:  #0F4C75;
      border:none;
      color: white;
      }

   </style>
   <body>
   <div id = "unibox">
      <div class = "uni">
      
      <div class = "unireg"><h1 id = "uniregh">대학교 사업계획서</h1></div>
      
      <form id = "frm" method = "post">
         <input type = "hidden" name = "UNI_B_NO" value = "${list.UNI_B_NO }" readonly/>
         
   

      <br>
      
      <div class = "uninum" name = "UNI_B_NO">
         <label>사업번호 </label>
          ${list.UNI_B_NO } 
      </div>
      
      <br>
      
      <div class = "uniname" name = "U_NAME">
         <label>대학명 </label>
         ${list.u_NAME }
      </div>
      
      <br>
      
      
      <div class = "uniaddr" name = "UNI_ADDR">
         <label>대학교 주소 </label>
         ${list.UNI_ADDR }
      </div>
      <br>
      
      <div class = "unihp" name = "UNI_HP">
         <label>전화번호 </label>
         ${list.UNI_HP }
      </div>
      
      <br>
      
      
      <div class = "unibname" name = "B_NAME">
         <label>사업명 </label>
         ${list.b_NAME }
         </div>
         <br>
      <div class = "bexpense" name = "B_EXPENSE">
         <label>사업비 </label>
         <input type = "text" id = "expense" name = "B_EXPENSE" value = "${list.b_EXPENSE }"/>
      </div>
      
   <br>
      <div class = "unidate">
         <label name = "S_DATE">시작날짜</label> 
         <input type = "date" id = "s_date" name = "S_DATE" value = "${list.s_DATE }"/> - 
         <label name = "E_DATE">종료날짜</label> 
         <input type = "date" id = "e_date" name = "E_DATE" value = "${list.e_DATE }"/>
      </div>
      
      <br>
      
      <div class = "unicontent" name = "B_CONTENT">
         <label>사업내용 </label>
         ${list.b_CONTENT }
      </div>
   
      </form>
      <br>
      <div id = "buttonset">
   <input type = "button" id = "update" value = "수정하기">
   &nbsp;&nbsp;&nbsp;
   <input type = "button" id = "delete" value = "삭제하기">
    </div>
    <script type="text/javascript">
    
    $("#update").on("click", function(){
         var frm = $("#frm")[0];
         frm.action = "update.do";
         frm.submit();
     });

     $("#delete").on("click", function(){
         var frm = $("#frm")[0];
         frm.action = "delete.do";
         frm.submit();
     });
    
    </script>
    
      </div>
   </div>

   
   </body>
   
</html>