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
    <h1 class="page-left__title">자유게시판</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="" aria-current="page">자유게시판</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right page-right--stack">

    <div class="post__top">
      <div>
        <h2 class="post__title">${bDTO.subject}</h2>
        <p class="post__meta">
          작성자 &nbsp;${bDTO.name}<br>
          작성일 &nbsp;${bDTO.regdate}
        </p>
      </div>
      <p class="post__hit">조회수 ${bDTO.readcnt}</p>
    </div>

    <div class="post__content">
      <p>${bDTO.contents}</p>
    </div>

    <div class="post__foot">
      <c:if test="${sessionScope.user.userid == nDTO.userid}">
        <a class="to-list" href="/Board?cmd=boardModify&b_idx=${nDTO.n_idx}">수정</a>
        <a class="to-list" href="/Board?cmd=boardDelete&b_idx=${nDTO.n_idx}"
           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
      </c:if>
      <a class="to-list" href="/Board?cmd=boardList">목록으로</a>
    </div>
  </div>

</div>

</body>
</html>
