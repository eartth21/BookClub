<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
    var role = "${sessionScope.user.role}";
    if(role == "admin"){
        $("#writeBtn").show();
    }
	$("#voteBtn").click(function(){
	    var choice = $("input[name='choice']:checked").val();
	
	    if(choice == undefined){
	        alert("토론 주제를 선택하세요");
	        return;
	    }
	
	    $.ajax({
	        url: '/Notice?cmd=weeklyBookPro',
	        type: 'post',
	        data: { k_idx: '${kDTO.k_idx}', choice: choice },
	        dataType: 'text',
	        success: function(result){
	            if(result.trim() == "ALREADY"){
	                alert("이미 투표하셨습니다.");
	            } else if(result.trim() == "OK"){
	                alert("투표가 완료되었습니다.");
	            }
	        }
	    });
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
      <li><a class="submenu__link is-active" href="" aria-current="page">금주의 책</a></li>
    </ul>
	<div class="back-row">
  		<a class="back" href="/">목록으로</a>
 	 	<a class="back" href="/Notice?cmd=bookWrite" id="writeBtn" style="display:none;">글쓰기</a>

	</div>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">금주의 책</h2>

    <div class="weekly">
      <div class="book-photo">
        <svg viewBox="0 0 230 300" xmlns="http://www.w3.org/2000/svg" style="width:100%;height:100%;display:block;">
          <rect x="0" y="0" width="230" height="300" fill="#C9C3BA"/>
          <!-- 책등 그림자 -->
          <rect x="0" y="0" width="18" height="300" fill="#9E9890"/>
          <!-- 표지 안쪽 카드 -->
          <rect x="30" y="34" width="176" height="232" fill="#F1EEE8" stroke="#6F6961" stroke-width="2"/>
          <!-- 제목 자리 -->
          <rect x="52" y="70" width="132" height="10" fill="#9E9890"/>
          <rect x="52" y="90" width="90" height="10" fill="#9E9890"/>
          <!-- 장식선 -->
          <line x1="52" y1="120" x2="184" y2="120" stroke="#6F6961" stroke-width="1.5"/>
          <!-- 책 아이콘 -->
          <g transform="translate(75,150)">
            <path d="M0 8 C0 4 4 2 10 2 L38 2 L38 62 L10 62 C4 62 0 60 0 56 Z" fill="#FDFCFA" stroke="#6F6961" stroke-width="2"/>
            <path d="M86 8 C86 4 82 2 76 2 L48 2 L48 62 L76 62 C82 62 86 60 86 56 Z" fill="#FDFCFA" stroke="#6F6961" stroke-width="2"/>
            <line x1="43" y1="2" x2="43" y2="62" stroke="#6F6961" stroke-width="2"/>
            <line x1="8" y1="14" x2="34" y2="12" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="8" y1="24" x2="34" y2="22" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="8" y1="34" x2="34" y2="32" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="52" y1="12" x2="78" y2="14" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="52" y1="22" x2="78" y2="24" stroke="#C9C3BA" stroke-width="2"/>
            <line x1="52" y1="32" x2="78" y2="34" stroke="#C9C3BA" stroke-width="2"/>
          </g>
          <text x="115" y="240" text-anchor="middle" font-family="sans-serif" font-size="12" fill="#9E9890">이달의 책</text>
        </svg>
      </div>
      <div class="weekly__info">
        <p class="weekly__label">책 소개</p>
        <p class="weekly__title">${kDTO.book }</p>
        <p class="weekly__author">${kDTO.author } &nbsp;&nbsp; </p>
        <p class="weekly__desc">
        	${kDTO.synopsis }
        </p>
      </div>
    </div>
    <fieldset class="vote">
	<label class="field__label" for="thought">투표 주제를 선택해주세요</label>
      <label class="vote__item">
        <input type="radio" name="choice" value="1">
        <span>${kDTO.topic1 }</span>
      </label>
      <label class="vote__item">
        <input type="radio" name="choice" value="2">
        <span>${kDTO.topic2 }</span>
      </label>
      <label class="vote__item">
        <input type="radio" name="choice" value="3">
        <span>${kDTO.topic3 }</span>
      </label>

      <button class="vote__submit" type="button" id="voteBtn">투표하기</button>
    </fieldset>
  </div>

</div>

</body>
</html>
