<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kor.exam.utill.Ut"%>
<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jspf"%>
    

    <div class="container">
        <h1>마이페이지<span style="font-size: 20.52px;"><a class="a-custom" href="/usr/learnControl/mypage1">마이리포트</a>&nbsp;<a class="a-custom" href="/usr/learnControl/mypage2">오답노트</a>&nbsp;<a class="a-custom" href="/usr/learnControl/mypage3">내 단어장</a></span></h1>
    </div>
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