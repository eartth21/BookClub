<%-- ============================================================
     ë¶ì ë¶ì  ëìí ë¡ í - ê³µíµ ì¤íì¼ ì¡°ê°
     ê° JSP ì head ììì include ì§ììë¡ ë¶ë¬ ìëë¤.
     ê²½ë¡ë ì¬ëìë¡ ììíë ì ëê²½ë¡ë¥¼ ì°ì¸ì : /inc/book_style.jsp
     ============================================================ --%>
<style>
/* ============================================================
   ë¶ì ë¶ì  ëìí ë¡ í - ê³µíµ ì¤íì¼
   index.jsp ë¥¼ ì ì¸í ëª¨ë  íì íì´ì§ê° ì´ íì¼ì ì¬ì©í©ëë¤.
   ============================================================ */

:root{
  --bg:#E7E3DA;         /* ë°í */
  --cover:#FDFCFA;      /* ì§ë©´ */
  --ink:#6F6961;        /* ê°ì¥ ì§í ë¸ë¼ì´ê·¸ë ì´ */
  --ink-mid:#9E9890;    /* ì¤ê° í¤ */
  --ink-soft:#C9C3BA;   /* ì°í í¤ */
  --page:#F1EEE8;       /* ê°ì¡° ë°°ê²½ */
  --radius:2px;
  --left-w:248px;       /* í¼ì¹ ì± ì¼ìª½ ë©´ ëë¹ */
  --gutter-w:46px;      /* ì± ê°ì´ë° ì íë¶ */
}

*{ box-sizing:border-box; }
html, body{ height:100%; }

body{
  margin:0;
  background:var(--bg);
  font-family:"Pretendard","Apple SD Gothic Neo","Malgun Gothic","Noto Sans KR",sans-serif;
  color:var(--ink);
  padding:40px 40px 40px 0;   /* ì¤ë¥¸ìª½ì¼ë¡ ì¹ì°ì¹ í¼ì¹ ì± */
}

/* ===== í¼ì¹ ì± ===== */
.spread{
  position:relative; height:100%;
  border:2px solid var(--ink); border-left:0;
  border-radius:0 var(--radius) var(--radius) 0;
  background:var(--cover);
  display:flex; overflow:hidden;
}

.spread__gutter{
  position:absolute; left:var(--left-w); top:-2px; bottom:-2px; width:var(--gutter-w);
  border-left:2px solid var(--ink); border-top:2px solid var(--ink);
  border-top-left-radius:var(--gutter-w);
  pointer-events:none;
}

/* ===== ì¼ìª½ ë©´ : ë©ì¸ë©ë´ + íìë©ë´ ===== */
.page-left{
  flex:0 0 var(--left-w); padding:56px 26px 32px;
  display:flex; flex-direction:column;
}
.page-left__title{ margin:0 0 4px; font-size:24px; font-weight:800; letter-spacing:-0.01em; }
.page-left__rule{ width:100%; height:2px; margin:14px 0 34px; background:var(--ink); border:0; }

.submenu{ list-style:none; margin:0; padding:0; display:flex; flex-direction:column; gap:6px; }
.submenu__link{
  display:block; padding:11px 12px;
  border-left:3px solid transparent;
  font-size:15px; color:var(--ink-mid); text-decoration:none;
  transition:color .15s ease, border-color .15s ease, background-color .15s ease;
}
.submenu__link:hover{ color:var(--ink); background:var(--page); }
.submenu__link.is-active{
  color:var(--ink); font-weight:700; border-left-color:var(--ink); background:var(--page);
}
.submenu__link:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }
/* ê´ë¦¬ì ë©ë´ì²ë¼ ìëìª½ì ë¨ì´ë¨ë¦´ ë */
.submenu__gap{ margin-top:26px; padding-top:20px; border-top:1px solid var(--ink-soft); }

/* ì¼ìª½ íë¨ : ì¸ë±ì¤ë¡ ëìê°ê¸° */
.back{
  margin-top:auto; align-self:flex-start;
  display:inline-flex; align-items:center; justify-content:center;
  padding:10px 20px; border:1.5px solid var(--ink); border-radius:var(--radius);
  background:transparent; color:var(--ink);
  font-size:14px; font-weight:600; text-decoration:none;
  transition:background-color .15s ease, color .15s ease;
}
.back-row{
  margin-top:auto;
  display:flex; gap:8px;
}
.back-row .back{
  margin-top:0;   /* 개별 .back 의 margin-top:auto 를 무효화 */
}
.back:hover, .back:focus-visible{ background:var(--ink); color:#FFFFFF; }
.back:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }

