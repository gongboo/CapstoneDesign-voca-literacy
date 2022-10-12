<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="회원가입" />
<%@ include file="../common/head.jspf"%>

    <div class="container">
        <section class="position-relative py-4 py-xl-5">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6 col-xl-4">
                        <div class="card mb-5">
                            <div class="card-body d-flex flex-column align-items-center">
                                <div class="col-md-8 col-xl-6 text-center mx-auto">
                                    <h2>회원가입</h2>
                                    <p class="w-lg-50">회원가입 하세요</p>
                                </div>
                                <form class="text-center" method="post">
                                    <div class="mb-3"><input class="form-control" name="loginId" placeholder="로그인아이디" type="text" onkeyup="JoinForm_checkLoginIdDup(this);" autocomplete="off"></div>
                                    <div class="mb-3"><input class="form-control" name="loginPw" placeholder="로그인비밀번호" type="password" ></div>
                                    <div class="mb-3"><input class="form-control" name="loginPwConfirm" placeholder="로그인비밀번호 확인" type="password"></div>
                                    <div class="mb-3"><input class="form-control" name="name" placeholder="이름" type="text"></div>
                                    <div class="mb-3"><input class="form-control" name="nickname" placeholder="닉네임" type="text"></div>
                                    <div class="mb-3"><input class="form-control" name="email" placeholder="이메일" type="text" ></div>
                                    <div class="mb-3"><input class="form-control" name="cellphoneNo" placeholder="휴대전화번호" type="text"></div>
                                    <div class="mb-3"><button class="btn btn-custom d-block w-100" type="submit">sign up</button></div>
									<div class="mb-3"><button type="button" class="btn btn-custom" onclick="history.back();">뒤로가기</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<%@ include file="../common/foot.jspf"%>