

<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userID">
   <s:authentication property="name" />
</c:set>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"></script>


<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='updateForm']");

      $(".cancel_btn").on("click", function() {
         formObj.attr("action", "/JJ/cafe/jobpostingdetail.do");
         formObj.attr("method", "post");
         formObj.submit();
      });
   });
   
   function update() {
		var form = document.updateForm;


		form.submit();
		
		
		alert('수정이 완료되었습니다.');
	
	} ;
   
   
</script>
<style>
#listMenu {
   width: 100%;
   height: auto;
   color: #fff;
   background: #BBE1FA;
   text-align: center;
}

#listMenu ul {
   width: 100%;
   height: 50px;
   margin: 0;
   padding: 0;
   margin-left: 300px;
}

#listMenu li {
   width: 200px;
   height: 100%;
   text-align: center;
   list-style: none;
   font-size: 17px;
   float: left;
   margin-left: 1px;
   background: #3282B8;
}

#listMenu li p {
   margin: 0;
   margin-top: 10px;
}

#listMenu li a {
   text-decoration: none;
   color: white;
}

#root {
   width: 100%;
   margin: 0 auto;
   margin-top: 60px;
   height: 2800px;
}

#programheader {
   width: 1200px;
   height: 120px;
   margin-left: 300px;
   margin-top: 100px;
   margin-bottom: 20px;
}

#programhead {
   font-size: 40px;
   margin-bottom: 5px;
}

#procontainer {
   width: 1000px;
   height: 800px;
   font-weight: 800px;
   margin-left: 300px;
   border-top: 3px solid #192E7E;
}

#programtitle {
   width: 900px;
   height: 70px;
   border-bottom: 2px solid #A4A4A4;
}

#textcontent {
   border: none;
   border-bottom: 2px solid #A4A4A4;
   margin-top: 20px;
}

#texttitle {
   border: none;
   border-bottom: 2px solid #A4A4A4;
   margin-top: 20px;
}

#tt {
   font-size: 20px;
   font-weight: 800px;
}

li {
   list-style: none;
}

#profile {
   margin-top: 20px;
   margin-bottom: 20px;
}

dl {
   font-weight: 800px;
}

li a {
   text-decoration: none;
   color: black;
}

#ssdate {
   margin-left: 100px;
}

button {
   border: 1px solid #e6e6e6;
   border-radius: 5px;
}

.save_btn {
   width: 80px;
   height: 40px;
   border: none;
   border: 1px solid #e6e6e6;
   font-size: 14px;
   margin-left: 5px;
   margin-top: 30px;
}

.cancel_btn {
   width: 80px;
   height: 40px;
   border: none;
   border: 1px solid #e6e6e6;
   font-size: 14px;
   margin-left: 5px;
   margin-top: 30px;
}

#btn1 {
   margin-top: 20px;
}

textarea {
   border: none;
   border-bottom: 2px solid #A4A4A4;
   margin-top: 20px;
}

.label1 {
   margin-top: 20px;
   border: 1px solid #A4A4A4;
   padding: 5 20 5 20px;
   width: 0 auto;
   border-radius: 5px;
}
</style>
</head>



