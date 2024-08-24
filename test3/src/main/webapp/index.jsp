<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link rel="stylesheet" type="text/css" href="resources/css/index.css">

</head>
<body>
	<div class="container">
		<header>
			<div class="logo">
				<img alt="로고" src="https://www.tjoeun.co.kr/images/logo.gif?v=20190918">
			</div>
			<div class="navgation">
		        <a class="btn btn-primary" href="" role="button">홈으로</a>
		        <a class="btn btn-primary" href="board/list.jsp" role="button">게시판</a>

 				<c:choose>
					<c:when test="${idKey==null}">
					
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">
  							로그인
						</button>
					
					</c:when>
					<c:otherwise>
						
						<a class="btn btn-secondary" href="logout.do" role="button">로그아웃</a>
					
					</c:otherwise>
				</c:choose>
		      	<a class="btn btn-primary" href="member/member.jsp" role="button">
			      	  회원가입
		      	</a>
				<div>
					<c:if test="${idKey != null}">
						<p>[${idKey }님 로그인 상태]</p>
					</c:if>
				</div>
			</div>

		</header>
		<article >
			<section >
				<div class="bgImg">
					<img class="bgImg" alt="여행사진1" src="resources/img/background.jpg">
				</div>
			</section>
		</article>
		<!-- Button trigger modal -->


		<!-- Modal -->
		<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <form action="loginProc.do" method="post">
			      <div class="modal-body">
				    <label for="ex	ampleInputEmail1" class="form-label">아이디</label>
				    <input type="text" class="form-control" id="id" aria-describedby="emailHelp" name="id">
			        <label for="exampleInputPassword1" class="form-label">비밀번호</label>
			    	<input type="password" class="form-control" id="pwd" name="pwd">
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">로그인</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
	

	
</body>
</html>