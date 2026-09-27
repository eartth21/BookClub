<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>토론일지 작성 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
  /* ===== 토론일지 작성 폼 ===== */
  .talk-form{ max-width:620px; }

  .talk-row{
    display:grid; grid-template-columns:1fr 1fr; gap:20px;
    margin-bottom:24px;
  }

  .talk-textarea{
    width:100%; min-height:180px; padding:14px 16px; resize:vertical;
    border:1px solid var(--ink-soft); border-radius:var(--radius);
    background:var(--cover); font:inherit; font-size:15px; line-height:1.8; color:var(--ink);
  }
  .talk-textarea:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }

  .talk-actions{
    display:flex; gap:10px; margin-top:32px;
    padding-top:24px; border-top:1px solid var(--ink-soft);
    justify-content:center;
  }

  /* 라벨을 입력칸 왼쪽에 나란히 두는 필드 (이 화면 전용) */
  .field--inline{
    display:flex; align-items:center; gap:4px;
  }
  .field--inline .field__label{
    flex:0 0 70px; margin-bottom:0;
  }
  .field--inline .field__input{
    flex:1 1 auto;
  }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    $("#send").click(function(){
        if($("#opinion").val().trim() == ''){
            alert("내용을 입력하세요");
            $("#opinion").focus();
            return;
        }
        if($("#thought").val().trim() == ''){
            alert("느낀점을 입력하세요");
            $("#thought").focus();
            return;
        }
        $("#logForm").submit();
    });

    $("#rewrite").click(function(){
        $("#opinion").val('');
        $("#thought").val('');
    });
});
</script>
</head>
<body>

<div class="spread">

  <!-- 왼쪽 면 : 메인메뉴 + 하위메뉴 -->
  <div class="page-left">
    <h1 class="page-left__title">아카이브</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link" href="/Archive?cmd=archiveBooks">도서 목록</a></li>
      <li><a class="submenu__link is-active" href="/Archive?cmd=archiveLogs" aria-current="page">토론일지</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 : 토론일지 작성 -->
  <div class="page-right">
    <h2 class="page-head">토론일지</h2>

    <form class="talk-form" id="logForm" action="/Archive?cmd=logWritePro" method="post">

      <div class="talk-row">
        <div class="field field--inline">
          <label class="field__label" for="book">책 제목</label>
          <input class="field__input" type="text" id="book" value="${weeklyBook.book}" readonly>
        </div>
        <div class="field field--inline">
          <label class="field__label" for="regdate">토론일자</label>
          <input class="field__input" type="text" id="regdate" value="${today}" readonly>
        </div>
      </div>

      <div class="talk-row">
        <div class="field field--inline">
          <label class="field__label" for="author">저자</label>
          <input class="field__input" type="text" id="author" value="${weeklyBook.author}" readonly>
        </div>
        <div class="field field--inline">
          <label class="field__label" for="numname">학번 / 이름</label>
          <input class="field__input" type="text" id="numname"
                 value="${sessionScope.user.num} / ${sessionScope.user.name}" readonly>
        </div>
      </div>

      <div class="field field--inline" style="margin-bottom:24px;">
        <label class="field__label" for="subject">토론주제</label>
        <input class="field__input" type="text" id="subject" value="${weeklyBook.subject}" readonly>
      </div>

      <div class="field" style="margin-bottom:24px;">
        <label class="field__label" for="opinion">내용</label>
        <textarea class="talk-textarea" id="opinion" name="opinion"
                  placeholder="토론에서 나눈 의견을 적어주세요."></textarea>
      </div>

      <div class="field">
        <label class="field__label" for="thought">느낀점</label>
        <textarea class="talk-textarea" id="thought" name="thought"
                  placeholder="토론을 마치고 느낀 점을 적어주세요."></textarea>
      </div>

      <div class="talk-actions">
        <input class="btn btn--primary" type="button" id="send" value="등록하기">
        <input class="btn btn--ghost" type="button" id="rewrite" value="다시쓰기">
      </div>

    </form>
  </div>

</div>

</body>
</html>
