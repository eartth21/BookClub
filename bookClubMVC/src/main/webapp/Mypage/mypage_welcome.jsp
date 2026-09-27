<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
  /* ===== 마이페이지 환영 화면 ===== */
  .welcome{
    height:100%;
    display:flex; flex-direction:column;
  }

  .welcome__center{
    flex:1 1 auto;
    display:flex; align-items:center; justify-content:center;
    text-align:center;
  }

  .welcome__text{
    margin:0; font-size:24px; font-weight:800; color:var(--ink);
  }

  .welcome__foot{
    display:flex; justify-content:flex-end;
  }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    var role = "${sessionScope.user.role}";
    if(role == "admin"){
        $("#adminBtn").show();
    }
});
</script>

</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">마이페이지</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link is-active" href="" aria-current="page">${user.name }(${user.userid })</a></li>
      <li><a class="submenu__link" href="/Mypage?cmd=mypageModify&userid=${user.userid }">회원 정보 수정</a></li>
      <li class="submenu__gap"><a class="submenu__link" id="adminBtn" href="/Mypage?cmd=mypageAdmin" style="display:none;">관리자 페이지</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <div class="welcome">
      <div class="welcome__center">
		<c:if test="${sessionScope.user.approved == 0}">
  			<p class="empty-row">승인 대기 중입니다.</p>
		</c:if>
		<c:if test="${sessionScope.user.approved == 1}">
    	    <p class="welcome__text">${user.name }님 환영합니다</p>
		</c:if>

      </div>

      <div class="welcome__foot">
        <a class="btn btn--ghost" href="/Mypage?cmd=logout">로그아웃</a>
      </div>

    </div>
  </div>

</div>

</body>
</html>
