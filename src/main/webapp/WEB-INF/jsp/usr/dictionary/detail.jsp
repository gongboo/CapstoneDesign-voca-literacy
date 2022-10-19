<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="단어 내용" />
<%@ include file="../common/head.jspf"%>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>



<section class="mt-5">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td>
							<div class="badge badge-primary">${word.id}</div>
						</td>
					</tr>
					<tr>
						<th>단어</th>
						<td>${word.name}</td>
					</tr>
					<tr>
						<th>품사</th>
						<td>${word.type}</td>
					</tr>
					<tr>
						<th>뜻</th>
						<td>${word.mean}</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<div class="btns">
			<c:if test="${empty param.listUri}">
				<button class="btn btn-link" type="button" onclick="history.back();">뒤로가기</button>
			</c:if>

			<c:if test="${not empty param.listUri}">
				<a class="btn btn-link" href="${param.listUri}">뒤로가기</a>
			</c:if>
			<c:if test="${rq.logined}"> 
			<form method="post" action="../member/myPage/addWord?id=${word.id}">
           <button class="btn btn-link" type="submit">내 단어장에 추가하기</button></form>
            </c:if>
          
		
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>