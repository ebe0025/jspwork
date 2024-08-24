<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    boolean checkPwd = false;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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
    <div class="container mt-5">
        <h2 class="mb-4">회원가입</h2>
        <form action="memberRegister.do" onsubmit="return validateForm()" method="post">
            <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <input type="text" class="form-control" name="id" id="id" required>
                <small id="idCheckText" class="form-text text-muted"></small>
            </div>
            
            <div class="mb-3">
                <label for="pwd" class="form-label">패스워드</label>
                <input type="password" class="form-control" name="pwd" id="pwd" required>
                <small class="form-text text-muted">특수기호, 영문, 숫자가 각 1개 이상씩 들어가야 되고 8글자 이상</small>
            </div>
            
            <div class="mb-3">
                <label for="repwd" class="form-label">패스워드 확인</label>
                <input type="password" class="form-control" name="repwd" id="repwd" required>
                <small class="form-text text-muted">위의 비밀번호를 한번 더 넣으세요</small>
            </div>
            
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" name="name" required>
                <small class="form-text text-muted">한글로 입력</small>
            </div>
            
            <div class="mb-3">
                <label class="form-label">성별</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="genderM" value="M" required>
                    <label class="form-check-label" for="genderM">남</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="genderF" value="F" required>
                    <label class="form-check-label" for="genderF">여</label>
                </div>
            </div>
            
            <div class="mb-3">
                <label for="birthday" class="form-label">생년월일</label>
                <input type="text" class="form-control" name="birthday" required>
                <small class="form-text text-muted">6글자로 입력 ex) 190315</small>
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">E-mail</label>
                <input type="email" class="form-control" name="email" size="40" required>
                <small class="form-text text-muted">ex) email@naver.com</small>
            </div>
            
            <div class="mb-3">
                <label for="postcode" class="form-label">우편번호</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="zipcode" id="postcode" readonly required>
                    <button type="button" class="btn btn-outline-secondary" onclick="findAddr();">우편번호 찾기</button>
                </div>
            </div>
            
            <div class="mb-3">
                <label for="addr" class="form-label">주소</label>
                <input type="text" class="form-control mb-2" name="address" id="addr" size="60" readonly required>
                <input type="text" class="form-control" name="detailAddress" id="detailAddr" placeholder="상세주소 넣기">
            </div>
            
            <div class="mb-3">
                <label for="job" class="form-label">직업</label>
                <select class="form-select" name="job" required>
                    <option value="">직업 선택</option>
                    <option value="회사원">회사원</option>
                    <option value="개발자">개발자</option>
                    <option value="공무원">공무원</option>
                    <option value="자영업">자영업</option>
                    <option value="교사">교사</option>
                </select>
            </div>
            
            <div class="d-grid gap-2 d-md-block">
                <button type="submit" class="btn btn-primary" id="signReg" disabled="disabled">회원가입</button>
                <button type="reset" class="btn btn-secondary">다시쓰기</button>
                <button type="button" class="btn btn-info">로그인</button>
            </div>
        </form>
    </div>

    <script type="text/javascript">
        $(()=>{
            $('#id').keyup(()=>{
                var userId = $('#id').val();
                var hideText = $('#idCheckText');
                if(userId.length >= 4){
                    $.ajax({
                        url: 'checkId.do',
                        data : {id:userId},
                        success: function(result) {
                            console.log(result);
                            hideText.show();
                            if(result)
                            {
                                hideText.text("이미 존재하는 아이디입니다.");    
                                $('#signReg').attr('disabled', true);
                            }else {
                                hideText.text("사용할 수 있는 아이디입니다.");
                                $('#signReg').attr('disabled', false);
                            }
                        },
                        error: function() {
                            console.log("id ajax 통신 실패");
                        }
                    })
                }else{
                        hideText.hide();
                        $('#signReg').attr('disabled', true);
                }
            })
        })
        
        function validateForm(){
            var pwd = $('#pwd').val();
            var repwd = $('#repwd').val();
            
            if (pwd !== repwd) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }
        
    </script>
</body>
</html>