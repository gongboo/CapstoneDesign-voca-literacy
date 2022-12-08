
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="어휘 테스트" />
<%@ include file="../common/head.jspf"%>
<div id="top-sticky">
	<div class="container top-inner">
		<p style="text-align: center">남은 시간</p>
		<p id="timer-time" style="text-align: center">3:00</p>
<%--		<p>푼 문제</p>--%>
<%--		<div class="progress">--%>
<%--			<div class="progress-bar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;background-color:var(--main-point-color);">50%</div>--%>
<%--		</div>--%>
	</div>


	<div class="container" id="menu-container">
		<a class="badge rounded-pill menu-pill-button" href="/usr/dictionary/list">검색하기</a>
		<a class="badge rounded-pill menu-pill-button-selected" href="/usr/learn/wordtest1">테스트 보기</a>
		<a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/word">나만의 단어장</a>
		<a class="badge rounded-pill menu-pill-button" href="/usr/member/myPage/Wrongword">오답 단어장</a>
		<a class="badge rounded-pill menu-pill-button" href="/usr/book/list">글 읽기</a>
	</div>
</div>
<%--<nav class="navbar navbar-expand-md">--%>
<%--  <div class="container">--%>
<%--    <a class="navbar-brand" href="#">학습하기</a>--%>

<%--    <div class="navbar-collapse navbar-expand" id="navbarNav">--%>
<%--      <ul class="navbar-nav">--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link active" aria-current="page" href="#">어휘테스트</a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link" href="/usr/learn/shortTextRead">짧은 글읽기</a>--%>
<%--        </li>--%>
<%--      </ul>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</nav>--%>

<div class="container content-container">
<div class="col">
	<c:forEach var="question" items="${questions}" varStatus="status">
		<div class="container" id="question-${status.count}">
			<div class="container">
				<h4>문제${status.count}</h4>
				<p>${question.question}</p>
			</div>

				<div class="form-check">
					<div class="form-check"><input class="form-check-input" type="radio" id="formCheck-${status.count}-1" name="question-${status.count}" value="1"><label class="form-check-label" for="formCheck-${status.count}-1">${question.examples[0]}</label></div>
					<div class="form-check"><input class="form-check-input" type="radio" id="formCheck-${status.count}-2" name="question-${status.count}" value="2"><label class="form-check-label" for="formCheck-${status.count}-2">${question.examples[1]}</label></div>
					<div class="form-check"><input class="form-check-input" type="radio" id="formCheck-${status.count}-3" name="question-${status.count}" value="3"><label class="form-check-label" for="formCheck-${status.count}-3">${question.examples[2]}</label></div>
					<div class="form-check"><input class="form-check-input" type="radio" id="formCheck-${status.count}-4" name="question-${status.count}" value="4"><label class="form-check-label" for="formCheck-${status.count}-4">${question.examples[3]}</label></div>
					<div class="form-check"><input class="form-check-input" type="radio" id="formCheck-${status.count}-5" name="question-${status.count}" value="5"><label class="form-check-label" for="formCheck-${status.count}-5">${question.examples[4]}</label></div>
				</div>
		</div>
	</c:forEach>

</div>
<div class="container">
	<div class="col">
		<div class="card" id="score" style="display: none">
			<div class="card-body">
				<h4 class="card-title">결과</h4>
				<p class="card-text" id="result-num">test</p>
			</div>
		</div>
	</div>
</div>

<br>

<div class="container">
	<div class="col"  id="next-button"><button class="btn btn-custom" onclick="show_next_question()">다음 문제</button></div>
	<div class="col" id="answer-button" style="display: none"><button class="btn btn-custom" onclick="submit_answer()">제출하기</button></div>
	<div class="col" id="result-button" style="display: none"><a href="/usr/home/showResult" class="btn btn-custom">틀린 단어보기</a></div>
</div>
</div>
<script>
	var cur_question=[1,0,0,0,0,0,0,0,0,0];
	var question_ids=["question-1","question-2","question-3","question-4","question-5","question-6","question-7","question-8","question-9","question-10"];
	var correct_answers=[];//정답
	<c:forEach var="question" items="${questions}" varStatus="status">
	correct_answers.push(${question.answer+1});
	</c:forEach>
//	var question_word=[];
//	<c:forEach var="word" items="${words}">
//	question_word.push(${word.name});
//	</c:forEach>
	for (var i = 1; i < question_ids.length; i++) {
		document.getElementById(question_ids[i]).style.display = "none";
	}
	var correct_or_not=[false,false,false,false,false,false,false,false,false,false]//

	for (var i = 1; i < question_ids.length; i++) {
		document.getElementById(question_ids[i]).style.display = "none";
	}
	

	function show_next_question(){
		var question_elements = [];
		for (var i = 0; i < question_ids.length; i++) {
			question_elements.push(document.getElementById(question_ids[i]));//모든 질문element를 아이디로 찾아서 리스트에 넣음.
		}
		var next_button=document.getElementById("next-button");
		var submit_button=document.getElementById("answer-button");
		var result_button=document.getElementById("result-button");
		console.log(correct_answers)
		for (var i = 0; i < cur_question.length; i++) {
			if (cur_question[i] == 1) {//현재 보여주고 있는 문제
				if (i == cur_question.length - 1) { //마지막 문제일 경우
					//버튼을 제출로 바꿈
					next_button.style.display = "none";
					submit_button.style.display = "block";
					result_button.style.display="block";

				}
				else {//다음 문제를 보여줌
					question_elements[i].style.display = "none";//안보이게 하고
					cur_question[i] = 0;//가림
					question_elements[i + 1].style.display = "block";
					cur_question[i + 1] = 1;
				}
				break;
			}
		}
	}

	function submit_answer(){

		var score=document.getElementById("score");
		var last_page=document.getElementById(question_ids[cur_question.length - 1]);
		var question_radio_element = [];
		//var submit_button=document.getElementById("answer-button");

		for (var i = 0; i < question_ids.length; i++) {
			question_radio_element.push(document.getElementsByName(question_ids[i]));//모든 질문element를 아이디로 찾아서 리스트에 넣음.
		}
		last_page.style.display="none";
		//submit_button.style.display="none";
		score.style.display="block";
		var count=0;
		for (var i = 0; i < question_ids.length; i++) {
			var submit_ans=document.querySelector('input[name='+question_ids[i]+']:checked').value;
			if (submit_ans==correct_answers[i]){
				count+=1;
				correct_or_not[i]=true;
			}
		}
		var test_result=document.getElementById("result-num");
		test_result.innerHTML=count+"점 입니다!";

		$.ajax({
			url : "/usr/learn/showResult.do",
			type : "post",
			data : {
				test_result_correct_or_not : correct_or_not//,
				//question_word : question_word
			},
			success : function(){
				alert("성공");

			}
		});
		
	}

	var time = 180;
	var min = "";
	var sec = "";

	var x = setInterval(function() {
		min = parseInt(time/60);
		sec = time%60;

		document.getElementById("timer-time").innerHTML = min +":"+ sec;
		time--;

		if (time < 0) {
			clearInterval(x);
			document.getElementById("timer-time").innerHTML = "시간초과";
			submit_answer();//submit answer가 마지막 문제일때 넘기는거라서 아닐 때도 넘기도록 수정하기
		}
	}, 1000);
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<%@ include file="../common/foot.jspf"%>
