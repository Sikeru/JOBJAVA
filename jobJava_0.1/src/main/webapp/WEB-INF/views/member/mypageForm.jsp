<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	function div2Resize() {
		let element = document.getElementById('myPageW');
	    var div1 = document.getElementById('myPageW');
	    div1.style.height = (element.clientHeight + 300) + 'px';
	    
	    let element2 = document.getElementById('myPageMain');
	    var div2 = document.getElementById('myPageMain');
	    div2.style.height = (element2.clientHeight + 200) + 'px';
	}
	window.onload = function() {
    	div2Resize();

    	// 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
    	window.addEventListener('resize', div2Resize);
	}

	function mac_get() {
		$.ajax({
			type: "GET",
			url: "${contextPath}/member/macGet.do", 
			data: {},
			success: function(mac) {
				console.log(mac)
				$('input[name=MAC_ADDR]').attr('value',mac);
			}
		});
	}
	
	function user_submit() {
		var PWD = $('#PWD').val();
		var HP = $('#HP').val();
		var EMAIL = $('#EMAIL').val();
		var POSTCODE = $("#sample6_postcode").val();
		var ADDRESS = $("#sample6_address").val();
		var DERAIOLADDRESS = $("#sample6_detailAddress").val();
		var EXTRAADDRESS = $("#sample6_extraAddress").val();
		var ADDRFOCUS = document.getElementById("addrfocus");
		
		/* 
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
		if(PWD != '') {
			if (!pwdCheck.test(PWD.value)) {
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
				PWD.focus();
				return false;
			}
		};
		*/
	  if(ADDRESS != '' & DERAIOLADDRESS != '' & EXTRAADDRESS != ''){
	  	$("#ADDR").val(ADDRESS +" "+ DERAIOLADDRESS + EXTRAADDRESS);
	  }

	  if (EMAIL == "") {
	    alert("이메일 주소를 입력하세요.");
	    EMAIL.focus();
	    return false;
	  };
	  
	  


	  $('#join_form').submit(); //유효성 검사의 포인트   	
		
	}
	
	function nuser_submit() {
		var NAME = $('#UNAME').val();
		var BIRTH = $('#UBIRTH').val();
		var J_SEARCH = $('#J_SEARCH').val();
		var BIRTH = $('#UBIRTH').val();
		var LAST_EDU = $('#LAST_EDU').val();
		
		  if (NAME == "") {
				 alert("이름을 입력하세요.");
				 EMAIL.focus();
				 return false;
			  };
			  
			  if (J_SEARCH == "") {
				 alert("구직여부를 작성해주세요");
				 J_SEARCH.focus();
				 return false;
			  }
			  
			  if (BIRTH == "") {
				  alert("생년월일을 입력하세요");
				  BIRTH.focus();
				  return false;
			  }
			  
			  if (LAST_EDU == ""){
				  alert("최종학력을 입력하세요");
				  LAST_EDU.focus();
				  return false;
			  }
			  
			  return user_submit();
	}
	
	function stu_submit() {
		var NAME = $('#SNAME').val();
		var DEPT = $('#DEPT').val();
		var BIRTH = $('#SBIRTH').val();
		var U_NAME = $('#U_NAME').val();
		
		if (NAME == "") {
			 alert("이름을 입력하세요.");
			 NAME.focus();
			 return false;
		};
		if (DEPT == "") {
			 alert("학과을 입력하세요.");
			 DEPT.focus();
			 return false;
		};
		if (BIRTH == "") {
			 alert("생일을 입력하세요.");
			 BIRTH.focus();
			 return false;
		};
		if (U_NAME == "") {
			 alert("대학교 이름을 입력하세요.");
			 U_NAME.focus();
			 return false;
		};
		
		return user_submit();
	}
	
	function com_submit() {
		var B_NO = $('#B_NO').val();
		var AGENT = $('#AGENT').val();
		var B_TYPE = $('#B_TYPE').val();
		var C_DIV = $('#C_DIV').val();
		var EMP_NUM = $('#EMP_NUM').val();
		var HOMEPAGE = $('#HOMEPAGE').val();
		var C_NAME = $('#C_NAME').val();		
		
		if (B_NO == "") {
			 alert("사업자 번호을 입력하세요.");
			 B_NO.focus();
			 return false;
		};
		if (AGENT == "") {
			 alert("대표자 이름을 입력하세요.");
			 AGENT.focus();
			 return false;
		};
		if (B_TYPE == "") {
			 alert("업종을 입력하세요.");
			 B_TYPE.focus();
			 return false;
		};
		if (C_DIV == "") {
			 alert("기업구분을 입력하세요.");
			 C_DIV.focus();
			 return false;
		};
		if (EMP_NUM == "") {
			 alert("근로자수을 입력하세요.");
			 EMP_NUM.focus();
			 return false;
		};
		
		var regHomePage = /(?:(?:https?|ftp|file):\/\/|www\.|ftp\.)(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[-A-Z0-9+&@#\/%=~_|$?!:,.])*(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[A-Z0-9+&@#\/%=~_|$])/igm;
		  		
		if (HOMEPAGE == "") {
			 alert("홈페이지을 입력하세요.");
			 HOMEPAGE.focus();
			 return false;
		};
		
		if (!regHomePage.test(HOMEPAGE)) {
			alert("올라른 홈페이지을 입력하세요");
			HOMEPAGE.focus();
			return false;
		};
		
		if (C_NAME == "") {
			 alert("회사명을 입력하세요.");
			 C_NAME.focus();
			 return false;
		};
		
		return user_submit();
	}
	
	function emp_submit() {
		var NAME = $('#ENAME').val();
		var RANK = $('#RANK').val();
		
		if (NAME == "") {
			 alert("이름을 입력하세요.");
			 NAME.focus();
			 return false;
		};
		if (RANK == "") {
			 alert("직급을 입력하세요.");
			 RANK.focus();
			 return false;
		};
		
		return user_submit();
	}
	
	function mag_submit() {
		var U_NAME = $('#M_U_NAME').val();
		var NAME = $('#MNAME').val();
		
		if (U_NAME == "") {
			 alert("대학교 이름을 입력하세요.");
			 U_NAME.focus();
			 return false;
		};
		
		if (NAME == "") {
			 alert("이름을 입력하세요.");
			 NAME.focus();
			 return false;
		};
		
		return user_submit();
	}
	
	 
    function userDel() {
    	if (confirm("༼ಢ_ಢ༽회원을 정말 탈퇴하실껀가요 ༼ಢ_ಢ༽ 	") == true){    //확인
    		 $('#del_form').submit(); //유효성 검사의 포인트
    	}else{   //취소
	   	    return false;

    	}
    }
</script>
    <style>
   		 #myPageW {
   		 	position: relative;
   		 	top: 30px;
            width: 900px;
            margin: 0 auto;
            height: auto;
        }
        #myPageBox *{
            margin-bottom: 10px;
        }
        #topTitle {
            width: 140px;
            height: 60px;
            background-color: rgb(0,93,197);
        }
        #myPageMain {
        	position: relative;
            top: 30px;
            width: 900px;
            height: auto;
            border: 1px solid;
            border-color: rgb(187,194,211);
        }
        sapn {
            font-size: 19px;
        }
        #myPageBox {
			position: relative;
            width: 800px;
            height: auto;
            left: 50px;
            top: 30px;
        }
        .btn-secondary {
        	width: 200px;
            height: 40px;
        	position: relative;
        	left: 140px;
            top: 50px;
        }
    </style>
