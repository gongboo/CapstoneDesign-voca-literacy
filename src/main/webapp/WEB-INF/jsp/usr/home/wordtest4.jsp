
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>
    
<nav class="navbar navbar-expand-md">
  <div class="container">
    <a class="navbar-brand" href="#">학습하기</a>

    <div class="navbar-collapse navbar-expand" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">어휘테스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usr/learn/shortTextRead">짧은 글읽기</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
<div class="col">
	<c:forEach var="question" items="${questions}">
		<div class="container" style="padding: 12px">
			<div class="col">
			<h4>문제 = ${question.word.name}</h4>
			<table>
			<colgroup>
					<col width="200" />
				</colgroup>
				<tbody>
					<tr>
						<th>보기1</th>
						<td>${question.examples[0]}</td>
					</tr>
					<tr>
						<th>보기2</th>
						<td>${question.examples[1]}</td>
					</tr>
					<tr>
						<th>보기3</th>
						<td>${question.examples[2]}</td>
					</tr>
					<tr>
						<th>보기4</th>
						<td>${question.examples[3]}</td>
					</tr>
					<tr>
						<th>보기5</th>
						<td>${question.examples[4]}</td>
					</tr>
				</tbody>
			</table>
            <h4>답 = ${question.answer+1}</h4>
			</div>
		</div>
  	</c:forEach>
</div>
</div>

    <div class="container">
        <div class="col"><a class="btn btn-custom" type="button">이전 문제</a><a class="btn btn-custom" href="/usr/learn/wordtest3" type="button">다음 문제</a></div>
    </div>

<%@ include file="../common/foot.jspf"%>
