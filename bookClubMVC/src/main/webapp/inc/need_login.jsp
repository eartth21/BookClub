<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 필요</title>
</head>
<body>
<script>
    alert("회원전용 게시판입니다.");
    location.href = "${pageContext.request.contextPath}/Mypage?cmd=mypageLogin";
</script>
</body>
</html>
