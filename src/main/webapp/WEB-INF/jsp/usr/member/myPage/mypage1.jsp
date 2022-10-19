<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../../common/head.jspf"%>

<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="/usr/member/myPage/mypage1">학습관리</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/usr/member/myPage/mypage1">마이리포트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/member/myPage/mypage2">나의 단어장</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/member/myPage/mypage3">오답 노트</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
  <p>현재까지 1000개의 단어를 학습했습니다.</p>
  <p>그래프</p>
</div>

<%@ include file="../../common/foot.jspf"%>
