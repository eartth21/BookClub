<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${nDTO.subject} | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">공지사항</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="/Notice?cmd=noticeList" aria-current="page">공지 목록</a></li>
      <li><a class="submenu__link" href="/Notice?cmd=weeklybook">금주의 책</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right page-right--stack">

    <div class="post__top">
      <div>
        <h2 class="post__title">${nDTO.subject}</h2>
        <p class="post__meta">
          작성자 &nbsp;${nDTO.name}<br>
          작성일 &nbsp;${nDTO.regdate}
        </p>
      </div>
      <p class="post__hit">조회수 ${nDTO.readcnt}</p>
    </div>

    <div class="post__content">
      <p>${nDTO.contents}</p>
    </div>

    <div class="post__foot">
      <c:if test="${sessionScope.user.userid == nDTO.userid}">
        <a class="to-list" href="/Notice?cmd=noticeModify&n_idx=${nDTO.n_idx}">수정</a>
        <a class="to-list" href="/Notice?cmd=noticeDelete&n_idx=${nDTO.n_idx}"
           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
      </c:if>
      <a class="to-list" href="/Notice?cmd=noticeList">목록으로</a>
    </div>
  </div>

</div>

</body>
</html>
