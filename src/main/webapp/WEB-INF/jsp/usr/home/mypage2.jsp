<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jspf"%>
    

<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="/usr/learnControl/mypage1">학습관리</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/usr/learnControl/mypage1">마이리포트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/usr/learnControl/mypage2">나의 단어장</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/learnControl/mypage3">오답 노트</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <div class="col">
        <div class="container">
            <h4>내 단어장</h4>
        </div>
        <div class="container"><select style="margin-right: 20px;">
                <optgroup label="This is a group">
                    <option value="12" selected="">This is item 1</option>
                    <option value="13">This is item 2</option>
                    <option value="14">This is item 3</option>
                </optgroup>
            </select><select style="margin-right: 20px;">
                <optgroup label="This is a group">
                    <option value="12" selected="">This is item 1</option>
                    <option value="13">This is item 2</option>
                    <option value="14">This is item 3</option>
                </optgroup>
            </select>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>단어</th>
                            <th>뜻</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>개과천선</td>
                            <td>Cell 2</td>
                        </tr>
                        <tr>
                            <td>Cell 3</td>
                            <td>Cell 4</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../common/foot.jspf"%>