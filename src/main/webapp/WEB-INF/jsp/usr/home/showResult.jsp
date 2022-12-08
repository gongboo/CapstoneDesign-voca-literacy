<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>

<div id="top-sticky">
    <div class="container top-inner">
        <a class="btn btn-custom" aria-current="page" href="/usr/dictionary/list">사전검색</a>
        <a class="btn btn-custom" href="/usr/dictionary/pic">사진 검색</a>

        <form method="POST" enctype="multipart/form-data" action="/upload" class="flex" style="border: 2px solid white; background-color: white;">
            <div class="input-group">
                <input class="btn form-control" maxlength="20" type="file" name="file" />
                <input class="btn form-control" type="submit" value="Upload" />
                <a class="btn btn-custom" href="/imagesearch">검색</a>
            </div>
        </form>
    </div>

    <div class="container" id="menu-container">
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/home/showResult">틀린 단어들</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/Wrongword">오답 단어장</a>
 
    </div>
</div>


<c:forEach var="word" items="${wordlist}">
		<div class="container" style="padding: 12px">
			<div class="col">
			<h4>${word.name}</h4>
      <p>[${word.type}] ${word.mean}</p>
			<a href="${rq.getWordDetailUriFromWordList(word)}" style="padding: 0px 10px 0px 0px" class="a-custom">자세히보기</a>
			<a href="/usr/member/myPage/addWrongWord?name=${word.name}" style="padding: 0px 10px 0px 0px" class="a-custom">내 단어장에 추가</a>
			</div>
		</div>
  	</c:forEach>
<%@ include file="../common/foot.jspf"%>