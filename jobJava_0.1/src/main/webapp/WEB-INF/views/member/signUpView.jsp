<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
function joinform_check() {
	  //변수에 담아주기
	  var ID = document.getElementById("ID");
	  var PWD = document.getElementById("PWD");
	  var REPWD = document.getElementById("REPWD");
	  var HP = document.getElementById("HP");
	  var ADDR = document.getElementById("ADDR");
	  var EMAIL = document.getElementById("EMAIL");
	  var IDCK = document.getElementById("IDCK");
	  var POSTCODE = document.getElementById("sample6_postcode");
	  var ADDRESS = document.getElementById("sample6_address");
	  var DERAIOLADDRESS = document.getElementById("sample6_detailAddress");
	  var EXTRAADDRESS = document.getElementById("sample6_extraAddress");
	  var ADDRFOCUS = document.getElementById("addrfocus");

	  if (ID.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	    alert("아이디를 입력하세요.");
	    //ID.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  };
	  
	  var idCheck = /^[a-z0-9]{5,20}$/;
	  if (!idCheck.test(ID.value)) {
		    alert("*5~20자의 영문 소문자, 숫자만 사용가능합니다");
		    ID.focus();
		    return false;
	};
	
	if(ID.value != IDCK.value) {
		alert("중복확인을 해주세요");
		ID.focus();
	    return false;
	};

	  if (PWD.value == "") {
	    alert("비밀번호를 입력하세요.");
	    PWD.focus();
	    return false;
	  };

	  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	  if (!pwdCheck.test(PWD.value)) {
	    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
	    PWD.focus();
	    return false;
	  };

	  if (REPWD.value !== PWD.value) {
	    alert("비밀번호가 일치하지 않습니다..");
	    REPWD.focus();
	    return false;
	  };

	  if (HP.value == "") {
	    alert("핸드폰 번호를 입력하세요.");
	    HP.focus();
	    return false;
	  };
	  
	  var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	  
      if (!regPhone.test(HP.value)) {
          alert('잘못된 휴대전화번호입니다.');
          return false;
      };
      
      
      
	  if (POSTCODE.value == "") {
		    alert("주소를 입력하세요.");
		    ADDRFOCUS.focus();
		    return false;
	  }else if(ADDRESS.value == ""){
		  alert("주소를 입력하세요.");
		  ADDRFOCUS.focus();
		  return false;
	  };
	  
	  $("#ADDR").val(ADDRESS.value +" "+ DERAIOLADDRESS.value + EXTRAADDRESS.value)

	  if (EMAIL.value == "") {
	    alert("이메일 주소를 입력하세요.");
	    EMAIL.focus();
	    return false;
	  };
	  
	  var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	  
	  if (!regEmail.test(EMAIL.value)) {
		    alert("올라른 이메일을 입력하세요");
		    EMAIL.focus();
		    return false;
	  };

	  document.join_form.submit(); //유효성 검사의 포인트   
	}

	//아이디 중복체크 팝업창(현재 공백문서)
	function id_check() {
		event.preventDefault();
		var ID = $("#ID").val();
		if (ID == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("아이디를 입력하세요.");
		    //ID.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		  };
		  
		  var idCheck = /^[a-z0-9]{5,20}$/;
		  if (!idCheck.test(ID)) {
			    alert("*5~20자의 영문 소문자, 숫자만 사용가능합니다");
			    ID.focus();
			    return false;
		};
		$.ajax({
			type:'post'
			,url:'${contextPath}/member/id_check.do'
			,data:{userID : ID }
			,success:function(id){
				if(id == 'FALSE') {
					alert("사용가능한 아이디 입니다.");
					$('#IDCK').val(ID);
				}
				if(id == 'TRUE') {
					alert("이미 존재하는 아이디 입니다.");
				}
			}
		});
	}

</script>
<style>
    #register{
        width: 70%;
        height: auto;
        margin: 0 auto;
        padding: 40px;
        background-color: white;
        margin-top: 20px;
        margin-bottom: 20px;
        border: 1px solid #000;

    }
    #id {
        width: 40%;
        height: 40px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    #idcheck {
    	width: 90px;
        height: 35px;
        position: relative;
        right: 455px;
        top: -2px;
    }
    .PWDBOX {
        width: 40%;
        height: 40px;
        border: 1px solid #000;
        border-radius: 7px;
    }
    #sample6_postcode {
    	margin-bottom: 20px;
    }
    #sample6_address{
    	margin-bottom: 20px;
    }



</style>

</head>
<body>
<div id="register">
	<h1>회원가입</h1><br>
	<form name="join_form" action="${contextPath}/member/signUp.do" method="post">
            <h4>아이디*</h4><br>
				<input type="text" id="ID" name="ID" placeholder="　아이디를 입력하세요.">  *5~20자의 영문 소문자, 숫자만 사용가능합니다
				<input type="hidden" id="IDCK" />
				<button id="idcheck" type="button" class="btn btn-outline-secondary" onclick="id_check()">중복확인</button>
				<!-- <button id="idcheck" type="button" onclick="id_check()">중복확인</button> -->
             <br><br><h4>비밀번호*</h4><br>
				<input type="password" class="PWDBOX" id="PWD" name="PWD" placeholder="　비밀번호를 입력하세요.">
				*비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.<br><br>
             <h4>비밀번호 확인*</h4><br>
				<input type="password" class="PWDBOX" placeholder="　비밀번호를 입력하세요."  id="REPWD"><br><br>
             <h4>휴대폰 번호*</h4><br>
				<input type="text" class="PWDBOX" id="HP" name="HP" placeholder="　핸드폰번호를 입력하세요."/><br><br>
			 <h4>주소 *</h4><br>
			 <input type="text" class="PWDBOX" id="sample6_postcode" placeholder="　우편번호" readonly>
			 <input type="button" id="addrfocus" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			 <input type="text" class="PWDBOX" id="sample6_address" placeholder="　주소" readonly><br>
			 <input type="text" class="PWDBOX" id="sample6_detailAddress" placeholder="　상세주소">
			 <input type="text" class="PWDBOX" id="sample6_extraAddress" placeholder="　참고항목" readonly>
			 <input type="hidden" id="ADDR" name="ADDR" placeholder="　주소를 입력하세요."/><br><br>
			 <h4>이메일 * </h4><br>
			 <input type="text" class="PWDBOX" id="EMAIL" name="EMAIL" value="${email }" readonly placeholder="　이메일를 입력하세요."/><br><br>
			<h4>회원구분(필독)*</h4><br>
			뉴리더회원(대학생) : 학생신분으로 대전코업 뉴리더 양성사업(대학생)을 이용하고자 하는 회원.<br>
			인턴회원(청년) : 청년신분으로 대전코업 뉴리더 양성사업2(청년)을 이용하고자 하는 회원.<br>
			기업회원 : 기업회원으로 대전코업 양성사업을 이용하고자 하는 회원.<br>
			학생매니저 : 학생신부의 학생의 대하여 도와주고 양성하고자 하는 회원.<br><br>
				학생 : <input type="radio" id="AUTHORITY" name="AUTHORITY" value="ROLE_STU" checked="checked">
				일반 : <input type="radio" id="AUTHORITY" name="AUTHORITY" value="ROLE_USER">
				기업 : <input type="radio" id="AUTHORITY" name="AUTHORITY" value="ROLE_COM">
				학생매니저 : <input type="radio" id="AUTHORITY" name="AUTHORITY" value="ROLE_MAG"><br><br>
				<button class="btn btn-secondary" type="button" onclick="joinform_check()">가입하기</button>
	</form>
</div>
</body>
</html>