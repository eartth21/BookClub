<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>금주의 책 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
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

  .field--inline{
    display:flex; align-items:center; gap:4px;
  }
  .field--inline .field__label{
    flex:0 0 50px; margin-bottom:0;
  }
  .field--inline .field__input{
    flex:1 1 auto;
  }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    $("#send").click(function(){
        if($("#book").val().trim() == ''){
            alert("책 제목을 입력하세요");
            $("#book").focus();
            return;
        }
        if($("#author").val().trim() == ''){
            alert("저자를 입력하세요");
            $("#author").focus();
            return;
        }
        if($("#synopsis").val().trim() == ''){
            alert("줄거리를 입력하세요");
            $("#synopsis").focus();
            return;
        }
        $("#bookForm").submit();
    });
});
</script>
</head>
<body>

<div class="spread">

  <div class="page-left">
    <h1 class="page-left__title">공지사항</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li><a class="submenu__link" href="/Notice?cmd=noticeList">공지 목록</a></li>
      <li><a class="submenu__link is-active" href="/Notice?cmd=notice_weekly" aria-current="page">금주의 책</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <div class="page-right">
    <h2 class="page-head">금주의 책</h2>

    <form class="talk-form" id="bookForm" action="/Notice?cmd=bookWritePro" method="post">

      <div class="talk-row">
        <div class="field field--inline">
          <label class="field__label" for="book">책 제목</label>
          <input class="field__input" type="text" id="book" name="book">
        </div>
        <div class="field field--inline">
          <label class="field__label" for="author">저자</label>
          <input class="field__input" type="text" id="author" name="author">
        </div>
      </div>

      <div class="field" style="margin-bottom:24px;">
        <label class="field__label" for="thought">줄거리</label>
        <textarea class="talk-textarea" id="synopsis" name="synopsis"></textarea>
      </div>
	<div class="field" style="margin-bottom:24px;">
	  <label class="field__label" for="topic1">토론주제 1</label>
	  <input class="field__input" type="text" id="topic1" name="topic1">
	</div>
	
	<div class="field" style="margin-bottom:24px;">
	  <label class="field__label" for="topic2">토론주제 2</label>
	  <input class="field__input" type="text" id="topic2" name="topic2">
	</div>
	
	<div class="field" style="margin-bottom:24px;">
	  <label class="field__label" for="topic3">토론주제 3</label>
	  <input class="field__input" type="text" id="topic3" name="topic3">
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