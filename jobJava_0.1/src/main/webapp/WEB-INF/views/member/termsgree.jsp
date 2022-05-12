<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script>
    	function allCheck(){
    		$("#check1").prop("checked" ,true);
    		$("#check2").prop("checked" ,true);
    	}
    	
    	function goCertification(){
    		var checkd1 = $("#check1").is(':checked');

    		if(!checkd1){
    			alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
    			$("#check1").focus();
    			return false;
    		}
    		var checkd2 = $("#check2").is(':checked');
    		if(!checkd2){
    			alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
    			$("#check2").focus();
    			return false;
    		}
    		
    		let f = document.createElement('form');
    	    let obj;
    	    obj = document.createElement('input');
    	    obj.setAttribute('type', 'hidden');
    	    obj.setAttribute('name', 'check');
    	    obj.setAttribute('value', 'checkAll');
    	    f.appendChild(obj);
    	    f.setAttribute('method', 'post');
    	    f.setAttribute('action', '${contextPath}/member/signUpTestView.do');
    	    document.body.appendChild(f);
    	    f.submit();
    	}
    
    </script>
    <style>
        #box {
            width: 1150px;
            height: auto;
            margin: 0 auto;
            margin-bottom: 100px;
            margin-top: 60px;
            
        }
    
    </style>
