<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css">
	.container{
		width: 1000px;             
    	padding: 20px;
    	margin-top: 50px;
    	   
	}
	.container table {
		margin: 0 auto;
		width: 80%;
	}
	.container table td{
		padding: 10px;
	}
</style>
</head>
<body>
	<div class="container">
	<!-- 사진을 받을 수 있게 폼에 enctype를 지정 -->
		<form action="write.bo" method="post">
			<table>
				<tr>
					<td style="width: 20%">
					  <div class="col">
					    <label for="subject" class="col-form-label">제목</label>
					  </div>
					</td>
					<td style="width: 60%">
					  <div class="col">
					    <input type="text" name="subject" class="form-control" aria-describedby="passwordHelpInline">
					  </div>
					</td>
					<td>
					  <div class="col">
					    <span id="passwordHelpInline" class="form-text">
					      제목을 적어주세요
					    </span>
					  </div>
					</td>
				</tr>
				<tr>
					<td>
					  <div class="col">
					    <label for="content" class="col-form-label">내용</label>
					  </div>
					</td>
					<td>
					  <div class="col">
					    <textarea class="form-control" name="content" id="content" rows="5" cols="10"></textarea>
					  </div>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<button type="button" class="btn btn-outline-secondary" onclick="history.go(-1);">취소하기</button>&emsp;&emsp;
						<button type="submit" class="btn btn-outline-primary">등록</button>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>