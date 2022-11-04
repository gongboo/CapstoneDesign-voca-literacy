<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="단어 내용" />
<%@ include file="../common/head.jspf"%>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>
<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="/usr/dictionary/list">단어검색</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/usr/dictionary/list">사전검색</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/dictionary/pic">사진 검색</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="col">
	<div class="container" style="padding: 12px">
		<div class="col">
		<h4>${word.name}</h4>
	<p>[${word.type}] ${word.mean}</p>

		<c:if test="${rq.logined}"> 
			<form method="post" action="../member/myPage/addWord?id=${word.id}">
			<button class="btn btn-custom" type="submit">내 단어장에 추가하기</button></form>
		</c:if>
<br>
		<c:if test="${not empty param.listUri}">
			<a href="${param.listUri}" style="padding: 0px 10px 0px 0px" class="a-custom">뒤로가기</a>
		</c:if>
	</div>
</div>

<!-- 
<section class="mt-5">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td>
							<div class="badge badge-primary">${word.id}</div>
						</td>
					</tr>
					<tr>
						<th>단어</th>
						<td>${word.name}</td>
					</tr>
					<tr>
						<th>품사</th>
						<td>${word.type}</td>
					</tr>
					<tr>
						<th>뜻</th>
						<td>${word.mean}</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<div class="btns">
			<c:if test="${empty param.listUri}">
				<button class="btn btn-link" type="button" onclick="history.back();">뒤로가기</button>
			</c:if>

			<c:if test="${not empty param.listUri}">
				<a class="btn btn-link" href="${param.listUri}">뒤로가기</a>
			</c:if>
			<c:if test="${rq.logined}"> 
			<form method="post" action="../member/myPage/addWord?id=${word.id}">
           <button class="btn btn-link" type="submit">내 단어장에 추가하기</button></form>
            </c:if>
          
		
		</div>
	</div>
</section> -->



<%@ include file="../common/foot.jspf"%>