</head>
<body>
   <div id="box">
    <h4>회원가입 약관, 개인정보수집 및 이용목적, 고유식별정보 이용목적에 모두 동의합니다.
    <span style="float: right">모두 동의함 <input type="checkbox" id="allCheck" onclick="allCheck()"/></span></h4><br>
    <hr>
    <h2><span style="color: blue">[필수]</span> 회원가입 약관</h2><br><br>
    <div style="overflow:auto; width:1150px; height:500px; border: 1px solid; padding:26px;">
      <br>
       <h3>제1장 총 칙</h3><br>
        &nbsp;제 1 조 (약관의 적용) <br>
        
        &nbsp;&nbsp;대전일자리경제진흥원 인터넷 서비스(이하"서비스"라 합니다)의 이용에는 기본<br>
        &nbsp;&nbsp;이용약관(이하"기본약관"이라 합니다)과 이 약관을 함께 적용합니다.<br><br>
        &nbsp;제 2 조 (용어의 정의)<br>
        &nbsp;&nbsp;이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
        &nbsp;&nbsp;운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람<br>
        &nbsp;&nbsp;해지 : 회사 또는 회원이 서비스 사용 후 이용계약을 해약하는 것<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 : 회사와 서비스 이용계약을 체결하고 이용자 ID를 부여받은 자<br>
        &nbsp;&nbsp;회사: 서비스의 제공자인 대전일자리경제진흥원<br><br>
        &nbsp;제 3 조 (이용계약의 성립)<br>
        &nbsp;&nbsp;서비스 가입 신청시 본 약관을 읽고 "동의함" 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.<br>
        &nbsp;&nbsp;이용계약은 서비스 이용희망자의 이용약관 동의 후 이용신청에 대하여 회사가 승낙함으로써 성립합니다.<br><br>
        &nbsp;제 4 조 (계약사항의 변경)<br>
        &nbsp;&nbsp;회원은 개인정보관리를 통해 언제든지 개인정보를 열람하고 수정할 수 있습니다.<br>
        &nbsp;&nbsp;회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인으로 수정을 해야 하고 미변경으로 인하여 발생되는 문제의 책임은 회원에게 있습니다.<br><br>
        &nbsp;제 5 조 (정보의 제공)<br>
        &nbsp;&nbsp;회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 회원에게 제공할 수 있습니다.<br><br>
        &nbsp;제 6 조 (요금 및 유료정보 등)<br>
        &nbsp;&nbsp;회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 별도의 유료정보에 대해서는 해당 정보에 명시된 요금에 대한 지불을 동의하여야 사용이 가능합니다.<br><br>
        &nbsp;제 7 조 (광고게재 및 광고주와의 거래)<br>
        &nbsp;&nbsp;회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다.<br>
        &nbsp;&nbsp;서비스를 이용하고자 하는 자는 서비스 이용시 노출  되는 광고게재에 대해 동의하는 것으로 간주됩니다.<br>
        &nbsp;&nbsp;회사는 본 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는<br>
        &nbsp;&nbsp;거래의 결과로서 발생하는 모든 손실 또는 손해에 대  해 책임을 지지 않습니다.<br><br>
        &nbsp;제 8 조 (서비스 이용시간)<br>
        &nbsp;&nbsp;서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다.<br>
        &nbsp;&nbsp;다만 정기 점검 등의 필요로 회사가 정한 날이나 시  간은 그러하지 않습니다.<br>
        &nbsp;&nbsp;회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다.<br>
        &nbsp;&nbsp;이 경우 그 내용을 사전에 공지합니다. 회사가 제공하는 서비스는 기본적으로 무료입니다.<br>
        &nbsp;&nbsp;단, 별도의 유료정보에 대해서는 해당 정보에 명시된 요금에 대한 지불을 동의하여야 사용이 가능합니다.<br><br>
        &nbsp;제 9 조 (서비스 이용 책임)<br>
        &nbsp;&nbsp;회원은 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를<br>
        &nbsp;&nbsp;이용하여 상품을 판매하는 영업활동을 할 수 없으  며 특히 해킹, 돈벌이 광고, 음란사이트를 통한 상업행위,<br>
        &nbsp;&nbsp;상용S/W 및 저작권 자료의 불법배포 등을 할 수 없습니다.<br>
        &nbsp;&nbsp;이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치등에 관해서는 회사가 책임을 지지 않습니다.<br><br>
        &nbsp;제 10 조 (계약해지 및 이용제한)<br>
        &nbsp;&nbsp;회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인, 우편, 방문 및 전화를 통해 회사에 해지 신청을 하여야 합니다.<br>
        &nbsp;&nbsp;회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.<br>
        &nbsp;&nbsp;다만, 이용계약을 해지하는 경우에는 회원에게 이를 통지하고, 이용계약 해지 전에 소명할 기회를 부여합니다.<br>
        &nbsp;&nbsp;가. 타인의 서비스 ID 및 비밀번호를 도용한 경우<br>
        &nbsp;&nbsp;나. 서비스 운영을 고의로 방해한 경우<br>
        &nbsp;&nbsp;다. 가입한 이름이 실명이 아닌 경우<br>
        &nbsp;&nbsp;라. 같은 사용자가 다른 ID로 이중등록을 한 경우<br>
        &nbsp;&nbsp;마. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우<br>
        &nbsp;&nbsp;바. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우<br>
        &nbsp;&nbsp;사. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우<br>
        &nbsp;&nbsp;아. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우<br>
        &nbsp;&nbsp;자. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우<br>
        &nbsp;&nbsp;차. 회사, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우<br>
        &nbsp;&nbsp;카. 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은 경우<br>
        &nbsp;&nbsp;타. 타인의 개인정보, 이용자ID 및 비빌번호를 부정하게 사용하는 경우<br>
        &nbsp;&nbsp;파. 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우<br>
        &nbsp;&nbsp;하. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트 링크하는 경우<br>
        &nbsp;&nbsp;거. 본 약관 제8조 및 제9조를 위반한 경우<br>
        &nbsp;&nbsp;너. 기타 서비스 이용계약상의 의무를 위반한 경우<br><br>
        &nbsp;제 11 조 (손해배상의 범위)<br>
        &nbsp;&nbsp;회사의 귀책사유로 이용자가 서비스를 이용하지 못하는 경우에는 이용자가 그 사실을 회사에 통보하여 확인한 때<br>
        &nbsp;&nbsp;(그 전에 회사가 그 사실을 알았거나 알수 있게  된 때)로부터 계속 4시간이후의 서비스 중지시간에 대하여 기본이용료를<br>
        &nbsp;&nbsp;포함한 최근 3개월(3개월 미만인 경우는 해당기간 적용)의 1일 평균요금에 서비스제공 중  지시간을 24로 나눈 수를<br>
        &nbsp;&nbsp;곱하여 산출한 금액의 3배를 배상 합니다. 이 경우 단수가 1시간 미만인 경우에는 1시간으로 합니다.<br>
        &nbsp;&nbsp;회사가 제공하는 서비스중 무료 서비스의 경우에는 손해배상에 해당되지 않습니다.<br>
        &nbsp;&nbsp;회사는 그 손해가 천재지변 등 불가항력이거나 이용자의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 아니합니다.<br><br>
        &nbsp;제 12 조 (손해배상의 청구)<br>
        &nbsp;&nbsp;손해배상 청구는 회사에 청구사유, 청구금액 및 산출근거를 기재하여 전화 및 서면으로하여야 하며 그 사유가 발생한<br>
        &nbsp;&nbsp;날로부터 6개월이 경과한 경우에는 소멸합니 다.<br>
        &nbsp;&nbsp;제10조의 서비스 이용정지 사유중 회사 및 타인에게 피해를 주어 피해자의 고발 또는 소송제기로 인하여<br>
        &nbsp;&nbsp;손해배상을 청구할 경우 그 사유를 제공한 자는 이에 응하여야 합니다.<br><br>
        &nbsp;제 13 조 (면책)<br>
        &nbsp;&nbsp;회사는 천재지변 또는 이에 준하는 불가항력으로 서비스를 제공할 수 없는 경우와 서비스의 효율적 제공을<br>
        &nbsp;&nbsp;위한 시스템 개선 공사, 장비 증설 및 상향공사 등 계획공사의 사유로 고객에게 사전 통보한 경우에는 책임을 면합니다.<br>
        &nbsp;&nbsp;자유게시판 서비스의 경우 각 게시판에 게재된 데이터의 보존 책임이 없습니다.<br>
        &nbsp;&nbsp;회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 면합니다.<br>
        &nbsp;&nbsp;회사는 이용자가 서비스를 통해 얻은 정보 또는 자료 등으로 인해 발생한 손익,서비스를<br>
        &nbsp;&nbsp;이용하거나 할 것으로부터 발생하거나 기대하는 손익 등에 대하여 책임을 면합니다.<br>
        &nbsp;&nbsp;회사는 이용자가 게시 또는 전송한 자료의 내용에 관하여는 책임을 면합니다.<br>
        &nbsp;&nbsp;약관의 적용은 이용자에 한하며, 제3자로 부터의 어떠한 배상, 클레임 등에 대하여 회사는 책임을 면합니다.<br>
        &nbsp;&nbsp;회사는 자유게시판 서비스를 무료로 사용하는 이용자들에게 회사의 귀책 사유로 서비스를 제공하지 못하는 경우 책임을 면합니다.<br>
        &nbsp;&nbsp;자유게시판 서비스와 같이 이용자 자신이 서비스를 개설하고 회원을 모집하여 관리하는 경우 개설한 이용자와<br>
        &nbsp;&nbsp;해당 서비스에 회원으로 가입한 이용자간의 각종 법규위반 및 금지 행위로 인한 문제에 대한 책임은 이용자간에 있으며 회사는 책임을 면합니다.<br><br>
        &nbsp;제 14 조 (관할법원)<br>
        &nbsp;&nbsp;요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지 법원을 관할법원으로 합니다.<br><br>
        &nbsp;[부칙]<br>
        &nbsp;&nbsp;이 약관은 2019년 3월 1일부터 시행합니다.
    </div><br>
    <spen style="float: right">동의함<input id="check1" type="checkbox"></spen>
    <br><br><br>
    <h2><span style="color: blue">[필수]</span> 개인정보수집 및 이용목적 동의</h2><br><br>
    <div style="overflow:auto; width:1150px; height:500px; border: 1px solid; padding:26px;">
      <br>
       <h3>제 1조. 개인정보의 처리목적</h3><br>
       &nbsp;① 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,<br>
       &nbsp;이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br><br>
       &nbsp;&nbsp;1. 서비스 제공<br>
       &nbsp;&nbsp;&nbsp;회원 가입 본인인증, 회원 서비스 제공에 따른 본인 식별·인증, 신고 및 불편접수 처리 등을 목적으로 개인정보를 처리합니다.<br><br>
       &nbsp;② 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.<br><br>
       <table class="table" style="width: 1050px">
          <thead>
            <tr>
              <th scope="col">순번</th>
              <th scope="col">개인정보파일의명칭</th>
              <th scope="col">운영근거</th>
              <th scope="col">개인정보파일에<br>
                기록되는 개인정보의 항목</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>1</th>
              <th>회원정보 DB</th>
              <th>회원 서비스이용</th>
              <th>이름, 생년월일, 아이디, 비밀번호,휴대폰, 주소</th>
            </tr>
          </tbody>
        </table>
        <h3>제 2조. 개인정보의 처리 및 보유기간</h3>
        &nbsp;① 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.<br>
        &nbsp;② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br><br>
        <table class="table" style="width: 1050px">
          <thead>
            <tr>
              <th scope="col">순번</th>
              <th scope="col">개인정보파일의명칭</th>
              <th scope="col">운영근거</th>
              <th scope="col">개인정보파일에<br>
                기록되는 개인정보의 항목</th>
              <th scope="col">보유기간</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>1</th>
              <th>회원정보 DB</th>
              <th>정보주체 동의</th>
              <th>이름, 생년월일, 아이디, 비밀번호,휴대폰, 주소</th>
              <th>회원탈퇴시까지</th>
            </tr>
          </tbody>
        </table>
    </div>
    <br>
    <spen style="float: right">동의함<input id="check2" type="checkbox"></spen>
    <br>
    <button style="margin-left: 480px; width: 200px; height: 50px;" class="btn btn-secondary" type="button" onclick="goCertification()">가입하기</button>
    </div>
</body>
</html>