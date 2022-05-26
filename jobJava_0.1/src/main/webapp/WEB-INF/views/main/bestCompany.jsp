<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function openPop() {
	    document.getElementById("popup_layer").style.display = "block";
	}
	    
	function closePop() {
	    document.getElementById("popup_layer").style.display = "none";
	}
	
	function deletCom(bc_no) {
		location.href = '${contextPath}/main/deleteBestCompany.do?BC_NO='+bc_no;
	}
	
	function R_joinform_check() {
		var BC_NAME = $('#R_BC_NAME').val();
        var BC_HP = $('#R_BC_HP').val();
        
        if (BC_NAME == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("회사이름을 입력하세요.");
		    $('#R_BC_NAME').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		};
		if (BC_HP == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	    	alert("회사홈페이지를 입력하세요.");
	    	$('#R_BC_HP').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	    	return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		};
		
		var regHomePage = /(?:(?:https?|ftp|file):\/\/|www\.|ftp\.)(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[-A-Z0-9+&@#\/%=~_|$?!:,.])*(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[A-Z0-9+&@#\/%=~_|$])/igm;
  		
		if (!regHomePage.test(BC_HP)) {
			alert("올라른 홈페이지을 입력하세요");
			$('#R_BC_HP').focus();
			return false;
		};
		
		$('#R_BsetCompany').submit();
	}
	
	function joinform_check() {
		var BC_NAME = $('#BC_NAME').val();
        var BC_HP = $('#BC_HP').val();
        
        if (BC_NAME == "" && BC_HP == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("회사이름을 또는 회사홈페이지을 입력하세요.");
		    $('#R_BC_NAME').focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		};
		
		var regHomePage = /(?:(?:https?|ftp|file):\/\/|www\.|ftp\.)(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[-A-Z0-9+&@#\/%=~_|$?!:,.])*(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[A-Z0-9+&@#\/%=~_|$])/igm;
  		
		if (!regHomePage.test(BC_HP) && BC_HP != "") {
			alert("올라른 홈페이지을 입력하세요");
			$('#R_BC_HP').focus();
			return false;
		};
		$('#BsetCompany').submit();
	}

	
</script>
<style>
	#BC_NAME {
		border: 0.2px solid;
	}
		/*popup*/
        .popup_layer {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.4); }
        /*팝업 박스*/
        .popup_box{position: relative;top:50%;left:50%; overflow: auto; height: 500px; width:375px;transform:translate(-50%, -50%);z-index:1002;box-sizing:border-box;background:#fff;box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-webkit-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-moz-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);}
        /*컨텐츠 영역*/
        .popup_box .popup_cont {padding:50px;line-height:1.4rem;font-size:14px; }
        .popup_box .popup_cont h2 {padding:15px 0;color:#333;margin:0;}
        .popup_box .popup_cont p{ border-top: 1px solid #666;padding-top: 30px;}
        /*버튼영역*/
        .popup_box .popup_btn {display:table;table-layout: fixed;width:100%;height:70px;background:#ECECEC;word-break: break-word;}
        .popup_box .popup_btn a {position: relative; display: table-cell; height:70px;  font-size:17px;text-align:center;vertical-align:middle;text-decoration:none; background:#ECECEC;}
        .popup_box .popup_btn a:before{content:'';display:block;position:absolute;top:26px;right:29px;width:1px;height:21px;background:#fff;-moz-transform: rotate(-45deg); -webkit-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg);}
        .popup_box .popup_btn a:after{content:'';display:block;position:absolute;top:26px;right:29px;width:1px;height:21px;background:#fff;-moz-transform: rotate(45deg); -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg);}
        .popup_box .popup_btn a.close_day {background:#5d5d5d;}
        .popup_box .popup_btn a.close_day:before, .popup_box .popup_btn a.close_day:after{display:none;}
        /*오버레이 뒷배경*/
        .popup_overlay{position:fixed;top:0px;right:0;left:0;bottom:0;z-index:1001;;background:rgba(0,0,0,0.5);}
        /*popup*/
        
        #e-text {
        	border: 0.2px solid;
        }
        #code {
        	border: 0.2px solid;
        }
    </style>
</head>
<body>
<c:forEach var="bestCom" items="${bestCom}">
<div class="card" style="width: 300px; height: auto;">
 <div class="cardTotal" style="margin: 0 auto;width: 200px;">
  <a href="${bestCom.BC_HP }"><img src="${contextPath}/main/download.do?fileName=${bestCom.BC_FILENAME}&fileNO=${bestCom.BC_NO}&folderName=bestCom" style="width: 100px; height: 100px;margin: 0 auto;"></a>

  <div class="card-body">
    <h5 class="card-title">${bestCom.BC_NAME}</h5>
    <s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
    <input type="button" value="삭제" onclick="deletCom(${bestCom.BC_NO})" class="btn btn-primary">
    
    <details>
    	<summary>수정</summary>
    	  <form id="BsetCompany" action="${contextPath}/main/updateBestCompany.do" method="post" enctype="multipart/form-data">
    	  <input type="hidden" name="BC_NO" value="${bestCom.BC_NO}"/>
    	  <input type="hidden" name="originalFile" value="${bestCom.BC_FILENAME }"/>
          <input id="BC_NAME" name="BC_NAME" type="text" placeholder="　회사이름"/><br><br>
          <input id="BC_HP" name="BC_HP" type="text" placeholder="　회사홈페이지"/><br><br>
          <input type="file" name="BC_FILENAME"/>
          <button class="btn btn-secondary" type="button" onclick="joinform_check()">수정</button>
          </form>
    </details>
    </s:authorize>
  </div>
  </div>
</div>

	
	
</c:forEach>
<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
<input class="btn" type="button" value="등록" onclick="openPop()"/>
</s:authorize>

    <div class="popup_layer" id="popup_layer" style="display: none;">
      <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <h3> 우수기능 등록</h3>
          <hr>
          <form id="R_BsetCompany" action="${contextPath}/main/insertBestCompany.do" method="post" enctype="multipart/form-data">
          <input id="R_BC_NAME" name="BC_NAME" type="text" placeholder="　회사이름"/><br><br>
          <input id="R_BC_HP" name="BC_HP" type="text" placeholder="　회사홈페이지"/><br><br>
          <input type="file" name="BC_FILENAME"/>
          <button class="btn btn-secondary" type="button" onclick="R_joinform_check()">등록</button>
          </form>
      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn" style="float: bottom; margin-top: 160px;">
          <a href="javascript:closePop();">닫기</a>
      </div>
  </div>
</div>

</body>
</html>