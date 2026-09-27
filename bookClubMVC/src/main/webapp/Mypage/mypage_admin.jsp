<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
  /* 왼쪽 하위메뉴를 <button>으로 쓰기 위한 리셋 (탭 전환용) */
  .submenu__link.submenu__btn{
    width:100%; border:0; border-left:3px solid transparent;
    background:transparent; font:inherit; text-align:left; cursor:pointer;
  }

  .admin-panel[hidden]{ display:none; }

  .admin-section__head{
    margin:0 0 20px; font-size:17px; font-weight:700;
  }

  /* 승인 대기 목록 */
  .approve-table{ width:100%; max-width:760px; border-collapse:collapse; font-size:15px; }
  .approve-table th, .approve-table td{
    padding:13px 12px; border-bottom:1px solid var(--ink-soft); text-align:left;
  }
  .approve-table thead th{
    border-bottom:1.5px solid var(--ink);
    font-size:13px; font-weight:700; letter-spacing:0.06em; color:var(--ink-mid);
  }
  .approve-table .col-btn{ width:160px; }
  .approve-table tbody tr:hover{ background:var(--page); }

  .approve-row{ display:flex; gap:8px; align-items:center; justify-content:flex-end; }

  .approve-select{
    height:36px; padding:0 10px;
    border:1px solid var(--ink-soft); border-radius:var(--radius);
    background:var(--cover); font:inherit; font-size:13px; color:var(--ink);
  }
  .approve-select:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }

  .btn--approve{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:56px; height:36px; padding:0 14px;
    border:1.5px solid var(--ink); border-radius:var(--radius);
    background:var(--ink); color:#FFFFFF;
    font:inherit; font-size:13px; font-weight:600; cursor:pointer;
    transition:background-color .15s ease, color .15s ease;
  }
  .btn--approve:hover{ background:var(--cover); color:var(--ink); }

  .empty-row{
    padding:24px 0; color:var(--ink-mid); font-size:14px;
  }

  /* 금주의 책 마감 카드 */
  .finalize-card{
    max-width:520px; padding:24px 26px;
    border:1px solid var(--ink-soft); border-radius:var(--radius);
    background:var(--page);
  }
  .finalize-card__title{ margin:0 0 4px; font-size:17px; font-weight:800; }
  .finalize-card__author{ margin:0 0 18px; font-size:13px; color:var(--ink-mid); }

  .finalize-topics{ list-style:none; margin:0 0 22px; padding:0; }
  .finalize-topics li{
    display:flex; justify-content:space-between; align-items:baseline;
    padding:10px 0; border-bottom:1px solid var(--ink-soft);
    font-size:14px;
  }
  .finalize-topics li:last-child{ border-bottom:0; }
  .finalize-topics .count{ font-weight:700; color:var(--ink); }

  .btn--finalize{
    width:100%; height:46px;
    border:1.5px solid var(--ink); border-radius:var(--radius);
    background:var(--ink); color:#FFFFFF;
    font:inherit; font-size:15px; font-weight:700; cursor:pointer;
    transition:background-color .15s ease, color .15s ease;
  }
  .btn--finalize:hover{ background:var(--cover); color:var(--ink); }
  .btn--finalize:disabled{
    border-color:var(--ink-soft); background:var(--ink-soft); cursor:default;
  }

  .finalize-result{
    margin:16px 0 0; padding:14px 16px;
    border:1px dashed var(--ink-soft); border-radius:var(--radius);
    background:var(--cover); font-size:14px; color:var(--ink);
  }
