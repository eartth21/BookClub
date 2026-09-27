<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>토론일지 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
  /* 행 전체를 클릭 영역으로 쓰기 위한 표시 (실제 이동은 onclick으로 처리) */
  .list-table tbody tr.clickable{ cursor:pointer; }
</style>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">아카이브</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link" href="Archive?cmd=archiveBooks">도서 목록</a></li>
      <li><a class="submenu__link is-active" href="" aria-current="page">토론일지</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
	<div class="page-right page-right--stack">
    <h2 class="page-head">토론일지</h2>

       

    <c:choose>
      <c:when test="${empty bookList}">
        <p class="empty-row">아직 작성된 토론일지가 없습니다.</p>
      </c:when>
      <c:otherwise>
        <table class="list-table">
          <thead>
            <tr>
              <th scope="col" class="col-round">번호</th>
              <th scope="col">도서</th>
              <th scope="col">토론 주제</th>
              <th scope="col" class="col-date">참여 인원</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="b" items="${bookList}">
              <tr class="clickable" onclick="location.href='/Archive?cmd=reportView&k_idx=${b.k_idx}'">
                <td>${b.k_idx}</td>
                <td>${b.book}</td>
                <td>${b.subject}</td>
                <td>${b.talkCount}명</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:otherwise>
    </c:choose>
    <a class="write" href="/Archive?cmd=logWrite">글쓰기</a>

  </div>
</div>

</body>
</html>
