<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>


<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0; // 전체 레코드 수
	int numPerPage = 10; // 1page에 보여줄 레코드 수
	int pagePerBlock = 5;// 블록당 페이지 수
	
	int totalPage = 0; // 전체 페이지
	int totalBlock = 0;  // 전체 블록 수
	

	
	int nowPage = 1; // 현재 해당하는 페이지
	int nowBlock =1; // 현재 해당하는 블록
	
	int start = 0; // board테이블의 select시 시작번호(한페이지에 필요한만큼 게시물만 가져오려고)
	int end = 0;   // 1page에 보여줄 레코드의 갯수(보통은 10개, 맨 마지막page는 전체레코드 수에 따라 달라짐)
	int listSize = 0;
	
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	
	
	String keyField = "";
	String keyWord = "";
	
	if(request.getParameter("keyField") != null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	start = (nowPage * numPerPage) - numPerPage + 1; 
	end = nowPage * numPerPage;
	totalRecord = bDao.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord/ numPerPage);
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
	
	
	
	//모든 게시판	
	List<Board> list =  bDao.getBoardList(keyField, keyWord, start, end);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.container {
		width: 1000px;
	}
	.container h2 {
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.boardTable {
		height: 600px;
	}
	.right-side {
		float: right;
	}
	.input-group{
		width: 600px;
		margin: 0 auto;
	}
	
</style>

</head>
<body>
	<div class="container">
		<h2 align="center">게시판</h2>
		
		
		<!-- 게시판 목록 -->
		<div class="boardTable">
			<table class="table table-hover">
				<tr class="table-active" align="center">
					<th>번호</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>글쓴이</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="<%=list %>" var="board">
					<tr onclick='location.href="detail.bo?num=${board.num}&nowPage=<%=nowPage %>&keyField=<%=keyField %>&keyWord=<%=keyWord%>"'>
						<td>${board.num }</td>
						<td>${board.subject }</td>
						<td>${board.regdate }</td>
						<td>${board.name }</td>
						<td>${board.count }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<!-- 검색기능 및 버튼 영역 -->
		<div class="searchTable d-flex justify-content-between align-items-center">
			<a class="btn btn-primary" href="../index.jsp" role="button">홈으로</a>
			<form action="list.jsp" method="get" class="d-flex">
				<div class="input-group">
					<select class="form-select" name="keyField">
						<option value="subject">제목</option>
						<option value="name">이름</option>
						<option value="content">내용</option>
					</select>
					<input type="text" class="form-control" name="keyWord" placeholder="검색어를 입력하세요" style="width: 65%;">
					<button class="btn btn-primary" type="submit">검색</button>
				</div>																								
			</form>
			<c:if test="${idKey != null }">
				<a class="btn btn-primary" href="boardWrite.jsp" role="button">게시글 작성</a>
			</c:if>
		</div>
		
	


		
	</div>
	

</body>
</html>