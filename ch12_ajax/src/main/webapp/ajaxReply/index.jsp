<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	body { text-align: center;}
	img { width: 600px;}
</style>
</head>
<body>
	<img src="../resources/img1.jpg"><br>
	<table>
		<thead>
			<tr>
				<th>댓글작성</th>
				<td>
					<textarea rows="3" cols="50"></textarea>
				</td>
				<td><button id="btn1">댓글등록</button></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<script type="text/javascript">
		$(()=>{
			selectReplyList();
		})
		
		function selectReplyList(){
			$.ajax({
				url : "rlist.bo",
				data : {bnum : 1}, //원글의 num값을 넘겨준다
				success : (result) => {
					console.log(result);
					
					let value = "";
					for(let i = 0; i < result.length; i++){
						value += "<tr>" 
								+"<th>" + result[i].name+"</th>"
								+ "<td>" + result[i].content + "</td>"
								+ "<td>" + result[i].redate + "</td>"
								+ "</tr>";
					}
					$("table tbody").html(value);
					
				},
				error : () => {
					console.log("ajax 통신 실패");
				}
			})
		}
	</script>
</body>
</html>