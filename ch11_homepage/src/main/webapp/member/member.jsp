<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
    body {background-color: rgb(229, 252, 178);}
    #regTable{
        
        width: 1000px;
        border-collapse: collapse;
    }
    #회원가입{
        text-align: center;
        background-color: darkgreen;
        color: white;
    }
    #buttons{
        text-align: center;
    }
    #regTable th, td {

        height:30px;
    }

</style>
<script src="script.js?ver=<%=System.currentTimeMillis() %>" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	 			let roadAddr = data.roadAddress; //도로명주소
	 			let jibunAddr = data.jibunAddress; //지번주소
	 			let extraAddr = '';
	 			
	 			document.getElementById("postcode").value = data.zonecode;
	 			if(data.userSelectedType == 'R') // 사용자가 도로명을 선택했을 때
 				{
	 				if(data.bname != ''){
	 					extraAddr += data.bname;
	 				}
	 				if(data.buildingName != ''){
	 					extraAddr += ',' +data.buildingName;
	 				}
	 				roadAddr += extraAddr != ''? ' (' + extraAddr + ')' : '';
	 				document.getElementById("addr").value = roadAddr;
 				}
	 			else{
	 				if(data.buildingName != ''){
	 					extraAddr += ',' +data.buildingName;
	 				}
	 				jibunAddr += extraAddr != ''? ' (' + extraAddr + ')' : '';
	 				
	 				document.getElementById("addr").value = jibunAddr;
	 			}
	 			document.getElementById("detailAddr").focus();
        }
    }).open();
	}
</script>

</head>
<body>
	<form action="memberProc.jsp" name="frm">
	    <table border="1" id="regTable">
	        <tr>
	            <th colspan="3" id="회원가입">회원가입</th>
	        </tr>
	        <tr>
	            <td>아이디 </td><br>
	            <td>
	            <input type="text" name="id" onkeydown="inputIdChk();">
	            <input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value);">
	            <input type="hidden" name="idBtnCheck" value="idUncheck">
	            </td>
	            <td>영문과 숫자로만 입력</td>
	        </tr>
	        <tr>
	            <td>패스워드 </td>
	            <td><input type="password" name="pwd"></td>
	            <td>특수기호,영문,숫자가 각 1개 이상씩 들어가야 되고 8글자 이상</td>
	        </tr>
	        <tr>
	            <td>패스워드 확인</td>
	            <td><input type="password" name="repwd"></td>
	            <td>위의 비밀번호를 한번 더 넣으세요</td>
	        </tr>
	        <tr>
	            <td>이름</td>
	            <td><input type="text" name="name"></td>
	            <td>한글로 입력</td>
	        </tr>
	        <tr>
	            <td>성별</td>
	            <td>
	                <input type="radio" name="gender" value="1">남&emsp;
	                <input type="radio" name="gender" value="2">여
	            </td>
	            <td>성별을 선택해 주세요</td>
	        </tr>
	        <tr>
	            <td>생년월일</td>
	            <td><input type="text" name="birthday"></td>
	            <td>6글자로 입력 ex) 190315</td>
	        </tr>
	        <tr>
	            <td>E-mail</td>
	            <td><input type="email" name="email" size="40"></td>
	            <td>ex) email@naver.com</td>
	        </tr>
	        <tr>
	            <td>우편번호</td>
	            <td>
	                <input name="zipcode" id="postcode" readonly>
	                <input type="button" value="우편번호 찾기" onclick="findAddr();">
	            </td>
	            <td>우편번호를 검색하세요</td>
	        </tr>
	        <tr>
	            <td>주소</td>
	            <td><input type="text" name="address" id="addr" size="60" readonly><br>
	                <input type="text" name="detailAddress" id="detailAddr" placeholder="상세주소 넣기"></td>
	            <td>상세주소가 있으면 입력해주세요</td>
	        </tr>
	        <tr>
	            <td>취미</td>
	            <td>
	                <input type="checkbox" name="hobby" value="internet">인터넷 &nbsp;
	                <input type="checkbox" name="hobby" value="travel">여행 &nbsp;
	                <input type="checkbox" name="hobby" value="game">게임 &nbsp;
	                <input type="checkbox" name="hobby" value="movie">영화 &nbsp;
	                <input type="checkbox" name="hobby" value="sport">운동
	            </td>
	            <td>취미를 선택하세요</td>
	        </tr>
	        <tr>
	            <td>직업</td>
	            <td>
	                <select name="job" id="">
	                    <option value="회사원">회사원</option>
	                    <option value="개발자">개발자</option>
	                    <option value="공무원">공무원</option>
	                    <option value="자영업">자영업</option>
	                    <option value="교사">교사</option>
	                </select>
	            </td>
	            <td>직업을 선택하세요</td>
	        </tr>
	        <tr>
	            <td colspan="3" id="buttons"> 
	                <input type="button" value="회원가입" onclick="inputCheck();">&emsp;
	                <input type="reset" value="다시쓰기">&emsp;
	                <input type="button" value="로그인">
	            </td>
	        </tr>
	    </table>
     </form>

</body>
</html>