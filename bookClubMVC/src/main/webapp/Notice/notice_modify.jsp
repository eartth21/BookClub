<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지 수정 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
  /* ===== 공지 작성 폼 ===== */
  .notice-form{ max-width:680px; }

  .notice-textarea{
    width:100%; min-height:280px; padding:14px 16px; resize:vertical;
    border:1px solid var(--ink-soft); border-radius:var(--radius);
    background:var(--cover); font:inherit; font-size:15px; line-height:1.8; color:var(--ink);
  }
  .notice-textarea:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }

  .notice-actions{
    display:flex; gap:10px; margin-top:32px;
    padding-top:24px; border-top:1px solid var(--ink-soft);
    justify-content:center;
  }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    $("#send").click(function(){
        if($("#subject").val().trim() == ''){
            alert("제목을 입력하세요");
            $("#subject").focus();
            return;
        }
        if($("#contents").val().trim() == ''){
            alert("내용을 입력하세요");
            $("#contents").focus();
            return;
        }
        $("#noticeForm").submit();
    });

    $("#rewrite").click(function(){
        $("#noticeForm")[0].reset();
    });
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
      <li><a class="submenu__link" href="/Notice?cmd=noticeList">공지 목록</a></li>
      <li><a class="submenu__link" href="/Notice?cmd=weeklybook">금주의 책</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">공지 수정</h2>

    <form class="notice-form" id="noticeForm" action="/Notice?cmd=noticeModifyPro" method="post">

      <div class="field" style="margin-bottom:24px;">
        <label class="field__label" for="subject">제목</label>
        <input class="field__input" type="text" id="subject" name="subject" value="${nDTO.subject}">
      </div>

      <div class="field">
        <label class="field__label" for="contents">내용</label>
        <textarea class="notice-textarea" id="contents" name="contents">${nDTO.contents }</textarea>
      </div>

      <div class="notice-actions">
        <input class="btn btn--primary" type="button" id="send" value="등록하기">
        <input class="btn btn--ghost" type="button" id="rewrite" value="다시쓰기">
      </div>

    </form>
  </div>

</div>

</body>
</html>
