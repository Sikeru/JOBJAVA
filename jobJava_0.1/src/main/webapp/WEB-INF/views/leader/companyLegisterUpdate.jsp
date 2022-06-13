<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var maxAppend = ${Append} + 1;
function file_add(){
   if(maxAppend >= 5){
          alert("파일 업로드 최대 개수는 5개 입니다.");
          return;
      } else{
          $('.file_add').append('<li><input class="filelist" type="file"name="fileName'+maxAppend+'" class="files"> <button type="button" onclick="fileDel(this);">삭제</button></li>'); 
          maxAppend ++;
   }
}

function fileDel(e) {
   $(e).parent().detach();
   maxAppend--;
}

function existingFileDel(e, filename,i) {
   $('#delfile'+i).val(filename);
   $(e).parent().detach();
   maxAppend--;
}

function joinform_check() {
   var TITLE = $('#TITLE').val();
   var CONTENT = $('#CONTENT').val();
   
   if (TITLE == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
         alert("제목를 입력하세요.");
         $('#TITLE').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
         return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
  if (CONTENT == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      alert("내용를 입력하세요.");
      $('#CONTENT').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };
//   let fileNames = $('.fileNames');
   //let newfileNames = $('.newfileNames');
   
   //for(let i=0;i<newfileNames.length;i++){
      //let newfileName = $(newfileNames[i]).val().substring($(newfileNames[i]).val().lastIndexOf('\\')+1);
      //for(let j=0;i<fileNames.length;j++){
         //let fileName = $(fileNames[j]).val();
         //if(fileName == newfileName) {
            //alert("파일 이름이 같습니다.");
            //return false;
         //}
      //}
   //}
  $('#join').submit();
}

	//버튼 스크립트
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='updateForm']");

						// 수정 
						$(".update_btn")
								.on(
										"click",
										function() {
											/* alert("수정이완료되었습니다."); */
											location.href = "${contextPath}/leader/companyLegisterList.do";
										})

						// 삭제
						$(".delete_btn")
								.on(
										"click",
										function() {
											formObj
													.attr("action",
															"${contextPath}/leader//legisterDelete.do?regiNO=${list.REGI_NO}");
											formObj.attr("method", "post");
											formObj.submit();
										})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "${contextPath}/leader/companyLegisterList.do";
										})
					})

	function d_click() {
		alert("마이페이지에서 변경해주세요.");
	};
</script>
<body>
	<div id="mypagetotal">
		<section id="protitle">
			<h1>기업등록 수정 페이지 후</h1>
		</section>
		<section id="proarticle">

			<form name="updateForm"
				action="${contextPath}/leader/legisterUpdate.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" id="REGI_NO" name="REGI_NO"
					value="${list.REGI_NO}" /> 사업자번호<br> <input type="text"
					id="B_NO" name="B_NO" value="${list.b_NO}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
					readonly><br> 대표자<br> <input type="text"
					name="AGENT" value="${list.AGENT}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> 업종<br>
				<input type="text" name="B_TYPE" value="${list.b_TYPE}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> 기업구분<br>
				<input type="text" name="C_DIV" value=" ${list.c_DIV}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> 근로자수<br>
				<input type="text" name="EMP_NUM" value="${list.EMP_NUM}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> 홈페이지<br>
				<input type="text" name="HOMEPAGE" value="${list.HOMEPAGE}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> 회사명<br>
				<input type="text" name="C_NAME" value="${list.c_NAME}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br>
				<%-- 매칭결과<br> <input type="text" name="M_RESULT" value="${list.m_RESULT}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> --%>
				<input type="hidden" id="uniBNO" name="UNI_B_NO"
					value="${param.uniBNO}" /> <input type="hidden" id="REGI_NO"
					name="REGI_NO" value="" />

				<!-- 	 시작날짜&nbsp; <input type="date" name="S_DATE">
				종료날짜&nbsp; <input type="date" name="E_DATE"> -->


				<br>
				<p>등록된 파일</p>
				<ul class="file_add">
					<c:forEach var="file" items="${regiFile}" varStatus="i">
						<li>파일: ${file.REGI_FILENAME}
							<button type="button"
								onclick="existingFileDel(this, '${file.REGI_FILENAME}', ${i.count});">삭제</button>
						</li>
						<input type="hidden" id="delfile${i.count}"
							name="delfile${i.count}" />
					</c:forEach>
					<li><input type="file" class="newfileNames" name="REGI_FILENO">
						<input type="button" value="파일추가" onClick="file_add()" /></li>
				</ul>
				<div>
					<input type="hidden"
						value="${pageContext.request.userPrincipal.name}" name="ID"><br>
					<input type="submit" value="수정완료" class="update_btn">
					&nbsp; <input type="submit" class="delete_btn" value="삭제">
					<input type="reset" value="취소" OnClick="javascript:cancle();">
					<input type="submit" class="list_btn" value="목록">
				</div>
			</form>
		</section>
	</div>
</body>
