<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>

<div id="top-sticky">
    <div class="container top-inner">
        <form class="flex" style="border: 2px solid white">
            <div class="input-group">

                <input class="form-control" name="searchKeyword" type="text" placeholder="지문을 입력하세요"
                       maxlength="1000" value=""/>
                <button class="btn btn-custom" type="submit">입력</button>
            </div>
        </form>
    </div>

    <div class="container" id="menu-container">
        <a class="badge rounded-pill menu-pill-button-selected" href="/usr/dictionary/list">검색하기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/learn/wordtest1">테스트 보기</a>
        <a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
    </div>
</div>

    <div class="container content-container">
        <h5 style="text-align: left;">오늘의 짧은 글</h5>
    </div>


<%@ include file="../common/foot.jspf"%>