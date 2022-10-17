<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jspf"%>

    <div class="container">
        <h1>마이페이지<span style="font-size: 20.52px;"><a class="a-custom" href="/usr/learnControl/mypage1">마이리포트</a>&nbsp;<a class="a-custom" href="/usr/learnControl/mypage2">오답노트</a>&nbsp;<a class="a-custom" href="/usr/learnControl/mypage3">내 단어장</a></span></h1>
    </div>
    <div class="col">
        <div class="container">
            <h4>마이리포트</h4>
        </div>
    </div>
    <div class="container">
        <p>현재까지 1000개의 단어를 학습했습니다.</p>
        <p>그래프</p>
    </div>

<%@ include file="../common/foot.jspf"%>