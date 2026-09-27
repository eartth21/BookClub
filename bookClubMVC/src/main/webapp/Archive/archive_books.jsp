<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 목록 | 북적북적 독서토론회</title>
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
  <div class="page-right">
    <h2 class="page-head">도서 목록</h2>

    <form class="search" action="/Archive?cmd=archiveBooks" method="get">
      <select class="search__select" name="type" aria-label="검색 조건">
        <option value="book">책이름</option>
        <option value="author">저자</option>
      </select>
      <input class="search__input" type="search" name="keyword" placeholder="검색어를 입력하세요" aria-label="검색어">
      <button class="search__btn" type="submit">검색</button>
    </form>

    <c:choose>
      <c:when test="${empty bookList}">
        <p class="empty-row">등록된 책이 없습니다.</p>
      </c:when>
      <c:otherwise>
        <ul class="shelf">
          <c:forEach var="b" items="${bookList}">
            <li>
              <a class="spine" href="/Archive?cmd=bookDetail&k_idx=${b.k_idx}">${b.book}</a>
            </li>
          </c:forEach>
        </ul>
      </c:otherwise>
    </c:choose>
  </div>

</div>

</body>
</html>
