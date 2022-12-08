<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="단어 내용" />
<%@ include file="../common/head.jspf"%>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>
<div id="top-sticky">
	<div class="container top-inner">
		<a class="btn btn-custom" href="/usr/dictionary/list">사전검색</a>
		<a class="btn btn-custom" href="/usr/dictionary/pic">사진 검색</a>

		<form class="flex" style="border: 2px solid white">
			<div class="input-group">
				<div class="input-group-prepend">
					<select
							data-value="${param.searchKeywordTypeCode}"
							name="searchKeywordTypeCode" class="form-select w-auto border-change">
						<option disabled="disabled">검색타입</option>
						<option selected value="name">단어</option>
						<option value="type">품사</option>
						<option value="mean">뜻</option>
						<option value="name,mean">단어,뜻</option>
					</select>
				</div>

				<input class="form-control" name="searchKeyword" type="text" placeholder="검색어"
					   maxlength="20" value="${param.searchKeyword}"/>
				<button class="btn btn-custom" type="submit">검색</button>
			</div>
		</form>
		<p class="text-secondary">단어 개수 : <span>${WordsCount}</span>개</p>
	</div>

	<div class="container" id="menu-container">
		<a class="badge rounded-pill menu-pill-button-selected" href="/usr/dictionary/list">검색하기</a>
		<a class="badge rounded-pill menu-pill-button" href="/usr/learn/wordtest1">테스트 보기</a>
		<a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
		<a class="badge rounded-pill menu-pill-button" href="/usr/learn/shortTextRead">글 읽기</a>
	</div>
</div>

<%--<nav class="navbar navbar-expand-md">--%>
<%--  <div class="container">--%>
<%--    <a class="navbar-brand" href="/usr/dictionary/list">단어검색</a>--%>

<%--    <div class="navbar-collapse navbar-expand" id="navbarNav">--%>
<%--      <ul class="navbar-nav">--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link active" aria-current="page" href="/usr/dictionary/list">사전검색</a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link" href="/usr/dictionary/pic">사진 검색</a>--%>
<%--        </li>--%>
<%--      </ul>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</nav>--%>


	<div class="container content-container">
		<h4>${word.name}</h4>
	<p>[${word.type}] ${word.mean} <br />  <br /> 예시) ${word.example}</p>

		<c:if test="${rq.logined}"> 
			<form method="post" action="../member/myPage/addWord?name=${word.name}">
			<button class="btn btn-custom" type="submit">내 단어장에 추가하기</button></form>
		</c:if>
<br>
		<c:if test="${not empty param.listUri}">
			<a href="${param.listUri}" style="padding: 0px 10px 0px 0px" class="a-custom">뒤로가기</a>
		</c:if>
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
					<tr>
						<th>고유어 여부</th>
						<td>${word.origin}</td>
					</tr>
					<tr>
						<th>예문</th>
						<td>${word.example}</td>
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
			<form method="post" action="../member/myPage/addWord?name=${word.name}">
           <button class="btn btn-link" type="submit">내 단어장에 추가하기</button></form>
            </c:if>
          
		
		</div>
	</div>
</section> -->



<%@ include file="../common/foot.jspf"%>