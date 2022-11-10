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
        <h5 style="text-align: left;">남은 시간: 10:00</h5>
    </div>
    <div class="container">
        <div class="progress">
            <div class="progress-bar bg-success" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
        </div>
    </div>
    <div class="container" style="padding: 12px;">
        <div class="card" id="question-1">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">문제1</h4>
                <p class="card-text">문제 1의 내용</p>
                <div class="form-check">
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1-1" name="question-1" value="1"><label class="form-check-label" for="formCheck-1-1">선택지1</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1-2" name="question-1" value="2"><label class="form-check-label" for="formCheck-1-2">선택지2</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1-3" name="question-1" value="3"><label class="form-check-label" for="formCheck-1-3">선택지3</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1-4" name="question-1" value="4"><label class="form-check-label" for="formCheck-1-4">선택지4</label></div>
                </div>
            </div>
        </div>
        <div class="card" id="question-2" style="display: none">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">문제2</h4>
                <p class="card-text">문제 1의 내용</p>
                <div class="form-check">
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2-1" name="question-2" value="1"><label class="form-check-label" for="formCheck-2-1">선택지1</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2-2" name="question-2" value="2"><label class="form-check-label" for="formCheck-2-2">선택지2</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2-3" name="question-2" value="3"><label class="form-check-label" for="formCheck-2-3">선택지3</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2-4" name="question-2" value="4"><label class="form-check-label" for="formCheck-2-4">선택지4</label></div>
                </div>
            </div>
        </div>
        <div class="card" id="question-3" style="display: none">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">문제3</h4>
                <p class="card-text">문제 1의 내용</p>
                <div class="form-check">
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3-1" name="question-3" value="1"><label class="form-check-label" for="formCheck-3-1">선택지1</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3-2" name="question-3" value="2"><label class="form-check-label" for="formCheck-3-2">선택지2</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3-3" name="question-3" value="3"><label class="form-check-label" for="formCheck-3-3">선택지3</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3-4" name="question-3" value="4"><label class="form-check-label" for="formCheck-3-4">선택지4</label></div>
                </div>
            </div>
        </div>
        <div class="card" id="question-4" style="display: none">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">문제4</h4>
                <p class="card-text">문제 1의 내용</p>
                <div class="form-check">
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-4-1" name="question-4" value="1"><label class="form-check-label" for="formCheck-4-1">선택지1</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-4-2" name="question-4" value="2"><label class="form-check-label" for="formCheck-4-2">선택지2</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-4-3" name="question-4" value="3"><label class="form-check-label" for="formCheck-4-3">선택지3</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-4-4" name="question-4" value="4"><label class="form-check-label" for="formCheck-4-4">선택지4</label></div>
                </div>
            </div>
        </div>
        <div class="card" id="question-5" style="display: none">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">문제5</h4>
                <p class="card-text">문제 1의 내용</p>
                <div class="form-check">
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-5-1" name="question-5" value="1"><label class="form-check-label" for="formCheck-5-1">선택지1</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-5-2" name="question-5" value="2"><label class="form-check-label" for="formCheck-5-2">선택지2</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-5-3" name="question-5" value="3"><label class="form-check-label" for="formCheck-5-3">선택지3</label></div>
                  <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-5-4" name="question-5" value="4"><label class="form-check-label" for="formCheck-5-4">선택지4</label></div>
                </div>
            </div>
        </div>
        <div class="card" id="score" style="display: none">
            <div class="card-body" style="height: 247.242px;">
                <h4 class="card-title">결과</h4>
                <p class="card-text" id="result-num">rtest</p>
            </div>
        </div>


    </div>
    <div class="container">
        <div class="col"  id="next-button"><button class="btn btn-custom" onclick="show_next_question()">다음 문제</button></div>
        <div class="col" id="answer-button" style="display: none"><button class="btn btn-custom" onclick="submit_answer()">제출하기</button></div>
    </div>
    <script>
      var cur_question=[1,0,0,0,0];
      var question_ids=["question-1","question-2","question-3","question-4","question-5"];

      function show_next_question(){
        var question_elements = [];
        for (var i = 0; i < question_ids.length; i++) {
          question_elements.push(document.getElementById(question_ids[i]));//모든 질문element를 아이디로 찾아서 리스트에 넣음.
        }
        var next_button=document.getElementById("next-button");
        var submit_button=document.getElementById("answer-button");
        for (var i = 0; i < cur_question.length; i++) {
          if (cur_question[i] == 1) {//현재 보여주고 있는 문제
            if (i == cur_question.length - 1) { //마지막 문제일 경우
            //버튼을 제출로 바꿈
              next_button.style.display = "none";
              submit_button.style.display = "block";

            } else {//다음 문제를 보여줌
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
          var correct_answers=[1,1,1,1,1];//여기다가 정답 넣어주세요
          var correct_or_not=[false,false,false,false,false]//
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
              console.log(submit_ans);
              if (submit_ans==correct_answers[i]){
                  count+=1;
                  correct_or_not[i]=true;
              }
          }
          var inn=document.getElementById("result-num");
          inn.innerHTML=count;

      }
    </script>

<%@ include file="../common/foot.jspf"%>