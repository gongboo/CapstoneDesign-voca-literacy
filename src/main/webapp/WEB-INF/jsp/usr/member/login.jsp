<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/head.jspf"%>

    <div class="container">
        <section class="position-relative py-4 py-xl-5">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6 col-xl-4">
                        <div class="card mb-5">
                            <div class="card-body d-flex flex-column align-items-center">
                                <div class="col-md-8 col-xl-6 text-center mx-auto">
									<br><br>
                                    <h4>로그인</h4>
                                    <p class="w-lg-50">로그인하세요</p>
                                </div>
                                <form class="text-center" method="post" action="../member/doLogin">
                                    <div class="mb-3"><input class="form-control" name="loginId" type="text" placeholder="아이디"></div>
                                    <div class="mb-3"><input class="form-control" name="loginPw" type="password" placeholder="비밀번호"></div>
                                    <div class="mb-3"><button class="btn btn-custom d-block w-100" href="${rq.loginUri}" type="submit">로그인</button></div>
                                    <a class="text-muted" href="${rq.findLoginPwUri}" type="submit" >Forgot your password?</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<%@ include file="../common/foot.jspf"%>