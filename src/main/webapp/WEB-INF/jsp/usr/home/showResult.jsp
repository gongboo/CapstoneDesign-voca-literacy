<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>

<div>결과창</div>
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