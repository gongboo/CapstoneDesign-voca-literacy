<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>
<div id="top-sticky">
    <div class="container top-inner">
        <p style="text-align: center; font-size: large;">남은 시간</p>
        <strong><p style="text-align: center; font-size: large;">3:00</p></strong>
<%--        <p>푼 문제</p>--%>
<%--        <div class="progress">--%>
<%--            <div class="progress-bar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="background-color:var(--main-point-color);"></div>--%>
<%--        </div>--%>
    </div>


    <div class="container" id="menu-container">
        <a class="badge rounded-pill menu-pill-button" href="/usr/dictionary/list">검색하기</a>
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/learn/wordtest1">테스트 보기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/learn/shortTextRead">글 읽기</a>
    </div>
</div>

<%--<nav class="navbar navbar-expand-md">--%>
<%--  <div class="container">--%>
<%--    <a class="navbar-brand" href="/usr/learn/wordtest1">학습하기</a>--%>

<%--    <div class="navbar-collapse navbar-expand" id="navbarNav">--%>
<%--      <ul class="navbar-nav">--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link active" aria-current="page" href="/usr/learn/wordtest1">어휘테스트</a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link" href="/usr/learn/wordtest_wrong">오답노트</a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link" href="/usr/learn/shortTextRead">문학읽기</a>--%>
<%--        </li>--%>
<%--      </ul>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</nav>--%>

<div class="container content-container">
    <div class="container" style="padding: 12px;">
        <div class="container">
            <h4>버튼을 눌러 시작하세요!</h4>
        </div>
    </div>
    <div class="container"><a class="btn btn-custom" href="/usr/learn/wordtest2" type="button">시작하기</a></div>
</div>


<%@ include file="../common/foot.jspf"%>