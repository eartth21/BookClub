<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${kDTO.book} | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">아카이브</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="/Archive?cmd=archiveBooks" aria-current="page">도서 목록</a></li>
      <li><a class="submenu__link" href="/Archive?cmd=archiveLogs">토론일지</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right page-right--stack">
    <h2 class="page-head">${kDTO.book}</h2>

    <div class="detail">
      <div class="book-photo">
        <svg viewBox="0 0 230 300" xmlns="http://www.w3.org/2000/svg" style="width:100%;height:100%;display:block;">
          <rect x="0" y="0" width="230" height="300" fill="#C9C3BA"/>
          <!-- 책등 그림자 -->
          <rect x="0" y="0" width="18" height="300" fill="#9E9890"/>
          <!-- 표지 안쪽 카드 -->
          <rect x="30" y="34" width="176" height="232" fill="#F1EEE8" stroke="#6F6961" stroke-width="2"/>
          <!-- 제목 자리 -->
          <rect x="52" y="70" width="132" height="10" fill="#9E9890"/>
          <rect x="52" y="90" width="90" height="10" fill="#9E9890"/>
          <!-- 장식선 -->
          <line x1="52" y1="120" x2="184" y2="120" stroke="#6F6961" stroke-width="1.5"/>
          <!-- 책 아이콘 -->
          <g transform="translate(75,150)">
            <path d="M0 8 C0 4 4 2 10 2 L38 2 L38 62 L10 62 C4 62 0 60 0 56 Z" fill="#FDFCFA" stroke="#6F6961" stroke-width="2"/>
            <path d="M86 8 C86 4 82 2 76 2 L48 2 L48 62 L76 62 C82 62 86 60 86 56 Z" fill="#FDFCFA" stroke="#6F6961" stroke-width="2"/>
            <line x1="43" y1="2" x2="43" y2="62" stroke="#6F6961" stroke-width="2"/>
            <line x1="8" y1="14" x2="34" y2="12" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="8" y1="24" x2="34" y2="22" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="8" y1="34" x2="34" y2="32" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="52" y1="12" x2="78" y2="14" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="52" y1="22" x2="78" y2="24" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="52" y1="32" x2="78" y2="34" stroke="#C9C3BA" stroke-width="2"/>
          </g>
          <text x="115" y="240" text-anchor="middle" font-family="sans-serif" font-size="12" fill="#9E9890">이달의 책</text>
        </svg>
      </div>
      <div class="detail__info">
        <p class="detail__label">평균 별점</p>
        <p class="stars">
          <fmt:formatNumber value="${avgRate}" pattern="0.0"/> / 5.0
          (${reviewCount}명)
        </p>

        <p class="detail__label">한줄평</p>
        <c:choose>
          <c:when test="${empty reviewList}">
            <p class="empty-row">아직 남겨진 한줄평이 없습니다.</p>
          </c:when>
          <c:otherwise>
            <ul class="reviews">
              <c:forEach var="r" items="${reviewList}">
                <li>
                  ${r.review}
                  <span>${r.rate}점 · ${r.name}</span>
                </li>
              </c:forEach>
            </ul>
          </c:otherwise>
        </c:choose>
      </div>
    </div>

    <p style="margin:0 0 34px;">
      <a class="to-log" href="/Archive?cmd=archiveLogs">토론일지 보러가기</a>
    </p>

    <div class="post__foot">
      <a class="to-list" href="/Archive?cmd=logWrite">글쓰기</a>
    </div>
  </div>

</div>

</body>
</html>
