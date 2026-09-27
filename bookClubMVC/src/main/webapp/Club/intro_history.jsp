<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동아리 연혁 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">동아리 소개</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="" aria-current="page">동아리 연혁</a></li>
      <li><a class="submenu__link" href="/Club?cmd=clubMember">부원 소개</a></li>
      <li><a class="submenu__link" href="/Club?cmd=clubJoin">가입방법 안내</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">동아리 연혁</h2>

    <p class="page-body" style="margin-bottom:26px;">
      북적북적 독서토론회는 2019년 3월, &ldquo;혼자 읽고 끝내지 말자&rdquo;는 다섯 명의 약속에서
      시작한 목포고등학교 독서토론 동아리입니다. 2026년 3월 기준 누적 토론 도서는 87권,
      활동 부원은 24명입니다.
    </p>

    <ol class="timeline">
      <li class="timeline__item">
        <span class="timeline__year">2019.03</span>
        <p class="timeline__desc">부원 5명으로 창단. 점심시간 도서실에서 격주 모임 시작.</p>
      </li>
      <li class="timeline__item">
        <span class="timeline__year">2021.03</span>
        <p class="timeline__desc">매주 목요일 정기 토론회로 전환, 회차별 토론 일지 기록 시작.</p>
      </li>
      <li class="timeline__item">
        <span class="timeline__year">2023.10</span>
        <p class="timeline__desc">교내 독서한마당 토론 시연 부스 운영, 신입 부원 11명 모집.</p>
      </li>
      <li class="timeline__item">
        <span class="timeline__year">2025.05</span>
        <p class="timeline__desc">전라남도 학생 독서토론대회 단체 장려상 수상.</p>
      </li>
      <li class="timeline__item">
        <span class="timeline__year">2026.03</span>
        <p class="timeline__desc">누적 토론 도서 87권 달성, 토론 일지 웹 아카이브 구축 착수.</p>
      </li>
    </ol>
  </div>

</div>

</body>
</html>
