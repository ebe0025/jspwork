<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">

	.detailContainer {
		width: 800px;
		margin: 0 auto;
	}
	
	.content-cell {
		white-space: pre-wrap; /* 줄바꿈과 띄어쓰기를 유지하면서 자동 줄바꿈 */
	}
	
	
</style>
</head>
<body>
	<div class="container detailContainer">
		<h2 class="text-center mb-4">게시판 상세보기</h2>
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td>${board.subject }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${board.regdate.substring(0, 10)}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${board.count }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="content-cell">${board.content }</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<a href="list.jsp?nowPage=${param.nowPage}&keyField=${param.keyField }&keyWord=${param.keyWord }" class="btn btn-primary">게시판 목록</a>
					<a href="edit.bo?num=${board.num}" class="btn btn-warning">수정하기</a>
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete">
					  삭제하기
					</button>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 삭제하기 모달 -->
	<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        정말로 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='delete.bo?num=${board.num }&nowPage=${param.nowPage}&keyField=${param.keyField }&keyWord=${param.keyWord }'">예</button>
	      </div>
	    </div>
	  </div>
	</div>	
	
</body>
</html>