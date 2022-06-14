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
	if (confirm("파일을 삭제하시겠습니까??") == true){    //확인
		$('#delfile'+i).val(filename);
		   $(e).parent().detach();
		   maxAppend--;
	 }else{   //취소

	     return false;

	 }
}

function joinform_check() {
	 var AGENT = $('#AGENT').val();
	   var B_TYPE = $('#B_TYPE').val();
	   var C_DIV = $('#C_DIV').val();
	   var EMP_NUM = $('#EMP_NUM').val();
	   var C_NAME = $('#C_NAME').val();

	   
	   if (AGENT == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	         alert("대표자명을 입력하세요.");
	         $('#AGENT').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	         return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  };
	  if (B_TYPE == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	      alert("업종을 입력하세요.");
	      $('#B_TYPE').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  };
	  if (C_DIV == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	      alert("기업구분을 입력하세요.");
	      $('#C_DIV').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  };
	  if (EMP_NUM == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	      alert("근로자수를 입력하세요.");
	      $('#EMP_NUM').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  };
	  if (C_NAME == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	      alert("회사명을 입력하세요.");
	      $('#C_NAME').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
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
											if (confirm("정말 삭제하시겠습니까??") == true){    //확인

												formObj
												.attr("action",
														"${contextPath}/leader//legisterDelete.do?regiNO=${list.REGI_NO}");
										formObj.attr("method", "post");
										formObj.submit();

											 }else{   //취소

											     return false;

											 }
										})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {
											formObj
											.attr("action",
													"${contextPath}/leader/companyLegisterList.do");
									formObj.attr("method", "post");
									formObj.submit();

										})
					})

	function d_click() {
		alert("마이페이지에서 정보를 변경해주세요.");
		if (confirm("마이페이지로 이동하시겠습니까??") == true){    //확인
			location.href = "${contextPath}/member/mypageForm.do";

		 }else{   //취소

		     return false;
		 }
	};
</script>
<style type="text/css">

 * {
        margin: 0;
        padding: 0;
    }
    
    wrap{
    width: 100%;
    height: auto;
    }

#top{
  width: 100%;
  height: 300px;
        background: #0F4C75;
        border-bottom: 1px solid;
  }     


    header {
      
        
    
    width: 1600px;
    margin: 0 auto;


    }

    header #loginMenu ul {
        width: 100%;
        height: 200px;
        background: #0F4C75;
        overflow: hidden;
        margin:0;
       
    }

    header #loginMenu li {
        display: inline-block;
        list-style: none;
        text-decoration: none;
        margin: 15px;
        float: right;
        position: relative;
        right: 100px;
        z-index: 1;
    }

    header #loginMenu li a {
        text-decoration: none;
        color: white;
    }

    /*    logo style start*/
    header #topLogo {
        width: 100%;
        height: 250px;
        position: relative;
        left: 45%;
        bottom: 250px;
         z-index: 0;
        
        

    }



    /*    logo style end*/
    
    

    header #topMenu ul {
        width: 100%;
        background: #0F4C75;
        
        overflow: hidden;
        margin:0;
        



    }

    header #topMenu li {
        display: inline-block;
        list-style: none;
        text-decoration: none;
        margin: 20px;
        float: right;
        position: relative;
        right: 35%;
        top: 30%;
        z-index: 2;
    }

    header #topMenu li a {
        text-decoration: none;
        color: white;
    }
    
    /* header style End */
  
  #listMenu{
width:100%;
height: auto;
color: #fff;
background: #BBE1FA;

}

#listMenu ul{
width:100%;
height:50px;
margin:0;
margin-left:25%;
padding:0;
text-align: center;

}

#listMenu li{
width:200px;
height:100%;
text-align: center;
list-style: none;
font-size: 20px;
float:left;
margin-left: 1px;
background: #3282B8;
}

#listMenu li p{

margin:0;
margin-top:10px;

}

#listMenu li a{

text-decoration: none;
color:white;
}

#proarticle {
width:100%;
height: 800px;
margin-top:50px;
margin-bottom:50px;
}

#formArticle{
width:805px;
height:800px;
border: 1px solid #b4b4b4;
margin-left: 25%;
padding:35px 130px 35px 130px;

}

#join{
width:100%;
height:525px;
margin:0;


}
.joinArticle{
width:545px;
height:525px;

}

.file_add{
padding:0;
}

.file_add li{
list-style: none;
}

