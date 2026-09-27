<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">마이페이지</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="mypage_profile.jsp" aria-current="page">회원 정보 수정</a></li>
      <li><a class="submenu__link" href="mypage_log.jsp">토론일지 수정</a></li>
      <li class="submenu__gap"><a class="submenu__link" href="mypage_admin.jsp">관리자 페이지</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">회원 정보 수정</h2>

    <div class="form">
      <div class="field">
        <label class="field__label" for="name">이름</label>
        <input class="field__input" type="text" id="name" value="김지안">
      </div>

      <div class="field">
        <label class="field__label" for="phone">휴대전화 번호</label>
        <input class="field__input" type="tel" id="phone" value="010-2345-6789" readonly>
        <p class="field__help">가입 시 인증한 번호로, 변경할 수 없습니다.</p>
      </div>

      <div class="field">
        <label class="field__label" for="grade">학년 / 반</label>
        <input class="field__input" type="text" id="grade" value="3학년 4반">
      </div>

      <div class="field">
        <label class="field__label" for="pw">비밀번호</label>
        <input class="field__input" type="password" id="pw" placeholder="새 비밀번호를 입력하세요">
      </div>

      <div class="field">
        <label class="field__label" for="pw2">비밀번호 확인</label>
        <input class="field__input" type="password" id="pw2" placeholder="새 비밀번호를 다시 입력하세요">
      </div>

      <div class="form__actions">
        <button class="btn btn--primary" type="button">저장하기</button>
        <button class="btn btn--ghost" type="reset">취소</button>
      </div>
    </div>
  </div>

</div>

</body>
</html>