<body>
   <s:authorize access="hasRole('ROLE_COM')">
      <div id="listMenu">
         <ul>
            <li><p>
                  <a href="${contextPath}/cafe/cafeBusinessGuide.do">사업안내</a>
               </p></li>
            <li><p>
                  <a href="${contextPath}/cafe/celender.do">채용일정</a>
               </p></li>
            <li><p>
                  <a href="${contextPath}/cafe/jobposting.do">채용공고</a>
               </p></li>
            <li><p>
                  <a href="${contextPath}#">프로그램 목록</a>
               </p></li>
            <li><p>
                  <a href="${contextPath}#">설문조사</a>
               </p></li>
         </ul>
      </div>
   </s:authorize>

   <div id="root">
      <header id=programheader>
         <h2 id=programhead>채용공고 수정뷰</h2>
         <br>
         <p>
            채용공고 수정 뷰입니다.<br> 수정은 신중히 해주십시오.
         </p>
      </header>

      <section id="procontainer">
         <form name="updateForm" role="form" method="post"
            action="${contextPath}/cafe/jobpostingupdate.do">



            <table>
               <tbody>
                  <div id="content1">

                     <label for="noform"><span class="red"></span></label>
                     <div class="body_item_inner1">
                        <input type="hidden" value="${update.JOB_NO}" name="JOB_NO" />

                     </div>

                  </div>
                  <tr>
                     <td><br> 프로그램 기간 &nbsp; | &nbsp; <fmt:formatDate
                           value="${update.s_DATE}" pattern="yyyy-MM-dd " /> <input
                        type="hidden" value="${update.s_DATE}" name="S_DATE"> ~
                        <fmt:formatDate value="${update.d_DATE}" pattern=" yyyy-MM-dd" />
                        <input type="hidden" value="${update.s_DATE}" name="D_DATE">
                        <hr></td>

                  </tr>

                  <tr>
                     <td><label class="label1" for="title">제목 </label> <textarea
                           id="texttitle" class="totalcontent" name="TITLE" cols="130"
                           rows="3"><c:out value="${update.TITLE}" /></textarea></td>

                  </tr>



                  <tr>
                     <td><label class="label1" for="jobd">내용</label> <textarea
                           id="textjob_d" class="totalcontent" name="JOB_D" cols="130"
                           rows="3"><c:out value="${update.JOB_D}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="career">경력</label> <textarea
                           id="textcareer" class="totalcontent" name="CAREER" cols="130"
                           rows="3"><c:out value="${update.CAREER}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="edu">학력</label> <textarea
                           id="textedu" class="totalcontent" name="EDU" cols="130"
                           rows="3"><c:out value="${update.EDU}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="area">지역</label> <textarea
                           id="textarea" class="totalcontent" name="AREA" cols="130"
                           rows="3"><c:out value="${update.AREA}" /></textarea></td>

                  </tr>

                  <tr>
                     <td><label class="label1" for="sal">급여</label> <textarea
                           id="textsal" class="totalcontent" name="SAL" cols="130"
                           rows="3"><c:out value="${update.SAL}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="emptype">고용형태</label> <textarea
                           id="textemptype" class="totalcontent" name="EMP_TYPE"
                           cols="130" rows="3"><c:out
                              value="${update.EMP_TYPE}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="work_type">근무형태</label> <textarea
                           id="textwork_type" class="totalcontent" name="WORK_TYPE"
                           cols="130" rows="3"><c:out
                              value="${update.WORK_TYPE}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="welfare">복리후생</label> <textarea
                           id="textwelfare" class="totalcontent" name="WELFARE" cols="130"
                           rows="3"><c:out value="${update.WELFARE}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="company">기업명</label> <textarea
                           id="textcompany" class="totalcontent" name="COMPANY" cols="130"
                           rows="3"><c:out value="${update.COMPANY}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="btype">업종</label> <textarea
                           id="textbtype" class="totalcontent" name="b_TYPE" cols="130"
                           rows="3"><c:out value="${update.b_TYPE}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="scale">기업규모</label> <textarea
                           id="textscale" class="totalcontent" name="SCALE" cols="130"
                           rows="3"><c:out value="${update.SCALE}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="establish">설립연도</label> <textarea
                           id="textestablish" class="totalcontent" name="ESTABLISH"
                           cols="130" rows="3"><c:out
                              value="${update.ESTABLISH}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="ysales">연매출액</label> <textarea
                           id="textysales" class="totalcontent" name="y_SALES" cols="130"
                           rows="3"><c:out value="${update.y_SALES}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="hp">홈페이지</label> <textarea
                           id="texthp" class="totalcontent" name="HP" cols="130" rows="3"><c:out
                              value="${update.HP}" /></textarea></td>

                  </tr>
                  <tr>
                     <td><label class="label1" for="empnum">근로자수</label> <textarea
                           id="textempnum" class="totalcontent" name="EMP_NUM" cols="130"
                           rows="3"><c:out value="${update.EMP_NUM}" /></textarea></td>

                  </tr>

               </tbody>
            </table>

            <div id="btn1">
               <button type="submit" class="save_btn" OnClick="javascript:update();" >저장</button>
               <button type="submit" class="cancel_btn">취소</button>
            </div>
         </form>
      </section>
   </div>


</body>
</html>