/* ===== ì¤ë¥¸ìª½ ë©´ ===== */
.page-right{
  flex:1 1 auto; padding:56px 64px 48px calc(var(--gutter-w) + 34px);
  overflow-y:auto;
}
/* íë¨ì ë²í¼ì ë¶ì¬ì¼ íë íë©´(ê²ìí ëª©ë¡ ë±) */
.page-right--stack{ display:flex; flex-direction:column; }

.page-head{ margin:0 0 28px; font-size:19px; font-weight:700; }
.page-body{ max-width:640px; margin:0; font-size:15px; line-height:1.95; }
.page-body + .page-body{ margin-top:16px; }

/* ===== ì´ë¯¸ì§ ìë¦¬ ===== */
.photo{
  width:min(560px,100%); aspect-ratio:16 / 10; margin-bottom:26px;
  border:1px solid var(--ink-soft); border-radius:var(--radius);
  background:var(--ink-soft);
  display:flex; align-items:center; justify-content:center;
  color:#FFFFFF; font-size:14px; letter-spacing:0.08em;
}
.book-photo{
  flex:0 0 auto; width:230px; aspect-ratio:3 / 4;
  border:1px solid var(--ink-soft); border-radius:var(--radius);
  background:var(--ink-soft);
  display:flex; align-items:center; justify-content:center;
  color:#FFFFFF; font-size:14px; letter-spacing:0.08em;
}

/* ===== ëª©ë¡ í(ê³µì§/ê²ìí/í ë¡ ì¼ì§ ê³µì©) ===== */
.list-table{ width:100%; max-width:780px; border-collapse:collapse; font-size:15px; }
.list-table th, .list-table td{
  padding:13px 12px; border-bottom:1px solid var(--ink-soft); text-align:left;
}
.list-table thead th{
  border-bottom:1.5px solid var(--ink);
  font-size:13px; font-weight:700; letter-spacing:0.06em; color:var(--ink-mid);
}
.list-table tbody tr:hover{ background:var(--page); }
.list-table a{ color:var(--ink); text-decoration:none; }
.list-table a:hover{ text-decoration:underline; }
.list-table tfoot td{ border-bottom:0; font-weight:700; }
.col-no{ width:86px; }
.col-round{ width:90px; }
.col-writer{ width:110px; }
.col-date{ width:120px; }
.col-hit{ width:80px; }

