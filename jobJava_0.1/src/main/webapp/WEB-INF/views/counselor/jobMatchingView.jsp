<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gugi&display=swap');
.accordion {
  width: 90%;
  max-width: 1000px;
  margin: 10px;
}
.accordion-item {
  background-color: #fff;
  color: #111;
  margin: 1rem 0;
  border-radius: 0.3rem;
  box-shadow: 0 2px 5px 0 rgba(0,0,0,0.25);
}
.accordion-item-header {
  padding: 0.5rem 3rem 0.5rem 1rem;
  min-height: 3.5rem;
  line-height: 1.25rem;
  font-weight: bold;
  display: flex;
  font-size: 17px;
  align-items: center;
  position: relative;
  cursor: pointer;
}
.accordion-item-header::after {
  content: "\002B";
  font-size: 2rem;
  position: absolute;
  right: 1rem;
}
.accordion-item-header.active::after {
  content: "\2212";
}
.accordion-item-body {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
.accordion-item-body-content {
  padding: 1rem;
  line-height: 1.5rem;
  font-family: sans-serif;
  border-top: 1px solid;
  font-size: 16px;
  border-image: linear-gradient(to right, transparent, #34495e, transparent) 1;
}

@media(max-width:767px) {
  html {
    font-size: 13px;
  }
}

.btn {
   background:#0F4C75;
}

#matching{
        background-color: white;
    margin-left: 900;
    margin-top: -36px;
    width: 65px;
    height: 39px;
    border-block-color: gray;
}


  </style>

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
    
   });
</script>

</head>
<body>
<div class="accordion">
  <c:forEach var="bInfo" items="${bInfo}" varStatus="qnaNUM">
  <div class="accordion-item">
    <div class="accordion-item-header">
    ${bInfo.TITLE }
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
            <form action="${contextPath}/counselor/memberMatching.do" method="post">
           기업 : ${bInfo.COMPANY }
           <br><br>
           경력 : ${bInfo.JOB_NO }
           <br><br>
           학력 : ${bInfo.EDU }
           <br><br>
           직무내용 <br> ${bInfo.JOB_D }
           <br><br>
           <input type="hidden" name="SHOP_NO" value="${bInfo.SHOP_NO }" />
           <c:forEach var="member" items="${member}" varStatus="i">
           <input type='checkbox' name='CM_NO' value='${member.CM_NO }' />
           <button type="button" class="btn btn-secondary" data-bs-toggle="popover" title="나이 : ${member.AGE}" data-bs-content="선호지역 : ${member.AREA}　선호직종 : ${member.OCC_TYPE } ">${member.NAME }</button>
           </c:forEach>
           <br><input type="submit" id = "matching" value="매칭"/>
           </form>
      </div>
    </div>
  </div>
  </c:forEach>
 </div>
 <script type="text/javascript">
const accordionItemHeaders = document.querySelectorAll(".accordion-item-header");

accordionItemHeaders.forEach(accordionItemHeader => {
  accordionItemHeader.addEventListener("click", event => {



    accordionItemHeader.classList.toggle("active");
    const accordionItemBody = accordionItemHeader.nextElementSibling;
    if(accordionItemHeader.classList.contains("active")) {
      accordionItemBody.style.maxHeight = accordionItemBody.scrollHeight + "px";
    }
    else {
      accordionItemBody.style.maxHeight = 0;
    }

  });
});
</script>
 <script type="text/javascript">
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
});
</script>
</body>
</html>