</head>
<body>
<div id="myPageW">
<h2>회원정보 변경</h2>
	<form id="join_form" action="${contextPath}/member/myPageUpDate.do" method="post">
    <div id="topTitle"><p style="color: white; position: relative;left: 20px;top: 15px;"><strong>회원정보 변경</strong></p></div>
    <div id="myPageMain">
      <div id="myPageBox">
      <s:authorize access="hasRole('ROLE_USER')">
       <span><strong>이름<span style="color: orange;">*</span></strong>
       <input type="text" id="NNAME" name="NAME" style="border-radius: 5px;height: 30px" value="${member.NAME}" readonly></span>
       <input type="hidden" id="PWD" name="passwd" value="">
       <span style="position: absolute; right: 200px;"><strong>생년월일<span style="color: orange;">*</span></strong> <input type="text" style="border-radius: 5px;height: 30px" name="BIRTH" value="${member.BIRTH}" readonly></span>
       <hr><br>
       <span><strong>아이디<span style="color: orange;">*</span></strong><br>
       <input type="text" id="ID" name="ID" style="border-radius: 5px;height:40px; width: 280px;" value="${member.ID}" readonly></span><br>
       <span><strong>핸드폰번호<span style="color: orange;">*</span></strong><br>
       <input type="text" id="HP" name="HP" style="border-radius: 5px;height:40px; width: 280px;" value="${member.HP}"></span><br>
        <span><strong>이메일<span style="color: orange;">*</span></strong><br>
       <input type="text" id="EMAIL" name="EMAIL" style="border-radius: 5px;height:40px; width: 280px;" value="${member.EMAIL}" readonly></span><br>
       <span>구직여부</span><br>
       <input type="text" id="J_SEARCH" name="J_SEARCH" style="border-radius: 5px;height:40px; width: 280px;" value="${member.j_SEARCH}" readonly>
       <span>* 구직을 구할시 이력서 제출</span><br>
       <span>최종학력</span><br>
       <input type="text" id="LAST_EDU" name="LAST_EDU" value="${member.LAST_EDU}" style="border-radius: 5px;height:40px; width: 280px;"><br>
       <span>주소</span><br>
       <span><input type="text" id="ADDR" name="ADDR" style="border-radius: 5px;height:40px; width: 400px;" value="${member.ADDR}"></span><br>
       <details>
        <summary>주소 수정</summary>
           <input type="text"  id="sample6_postcode" placeholder="　우편번호" style="border-radius: 5px;height:40px; width: 280px;" readonly>	
           <input type="text" id="sample6_address" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　주소" readonly><br>
           <input type="text" id="sample6_detailAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　상세주소">
           <input type="text" id="sample6_extraAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　참고항목"><br>
           <input type="button" id="addrfocus" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        </details>
       </s:authorize>
       <s:authorize access="hasRole('ROLE_STU')">
       <span><strong>이름<span style="color: orange;">*</span></strong>
       <input type="text" id="SNAME" name="NAME" style="border-radius: 5px;height: 30px" value="${member.NAME}" readonly></span> 
       <span style="position: absolute; right: 200px;"><strong>생년월일<span style="color: orange;">*</span></strong> <input type="text" style="border-radius: 5px;height: 30px" name="BIRTH" value="${member.BIRTH}" readonly></span>
       <input type="hidden" id="PWD" name="passwd" value="">
       <hr><br>
       <span><strong>아이디<span style="color: orange;">*</span></strong><br>
       <input type="text" id="ID" name="ID" style="border-radius: 5px;height:40px; width: 280px;" value="${member.ID}" readonly></span><br>
       <span><strong>핸드폰번호<span style="color: orange;">*</span></strong><br>
       <input type="text" id="HP" name="HP" style="border-radius: 5px;height:40px; width: 280px;" value="${member.HP}"></span><br>
        <span><strong>이메일<span style="color: orange;">*</span></strong><br>
       <input type="text" id="EMAIL" name="EMAIL" style="border-radius: 5px;height:40px; width: 280px;" value="${member.EMAIL}" readonly></span><br>
       <span>대학교</span><br>
       <input type="text" id="U_NAME" name="U_NAME" value="${member.u_NAME}" style="border-radius: 5px;height:40px; width: 280px;"><br>
       <span>학과</span><br>
       <input type="text" id="DEPT" name="DEPT" value="${member.DEPT}" style="border-radius: 5px;height:40px; width: 280px;"><br>
       <span>MAC 주소</span><br>
       <input type="text" name="MAC_ADDR" value="${member.MAC_ADDR}" style="border-radius: 5px;height:40px; width: 280px;" readonly>
       <c:if test="${member.MAC_ADDR == null} ">
		<input class="btn btn-outline-secondary" type="button" onclick="mac_get()" value="맥정보가져오기">
		</c:if><br>
       <span>주소</span><br>
       <span><input type="text" id="ADDR" name="ADDR" style="border-radius: 5px;height:40px; width: 400px;" value="　${member.ADDR}" readonly></span><br>
       <details>
        <summary>주소 수정</summary>
           <input type="text"  id="sample6_postcode" placeholder="　우편번호" style="border-radius: 5px;height:40px; width: 280px;" readonly>
           <input type="text" id="sample6_address" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　주소" readonly><br>
           <input type="text" id="sample6_detailAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　상세주소">
           <input type="text" id="sample6_extraAddress" style="height:40px; width: 280px;" placeholder="　참고항목"><br>
           <input type="button" id="addrfocus" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        </details>
       </s:authorize>
       
       <s:authorize access="hasRole('ROLE_COM')">
       <span><strong>회사이름<span style="color: orange;">*</span></strong>
       <input type="text" id="C_NAME" name="C_NAME" value="${member.c_NAME}" style="border-radius: 5px;height: 30px"></span> 
       <span style="position: absolute; right: 200px;"><strong>회사홈페이지<span style="color: orange;">*</span></strong> <input id="HOMEPAGE" name="HOMEPAGE" value="${member.HOMEPAGE}" style="border-radius: 5px;height: 30px"></span>
       <input type="hidden" id="PWD" name="passwd" value="">
       <hr><br>
       <span><strong>아이디<span style="color: orange;">*</span></strong><br>
       <input type="text" id="ID" name="ID" style="border-radius: 5px;height:40px; width: 280px;" value="${member.ID}" readonly></span><br>
       <span><strong>핸드폰번호<span style="color: orange;">*</span></strong><br>
       <input type="text" id="HP" name="HP" style="border-radius: 5px;height:40px; width: 280px;" value="${member.HP}"></span><br>
        <span><strong>이메일<span style="color: orange;">*</span></strong><br>
       <input type="text" id="EMAIL" name="EMAIL" value="${member.EMAIL}" style="border-radius: 5px;height:40px; width: 280px;" readonly></span><br>
       <span><strong>사업자번호<span style="color: orange;">*</span></strong><br>
       <input type="text" id="B_NO" name="B_NO" style="border-radius: 5px;height:40px; width: 280px;" value="${member.b_NO}"></span><br>
       <span>대표자</span><br>
       <input type="text" id="AGENT" name="AGENT" style="border-radius: 5px;height:40px; width: 280px;" value="${member.AGENT}" style="height:40px; width: 280px;"><br>
       <span>업종</span><br>
       <input type="text" id="B_TYPE" name="B_TYPE" style="border-radius: 5px;height:40px; width: 280px;" value="${member.b_TYPE}" style="height:40px; width: 280px;"><br>
       <span>기업구분</span><br>
       <input type="text" id="C_DIV" name="C_DIV" style="border-radius: 5px;height:40px; width: 280px;" value="${member.c_DIV}" style="height:40px; width: 280px;"><br>
       <span>근로자수</span><br>
       <input type="text" id="EMP_NUM" name="EMP_NUM" value="${member.EMP_NUM}" style="border-radius: 5px;height:40px; width: 280px;"><br>
       <span>주소</span><br>
       <span><input type="text" id="ADDR" name="ADDR" style="border-radius: 5px;height:40px; width: 400px;" value="${member.ADDR}" readonly></span><br>
       <details>
        <summary>주소 수정</summary>
           <input type="text"  id="sample6_postcode" placeholder="　우편번호" style="border-radius: 5px;height:40px; width: 280px;" readonly>
           <input type="text" id="sample6_address" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　주소" readonly><br>
           <input type="text" id="sample6_detailAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　상세주소">
           <input type="text" id="sample6_extraAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　참고항목"><br>
           <input type="button" id="addrfocus" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        </details>
       </s:authorize>
       
       <s:authorize access="hasRole('ROLE_MAG')">
       <span><strong>대학교이름<span style="color: orange;">*</span></strong>
       <input type="text" id="M_U_NAME" name="U_NAME" style="border-radius: 5px;height: 30px" value="${member.u_NAME}" readonly></span> 
       <span style="position: absolute; right: 200px;"><strong>이름<span style="color: orange;">*</span></strong> <input type="text" style="height: 30px" id="MNAME" name="NAME" value="${member.NAME}"></span>
       <input type="hidden" id="PWD" name="passwd" value="">
       <hr><br>
       <span><strong>아이디<span style="color: orange;">*</span></strong><br>
       <input type="text" id="ID" name="ID" style="border-radius: 5px;height:40px; width: 280px;" value="${member.ID}" readonly></span><br>
       <span><strong>핸드폰번호<span style="color: orange;">*</span></strong><br>
       <input type="text" id="HP" name="HP" style="border-radius: 5px;height:40px; width: 280px;" value="${member.HP}"></span><br>
        <span><strong>이메일<span style="color: orange;">*</span></strong><br>
       <input type="text" id="EMAIL" name="EMAIL" style="border-radius: 5px;height:40px; width: 280px;" value="${member.EMAIL}" readonly></span><br>
       <span>주소</span><br>
       <span><input type="text" id="ADDR" name="ADDR" style="border-radius: 5px;height:40px; width: 400px;" value="${member.ADDR}" readonly></span><br>
       <details>
        <summary>주소 수정</summary>
           <input type="text"  id="sample6_postcode" placeholder="　우편번호" style="border-radius: 5px;height:40px; width: 280px;" readonly>	
           <input type="text" id="sample6_address" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　주소" readonly><br>
           <input type="text" id="sample6_detailAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　상세주소">
           <input type="text" id="sample6_extraAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　참고항목"><br>
           <input type="button" id="addrfocus" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        </details>
	   </s:authorize>
	   
       <s:authorize access="hasRole('ROLE_EMP')">
       <span><strong>이름<span style="color: orange;">*</span></strong>
       <input type="text" id="ENAME" name="NAME" style="border-radius: 5px;height: 30px" value="${member.NAME}" readonly></span> 
       <span style="position: absolute; right: 200px;"><strong>직급<span style="color: orange;">*</span></strong> <input type="text" style="border-radius: 5px;height: 30px" id="RANK" name="RANK" value="${member.RANK}"></span>
       <input type="hidden" id="PWD" name="passwd" value="">
       <hr><br>
       <span><strong>아이디<span style="color: orange;">*</span></strong><br>
       <input type="text" id="ID" name="ID" style="border-radius: 5px;height:40px; width: 280px;" value="${member.ID}" readonly></span><br>
       <span><strong>핸드폰번호<span style="color: orange;">*</span></strong><br>
       <input type="text" id="HP" name="HP" style="border-radius: 5px;height:40px; width: 280px;" value="${member.HP}"></span><br>
        <span><strong>이메일<span style="color: orange;">*</span></strong><br>
       <input type="text" id="EMAIL" name="EMAIL" style="border-radius: 5px;height:40px; width: 280px;" value="${member.EMAIL}" readonly></span><br>
       <span>주소</span><br>
       <span><input type="text" id="ADDR" name="ADDR" style="border-radius: 5px;height:40px; width: 400px;" value="${member.ADDR}" readonly></span><br>
       <details>
        <summary>주소 수정</summary>
           <input type="text"  id="sample6_postcode" placeholder="　우편번호" style="border-radius: 5px;height:40px; width: 280px;" readonly>	
           <input type="text" id="sample6_address" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　주소" readonly><br>
           <input type="text" id="sample6_detailAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　상세주소">
           <input type="text" id="sample6_extraAddress" style="border-radius: 5px;height:40px; width: 280px;" placeholder="　참고항목"><br>
           <input type="button" id="addrfocus" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        </details>
       </s:authorize>
       
       </div>
       </div>
       
       <s:authorize access="hasRole('ROLE_USER')">
       <input class="btn-secondary" type="button" value="변경하기" onclick="nuser_submit()"/>
       </s:authorize>
       <s:authorize access="hasRole('ROLE_STU')">
       <input class="btn-secondary" type="button" value="변경하기" onclick="stu_submit()"/>
       </s:authorize>
       <s:authorize access="hasRole('ROLE_COM')">
       <input class="btn-secondary" type="button" value="정보수정" onclick="com_submit()"/>
       </s:authorize>
       <s:authorize access="hasRole('ROLE_EMP')">
       <input class="btn-secondary" type="button" value="정보수정" onclick="emp_submit()"/>
	   </s:authorize>
       <s:authorize access="hasRole('ROLE_MAG')">
       <input class="btn-secondary" type="button" value="정보수정" onclick="mag_submit()"/>
       </s:authorize>
       </form>
       
       <input class="btn-secondary" type="button" value="비밀번호 변경" onclick=""/>
       <form id="del_form" action="${contextPath}/member/deleteMember.do" method="post">
       <input class="btn-secondary" type="button" value="탈퇴" onclick="userDel()"/>
       <input type="hidden" name="ID" value="${member.ID }"/>
       </form>
       </div>

</body>
</html>