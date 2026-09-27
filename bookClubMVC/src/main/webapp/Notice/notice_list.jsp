<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지 목록 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    // 세션의 role 값을 EL로 읽어와 관리자일 때만 글쓰기 버튼을 보여준다.
    var role = "${sessionScope.user.role}";
    if(role == "admin"){
        $("#writeBtn").show();
    }
});
</script>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">공지사항</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="" aria-current="page">공지 목록</a></li>
      <li><a class="submenu__link" href="/Notice?cmd=weeklybook">금주의 책</a></li>
    </ul>
	<div class="back-row">
  		<a class="back" href="/">목록으로</a>
 	 	<a class="back" href="/Notice?cmd=noticeWrite" id="writeBtn" style="display:none;">글쓰기</a>
	</div>

  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">공지 목록</h2>
     <table class="list-table">
      <thead>
        <tr>
          <th scope="col" class="col-no">글번호</th>
          <th scope="col">제목</th>
          <th scope="col" class="col-writer">작성자</th>
          <th scope="col" class="col-date">작성일</th>
          <th scope="col" class="col-hit">조회수</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="notice" items="${nList }">
        <tr>
          <td>${notice.n_idx}</td>
          <td><a href="/Notice?cmd=noticeView&n_idx=${notice.n_idx }">${notice.subject }</a></td>
          <td>${notice.name }</td>
          <td>${notice.regdate }</td>
          <td>${notice.readcnt }</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

</div>

</body>
</html>
