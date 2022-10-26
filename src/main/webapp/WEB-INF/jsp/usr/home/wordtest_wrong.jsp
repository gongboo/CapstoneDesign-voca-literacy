<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jspf"%>
    
<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="/usr/learn/wordtest1">학습하기</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="/usr/learn/wordtest1">어휘테스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/usr/learn/wordtest_wrong">오답노트</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <div class="col">
        <div class="container">
            <h4>오답노트</h4>
        </div>
        <div class="container"></div>
    </div>

<%@ include file="../common/foot.jspf"%>