<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	//파일업로드
	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append(
				"<br>" + "<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}
	//유효성
	function jobappCheck() {
		var form = document.jobboxform;


		if (!form.E_DATE.value) {
			alert("구직마감희망날짜를 설정해주세요.");
			form.E_DATE.focus();
			return;
		}
		
		form.submit();
		
	}
</script>
<body>

<div id = "totaljobbox">

 <form name="jobboxform" action="${contextPath}/jobresult.do" method="post">
           <br>
    <legend><h2>선호지역</h2></legend>
                <select name="AREA">
      <option value="서울특별시">서울특별시</option>
      <option value="인천광역시">인천광역시</option>
      <option value="대전광역시">대전광역시</option>
      <option value="광주광역시">광주광역시</option>
      <option value="울산광역시">울산광역시</option>
      <option value="부산광역시">부산광역시</option>
      <option value="대구광역시">대구광역시</option>
      <option value="제주특별자치도">제주특별자치도</option>
      <option value="세종특별자치시">세종특별자치시</option>
      <option value="강원도">강원도</option>
      <option value="경기도">경기도</option>
      <option value="충청북도">충청북도</option>
      <option value="충청남도">충청남도</option>
      <option value="경상북도">경상북도</option>
     <option value="경상남도">경상남도</option>
     <option value="전라북도">전라북도</option>
     <option value="전라남도">전라남도</option>
     </select> 
 <br><br>
            
            
              
    <legend><h2>선호직종</h2></legend>
                <select name="OCC_TYPE">
      <option value="건설·채굴직">건설·채굴직</option>
      <option value="경영·사무·금융·보험직">경영·사무·금융·보험직</option>
      <option value="교육·법률·사회복지·경찰·소방직 및 군인직">교육·법률·사회복지·경찰·소방직 및 군인직</option>
      <option value="농림어업직">농림어업직</option>
      <option value="미용·여행·숙박·음식·경비·돌봄·청소직">미용·여행·숙박·음식·경비·돌봄·청소직</option>
      <option value="보건·의료직">보건·의료직</option>
      <option value="기계·금속·재료">기계·금속·재료</option>
      <option value="인쇄·목재·공예 및 제조 단순">인쇄·목재·공예 및 제조 단순</option>
      <option value="전기·전자·정보통신">전기·전자·정보통신</option>
      <option value="화학·환경·섬유·의복·식품가공">화학·환경·섬유·의복·식품가공</option>
      <option value="연구 및 공학기술직">연구 및 공학기술직</option>
      <option value="영업·판매·운전·운송직">영업·판매·운전·운송직</option>
      <option value="예술·디자인·방송·스포츠직">예술·디자인·방송·스포츠직</option>
  
     </select> 
 <br><br>
            
           
                <legend><h2>여성가장여부</h2></legend>
                예 <input type="radio" name="F_FAMILY" value="Y" checked />
                아니오 <input type="radio" name="F_FAMILY" value="N" /><br><br>
            
             
            
                <legend><h2>장애여부</h2></legend>
                예 <input type="radio" name="DISABILITY" value="Y" checked />
                아니오 <input type="radio" name="DISABILITY" value="N" /><br><br>
           
            
            
                <legend><h2>군대여부</h2></legend>
                예 <input type="radio" name="MILITARY" value="Y" checked />
                아니오 <input type="radio" name="MILITARY" value="N" /><br><br>
           

                <legend><h2>공개여부</h2></legend>
                예 <input type="radio" name="DISCLOSURE" value="Y" checked />
                아니오 <input type="radio" name="DISCLOSURE" value="N" /><br><br>
                
              <h2>파일명</h2><br> <input type="text" name="FILENAME" value="filename"
					placeholder="파일추가하기" onClick="fn_addFile()" size=20 />
				<div id="d_file"></div> 
            
			   <h2> 구직마감희망날짜</h2>&nbsp;  <input type="date" name="E_DATE"><br><br>
            
            <input type="hidden"
					value="${pageContext.request.userPrincipal.name}" name="ID"><br>
					
				<input type=button value="구직등록하기"
					OnClick="javascript:jobappCheck();">
		
					&nbsp; &nbsp; &nbsp; 
					 <input type="reset" value="취소">
				<br> <br>
            
        </form>
        
        
        </div>
        
</body>
</html>