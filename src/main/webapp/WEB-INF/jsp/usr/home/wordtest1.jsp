<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>
    
    <div class="container">
        <h1>어휘 테스트</h1>
    </div>
    <div class="container">
        <h5 style="text-align: left;">남은 시간: 10:00</h5>
    </div>
    <div class="container">
        <div class="progress">
            <div class="progress-bar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
        </div>
    </div>
    <div class="container" style="padding: 12px;">
        <div class="card">
            <div class="card-body" style="height: 333.242px;">
                <h4>버튼을 눌러 시작하세요!</h4>
            </div>
        </div>
    </div>
    <div class="container"><button class="btn btn-custom" type="button">시작하기</button></div>

<%@ include file="../common/foot.jspf"%>