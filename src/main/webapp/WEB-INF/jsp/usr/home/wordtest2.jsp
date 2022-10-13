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
            <div class="progress-bar bg-success" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
        </div>
    </div>
    <div class="container" style="padding: 12px;">
        <div class="card">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">문제6</h4>
                <p class="card-text">지난날의 잘못이나 허물을 고쳐 올바르고 착하게 됨</p>
                <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2"><label class="form-check-label" for="formCheck-2">개과천선</label></div>
                <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3"><label class="form-check-label" for="formCheck-3">Label</label></div>
                <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-4"><label class="form-check-label" for="formCheck-4">Label</label></div>
                <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Label</label></div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col"><button class="btn btn-custom" type="button">이전 문제</button><button class="btn btn-custom" type="button">다음 문제</button></div>
    </div>

<%@ include file="../common/foot.jspf"%>