<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="USER_ID">
<s:authentication property="name" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
  		input {
  			background-color:transparent;
			border : 0px solid transparent;
  		}
        #tableTotal {
        	position: relative;
        	top: 50px;
            width: 1140px;
            height: auto;
            margin: 0 auto;
        }
        
        #title {
            position: relative;
            width: 1140px;
            height: 60px;
            background: rgb(244,245,249);
            border-top: 1.5px solid rgb(83,90,117);
            border-bottom: 1px solid rgb(213,213,219);
        }
        #title input{
            position: absolute;
            font-size: 20px;
        }
            
        #nameDate {
            position: relative;
            width: 1140px;
            height: 100px;
            border-top: 3px solid rgb(83,90,117);
            border-bottom: 1px solid rgb(213,213,219);
        }
        
        #nameDate table{
            width: 1140px;
            height: 100px;
        }
        #nameDate table{
            border-collapse: collapse;
        }
        #nameDate tr,td{
            border: 1px solid black;
            border-collapse: collapse;
        }
        #content{
            position: relative;
            width: 1140px;
            top: 30px;
            height: auto;
            text-align: center;
        }
        #answer{
        	width: 1140px;
        	height: auto;
        }
        
        #answer table{
        	width: 1140px;
        	height: 100px;
            border-collapse: collapse;
        }
        #answer tr,td{
            border: 1px solid black;
            border-collapse: collapse;
       }
</style>

<script>
 function deleteTable(EMP_CON_NO) {
	 location.href="${contextPath}/board/employmentDeleteTable.do?EMP_CON_NO="+EMP_CON_NO;
	 
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
		$('#join').submit();
	}
</script>
</head>
<body>

<div id="tableTotal">
	<h1>질의응답 테이블</h1><br>
	<form id="join" action="${contextPath}/board/upDateonlineTable.do" method="post">
        <div id="title">
        	<c:choose>
	           	<c:when test="${employment.ID == USER_ID}">
            <span><strong><input type="text" id="TITLE" name="TITLE" value="${employment.TITLE }"></strong></span>
            	</c:when>
            	<c:otherwise>
            <span><strong><input type="text" id="TITLE" name="TITLE" value="${employment.TITLE }" disabled></strong></span>
            	</c:otherwise>
            </c:choose>
        </div>
        <br>
        <div id="nameDate">
            <table>
                <tr>
                    <td style="width: 228px;text-align: center;background: rgb(244,245,249);">작성자</td>
                    <td style="width: 340px;">　<input type="text" name="ID" value="${employment.ID}" readonly></td>
                    <td style="width: 228px;text-align: center;background: rgb(244,245,249);">등록일</td>
                    <td style="width: 340px;">　<input type="text" name="ID" value="${employment.EC_DATE}" readonly></td>
                </tr>
                <tr>
                    <td style="width: 228px;text-align: center;background: rgb(244,245,249);">첨부파일</td>
                    <td colspan="3"></td>
                </tr>
            </table>
        </div>
        <div id="content">
        	<c:choose>
	           	<c:when test="${employment.ID == USER_ID}">
            <span><input type="text" id="CONTENT" name="CONTENT" value="${employment.CONTENT }"></span>
            	</c:when>
            	<c:otherwise>
            <span><input type="text" id="CONTENT" name="CONTENT" value="${employment.CONTENT }" disabled></span>
            	</c:otherwise>
            </c:choose>
            <br><br><br><br>
            <hr>
            <br><br><br><br>
        </div>
        <input type="hidden" name="online_NO" value="${employment.EMP_CON_NO}">
        <div id="answer">
			<c:if test="${employment.ID == USER_ID}">
				<c:if test="${not empty employment.RESPON}">
				<table>
					<tr>
					 <td style="width: 228px;text-align: center;background: rgb(244,245,249);">답변자</td>
  					 <td><input type="text" value="　　${employment.ANSWER }" disabled></td>
  					 
  					</tr>
  					<tr>
  						<td style="width: 228px;text-align: center;background: rgb(244,245,249);">답변내용</td>
  						<td><input type="text" value="　　${employment.RESPON }" disabled></td>
  					</tr>
  				</table>
  				</c:if>
  				<br>
  				 		<button class="btn btn-secondary" type="button" onclick="joinform_check()">수정</button>
  				 		<button class="btn btn-secondary" type="button" onclick="deleteTable(${employment.EMP_CON_NO})">삭제</button>
  				<hr><br><br><br>
			</c:if>
			<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMP')">
			<table>
					<tr>
					 <td style="width: 228px;text-align: center;background: rgb(244,245,249);">답변자</td>
					 <td><input type="text" value="　　${employment.RESPON }"></td>
  					 
  					</tr>
  					<tr>
  						<td style="width: 228px;text-align: center;background: rgb(244,245,249);">답변내용</td>
  						<td><input type="text" value="${employment.ANSWER }" name="ANSWER"></td>	
  					</tr>
  			</table>
  				<br>
  						<input type="hidden" name="RESPON" value="${pageContext.request.userPrincipal.name}"/>	
  				 		<button class="btn btn-secondary" type="button" onclick="joinform_check()">수정</button>
  				 		<button class="btn btn-secondary" type="button" onclick="deleteTable(${employment.EMP_CON_NO})">삭제</button>
  				<hr><br><br><br>
			</s:authorize>
		</div>
        </form>
    </div>


</body>
</html>