/* ===== ë²í¼ ===== */
.btn{
  display:inline-flex; align-items:center; justify-content:center;
  min-width:120px; height:46px; padding:0 24px;
  border:1.5px solid var(--ink); border-radius:var(--radius);
  font:inherit; font-size:15px; font-weight:600; text-decoration:none; cursor:pointer;
  transition:background-color .15s ease, color .15s ease;
}
.btn--primary{ background:var(--ink); color:#FFFFFF; }
.btn--primary:hover{ background:var(--cover); color:var(--ink); }
.btn--ghost{ background:transparent; color:var(--ink); }
.btn--ghost:hover{ background:var(--ink); color:#FFFFFF; }
.btn:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }

/* ê²ìí ê¸ì°ê¸°(ë¥ê·¼ ë²í¼) */
.write{
  margin-top:auto; align-self:center;
  display:inline-flex; align-items:center; justify-content:center;
  min-width:96px; padding:12px 26px;
  border:1.5px solid var(--ink); border-radius:999px;
  background:var(--cover); color:var(--ink);
  font-size:15px; font-weight:600; text-decoration:none;
  transition:background-color .15s ease, color .15s ease;
}
.write:hover, .write:focus-visible{ background:var(--ink); color:#FFFFFF; }
.write:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }

/* ìì¸ íë©´ì ëª©ë¡ì¼ë¡ */
.to-list{
  display:inline-flex; align-items:center; justify-content:center;
  padding:10px 22px; border:1.5px solid var(--ink); border-radius:var(--radius);
  background:transparent; color:var(--ink);
  font-size:14px; font-weight:600; text-decoration:none;
  transition:background-color .15s ease, color .15s ease;
}
.to-list:hover, .to-list:focus-visible{ background:var(--ink); color:#FFFFFF; }
.to-list:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }

/* ===== ëìë¦¬ ì°í : ì°í ===== */
.timeline{
  max-width:640px; margin:0; padding:4px 0 0 22px;
  list-style:none; border-left:1.5px solid var(--ink-soft);
}
.timeline__item{ position:relative; padding:0 0 26px 4px; }
.timeline__item:last-child{ padding-bottom:0; }
.timeline__item::before{
  content:""; position:absolute; left:-29px; top:7px;
  width:9px; height:9px; border:1.5px solid var(--ink);
  border-radius:50%; background:var(--cover);
}
.timeline__year{
  display:block; margin-bottom:4px;
  font-size:14px; font-weight:700; letter-spacing:0.06em; color:var(--ink);
}
.timeline__desc{ margin:0; font-size:15px; line-height:1.8; color:var(--ink-mid); }

/* ===== ë¶ì ìê° ===== */
.officers{
  display:grid; grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
  gap:12px; max-width:640px; margin:0 0 34px; padding:0; list-style:none;
}
.officer{
  padding:16px 16px 18px; border:1px solid var(--ink-soft);
  border-radius:var(--radius); background:var(--page);
}
.officer__role{
  display:block; margin-bottom:8px;
  font-size:12px; font-weight:700; letter-spacing:0.14em; color:var(--ink-mid);
}
.officer__name{ display:block; font-size:17px; font-weight:700; }
.officer__grade{ display:block; margin-top:4px; font-size:13px; color:var(--ink-mid); }

.roster{ width:100%; max-width:640px; border-collapse:collapse; font-size:15px; }
.roster caption{
  margin-bottom:10px; font-size:14px; font-weight:700; text-align:left; color:var(--ink);
}
.roster th, .roster td{
  padding:11px 14px; border-bottom:1px solid var(--ink-soft); text-align:left;
}
.roster thead th{
  border-bottom:1.5px solid var(--ink);
  font-size:13px; font-weight:700; letter-spacing:0.06em; color:var(--ink-mid);
}
.roster tbody th{ font-weight:600; }
.roster tfoot td{ border-bottom:0; font-weight:700; }

/* ===== ê¸ì£¼ì ì± ===== */
.weekly{ display:flex; flex-wrap:wrap; gap:34px; margin-bottom:40px; }
.weekly__info{ flex:1 1 260px; max-width:420px; }
.weekly__label{
  margin:0 0 12px; font-size:13px; font-weight:700;
  letter-spacing:0.14em; color:var(--ink-mid);
}
.weekly__title{ margin:0 0 6px; font-size:22px; font-weight:800; }
.weekly__author{ margin:0 0 18px; font-size:14px; color:var(--ink-mid); }
.weekly__desc{ margin:0; font-size:15px; line-height:1.9; }

.vote{
  max-width:620px; padding:24px 26px;
  border:1px solid var(--ink-soft); border-radius:var(--radius); background:var(--page);
}
.vote__legend{ padding:0; margin:0 0 18px; font-size:16px; font-weight:700; }
.vote__item{
  display:flex; align-items:flex-start; gap:10px; padding:10px 0;
  border-bottom:1px solid var(--ink-soft); cursor:pointer; font-size:15px; line-height:1.6;
}
.vote__item:last-of-type{ border-bottom:0; }
.vote__item input{ margin-top:4px; accent-color:var(--ink); }
.vote__submit{
  margin-top:22px; width:100%; height:46px;
  border:1.5px solid var(--ink); border-radius:var(--radius);
  background:var(--ink); color:#FFFFFF;
  font:inherit; font-size:15px; font-weight:700; cursor:pointer;
  transition:background-color .15s ease, color .15s ease;
}
.vote__submit:hover{ background:var(--cover); color:var(--ink); }
.vote__submit:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }

/* ===== ìì¹´ì´ë¸ ===== */
.search{ display:flex; gap:8px; max-width:640px; margin-bottom:34px; }
.search__select, .search__input{
  height:42px; padding:0 12px; border:1px solid var(--ink-soft);
  border-radius:var(--radius); background:var(--cover);
  font:inherit; font-size:15px; color:var(--ink);
}
.search__select{ flex:0 0 110px; }
.search__input{ flex:1 1 auto; }
.search__btn{
  flex:0 0 auto; height:42px; padding:0 22px;
  border:1.5px solid var(--ink); border-radius:var(--radius);
  background:var(--ink); color:#FFFFFF;
  font:inherit; font-size:15px; font-weight:600; cursor:pointer;
}
.search__btn:hover{ background:var(--ink-mid); border-color:var(--ink-mid); }
.search__select:focus-visible, .search__input:focus-visible, .search__btn:focus-visible{
  outline:2px solid var(--ink); outline-offset:2px;
}

