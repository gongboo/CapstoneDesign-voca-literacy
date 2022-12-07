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
        <form class="flex" style="border: 2px solid white">
            <div class="input-group">
                <input class="form-control" name="searchKeyword" type="text" placeholder="지문을 입력하세요"
                       maxlength="1000" value=""/>
                <button class="btn btn-custom" type="submit">입력</button>
            </div>
        </form>

    </div>

    <div class="container" id="menu-container">
        <a class="badge rounded-pill menu-pill-button" href="/usr/dictionary/list">검색하기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/learn/wordtest1">테스트 보기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/book/list">글 읽기</a>
    </div>
</div>

  
<div class="container content-container">
	<h4>${book.title}</h4>
	<h4>[${book.writer}]</h4>
	<p id="words-container">${book.body}</p>
<br>
<button onclick="history.back()" class="btn btn-custom">뒤로가기</button>
		
	</div>
<script>
    var text="${book.body}";
    words=text.split(" ");
    var texthtml="";
    for ( var i in words ) {
        texthtml+= '<a class="a-readshort" href="javascript:void(0)" onclick="pressText(this)">' + words[i] + '</a> ';
    }
    document.getElementById("words-container").innerHTML=texthtml;

    function pressText(thisElement){
        if (thisElement.classList.contains("a-readshort")) {
            thisElement.classList.remove("a-readshort");
            thisElement.classList.add("a-readshort-clicked");
            //리스트에 넣기
        }
        else if (thisElement.classList.contains("a-readshort-clicked")) {
            thisElement.classList.remove("a-readshort-clicked");
            thisElement.classList.add("a-readshort");
            //리스트에서 빼기
        }
    }
</script>

<%@ include file="../common/foot.jspf"%>