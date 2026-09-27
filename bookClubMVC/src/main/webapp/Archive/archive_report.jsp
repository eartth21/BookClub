<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${kDTO.book} 토론일지 | 북적북적 독서토론회</title>
<%@ include file="/inc/book_style.jsp" %>
<style>
  /* ===== 취합 토론일지(보고서) 전용 ===== */
  .report-head{
    margin:0 0 8px; padding-bottom:24px; border-bottom:1.5px solid var(--ink);
  }
  .report-head__title{ margin:0 0 6px; font-size:24px; font-weight:800; }
  .report-head__meta{ margin:0; font-size:14px; color:var(--ink-mid); line-height:1.8; }

  .entries{ list-style:none; margin:28px 0 0; padding:0; }

  .entry{
    padding:24px 0; border-bottom:1px solid var(--ink-soft);
  }
  .entry:last-child{ border-bottom:0; }

  .entry__meta{
    display:flex; justify-content:space-between; align-items:baseline;
    margin-bottom:14px; font-size:14px; color:var(--ink-mid);
  }
  .entry__writer{ font-size:15px; font-weight:700; color:var(--ink); }

  .entry__label{
    margin:0 0 4px; font-size:13px; font-weight:700;
    letter-spacing:0.06em; color:var(--ink-mid);
  }
  .entry__body{ margin:0 0 16px; font-size:15px; line-height:1.85; color:var(--ink); }
  .entry__body:last-child{ margin-bottom:0; }
</style>
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

  <!-- 오른쪽 면 -->
  <div class="page-right page-right--stack">

    <div class="report-head">
      <h2 class="report-head__title">${kDTO.book}</h2>
      <p class="report-head__meta">
        저자 &nbsp;${kDTO.author}<br>
        토론주제 &nbsp;${kDTO.subject}
      </p>
    </div>

    <c:choose>
      <c:when test="${empty talkList}">
        <p class="empty-row">아직 작성된 토론일지가 없습니다.</p>
      </c:when>
      <c:otherwise>
        <ul class="entries">
          <c:forEach var="t" items="${talkList}">
            <li class="entry">
              <div class="entry__meta">
                <span class="entry__writer">${t.num} / ${t.name}</span>
                <span>${t.t_regdate}</span>
              </div>

              <p class="entry__label">의견</p>
              <p class="entry__body">${t.opinion}</p>

              <p class="entry__label">느낀점</p>
              <p class="entry__body">${t.thought}</p>
            </li>
          </c:forEach>
        </ul>
      </c:otherwise>
    </c:choose>

    <div class="post__foot">
      <a class="to-list" href="/Archive?cmd=archiveLogs">목록으로</a>
    </div>
  </div>

</div>

</body>
</html>
