<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:set var="pageTitle" value="메인" />
<%@ include file="../common/head.jspf"%>
<div class="container">
    <div class="row">
        <div class="col-md-6" style="padding: 12px;">
            <a href="/usr/learn/wordtest1" class="a-null">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">📝 테스트 보기</h4>
                        <p>테스트로 학습합니다.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-6" style="padding: 12px;">
            <a href="/usr/dictionary/list" class="a-null">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">🔎 단어 검색하기</h4>
                        <p>모르는 단어를 검색합니다.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<div class="container" style="padding: 6px 12px;">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">🔥 지금 인기있는 단어</h4>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-group" style="border-style: none;">
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <ul class="list-group" style="border-style: none;">
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                            <li class="list-group-item" style="border-style: none;"><span>List Group Item 1</span><a href="#" style="float:right;" class="a-custom">저장하기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6" style="padding: 12px;">
            <a href="/usr/member/myPage/word" class="a-null">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">📚 나의 단어장 보기</h4>
                        <p>내가 저장한 단어들을 봅니다.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-6" style="padding: 12px;">
            <a href="/usr/member/myPage/mypage1" class="a-null">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">📈 나의 학습 상황</h4>
                        <p>나의 학습 상승률을 확인합니다.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<%@ include file="../common/foot.jspf"%>