.shelf{
  display:flex; gap:10px; align-items:flex-end;
  max-width:820px; margin:0 0 30px; padding:0 0 12px;
  border-bottom:2px solid var(--ink); list-style:none; overflow-x:auto;
}
.spine{
  flex:0 0 auto; width:58px; height:200px; padding:16px 0;
  border:1px solid var(--ink); border-radius:var(--radius) var(--radius) 0 0;
  background:var(--page); color:var(--ink);
  font-size:16px; font-weight:600; letter-spacing:0.05em;
  writing-mode:vertical-rl; text-orientation:upright;
  display:flex; align-items:center; justify-content:center;
  text-decoration:none;
  transition:transform .15s ease;
}
.spine:nth-child(3n+2){ background:var(--ink-soft); }
.spine:nth-child(3n){ background:var(--ink-mid); color:#FFFFFF; }
.spine:hover, .spine:focus-visible{ transform:translateY(-8px); }
.spine:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }

.cards{
  list-style:none; margin:0; padding:0; max-width:760px;
  display:flex; flex-direction:column; gap:12px;
}
.card{
  display:block; width:100%; padding:18px 20px;
  border:1px solid var(--ink-soft); border-radius:var(--radius);
  background:var(--cover); text-decoration:none;
  transition:background-color .15s ease;
}
.card:hover{ background:var(--page); }
.card:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }
.card__title{ display:block; margin-bottom:6px; font-size:17px; font-weight:700; color:var(--ink); }
.card__meta{ display:block; font-size:13px; color:var(--ink-mid); }

.detail{ display:flex; flex-wrap:wrap; gap:38px; margin-bottom:36px; }
.detail__info{ flex:1 1 280px; max-width:420px; }
.detail__label{
  margin:0 0 8px; font-size:13px; font-weight:700;
  letter-spacing:0.14em; color:var(--ink-mid);
}
.stars{ margin:0 0 28px; font-size:22px; letter-spacing:4px; color:var(--ink); }
.stars small{ margin-left:10px; font-size:14px; letter-spacing:0; color:var(--ink-mid); }
.reviews{ list-style:none; margin:0; padding:0; }
.reviews li{
  padding:12px 0; border-bottom:1px solid var(--ink-soft);
  font-size:15px; line-height:1.7;
}
.reviews li:last-child{ border-bottom:0; }
.reviews span{ display:block; margin-top:4px; font-size:13px; color:var(--ink-mid); }
.to-log{
  display:inline-block; padding-bottom:2px;
  font-size:15px; font-weight:600; color:var(--ink);
  text-decoration:none; border-bottom:1.5px solid var(--ink);
}
.to-log:hover{ color:var(--ink-mid); border-color:var(--ink-mid); }

/* ===== ê²ìê¸ ìì¸ ===== */
.post__top{
  display:flex; justify-content:space-between; align-items:flex-start;
  gap:24px; max-width:780px; padding-bottom:20px; border-bottom:1.5px solid var(--ink);
}
.post__title{ margin:0 0 12px; font-size:22px; font-weight:800; line-height:1.4; }
.post__meta{ margin:0; font-size:14px; line-height:1.9; color:var(--ink-mid); }
.post__hit{ flex:0 0 auto; font-size:14px; color:var(--ink-mid); }
.post__content{ max-width:780px; margin:0; padding:34px 2px 0; font-size:15px; line-height:2.0; }
.post__content p{ margin:0 0 16px; }
.post__foot{ margin-top:auto; padding-top:34px; }

