
$(function show_hide_enter_option() {
	$("#entTable").hide();
	$("#chkEntCus").click(function show_hide_enter_option() {
		if ($(this).is(":checked")) {
			$("#entTable").show();
		} else {
			$("#entTable").hide();
		}
	});
});

$(function() {
	$('#pw').keyup(function() {
		if ($('#pw').val().length < 4) {
			$('#chkNotice').html('비밀번호는 4자리 이상 12자리 이하로 설정해주세요.');
			$('#chkNotice').attr('color', 'red');
		}
		else if ($('#pw').val() != $('#pw_check').val()) {
			$('#chkNotice').html('비밀번호 일치하지 않음<br>');
			$('#chkNotice').attr('color', 'red');
		}
		else if ($('#pw').val() == $('#pw_check').val()) {
			if ($('#pw').val() == '') {
				$('#chkNotice').html('<br>');
				$('#chkNotice').attr('color', 'white');
			}


			else {
				$('#chkNotice').html('비밀번호 일치함<br>');
				$('#chkNotice').attr('color', 'green');

			}
		}

	});

	$('#pw_check').keyup(function() {
		if ($('#pw_check').val().length < 4) {
			$('#chkNotice').html('비밀번호는 4자리 이상 12자리 이하로 설정해주세요.');
			$('#chkNotice').attr('color', 'red');
		}
		else if ($('#pw_check').val() != $('#pw').val()) {
			$('#chkNotice').html('비밀번호 일치하지 않음<br>');
			$('#chkNotice').attr('color', 'red');
		}

		else {

			if ($('#pw').val() == $('#pw_check').val()) {
				$('#chkNotice').html('비밀번호 일치함<br>');
				$('#chkNotice').attr('color', 'green');
			}
		}
	});
});

function IdCheck() {
	window.open("IdCheck_window.jsp", "IdCheck_window",
		"width=400, height=300");
}

function loginCheck() {
	if (document.login_Form.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.login_Form.id.focus();
		return false;
	} else if (document.login_Form.pw.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.login_Form.pw.focus();
		return false;
	} else {
		return true;
	}
}

function joinCheck() {
	if (document.join_Form.id.value == "") {
		alert("아이디를 입력해주세요.");
		document.join_Form.id.focus();
		return false;
	}

	if (document.join_Form.pw.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.join_Form.pw.focus();
		return false;
	}

	if (document.join_Form.pw_check.value == "") {
		alert("비밀번호를 체크해주세요.");
		document.join_Form.pw_check.focus();
		return false;
	}

	if (document.join_Form.name.value == "") {
		alert("이름을 입력해주세요.");
		document.join_Form.name.focus();
		return false;
	}

	if (document.join_Form.gender.value == "") {
		alert("성별을 체크해주세요.");
		document.join_Form.gender.focus();
		return false;
	}


	if (document.join_Form.birth.value == "") {
		alert("생년월일을 입력해주세요.");
		document.join_Form.birth.focus();
		return false;
	}

	if (document.join_Form.email_1.value == "" || document.join_Form.email_2.value == "") {
		alert("이메일을 입력해주세요.");
		document.join_Form.email_1.focus();
		return false;
	}
	
	if (document.join_Form.phone_1.value == "" || document.join_Form.phone_2.value == "" || document.join_Form.phone_3.value == "") {
		alert("전화번호를 입력해주세요.");
		document.join_Form.phone_1.focus();
		return false;
	}
	
	if (document.join_Form.address_street.value == "" || document.join_Form.address_detail.value == "") {
		alert("주소를 입력해주세요.");
		document.join_Form.address_street.focus();
		return false;
	}
	
	if (document.join_Form.question.value == "" || document.join_Form.answer.value == "") {
		alert("문답을 입력해주세요.");
		document.join_Form.question.focus();
		return false;
	}
	
	if (document.join_Form.pw.value != document.join_Form.pw_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.join_Form.pw_check.focus();
		return false;
	}
	
	alert('완료 되었습니다.');
	

	return true;
}

function idCheck() {
	
	if (document.join_Form.id.value == "") {
		alert("아이디를 입력해주세요.");
		document.join_Form.id.focus();
		return;
	}
	// 아이디 중복 체크를 위한 페이지는 새로운 창에 출력한다.
	var url = "idCheck.do?id=" + document.join_Form.id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function applyId() {

	opener.join_Form.id.value = document.frm.id.value;
	opener.join_Form.reid.value = document.frm.id.value;
	self.close();
}