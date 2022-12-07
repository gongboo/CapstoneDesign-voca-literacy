<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>

<div id="top-sticky">
    <div class="container top-inner">
        <div style="align-items: center">
            <button class="btn btn-custom" type="submit">
             <a class="badge rounded-pill menu-pill-button-selected" href="/usr/book/detail?ran=1"> 랜덤 지문으로 보기 </a>
            </button>
        </div>
       <!--   <form class="flex" style="border: 2px solid white">
            <div class="input-group">
                <input class="form-control" name="searchKeyword" type="text" placeholder="지문을 입력하세요"
                       maxlength="1000" value=""/>
                <button class="btn btn-custom" type="submit">입력</button>
            </div>
        </form>
    </div>
-->
	<form class="flex" style="border: 2px solid white">
				<div class="input-group">
					<div class="input-group-prepend">
						<select
								data-value="${param.searchKeywordTypeCode}"
								name="searchKeywordTypeCode" class="form-select w-auto border-change">
							<option disabled="disabled">검색타입</option>
							<option selected value="title">제목</option>
							<option value="writer">작가</option>
							<option value="title,writer">제목,작가</option>
						</select>
					</div>

					<input class="form-control" name="searchKeyword" type="text" placeholder="검색어"
						   maxlength="20" value="${param.searchKeyword}"/>
					<button class="btn btn-custom" type="submit">검색</button>
				</div>
			</form>

</div>
    <div class="container" id="menu-container">
        <a class="badge rounded-pill menu-pill-button" href="/usr/dictionary/list">검색하기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/learn/wordtest1">테스트 보기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/learn/shortTextRead">글 읽기</a>
    </div>
</div>


    
    <div class="container content-container">

	<div class="col">
	<c:forEach var="book" items="${books}">
		<div class="container" style="padding: 12px">
			<div class="col">
			<h4>${book.title}</h4>
               <p>[${book.writer}]</p>
			<a href="/usr/book/detail?id=${book.id}" style="padding: 0px 10px 0px 0px" class="a-custom">자세히보기</a>
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

</div>
    
<%@ include file="../common/foot.jspf"%>