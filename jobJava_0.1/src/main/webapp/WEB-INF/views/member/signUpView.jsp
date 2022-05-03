<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<script>
function joinform_check() {
	  //변수에 담아주기
	  var ID = document.getElementById("ID");
	  var PWD = document.getElementById("PWD");
	  var REPWD = document.getElementById("REPWD");
	  var HP = document.getElementById("HP");
	  var ADDR = document.getElementById("ADDR");
	  var EMAIL = document.getElementById("EMAIL");

	  if (ID.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	    alert("아이디를 입력하세요.");
	    //ID.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
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
          alert('입력된 값은 휴대전화번호입니다.');
          return false;
      };
      
	  if (ADDR.value == "") {
		    alert("주소를 입력하세요.");
		    ADDR.focus();
		    return false;
	  };

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
	}

	//우편번호 검색 팝업창(현재 공백문서)
	function search_address() {
	  window.open("", "b", "width=600, height=300, left=200, top=100");
	}

</script>
<style>
ul,
li {
  list-style: none;
}
a {
  text-decoration: none;
  color: inherit;
}        
.register{
            width: 550px;
            margin: 0 auto;
            padding: 15px 20px;
            background: white;
            color: #2b2e4a;
            font-size: 14px;
            text-align: left;
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
        }
        .register h3{
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .register input{
            width: 100%;
            height: 40px;
            outline: none;
            padding: 10px;
            border: 1px solid #707070;
            transition: 0.3s;
        }
        .register input:valid, .register input:focus{
            border: 1px solid #2b2e4a;
        }
        .register .center{
            display: flex;
            align-items: center;
        }
        .register .flex{
            display: flex;
            flex-direction: column;
        }
        .register .flex .container{
            display: grid;
            grid-template-columns: 1fr 3fr 1fr;
            margin-bottom: 10px;
        }
        .register .flex .container .item:first-child{
           margin-right: 10px;
        }
        .register .flex .container .item .idcheck{
            height: 100%;
            margin-left: 10px;
            padding: 5px 15px;
            background: #2b2e4a;
            border: 1px solid #2b2e4a;
            color: white;
            font-size: 12px;
            transition: 0.3s;
        }
        .register .flex .container .item select{
            height: 40px;
            padding: 10px;
            border: 1px solid #2b2e4a;
        }
        .register .submit{
            width: 100%;
            height: 40px;
            color: white;
            border: none;
            border: 1px solid #2b2e4a;
            background: #2b2e4a;
            transition: 0.3s;
        }
        .register .flex .container:last-child{
            margin: 0;
        }


</style>

</head>
<body>
<!-- 
<h1>
	회원가입
</h1>
<div id="singup">

<form action="${contextPath}/member/signUp.do" method="post">
	<h4>ID</h4>
	<input type="text" name="ID"><br>
	<h4>PW</h4>
	<input type="password" name="PWD"><br>
	<input type="hidden" name="HP" value="010-1111-2222"/>
	<input type="hidden" name="ADDR" value="주소테스트"/>
	<input type="hidden" name="EMAIL" value="test@test.com"/>
	학생 : <input type="radio" name="AUTHORITY" value="ROLE_STU">
	일반 : <input type="radio" name="AUTHORITY" value="ROLE_USER"><br>
	<input type="submit" value="회원등록">
 -->	
<div class="register">
	<h3>회원가입</h3>
	<form name="join_form" action="${contextPath}/member/signUp.do" method="post">
	<div class="flex">
		<ul class="container">
			<li class="item center">
				아이디
			</li>
			<li class="item">
				<input type="text" id="ID" name="ID" placeholder="아이디를 입력하세요.">
			</li>
			<li class="item">
				<button class="idcheck">중복확인</button>
			</li>
			<li class="item">
			</li>
		</ul>
		<ul class="container">
			<li class="item center">
				비밀번호
			</li>
			<li class="item">
				<input type="password" id="PWD" name="PWD" placeholder="비밀번호를 입력하세요.">
			</li>                   
		</ul>
		<ul class="container">
			<li class="item center">
				비밀번호확인
			</li>
			<li class="item">
				<input type="password" placeholder="비밀번호를 입력하세요."  id="REPWD">
			</li>
			<li class="item">
            </li>
		</ul>
		<ul class="container">
			<li class="item center">
				핸드폰번호
			</li>
			<li class="item">
				<input type="text" id="HP" name="HP" placeholder="핸드폰번호를 입력하세요."/>
			</li>
			<li class="item">                      	
			</li>
		</ul>
		<ul class="container">
			<li class="item center">
				주소
			</li>
			<li class="item">
				<input type="text" id="ADDR" name="ADDR" placeholder="주소를 입력하세요."/>
			</li>
			<li class="item">                      	
			</li>
		</ul>
				<ul class="container">
			<li class="item center">
				이메일
			</li>
			<li class="item">
				<input type="text" id="EMAIL" name="EMAIL" placeholder="이메일를 입력하세요."/>
			</li>
			<li class="item">                      	
			</li>
		</ul>
		
		<ul class="container">
			<li class="item center">
				권한
			</li>
			<li class="item">
				학생 : <input type="radio" id="AUTHORITY" name="AUTHORITY" value="ROLE_STU">
			</li>
			<li class="item">
				일반 : <input type="radio" id="AUTHORITY" name="AUTHORITY" value="ROLE_USER">
			</li>
			<li class="item">
			</li>
		</ul>
		<ul class="container">
			<li class="item center">
			</li>
			<li class="item">
				<button class="submit" type="button" onclick="joinform_check()">가입하기</button>
			</li>
			<li class="item">
			</li>
		</ul>
	</div>
	</form>
</div>
</body>
</html>