/* botton style */
.update_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 100px;
    height: 40px;
}

.update_btn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}

.delete_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 100px;
    height: 40px;
}

.delete_btn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}

.list_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 100px;
    height: 40px;
}

.list_btn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}

.reset_btn {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    background: white;
    color: #4169E1;
    border: 1px solid #4169E1;
    width: 100px;
    height: 40px;
}

.reset_btn:hover {
    background: #4169E1;
    color: white;
    border: 0px solid;
}


/* botton style and*/
        

 footer {
        width: 100%;
        margin: 0 auto;
        clear: both;
    }
	footer #service{
		width: 100%;
		height:50px;
		background: #0F4C75;
	}
    footer #service ul {
    	width:100%;
        text-align: center;
        margin:0;
    }

    footer #service li {
        list-style: none;
        text-decoration: none;
        display: inline-block;
        margin-right:30px;
        line-height: 50px;
        
        

    }

    footer #service li a {
        text-decoration: none;
        color: white;
    }

    footer #copyrights {
        width: 0 auto;
        height: 200px;
        
        
    }
    footer .copyright-wrap{
        width: 80%;
        height: 100%;
        background: #3282B8;
        float: left;
        
    }
    footer .copyright{
        width: 0 auto;
        margin-top: 20px;
        margin-left: 30px;
    }
    footer .copyright a{
        color: white;
        line-height: 20px;
       
    }
    footer .footerLogo{
        width: 20%;
        height: 100%;
        float: left;
        background: #3282B8;
        
        
    }
    footer .footerLogo img{
        width: 100%;
        height: 100%;
    }
    footer #company{
        width: 100%;
        height: 50px;
        
    }
    footer #company ul{
        text-align: center;
        background: #BBE1FA;
    }
    footer #company li{
        list-style: none;
        text-decoration: none;
        display: inline-block;
        margin-right: 70px;
    }
    footer #company img{
        width: 100%;
        height: 150px;
    }
</style>

<body>
	<div id="updateView">
	<div id="listMenu">
<ul>
<li><p><a href="${contextPath}/leader/companyLegisterList.do">사업참여</a></p></li>
<li><p><a href="${contextPath}/leader/companyLegisterStuList.do">참여학생조회</a></p></li>
<li><p><a href="${contextPath}/leader/commuteCheck.do">출퇴근조회</a></p></li>
<li><p><a href="${contextPath}/leader/surveylist.do">설문조사</a></p></li>
</ul>
</div>
		<div id="proarticle">
		<div id= formArticle>
			<form name="updateForm" id = "join"
				action="${contextPath}/leader/legisterUpdate.do" method="post"
				enctype="multipart/form-data">
				<div class="joinArticle">
				<input type="hidden" id="REGI_NO" name="REGI_NO"
					value="${list.REGI_NO}" /> 사업자번호<br> <input type="text"
					id="B_NO" name="B_NO" value="${list.b_NO}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69 onclick="d_click()"
					readonly><br><br>
					 대표자<br> 
					 <input type="text" id="AGENT"name="AGENT" value="${list.AGENT}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br><br>
					 업종<br>
				<input type="text" id="B_TYPE" name="B_TYPE" value="${list.b_TYPE}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> <br>
					기업구분<br>
				<input type="text" id="C_DIV" name="C_DIV" value="${list.c_DIV}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br> <br>
					근로자수<br>
				<input type="text"  id="EMP_NUM" name="EMP_NUM" value="${list.EMP_NUM}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br><br> 홈페이지<br>
				<input type="text" name="HOMEPAGE" value="${list.HOMEPAGE}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br><br> 회사명<br>
				<input type="text"  id="C_NAME" name="C_NAME" value="${list.c_NAME}"
					placeholder="마이페이지에서 정보를 입력해주세요." size=69><br><br>
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
					<li>
					<input type="file" class="newfileNames" name="REGI_FILENO">
						<input type="button" class=fileBtn value="파일추가" onClick="file_add()" /></li>
				</ul>
				<div>
					<input type="hidden"
						value="${pageContext.request.userPrincipal.name}" name="ID"><br>
					<input type="button" class="update_btn" value="수정완료"  onclick="joinform_check()">
					&nbsp; <input type="submit" class="delete_btn" value="삭제">
					<input type="reset" class="reset_btn" value="취소" OnClick="javascript:cancle();">
					<input type="submit" class="list_btn" value="목록">
				</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