</style>
<script>
$(function(){

    // ===== 왼쪽 하위메뉴 탭 전환 =====
    $(".submenu__btn").click(function(){
        var target = $(this).data("target");

        $(".submenu__btn").removeClass("is-active");
        $(this).addClass("is-active");

        $(".admin-panel").attr("hidden", true);
        $("#" + target).removeAttr("hidden");
    });

    // ===== 회원가입 승인 : 행마다 셀렉트 + 확인 =====
    $(".btn--approve").click(function(){
        var $btn = $(this);
        var $row = $btn.closest("tr");
        var userid = $btn.data("userid");
        var value = $row.find(".approve-select").val();   // "0"=대기, "1"=승인

        if(value != "1"){
            alert("변경 사항이 없습니다. '승인'을 선택한 뒤 확인을 눌러주세요.");
            return;
        }

        $.ajax({
            url: '/Mypage?cmd=userApprove',
            type: 'post',
            data: { userid: userid },
            dataType: 'text',
            success: function(result){
                result = result.trim();
                if(result == "OK"){
                    $row.fadeOut(200, function(){ $(this).remove(); });
                } else if(result == "FORBIDDEN"){
                    alert("관리자만 처리할 수 있습니다.");
                } else {
                    alert("승인 처리에 실패했습니다.");
                }
            }
        });
    });

    // ===== 금주의 책 투표 마감 =====
    $("#finalizeBtn").click(function(){
        if(!confirm("투표마감하시겠습니까?")){
            return;
        }

        var $btn = $(this);
        $.ajax({
            url: '/Mypage?cmd=finalizeTopic',
            type: 'post',
            data: { k_idx: $btn.data("kidx") },
            dataType: 'text',
            success: function(result){
                result = result.trim();
                if(result == "OK"){
                    alert("토론주제가 확정되었습니다.");
                    location.reload();
                } else if(result == "ALREADY"){
                    alert("이미 마감된 투표입니다.");
                    location.reload();
                } else if(result == "FORBIDDEN"){
                    alert("관리자만 처리할 수 있습니다.");
                } else {
                    alert("처리 중 오류가 발생했습니다.");
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
    <h1 class="page-left__title">마이페이지</h1>
    <hr class="page-left__rule">

    <ul class="submenu">
      <li>
        <button class="submenu__link submenu__btn is-active" type="button"
                data-target="panel-approve">회원 승인</button>
      </li>
      <li>
        <button class="submenu__link submenu__btn" type="button"
                data-target="panel-finalize">토론 투표 마감</button>
      </li>
      <li class="submenu__gap">
        <a class="submenu__link is-active" href="/Mypage?cmd=mypageAdmin" aria-current="page">관리자 페이지</a>
      </li>
    </ul>

    <a class="back" href="/">목록으로</a>
  </div>

  <div class="spread__gutter"></div>

  <!-- 오른쪽 면 -->
  <div class="page-right">
    <h2 class="page-head">관리자 페이지</h2>

    <!-- ===== 회원 승인 패널 ===== -->
    <section class="admin-panel" id="panel-approve">
      <h3 class="admin-section__head">회원가입 승인 대기</h3>

      <c:choose>
        <c:when test="${empty pendingUsers}">
          <p class="empty-row">승인 대기 중인 회원이 없습니다.</p>
        </c:when>
        <c:otherwise>
          <table class="approve-table">
            <thead>
              <tr>
                <th scope="col">아이디</th>
                <th scope="col">이름</th>
                <th scope="col">학번</th>
                <th scope="col">전화번호</th>
                <th scope="col" class="col-btn">처리</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="u" items="${pendingUsers}">
                <tr>
                  <td>${u.userid}</td>
                  <td>${u.name}</td>
                  <td>${u.num}</td>
                  <td>${u.tel}</td>
                  <td class="col-btn">
                    <div class="approve-row">
                      <select class="approve-select">
                        <option value="0" selected>대기</option>
                        <option value="1">승인</option>
                      </select>
                      <button class="btn--approve" type="button" data-userid="${u.userid}">확인</button>
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:otherwise>
      </c:choose>
    </section>

    <!-- ===== 투표 마감 패널 ===== -->
    <section class="admin-panel" id="panel-finalize" hidden>
      <h3 class="admin-section__head">이번 주 투표 마감</h3>

      <c:choose>
        <c:when test="${empty weeklyBook}">
          <p class="empty-row">등록된 금주의 책이 없습니다.</p>
        </c:when>
        <c:otherwise>
          <div class="finalize-card">
            <p class="finalize-card__title">${weeklyBook.book}</p>
            <p class="finalize-card__author">${weeklyBook.author}</p>

            <ul class="finalize-topics">
              <li>
                <span>${weeklyBook.topic1}</span>
                <span class="count">${weeklyBook.count1}표</span>
              </li>
              <li>
                <span>${weeklyBook.topic2}</span>
                <span class="count">${weeklyBook.count2}표</span>
              </li>
              <li>
                <span>${weeklyBook.topic3}</span>
                <span class="count">${weeklyBook.count3}표</span>
              </li>
            </ul>

            <c:choose>
              <c:when test="${not empty weeklyBook.subject}">
                <button class="btn--finalize" type="button" disabled>이미 마감되었습니다</button>
                <div class="finalize-result">
                  확정된 주제 : ${weeklyBook.subject}
                </div>
              </c:when>
              <c:otherwise>
                <button class="btn--finalize" type="button" id="finalizeBtn" data-kidx="${weeklyBook.k_idx}">투표 마감하기</button>
              </c:otherwise>
            </c:choose>
          </div>
        </c:otherwise>
      </c:choose>
    </section>

  </div>

</div>

</body>
</html>
