/**
 *    회원 관련 자바스크립트 함수
 */
/*
*  약관 동의 여부 확인
*/
function go_next() {
	
	if ($(".agree")[0].checked == true) {    // 동의함 체크되어 있어 회원가입 화면 요청
		$("#join").attr('action', 'join_form').submit();
	} else if ($(".agree")[1].checked == true) {
		alert("약관에 동의해 주셔야 합니다.");
	}
}


/*
**  id 중복확인 화면 출력
*/
function idcheck() {
	if ($("#id").val() == "") {
		alert("아이디를 입력해 주세요!");
		$("#id").focus();
		return false;
	} 
	
	// id가 입력되었으면 id중복확인 윈도우 오픈
	var url = "id_check_form?id="+$("#id").val();
	window.open(url, "_blank_", "toolbar=no, menubar=no, scrollbars=no, resizable=yes, width=350, height=200");
}

/*
*  중복확인 ID 사용
*/
function idok() {
	$("#theform").attr("action", "id_check_confirmed").submit();
}

/*
* 회원 가입시, 필수 입력 항목 확인
*/
function go_save() {
	if ($("#id").val() == "") {
		alert("아이디를 입력해 주세요!");
		$("#id").focus();
		return false;
	} else if($("#id").val() != $("#reid").val()) {
		alert("아이디 중복 체크를 해주세요!");
		$("#id").focus();
		return false;
	} else if ($("#pwd").val() == "") {
		alert("비밀번호를 입력해 주세요!");
		$("#pwd").focus();
		return false;
	} else if($("#pwd").val() != $("#pwdCheck").val()) {
		alert("비밀번호가 일치하지 않습니다!");
		$("#pwd").focus();
		return false;
	} else if ($("#name").val() == "") {
		alert("이름을 입력해 주세요!");
		return false;
	} else {
		// 회원 가입 요청
		$("#join").attr("action", "join").submit();
	}	
}


/*
* 	다음 주소 연동
*/
function execution_daum_address(){
	 
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
        	 
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
        	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        	                var addr = ''; // 주소 변수
        	                var extraAddr = ''; // 참고항목 변수
        	 
        	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        	                    addr = data.roadAddress;
        	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
        	                    addr = data.jibunAddress;
        	                }
        	 
        	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        	                if(data.userSelectedType === 'R'){
        	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        	                        extraAddr += data.bname;
        	                    }
        	                    // 건물명이 있고, 공동주택일 경우 추가한다.
        	                    if(data.buildingName !== '' && data.apartment === 'Y'){
        	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        	                    }
        	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        	                    if(extraAddr !== ''){
        	                        extraAddr = ' (' + extraAddr + ')';
        	                    }
        	                    // 주소변수 문자열과 참고항목 문자열 합치기
        	                    addr += extraAddr;
        	                
        	                } else {
        	                    addr += ' ';
        	                }
        	 
        	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
        	                $("[name=address1]").val(data.zonecode);
        	                $("[name=address2]").val(addr);
        	                // 커서를 상세주소 필드로 이동한다.
        	                $(".address_input_3").attr("readonly",false);
        	                $(".address_input_3").focus();
        	 

 
        }
    }).open();    
 
}