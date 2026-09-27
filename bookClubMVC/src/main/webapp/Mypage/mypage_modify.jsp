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
	$("#send").click(function(){
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
      <li><a class="submenu__link" href="/Mypage?cmd=welcome" aria-current="page">${user.name }(${user.userid })</a></li>
      <li><a class="submenu__link is-active" href="" aria-current="page">회원 정보 수정</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">회원 정보 수정</h2>
		<div class="auth">
		  <form action="/Mypage?cmd=mypageModifyPro" method="post" id="user">
			<input type="hidden" id="syscode" name="syscode">
		    <div class="field">
		      <label class="field__label" for="userid">아이디</label>
		      <div class="field__row">
		        <input class="field__input" type="text" id="userid" name="userid" value="${uDTO.userid}" readonly>
		      </div>
		      <p class="field__help" id="idResult"></p>
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="pass">비밀번호</label>
		      <input class="field__input" type="password" id="pass" name="pass" readonly>
		    </div>
		    <div class="field">
		      <label class="field__label" for="name">이름</label>
		      <input class="field__input" type="text" id="name" name="name" value="${uDTO.name}" readonly>
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="num">학번</label>
		      <input class="field__input" type="text" id="num" name="num" value="${uDTO.num}" placeholder="예) 1203">
		    </div>
		
		    <div class="field">
		      <label class="field__label" for="tel">휴대전화 번호</label>
		      <div class="field__row">
		        <input class="field__input" type="tel" id="tel" name="tel" value="${uDTO.tel}">
		      <br><p class="field__help" id="telResult"></p>
		      </div>
		    </div>
		
		
		    <div class="auth__actions">
		      <button class="btn btn--primary btn--block" id="send" type="button">수정하기</button>
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
