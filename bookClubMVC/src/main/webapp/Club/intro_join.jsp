<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가입방법 안내 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">동아리 소개</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link" href="/Club?cmd=clubJoin">동아리 연혁</a></li>
      <li><a class="submenu__link" href="/Club?cmd=clubMember">부원 소개</a></li>
      <li><a class="submenu__link is-active" href="" aria-current="page">가입방법 안내</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">가입방법 안내</h2>

    <p class="page-body">
      가입은 매 학기 초 2주간, 그리고 결원이 생겼을 때 수시로 받습니다.
      신청서는 도서실 앞 게시판에서 받거나 이 사이트의 게시판에 남겨 주시면 됩니다.
      따로 시험이나 면접은 없고, 지원 동기 세 줄과 최근에 읽은 책 한 권만 적으면 됩니다.
    </p>
    <p class="page-body">
      정기 모임은 매주 목요일 방과 후 도서실에서 한 시간 진행합니다.
      토론 도서는 부원 투표로 정하고, 학교 도서실에 비치된 책 위주로 선정하므로
      따로 책을 구입할 필요는 없습니다. 궁금한 점은 김선생 선생님 또는 부장에게 문의해 주세요.
    </p>
  </div>

</div>

</body>
</html>
