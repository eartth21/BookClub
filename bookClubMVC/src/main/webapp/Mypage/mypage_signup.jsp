<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script>
	$(function(){
		$("#idcheck").click(function(){
			var userid =$("#userid").val();
			$.ajax({
				url:'Mypage?cmd=idCheck',
				type:'post',
				data:{'userid':userid},
				success:function(result){
					if(result==0){
						$("#idResult").text("사용 가능한 아이디입니다.");
					}else{
						$("#idResult").text("이미 사용중인 아이디입니다.");	
					}
				}		
			});
		});
		
		$("#pass2").on("change",function(){
			var pass = $("#pass").val();
			var pass2 = $("#pass2").val();
			if(pass!=pass2){
				$("#pwResult").text("비밀번호가 일치하지 않습니다.");
				$("#pass2").val('');
				$("#pass2").focus();
			}else{
				$("#pwResult").text("비밀번호가 일치합니다.");				
			}
		});
	$("#telcheck").click(function(){
		if($("#tel").val()==''){
			$("#telResult").text("전화번호가 입력되지 않았습니다.");
			$("#tel").focus();
			return;
		}
		var phone = $("#tel").val();
		$.ajax({
			url:'/Mypage?cmd=smsCert',
			type:'post',
			data:{"phone":phone},
			success:function(result){
				$("#telResult").text("인증번호가 전송되었습니다.");
				$("#syscode").val(result);
			}
		});
	});
	
	$("#codecheck").click(function(){
		if($("#usercode").val()==$("#syscode").val()){
			alert("인증되었습니다");
			$("#usercode").prop('readonly',true);
		}else{
			alert("잘못된 인증번호 입니다");
			$("#usercode").val('');
			$("#usercode").focus();
		}
	});
	$("#send").click(function(){
		if($("#userid").val()==''){
			alert("아이디가 입력되지 않았습니다.");
			$("#userid").focus();
			return;
		}
		if($("#pass").val()==''){
			alert("비밀번호가 입력되지 않았습니다.");
			$("#pass").focus();
			return;
		}
		if($("#pass2").val()==''){
			alert("비밀번호 확인이 입력되지 않았습니다.");
			$("#pass2").focus();
			return;
		}
		if($("#name").val()==''){
			alert("이름이 입력되지 않았습니다.");
			$("#name").focus();
			return;
		}
		if($("#num").val()==''){
			alert("학번이 입력되지 않았습니다.");
			$("#num").focus();
			return;
		}
		if($("#tel").val()==''){
			alert("전화번호가 입력되지 않았습니다.");
			$("#userid").focus();
			return;
		}
		if($("#usercode").val()==''){
			alert("인증번호가 입력되지 않았습니다.");
			$("#usercode").focus();
			return;
		}
		$("#user").submit();

	});
	
	});

</script>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 (로그인 전) -->
  <div class="page-left">
    <h1 class="page-left__title">마이페이지</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link" href="/Mypage?cmd=mypageLogin">로그인</a></li>
      <li><a class="submenu__link is-active" href="/Mypage?cmd=signup" aria-current="page">회원가입</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">회원가입</h2>
		<div class="auth">
		  <form action="/Mypage?cmd=signupPro" method="post" id="user">
			<input type="hidden" id="syscode" name="syscode">
		    <div class="field">
		      <label class="field__label" for="userid">아이디</label>
		      <div class="field__row">
		        <input class="field__input" type="text" id="userid" name="userid">
		        <button class="btn--sm" id="idcheck" type="button">중복확인</button>
		      </div>
		      <p class="field__help" id="idResult"></p>
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="pass">비밀번호</label>
		      <input class="field__input" type="password" id="pass" name="pass" placeholder="8자 이상 입력하세요">
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="pw2">비밀번호 확인</label>
		      <input class="field__input" type="password" id="pass2">
		      <p class="field__help" id="pwResult"></p>		  
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="name">이름</label>
		      <input class="field__input" type="text" id="name" name="name" placeholder="이름을 입력하세요">
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="num">학번</label>
		      <input class="field__input" type="text" id="num" name="num" placeholder="예) 1203">
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="tel">휴대전화 번호</label>
		      <div class="field__row">
		        <input class="field__input" type="tel" id="tel" name="tel" placeholder="010-0000-0000">
		        <button class="btn--sm" id="telcheck" type="button">인증요청</button>
		      <br><p class="field__help" id="telResult"></p>
		      </div>
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="code">인증번호</label>
		      <div class="field__row">
		        <input class="field__input" type="text" id="usercode" placeholder="문자로 받은 6자리 숫자">
		        <button class="btn--sm" type="button" id="codecheck">확인</button>
		      </div>
		      <p class="field__help">인증번호는 발송 후 5분간 유효합니다.</p>
		    </div>
		
		    <div class="auth__actions">
		      <button class="btn btn--primary btn--block" id="send" type="button">가입하기</button>
		    </div>
		
		  </form>
		
		  <p class="auth__foot">
		    이미 계정이 있으신가요? <a href="/Mypage?cmd=mypageLogin">로그인</a>
		  </p>
		</div>    
    
    
  </div>
</div>

</body>
</html>
