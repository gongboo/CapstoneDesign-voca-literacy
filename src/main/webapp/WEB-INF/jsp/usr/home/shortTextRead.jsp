<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>

<div id="top-sticky">
    <div class="container top-inner">
        <div style="align-items: center">
            <button class="btn btn-custom" type="submit">
                랜덤 지문으로 보기
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shuffle" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M0 3.5A.5.5 0 0 1 .5 3H1c2.202 0 3.827 1.24 4.874 2.418.49.552.865 1.102 1.126 1.532.26-.43.636-.98 1.126-1.532C9.173 4.24 10.798 3 13 3v1c-1.798 0-3.173 1.01-4.126 2.082A9.624 9.624 0 0 0 7.556 8a9.624 9.624 0 0 0 1.317 1.918C9.828 10.99 11.204 12 13 12v1c-2.202 0-3.827-1.24-4.874-2.418A10.595 10.595 0 0 1 7 9.05c-.26.43-.636.98-1.126 1.532C4.827 11.76 3.202 13 1 13H.5a.5.5 0 0 1 0-1H1c1.798 0 3.173-1.01 4.126-2.082A9.624 9.624 0 0 0 6.444 8a9.624 9.624 0 0 0-1.317-1.918C4.172 5.01 2.796 4 1 4H.5a.5.5 0 0 1-.5-.5z"/>
                    <path d="M13 5.466V1.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384l-2.36 1.966a.25.25 0 0 1-.41-.192zm0 9v-3.932a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384l-2.36 1.966a.25.25 0 0 1-.41-.192z"/>
                </svg>
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
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/Wrongword">오답 단어장</a>
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/book/list">글 읽기</a>
    </div>
</div>

    <div class="container content-container">
        <div class="container">
            <div style="display: inline-block; background-color: palevioletred; width:20px; height: 10px;">
            </div>
            <div style="display: inline;">수능 고빈도어</div>
        </div>
        <div class="container" id="words-container">

        </div>
    </div>

<script>
    var text="개나리 노란 꽃 그늘 아래 가지런히 놓여 있는 꼬까신 하나";
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