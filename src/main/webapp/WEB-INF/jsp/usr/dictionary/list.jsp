<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Dictionary" />
<%@ include file="../common/head.jspf"%>
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


<div class="container">
  
	<form class="flex">
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
</div>
<div class="col">
	<c:forEach var="word" items="${words}">
		<div class="container" style="padding: 12px">
			<div class="col">
			<h4>${word.name}</h4>
      <p>[${word.type}] ${word.mean}</p>
			<a href="${rq.getWordDetailUriFromWordList(word)}" style="padding: 0px 10px 0px 0px" class="a-custom">자세히보기</a>
			<a href="usr/member/myPage/addWord?id=${word.id}" style="padding: 0px 10px 0px 0px" class="a-custom">내 단어장에 추가</a>
			</div>
		</div>
  	</c:forEach>
</div>
<div class="container">
	<div class="page-menu mt-4">
		<div class="btn-group justify-center">
			<c:set var="pageMenuArmLen" value="9" />
			<c:set var="startPage"
				value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
			<c:set var="endPage"
				value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
			<c:set var="pageBaseUri"
				value="list?searchKeyword=${param.searchKeyword}" />
			<c:set var="pageBaseUri"
				value="${pageBaseUri}&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />

			<c:if test="${startPage > 1}">
				<a class="btn btn-sm " href="${pageBaseUri}&page=1">1</a>
				<c:if test="${startPage > 2}">
					<a class="btn btn-sm btn-disabled">...</a>
				</c:if>
			</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<a class="btn btn-sm ${page == i ? 'btn-active' : '' }"
					href="${pageBaseUri}&page=${i}">${i}</a>
			</c:forEach>

			<c:if test="${endPage < pagesCount}">
				<c:if test="${endPage < pagesCount - 1}">
					<a class="btn btn-sm btn-disabled">...</a>
				</c:if>
				<a class="btn btn-sm" href="${pageBaseUri}&page=${pagesCount}">${pagesCount}</a>
			</c:if>
		</div>
	</div>
</div>




<%@ include file="../common/foot.jspf"%>