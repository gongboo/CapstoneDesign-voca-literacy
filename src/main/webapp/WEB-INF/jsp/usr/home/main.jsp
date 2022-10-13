<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:set var="pageTitle" value="메인" />
<%@ include file="../common/head.jspf"%>

<div class="container" style="padding: 12px">
  <div class="card">
    <div class="card-body" style="padding: 15px">
      <h4 class="card-title">10분 테스트 바로보기</h4>
      <p class="card-text">10분 어휘력 테스트를 봅니다</p>
      <a class="card-link a-custom" href="#">10분 테스트 보러가기</a>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-6" style="padding: 12px">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title">오늘의 단어</h4>
          <h5 class="card-title">개과천선</h5>
          <p class="card-text">
            지난날의 잘못이나 허물을 고쳐 올바르고 착하게 됨
          </p>
          <a class="card-link a-custom" href="#">저장하기</a
          ><a class="card-link a-custom" href="#">자세히보기</a
          ><a class="card-link a-custom" href="#">사전 바로가기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6" style="padding: 12px">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title">지난번에 틀렸던 문제</h4>
          <p class="card-text">
            Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo
            odio, dapibus ac&nbsp;
          </p>
          <p class="card-text">답: 학습</p>
          <a class="card-link a-custom" href="#">오답노트 바로가기</a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container" style="padding: 12px">
  <div class="card">
    <div class="card-body" style="padding: 15px">
      <h4 class="card-title">임시 메뉴</h4>
      <p class="card-text">이렇게 메뉴추가 합니다</p>
      <a class="card-link a-custom" href="#">바로가기</a>
    </div>
  </div>
</div>

<%@ include file="../common/foot.jspf"%>
