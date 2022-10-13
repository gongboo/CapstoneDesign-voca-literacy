<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Dictionary" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<div class="flex">
			<div>
				단어 개수 : <span class="text-blue-700">${WordsCount}</span>개
			</div>
			<div class="flex-grow"></div>
			<form class="flex">
			     <select
					data-value="${param.searchKeywordTypeCode}"
					name="searchKeywordTypeCode" class="select select-bordered">
					<option disabled="disabled">검색타입</option>
					<option value="name">단어</option>
					<option value="type">품사</option>
					<option value="name,type">단어,품사</option>
				</select> <input name="searchKeyword" type="text"
					class="ml-2 w-72 input input-bordered" placeholder="검색어"
					maxlength="20" value="${param.searchKeyword}" />

				<button type="submit" class="ml-2 btn btn-primary">검색</button>
			</form>
		</div>
		<div class="mt-3">
			<table class="table table-fixed w-full">
				<colgroup>
					<col width="50" />
					<col width="100" />
					<col width="100" />

					<col />
				</colgroup>
				<thead>
					<tr>
					    <th></th>
						<th>단어</th>
						<th>품사</th>
						<th>뜻</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="word" items="${words}">
						<tr class="hover">
							<th>${word.id}</th>
							<td>${word.name}</td>
							<td>${word.type}</td>
							<td>${word.mean}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="page-menu mt-4">
			<div class="btn-group justify-center">
				<c:set var="pageMenuArmLen" value="9" />
				<c:set var="startPage"
					value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
				<c:set var="endPage"
					value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />

				<c:set var="pageBaseUri"
					value="${pageBaseUri}&searchKeyword=${param.searchKeyword}" />
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
</section>

<%@ include file="../common/foot.jspf"%>