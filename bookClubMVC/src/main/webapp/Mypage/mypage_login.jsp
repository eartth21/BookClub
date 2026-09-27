<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script>
$(function(){
	$("#btn_send").click(function(){
		if($("#userid").val()==''){
			alert("아이디가 입력되지 않았습니다");
			$("#userid").focus();
			return;
		}
		if($("#pass").val()==''){
			alert("비밀번호가 입력되지 않았습니다");
			$("#pass").focus();
			return;
		}
		$("#login").submit();
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
      <li><a class="submenu__link is-active" href="mypage_login.jsp" aria-current="page">로그인</a></li>
      <li><a class="submenu__link" href="/Mypage?cmd=signup">회원가입</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">로그인</h2>

    <div class="auth">
	<form id="login" action="/Mypage?cmd=mypageLoginPro" method="post">
      <div class="field">
        <label class="field__label" for="userid">아이디</label>
        <input class="field__input" type="text" name="userid" id="userid" >
      </div>

      <div class="field">
        <label class="field__label" for="pw">비밀번호</label>
        <input class="field__input" type="password" name="pass" id="pass" placeholder="비밀번호를 입력하세요" >
      </div>

      <div class="auth__actions">
        <button class="btn btn--primary btn--block" id="btn_send" type="button">로그인</button>
      </div>
	</form>
      <p class="auth__foot">
        아직 회원이 아니신가요? <a href="/Mypage?cmd=signup">회원가입</a>
      </p>
    </div>
  </div>

</div>

</body>
</html>
