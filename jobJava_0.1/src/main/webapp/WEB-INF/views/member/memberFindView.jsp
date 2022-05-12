<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function idFind() {
		var EMAIL = $('#idEmail').val();
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		  
		if(EMAIL == "") {
			alert('이메일을 먼저 입력해주세요.');
			$('#idEmail').focus();
	        return false;
		};
		if (!regEmail.test(EMAIL)) {
			alert("올라른 이메일을 입력하세요");
			$('#idEmail').focus();
			return false;
		};
		
		$.ajax({
			type: "GET",
			url: "${contextPath}/member/idFind.do", 
			data: {email : EMAIL},
			success: function(user_id) {
				$('#findId').text('아이디는 : ' + user_id)
			}
		});
		
	}
	
	function pwFind() {
		var EMAIL = $('#pwEmail').val();
		var ID = $('#id').val();
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		if(ID == "") {
			alert('아이디을 먼저 입력해주세요.');
			$('#id').focus();
	        return false;
		};
		
		if(EMAIL == "") {
			alert('이메일을 먼저 입력해주세요.');
			$('#pwEmail').focus();
	        return false;
		};
		if (!regEmail.test(EMAIL)) {
			alert("올라른 이메일을 입력하세요");
			$('#pwEmail').focus();
			return false;
		};
		
		$.ajax({
			type: "POST",
			url: "${contextPath}/mail/findPwCertiMail.do", 
			data: {email : EMAIL,
				id : ID},
			success: function(lot) {
				if(lot == 'FALSE') {
					alert("아이디 혹은 이메일이 잘못되었습니다.");
					$('#id').focus();
					return false;
				}
				if(lot == 'TRUE') {
					alert("이메일로 코드를 전송했습니다.");
					$('#code').focus();
					$.ajax({
						type: "GET",
						url: "${contextPath}/mail/certiMail.do", 
						data: {email : EMAIL},
						success: function(code) {
							$('#codecke').val(code);
						}
					});
				}
				
				}
			});
		}
		
	
	function codeCheck() {
		var Code = $("#code").val();
		var CodeCke = $("#codecke").val();
		
		if (Code == "") {
			alert('코드을 먼저 입력해주세요.');
			$('#code').focus();
	        return false;
		}

		if (Code != CodeCke) {
	          alert('입력하신 코드가 다릅니다.');
	          $('#code').focus();
	          return false;
	    };
	    
	    alert('임시비밀번호를 이메일로 전송했습니다. 잠시만 기다려주세요.');
	    $("#id").attr("readonly",true);
	    $("#pwEmail").attr("readonly",true);
	    $("#code").attr("readonly",true);

	 	let f = document.createElement('form');
	    let obj;
	    let obj1;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'ID');
	    obj.setAttribute('value', $('#id').val());
	    obj1 = document.createElement('input');
	    obj1.setAttribute('type', 'hidden');
	    obj1.setAttribute('name', 'EMAIL');
	    obj1.setAttribute('value', $('#pwEmail').val());
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '${contextPath}/mail/pwdChange.do');
	    document.body.appendChild(f);
	    f.submit();
	    
	}

</script>
<style>
	#box {
      width: 1600px;
      height: 500px;
      margin: 0 auto;
    }
    #topbox{
            width: 1400px;
            height: 240px;
            margin: 0 auto;
            margin-top: 100px;
    }
    .box {
            margin-bottom: 100px;
            margin-left: 200px;
            width: 500px;
            height: 300px;
            border: 1px solid rgb(253,131,82);
            float: left;
    }
    .mbox {
        	width: 1400px;
        	margin-top: 50px;
    }
</style>
</head>
<body>
<div id="box">
<div id="topbox">
<h3>본인인증</h3>
회원의 개인정보보호를 위해 인증을 거쳐 회원가입을 하고 있습니다.<br>
원하시는 본인인증 방법을 선택해주세요.<br>
<hr>
<h3>본인인증방법 선택</h3>
</div>
<div class="box">
       		<div class="mbox">
       		<h4>아이디 찾기</h4>
       		<input type="text" id="idEmail"><input class="btn-secondary" type="button" value="아이디찾기" onclick="idFind()"/><br>
       		<span id="findId"></span>
            </div>
        </div>
        <div class="box">
       		<div class="mbox">
       		<h4>비밀번호 찾기</h4>
       		아이디 : <input type="text" id="id"/><br>
       		이메일 : <input type="text" id="pwEmail"/><input class="btn-secondary" type="button" value="인증코드전송" onclick="pwFind()"/><br>
       		인증코드 : <input type="text" id="code"/><input class="btn-secondary" type="button" value="코드확인" onclick="codeCheck()"/>
       		<input id="codecke" type="hidden"/>
            </div>
        </div>
</div>
</body>
</html>