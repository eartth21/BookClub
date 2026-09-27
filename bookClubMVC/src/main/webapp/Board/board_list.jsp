<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유 게시판 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">게시판</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="board_free.jsp" aria-current="page">자유 게시판</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
	<div class="page-right page-right--stack">
    <h2 class="page-head">자유 게시판</h2> 
      <table class="list-table">
      <thead>
        <tr>
          <th scope="col" class="col-no">게시글</th>
          <th scope="col">제목</th>
          <th scope="col" class="col-writer">작성자</th>
          <th scope="col" class="col-date">작성일</th>
          <th scope="col" class="col-hit">조회수</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="board" items="${bList }">
        <tr>
          <td>${board.b_idx }</td>
          <td><a href="/Board?cmd=boardView&b_idx=${board.b_idx }">${board.subject}</a></td>
          <td>${board.name }</td>
          <td>${board.regdate }</td>
          <td>${board.readcnt }</td>
        </tr>
	</c:forEach>
      </tbody>
    </table>

    <a class="write" href="/Board?cmd=boardWrite">글쓰기</a>
  </div>

</div>

</body>
</html>
