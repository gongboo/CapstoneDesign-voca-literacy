<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>
    
<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="#">학습하기</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">어휘테스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/learn/shortTextRead">짧은 글읽기</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <div class="container">
        <h5 style="text-align: left;">남은 시간: 10:00</h5>
    </div>
    <div class="container">
        <div class="progress">
            <div class="progress-bar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%; background-color: green;">50%</div>
        </div>
    </div>
    <div class="container" style="padding: 12px;">
        <div class="card">
            <div class="card-body" style="height: 333.242px;">
                <h4>결과</h4>
                <h4>9/10</h4>
            </div>
        </div>
    </div>
    <div class="container"><button class="btn btn-custom" type="button">정답 보기</button></div>
    

<%@ include file="../common/foot.jspf"%>