<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
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
        .register .flex .container .item .idcheck:hover{
            background: white;
            color: #2b2e4a;
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
        .register .submit:hover{
            width: 100%;
            height: 40px;
            border: none;
            border: 1px solid #2b2e4a;
            color: #2b2e4a;
            background: white;
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
	<form action="${contextPath}/member/signUp.do" method="post">
	<div class="flex">
		<ul class="container">
			<li class="item center">
				아이디
			</li>
			<li class="item">
				<input type="text" name="ID" placeholder="아이디를 입력하세요.">
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
				<input type="password" name="PWD" placeholder="비밀번호를 입력하세요.">
			</li>                   
		</ul>
		<ul class="container">
			<li class="item center">
				비밀번호확인
			</li>
			<li class="item">
				<input type="password" placeholder="비밀번호를 입력하세요." required>
			</li>
			<li class="item">
            </li>
		</ul>
		<ul class="container">
			<li class="item center">
				핸드폰번호
			</li>
			<li class="item">
				<input type="text" name="HP" placeholder="핸드폰번호를 입력하세요."/>
			</li>
			<li class="item">                      	
			</li>
		</ul>
		<ul class="container">
			<li class="item center">
				주소
			</li>
			<li class="item">
				<input type="text" name="ADDR" placeholder="주소를 입력하세요."/>
			</li>
			<li class="item">                      	
			</li>
		</ul>
				<ul class="container">
			<li class="item center">
				이메일
			</li>
			<li class="item">
				<input type="text" name="EMAIL" placeholder="이메일를 입력하세요."/>
			</li>
			<li class="item">                      	
			</li>
		</ul>
		
		<ul class="container">
			<li class="item center">
				권한
			</li>
			<li class="item">
				학생 : <input type="radio" name="AUTHORITY" value="ROLE_STU">
			</li>
			<li class="item">
				일반 : <input type="radio" name="AUTHORITY" value="ROLE_USER">
			</li>
			<li class="item">
			</li>
		</ul>
		<ul class="container">
			<li class="item center">
			</li>
			<li class="item">
				<button class="submit">가입하기</button>
			</li>
			<li class="item">
			</li>
		</ul>
	</div>
	</form>
</div>
</body>
</html>