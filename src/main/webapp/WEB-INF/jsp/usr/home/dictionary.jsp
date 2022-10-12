<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:set var="pageTitle" value="사전 검색" />
<%@ include file="../common/head.jspf"%> <%-- 사전 검색 페이지 입니다 --%>
<div class="container">
  <h1>사전검색</h1>
</div>
<div class="container">
  <div class="input-group">
    <input class="form-control" type="text" />
    <button class="btn btn-custom" type="button">검색</button>
  </div>
</div>
<div class="col">
  <div class="container" style="padding: 12px">
    <div class="col">
      <h4>학습</h4>
      <p>
        학습(學習) 또는 배움은 본능적인 변화인 성숙과는 달리, 직간접적 경험이나
        훈련에 의해 지속적으로 자각하고, 인지하며, 변화시키는 행동 변화이다.
      </p>
      <a href="#" style="padding: 0px 10px 0px 0px" class="a-custom"
        >자세히보기</a
      ><a href="#" style="padding: 0px 10px 0px 0px" class="a-custom"
        >내 단어장에 추가</a
      >
    </div>
    <hr />
  </div>
  <div class="container" style="padding: 12px">
    <div class="col">
      <h4>학습</h4>
      <p>
        학습(學習) 또는 배움은 본능적인 변화인 성숙과는 달리, 직간접적 경험이나
        훈련에 의해 지속적으로 자각하고, 인지하며, 변화시키는 행동 변화이다.
      </p>
      <a href="#" style="padding: 0px 10px 0px 0px" class="a-custom"
        >자세히보기</a
      >
      <a href="#" style="padding: 0px 10px 0px 0px" class="a-custom"
        >내 단어장에 추가</a
      >
    </div>
    <hr />
  </div>
</div>

<%@ include file="../common/foot.jspf"%>
