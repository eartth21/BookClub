<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>한줄평 작성 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
  .review-form{ max-width:560px; }

  .review-book{
    margin:0 0 30px; padding:20px 22px;
    border:1px solid var(--ink-soft); border-radius:var(--radius);
    background:var(--page);
  }
  .review-book__title{ margin:0 0 4px; font-size:18px; font-weight:800; }
  .review-book__author{ margin:0; font-size:13px; color:var(--ink-mid); }

  .star-rate{
    display:flex; flex-direction:row-reverse; justify-content:flex-end;
    gap:4px; font-size:32px;
  }
  .star-rate input{ display:none; }
  .star-rate label{
    color:var(--ink-soft); cursor:pointer; transition:color .15s ease;
  }
  .star-rate input:checked ~ label,
  .star-rate label:hover,
  .star-rate label:hover ~ label{
    color:var(--ink);
  }

  .review-textarea{
    width:100%; min-height:120px; padding:14px 16px; resize:vertical;
    border:1px solid var(--ink-soft); border-radius:var(--radius);
    background:var(--cover); font:inherit; font-size:15px; line-height:1.8; color:var(--ink);
  }
  .review-textarea:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }

  .review-actions{
    display:flex; justify-content:center;
    margin-top:32px; padding-top:24px; border-top:1px solid var(--ink-soft);
  }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    $("#send").click(function(){
        if($("input[name='rate']:checked").length == 0){
            alert("별점을 선택하세요");
            return;
        }
        if($("#review").val().trim() == ''){
            alert("한줄평을 입력하세요");
            $("#review").focus();
            return;
        }
        $("#reviewForm").submit();
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
      <li><a class="submenu__link" href="/Archive?cmd=archiveLogs">토론일지</a></li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">한줄평 작성</h2>

    <div class="review-book">
      <p class="review-book__title">${kDTO.book}</p>
      <p class="review-book__author">${kDTO.author}</p>
    </div>

    <form class="review-form" id="reviewForm" action="/Archive?cmd=reviewWritePro" method="post">

      <input type="hidden" name="k_idx" value="${kDTO.k_idx}">

      <div class="field" style="margin-bottom:24px;">
        <label class="field__label">별점</label>
        <div class="star-rate">
          <input type="radio" name="rate" value="5" id="star5"><label for="star5">★</label>
          <input type="radio" name="rate" value="4" id="star4"><label for="star4">★</label>
          <input type="radio" name="rate" value="3" id="star3"><label for="star3">★</label>
          <input type="radio" name="rate" value="2" id="star2"><label for="star2">★</label>
          <input type="radio" name="rate" value="1" id="star1"><label for="star1">★</label>
        </div>
      </div>

      <div class="field">
        <label class="field__label" for="review">한줄평</label>
        <textarea class="review-textarea" id="review" name="review"
                  placeholder="이 책에 대한 한줄평을 남겨주세요."></textarea>
      </div>

      <div class="review-actions">
        <input class="btn btn--primary" type="button" id="send" value="등록하기">
      </div>

    </form>
  </div>

</div>

</body>
</html>
