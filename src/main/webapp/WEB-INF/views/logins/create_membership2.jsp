<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/common.jsp" %>
<%@ include file="../includes/login/NewFile1.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="resources" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./myTooltip.css"> <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <script src="./myTooltip.js"></script>

출처: https://gongcha.tistory.com/38 [웹/앱 개발자 블로그 ]
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Login &amp; Register Templates</title>
<script type="text/javascript">
	function checkForm() {
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!document.newMember.email.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		
		if (!regEmail.test(document.newMember.email.value)) {
            alert("이메일 형식이 올바르지 않습니다");         
            return false;
      }	

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if (!pwdCheck.test(document.newMember.password.value)) {
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");		  
		    return false;
		  }
		


	
		
		
	}
	
	
	
	
	
	
	isNull = function(object) { 
		try { 
			
			if (typeof object == "boolean"){ 
				return false; 
			} else { 
				return (object == null || typeof object == "undefined" || object === "" || object == "undefined"); 
				} 
			} catch (e) {
				alert("isNull: " + object +"::"+ e.message);
				WebSquare.exception.printStackTrace(e); 
				} 
			
	}; 
	
	//신규 비밀번호 체크 
	function getPwContent(key) { 
		var pwd = key; 
		
		var passed = validatePassword(pwd); 
		
		return passed; } 
	
	//비밀번호 안정성 체크 
	
	function validatePassword (pw, options) { 
		var o = {
				length: [6, 16], 
				lower: 1, 
				upper: 1, 
				alpha: 1, /* lower + upper */ 
				numeric: 1, 
				special: 1, 
				custom: [ /* regexes and/or functions */ ], 
				badWords: [], 
				badSequenceLength: 5, 
				noQwertySequences: true, 
				spaceChk: true, 
				noSequential: false }; // space bar check if (o.spaceChk && /\s/g.test(pw)) { return "<p style='line-height:200%;'><span style='color:#E3691E; font-weight:bold;'>사용불가</span> : 비밀번호 재작성 필요" + "<br/>" + "<span style='color:#999; font-weight:bold;'>영문 대소문자, 숫자 및 특수문자 사용</span></p>"; } //password 길이 체크 if (pw.length < o.length[0]) return "<p style='line-height:200%;'><span style='color:#E3691E; font-weight:bold;'>사용불가</span>" + "<br/>" + "<span style='color:#999; font-weight:bold;'>비밀번호는 " + o.length[0] + "자 이상 입력하셔야 합니다.</span></p>"; if (pw.length > o.length[1]) return "<p style='line-height:200%;'><span style='color:#E3691E; font-weight:bold;'>사용불가</span>" + "<br/>" + "<span style='color:#999;'>비밀번호는 " + o.length[1] + "자 이내로 입력하셔야 합니다.</span></p>"; // bad sequence check if (o.badSequenceLength && pw.length >= o.length[0]) { var lower = "abcdefghijklmnopqrstuvwxyz", upper = lower.toUpperCase(), numbers = "0123456789", qwerty = "qwertyuiopasdfghjklzxcvbnm", start = o.badSequenceLength - 1, seq = "_" + pw.slice(0, start); for (i = start; i < pw.length; i++) { seq = seq.slice(1) + pw.charAt(i); if ( lower.indexOf(seq) > -1 || upper.indexOf(seq) > -1 || numbers.indexOf(seq) > -1 || (o.noQwertySequences && qwerty.indexOf(seq) > -1) ) { return "<p style='line-height:200%;'>비밀번호 안전도 <span style='color:#E5E5E5'>|</span> <span style='color:#E3691E; font-weight:bold;'>낮음</span> " + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;'>―</span>" + "<span style='color:#E5E5E5; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<span style='color:#E5E5E5; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<br/>" + "<span style='color:#999; font-weight:bold;'>안전도가 높은 비밀번호를 권장합니다.</span></p>"; } } } //password 정규식 체크 var re = { lower: /[a-z]/g, upper: /[A-Z]/g, alpha: /[A-Z]/gi, numeric: /[0-9]/g, special: /[\W_]/g }, rule, i; var lower = (pw.match(re['lower']) || []).length > 0 ? 1 : 0; var upper = (pw.match(re['upper']) || []).length > 0 ? 1 : 0; var numeric = (pw.match(re['numeric']) || []).length > 0 ? 1 : 0; var special = (pw.match(re['special']) || []).length > 0 ? 1 : 0; //숫자로만 이루어지면 낮음 if((pw.match(re['numeric']) || []).length == pw.length ) { return "<p style='line-height:200%;'><span style='color:#E3691E; font-weight:bold;'>사용불가</span> : 비밀번호 재작성 필요" + "<br/>" + "<span style='color:#999; font-weight:bold;'>영문 대소문자, 숫자 및 특수문자 사용</span></p>"; } //숫자, 알파벳(대문자, 소문자), 특수문자 2가지 조합 else if(lower + upper + numeric + special <= 2){ return "<p style='line-height:200%;'>비밀번호 안전도 <span style='color:#E5E5E5'>|</span> <span style='color:#E3691E; font-weight:bold;'>낮음</span> " + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;'>―</span>" + "<span style='color:#E5E5E5; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<span style='color:#E5E5E5; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<br/>" + "<span style='color:#999; font-weight:bold;'>안전도가 높은 비밀번호를 권장합니다.</span></p>"; } //숫자, 알파벳(대문자, 소문자), 특수문자 4가지 조합 else if(lower + upper + numeric + special <= 3) { return "<p style='line-height:200%;'>비밀번호 안전도 <span style='color:#E5E5E5'>|</span> <span style='color:#E3691E; font-weight:bold;'>적정</span> " + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;'>―</span>" + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<span style='color:#E5E5E5; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<br/>" + "<span style='color:#999; font-weight:bold;'>안전하게 사용하실 수 있는 비밀번호 입니다.</span></p>"; } //숫자, 알파벳(대문자, 소문자), 특수문자 4가지 조합 else { return "<p style='line-height:200%;'>비밀번호 안전도 <span style='color:#E5E5E5'>|</span> <span style='color:#E3691E; font-weight:bold;'>높음</span> " + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;'>―</span>" + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<span style='color:#E3691E; font-weight:bold; font-size:20px; position: relative; top: 1.5px;''>―</span>" + "<br/>" + "<span style='color:#999; font-weight:bold;'>예측하기 힘든 비밀번호로 더욱 안전합니다.</span></p>"; } // enforce the no sequential, identical characters rule if (o.noSequential && /([\S\s])\1/.test(pw)) return "no sequential"; // enforce word ban (case insensitive) for (i = 0; i < o.badWords.length; i++) { if (pw.toLowerCase().indexOf(o.badWords[i].toLowerCase()) > -1) return "bad word"; } // enforce custom regex/function rules for (i = 0; i < o.custom.length; i++) { rule = o.custom[i]; if (rule instanceof RegExp) { if (!rule.test(pw)) return "custom"; } else if (rule instanceof Function) { if (!rule(pw)) return "custom"; } } }; $(document).ready(function() { $("#ch_new_pw").off("focus").on("focus", function() { var value = $(this).val(); $('.js-mytooltip-pw').myTooltip('updateContent', getPwContent(value)); }); $("#ch_new_pw").off("click").on("click", function() { var value = $(this).val(); if(!isNull(value)) { $('.js-mytooltip-pw').myTooltip('updateContent', getPwContent(value)); } }); $("#ch_new_pw").off("keyup").on("keyup", function() { $("#ch_new_pw").blur(); $("#ch_new_pw").focus(); }); //비밀번호 안정성 tooltip $('.js-mytooltip-pw').myTooltip({ 'offset': 30, 'theme': 'light', 'customClass': 'mytooltip-content', 'content': '<p>t</p>' }); });

	출처: https://gongcha.tistory.com/38 [웹/앱 개발자 블로그 ]


		document.addEventListener('keydown', logKey);

</script>
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
</head>

    <body>
    
    <jsp:include page="../includes/header.jsp" />
    

        <!-- Top content -->
        <div class="top-content top-padding-login" style="background-color:#19b9e7 ;">
        	
            <div class="inner-bg">
                <div class="container">
                	
                    <div class="row description">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1 style="margin-top:60px;">회원가입</h1>
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        
                        
                        	
                        <div class="col-sm-8 col-sm-offset-2">
                        	
                        	<div class="form-box" style="width:500px; margin:auto;" >
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>지금 회원가입하세요!</h3>
	                            		<p>이메일, 비밀번호, 닉네임을 형식에 맞게 입력해주세요</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <form name="newMember" role="form" action="${root}/logins/processAddMember" method="post" class="registration-form" onsubmit="return checkForm()">
				                    	<div class="form-group">
				                        	<label class="sr-only" for="form-email">이메일</label>
				                        	<input type="text" name="email" placeholder="이메일" class="form-email form-control" id="form-email">
				                        	
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-last-name">비밀번호</label>
				                        	<input type="text" name="password" placeholder="비밀번호" class="form-last-name form-control" id="form-last-name">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">비밀번호확인</label>
				                        	<input type="text" name="password_confirm" placeholder="비밀번호확인" class="form-email form-control" id="form-email">
				                        </div>				                        
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">닉네임</label>
				                        	<input type="text" name="name" placeholder="성명" class="form-email form-control" id="form-email">
				                        </div>
				                        
				                        <button type="submit" class="btn" value="등록">회원가입</button>
				                    </form>
			                    </div>
                        	</div>
                        	
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>

        <!-- Footer -->
        <!--  style="background-color:#19b9e7;" -->
        <footer style="background-color:#19b9e7;">
        	
        </footer>

        <!-- Javascript -->
        <script type="text/javascript" src="${resources}/js/login/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="${resources}/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${resources}/js/login/jquery.backstretch.min.js"></script>
        <script type="text/javascript" src="${resources}/js/login/scripts.js"></script>
       
        <!--[if lt IE 10]>
            <script src="..resources/js/placeholder.js"></script>
        <![endif]-->

    </body>


</html>