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
    var msg = "${msg}"
    window.onload = function() {
    	if(msg == 1) {
    		alert("이미 존재하는 이메일 입니다.");
    	}
    }
    
    function openPop() {
        document.getElementById("popup_layer").style.display = "block";
    }
        
    function closePop() {
        document.getElementById("popup_layer").style.display = "none";
    }
    
	function emailCode() {
		var email = $('#e-text').val();
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		  
		if(email == "") {
			alert('이메일을 먼저 입력해주세요.');
	        return false;
		};
		if (!regEmail.test(email)) {
			alert("올라른 이메일을 입력하세요");
			EMAIL.focus();
			return false;
		}else{
			alert("이메일로 코드를 전송했습니다.");	
		};
		
		
		
		$.ajax({
			type: "GET",
			url: "${contextPath}/mail/certiMail.do", 
			data: {email : email},
			success: function(code) {
				$('#codecke').val(code);
			}
		});
	}
	
	function codeCke() {
		var Code = $("#code").val();
		var CodeCke = $("#codecke").val();
		var email = $('#e-text').val();
		if(email == "") {
			alert('이메일을 먼저 입력해주세요.');
	        return false;
		}
		
		if (Code == "") {
			alert('코드을 입력해주세요.');
	        return false;
		}
		
		if (Code != CodeCke) {
	          alert('입력하신 코드가 다릅니다.');
	          return false;
	    };
	    var email = $('#e-text').val();
	    let f = document.createElement('form');
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'email');
	    obj.setAttribute('value', email);
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '${contextPath}/member/signUpView.do');
	    document.body.appendChild(f);
	    f.submit();
	   
	}
    
    </script>
    <style>
        #box {
            width: 1600px;
            height: 500px;
        }
        .box {
            margin-top: 100px;
            margin-bottom: 100px;
            margin-left: 300px;
            width: 500px;
            height: 400px;
            border: 1px solid rgb(253,131,82);
            float: left;
        }
        .mbox {
        	width: 1400px;
        	margin-top: 50px;
        }
        
        .mbox > img{
        	width: 170px;
        	height: 170px;
        	margin-left: 155px;
        	margin-bottom: 30px;
        }
        .mbox > span{
       		margin-left: 180px;
        }
        .btn{
        	margin-top: 20px;
        	margin-left: 90px;
            width: 300px;
            height: 60px;
            border: 0;
            border-radius: 40px;
            background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
            color: white;
        }
        p input {
            border: 0;
            margin-top: 20px;
        }
        	
        /*popup*/
        .popup_layer {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.4); }
        /*팝업 박스*/
        .popup_box{position: relative;top:50%;left:50%; overflow: auto; height: 600px; width:375px;transform:translate(-50%, -50%);z-index:1002;box-sizing:border-box;background:#fff;box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-webkit-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);-moz-box-shadow: 2px 5px 10px 0px rgba(0,0,0,0.35);}
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
<div id='box'>
        <div class="box">
       		<div class="mbox">
        	<img src="${contextPath}/resources/image/ico_sign_phone02.png"/><br>
       		<span><strong>휴대폰인증 인증</strong><br></span>
            <input class="btn" type="button" value="휴대폰인증" />
            </div>
        </div>
        <div class="box">
        	<div class="mbox">
       		<img src="${contextPath}/resources/image/ico_sign_email.png"/><br>
       		<span>&nbsp;&nbsp;<strong>이메일 인증</strong><br></span>
            <input class="btn" type="button" value="인증하기" onclick="openPop()"/>
            </div>
        </div>
    </div>
    
    <div class="popup_layer" id="popup_layer" style="display: none;">
      <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <h3> 이메일 인증</h3>
          <hr>
         <h4> 이메일을 입력해주세요</h4><br>
          <input id="e-text" type="text" placeholder="　****@naver.com"/>
          <input class="btn-secondary" type="button" value="코드전송" onclick="emailCode()"/><br><br>
          <input id="code" type="text" placeholder="　인증코드입력" />
          <input id="codecke" type="hidden" value="dd"/>
          <input class="btn-secondary" type="button" value="코드확인" onclick="codeCke()"/>

      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn" style="float: bottom; margin-top: 200px;">
          <a href="javascript:closePop();">닫기</a>
      </div>
  </div>
</div>

</body>
</html>