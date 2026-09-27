<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부원 소개 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">동아리 소개</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link" href="/Club?cmd=clubHistory">동아리 연혁</a></li>
      <li><a class="submenu__link is-active" href="" aria-current="page">부원 소개</a></li>
      <li><a class="submenu__link" href="/Club?cmd=clubJoin">가입방법 안내</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">부원 소개</h2>
    <div class="photo">부원 단체 사진</div>

    <p class="page-body" style="margin-bottom:26px;">
      지도교사는 국어과 김선생 선생님이며, 학년 구분 없이 네 개 토론조로 나누어
      매주 다른 조원과 토론합니다.
    </p>

    <ul class="officers">
      <li class="officer">
        <span class="officer__role">부장</span>
        <span class="officer__name">김지안</span>
        <span class="officer__grade">3학년</span>
      </li>
      <li class="officer">
        <span class="officer__role">부부장</span>
        <span class="officer__name">박서준</span>
        <span class="officer__grade">2학년</span>
      </li>
      <li class="officer">
        <span class="officer__role">총무</span>
        <span class="officer__name">이하늘</span>
        <span class="officer__grade">2학년</span>
      </li>
      <li class="officer">
        <span class="officer__role">기록부장</span>
        <span class="officer__name">최유나</span>
        <span class="officer__grade">3학년</span>
      </li>
    </ul>

    <table class="roster">
      <caption>학년별 부원 현황 (2026학년도 1학기)</caption>
      <thead>
        <tr>
          <th scope="col">학년</th>
          <th scope="col">인원</th>
          <th scope="col">토론조</th>
        </tr>
      </thead>
      <tbody>
        <tr><th scope="row">1학년</th><td>8명</td><td>가 · 나 · 다 · 라조</td></tr>
        <tr><th scope="row">2학년</th><td>9명</td><td>가 · 나 · 다 · 라조</td></tr>
        <tr><th scope="row">3학년</th><td>7명</td><td>가 · 나 · 다조</td></tr>
      </tbody>
      <tfoot>
        <tr><td>합계</td><td>24명</td><td>4개 조</td></tr>
      </tfoot>
    </table>
  </div>

</div>

</body>
</html>