/* ===== ëê¸ ===== */
.comments{
  max-width:780px; margin-top:40px; padding-top:26px;
  border-top:1px solid var(--ink-soft);
}
.comments__head{
  margin:0 0 18px; font-size:14px; font-weight:700;
  letter-spacing:0.1em; color:var(--ink-mid);
}
.comments__list{ list-style:none; margin:0 0 24px; padding:0; }
.comment{ padding:16px 0; border-bottom:1px solid var(--ink-soft); }
.comment:last-child{ border-bottom:0; }
.comment__meta{
  display:flex; gap:10px; align-items:baseline; margin-bottom:6px;
  font-size:13px; color:var(--ink-mid);
}
.comment__writer{ font-size:14px; font-weight:700; color:var(--ink); }
.comment__text{ margin:0; font-size:15px; line-height:1.8; }
.comment__form{ display:flex; gap:8px; align-items:flex-start; }
.comment__input{
  flex:1 1 auto; min-height:76px; padding:12px 14px; resize:vertical;
  border:1px solid var(--ink-soft); border-radius:var(--radius);
  background:var(--cover); font:inherit; font-size:15px; line-height:1.7; color:var(--ink);
}
.comment__input:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }
.comment__submit{
  flex:0 0 auto; min-width:88px; height:76px;
  border:1.5px solid var(--ink); border-radius:var(--radius);
  background:var(--ink); color:#FFFFFF;
  font:inherit; font-size:15px; font-weight:600; cursor:pointer;
  transition:background-color .15s ease, color .15s ease;
}
.comment__submit:hover{ background:var(--cover); color:var(--ink); }
.comment__submit:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }

/* ===== ë§ì´íì´ì§ í¼ ===== */
.form{ max-width:520px; }
.field{ margin-bottom:24px; }
.field__label{
  display:block; margin-bottom:8px;
  font-size:13px; font-weight:700; letter-spacing:0.1em; color:var(--ink-mid);
}
.field__input{
  width:100%; height:44px; padding:0 14px;
  border:1px solid var(--ink-soft); border-radius:var(--radius);
  background:var(--cover); font:inherit; font-size:15px; color:var(--ink);
}
.field__input:focus-visible{ outline:2px solid var(--ink); outline-offset:2px; }
.field__input[readonly]{ background:var(--page); color:var(--ink-mid); }
.field__help{ margin:8px 0 0; font-size:13px; color:var(--ink-mid); }
.form__actions{
  display:flex; gap:10px; margin-top:34px;
  padding-top:26px; border-top:1px solid var(--ink-soft);
}

.note{
  max-width:640px; margin:0; padding:22px 24px;
  border:1px dashed var(--ink-soft); border-radius:var(--radius);
  background:var(--page); font-size:15px; line-height:1.9; color:var(--ink-mid);
}

/* ===== ë°ìí ===== */
@media (max-width:900px){
  :root{ --left-w:180px; --gutter-w:32px; }
  body{ padding:20px 20px 20px 0; }
  .page-left{ padding:36px 16px 24px; }
  .page-left__title{ font-size:19px; }
  .page-right{ padding:36px 24px 32px calc(var(--gutter-w) + 20px); }
  .search{ flex-wrap:wrap; }
  .search__select{ flex:0 0 100px; }
  .col-writer, .col-hit{ display:none; }
}

/* ===== ë¡ê·¸ì¸ / íìê°ì ===== */
.auth{ max-width:420px; }
.auth__lead{
  margin:0 0 30px; font-size:15px; line-height:1.8; color:var(--ink-mid);
}
/* ìë ¥ì¹¸ + ì ë²í¼ (ì´ë©ì¼ ì¸ì¦ ë±) */
.field__row{ display:flex; gap:8px; }
.field__row .field__input{ flex:1 1 auto; }
.btn--sm{
  flex:0 0 auto; min-width:96px; height:44px; padding:0 16px;
  border:1.5px solid var(--ink); border-radius:var(--radius);
  background:var(--cover); color:var(--ink);
  font:inherit; font-size:14px; font-weight:600; cursor:pointer;
  transition:background-color .15s ease, color .15s ease;
}
.btn--sm:hover{ background:var(--ink); color:#FFFFFF; }
.btn--sm:focus-visible{ outline:2px solid var(--ink); outline-offset:3px; }
.btn--block{ width:100%; }
.auth__actions{ margin-top:32px; }
.auth__foot{
  margin:22px 0 0; padding-top:20px; border-top:1px solid var(--ink-soft);
  font-size:14px; color:var(--ink-mid); text-align:center;
}
.auth__foot a{ color:var(--ink); font-weight:600; text-decoration:none; }
.auth__foot a:hover{ text-decoration:underline; }
</style>
