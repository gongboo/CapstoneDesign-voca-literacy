<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../../common/head.jspf"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="/usr/member/myPage/mypage1">마이페이지</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/usr/member/myPage/mypage1">마이리포트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/member/myPage/mypage2">개인정보 수정</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
  <p>현재까지 1000개의 단어를 학습했습니다.</p>
  <p>그래프</p>
  <div>
    <canvas id="myChart" width="400" height="400"></canvas>
  </div>
</div>
<script>
  const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

  const data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {}
  };
  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
</script>
 
<%@ include file="../../common/foot.jspf"%>
