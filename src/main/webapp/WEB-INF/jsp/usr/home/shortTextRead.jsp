<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>
    
<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="/usr/learn/wordtest1">학습하기</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/usr/learn/wordtest1">어휘테스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/usr/learn/shortTextRead">짧은 글읽기</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <div class="container">
        <h5 style="text-align: left;">오늘의 짧은 글</h5>
    </div>


<%@ include file="../common/foot.jspf"%>