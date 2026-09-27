<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>북적북적 독서토론회</title>
<style>
  /* ===== 공통 토큰 ===== */
  :root{
    --bg:        #E7E3DA;  /* 바탕 */
    --cover:     #FDFCFA;  /* 표지 면 */
    --ink:       #6F6961;  /* 가장 진한 브라운그레이 */
    --ink-mid:   #9E9890;  /* 중간 톤 */
    --ink-soft:  #C9C3BA;  /* 연한 톤 */
    --page:      #F1EEE8;  /* 책배(페이지 단면) */
    --radius:    2px;
  }

  *{ box-sizing:border-box; }

  html, body{ height:100%; }

  body{
    margin:0;
    background:var(--bg);
    font-family:"Pretendard","Apple SD Gothic Neo","Malgun Gothic",
                "Noto Sans KR", sans-serif;
    color:var(--ink);
    display:flex;
    align-items:center;
    justify-content:center;
    padding:48px 24px;
  }

  /* ===== 책 전체 ===== */
  .book{
    position:relative;
    width:min(900px, 100%);
    aspect-ratio: 4 / 3;
    max-height:78vh;
  }

  /* 뒤표지(그림자처럼 깔리는 층) */
  .book__back{
    position:absolute;
    inset:0;
    border:2px solid var(--ink);
    border-radius:var(--radius);
    background:var(--ink-soft);
  }

  /* 앞표지 */
  .book__cover{
    position:absolute;
    left:0;
    top:0;
    width:calc(100% - 22px);
    height:calc(100% - 20px);
    border:2px solid var(--ink);
    border-radius:var(--radius);
    background:var(--cover);
  }

  /* 책배 : 표지 왼쪽의 페이지 단면 선 */
  .book__edge{
    position:absolute;
    left:8px;
    top:8px;
    bottom:8px;
    width:18px;
    border-right:1px solid var(--ink);
    border-left:1px solid var(--ink);
    background:var(--page);
  }
  .book__edge::after{
    content:"";
    position:absolute;
    left:6px;
    top:0;
    bottom:0;
    border-left:1px solid var(--ink-mid);
  }

  /* ===== 표지 제목 영역 ===== */
  .cover__title{
    position:absolute;
    left:56px;
    right:64px;
    top:50%;
    transform:translateY(-50%);
    text-align:center;
  }

  .cover__label{
    margin:0 0 22px;
    font-size:13px;
    font-weight:600;
    letter-spacing:0.34em;
    color:var(--ink-mid);
  }

  .cover__name{
    margin:0;
    font-size:clamp(30px, 5.4vw, 58px);
    font-weight:800;
    line-height:1.24;
    letter-spacing:-0.01em;
    color:var(--ink);
  }

  .cover__rule{
    width:64px;
    height:1px;
    margin:30px auto 24px;
    background:var(--ink-mid);
    border:0;
  }

  .cover__school{
    margin:0;
    font-size:15px;
    font-weight:500;
    letter-spacing:0.12em;
    color:var(--ink-mid);
  }

  /* ===== 오른쪽 책갈피 메뉴 ===== */
  .bookmarks{
    position:absolute;
    top:14%;
    right:-14px;
    display:flex;
    flex-direction:column;
    gap:14px;
    list-style:none;
    margin:0;
    padding:0;
    z-index:2;
  }

  .bookmarks__link{
    display:flex;
    align-items:center;
    justify-content:center;
    width:172px;
    height:52px;
    padding-right:16px;              /* 꼬리 홈 만큼 여백 */
    /* 오른쪽 끝을 제비꼬리(V홈) 모양으로 자름 */
    clip-path:polygon(0 0, 100% 0, calc(100% - 18px) 50%, 100% 100%, 0 100%);
    background:var(--ink-mid);
    color:#FFFFFF;
    font-size:16px;
    font-weight:600;
    letter-spacing:0.02em;
    text-decoration:none;
    transition:transform .18s ease, background-color .18s ease;
  }

  /* 위에서 아래로 톤이 짙어지는 그라데이션 배치 */
  .bookmarks li:nth-child(1) .bookmarks__link{ background:#8A837A; }
  .bookmarks li:nth-child(2) .bookmarks__link{ background:#948D84; }
  .bookmarks li:nth-child(3) .bookmarks__link{ background:#7E776E; }
  .bookmarks li:nth-child(4) .bookmarks__link{ background:#8A837A; }
  .bookmarks li:nth-child(5) .bookmarks__link{ background:#6F6961; }

  .bookmarks__link:hover,
  .bookmarks__link:focus-visible{
    transform:translateX(12px);
    background:var(--ink);
  }

  .bookmarks__link:focus-visible{
    outline:2px solid var(--ink);
    outline-offset:3px;
  }

  /* ===== 반응형 ===== */
  @media (max-width:640px){
    body{ padding:32px 16px; }
    .book{ aspect-ratio:3 / 4; }
    .bookmarks{ right:-10px; gap:10px; }
    .bookmarks__link{ width:132px; height:44px; font-size:14px; }
    .cover__title{ left:40px; right:44px; }
    .cover__label{ font-size:11px; margin-bottom:16px; }
    .cover__rule{ margin:22px auto 18px; }
    .cover__school{ font-size:13px; }
  }

  @media (prefers-reduced-motion:reduce){
    .bookmarks__link{ transition:none; }
  }
</style>
</head>
<body>

  <div class="book">
    <div class="book__back"></div>

    <div class="book__cover">
      <div class="book__edge"></div>

      <!-- 표지 제목 : 확인 후 추가한 영역 -->
      <div class="cover__title">
        <p class="cover__label">독서토론 동아리</p>
        <h1 class="cover__name">북적북적<br>독서토론회</h1>
        <hr class="cover__rule">
        <p class="cover__school">목포고등학교 &nbsp;|&nbsp; 지도교사 김선생</p>
      </div>
    </div>

    <!-- 오른쪽 책갈피 메뉴 : href는 공란으로 두었습니다 -->
    <ul class="bookmarks">
      <li><a class="bookmarks__link" href="/Club?cmd=clubIntro">동아리소개</a></li>
      <li><a class="bookmarks__link" href="/Notice?cmd=noticeList">공지사항</a></li>
      <li><a class="bookmarks__link" href="/Archive?cmd=archiveBooks">아카이브</a></li>
      <li><a class="bookmarks__link" href="/Board?cmd=boardList">게시판</a></li>
      <li><a class="bookmarks__link" href="/Mypage?cmd=mypage">마이페이지</a></li>
    </ul>
  </div>

</body>
</html>
