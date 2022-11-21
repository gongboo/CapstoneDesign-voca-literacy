<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Dictionary" />
<%@ include file="../common/head.jspf"%>

<div id="top-sticky">
    <div class="container top-inner">
        <a class="btn btn-custom" aria-current="page" href="/usr/dictionary/list">사전검색</a>
        <a class="btn btn-custom" href="/usr/dictionary/pic">사진 검색</a>
        <form class="flex" style="border: 2px solid white">
            <div class="input-group">
                        <input maxlength="20" class="form-control" type="file" accept="image/*">
                        <a class="btn btn-custom" href="/imagesearch">검색</a>
            </div>
        </form>
        <p class="text-secondary">단어 개수 : <span>${WordsCount}</span>개</p>
    </div>

    <div class="container" id="menu-container">
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/dictionary/list">검색하기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/learn/wordtest1">테스트 보기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
    </div>
</div>


<div class="container content-container">
<div class="col">
	<c:forEach var="word" items="${words}">
		<div class="container" style="padding: 12px">
			<div class="col">
			<h4>${word.name}</h4>
      <p>[${word.type}] ${word.mean}</p>
			<a href="#" style="padding: 0px 10px 0px 0px" class="a-custom"
				>자세히보기</a
			><a href="#" style="padding: 0px 10px 0px 0px" class="a-custom"
				>내 단어장에 추가</a
			>
			</div>
			<hr />
		</div>
  	</c:forEach>
</div>
</div>


<%@ include file="../common/foot.jspf"%>