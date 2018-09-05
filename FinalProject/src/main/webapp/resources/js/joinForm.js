function check() {
	var userid = $('#userid').val();
	var email =  $('#email').val();
	var userpwd = $('#userpwd').val();
	var userpwd2 = $('#userpwd2').val();
	var phone = $('#phone').val();
	var name = $('#name').val();
	var namekana = $('#namekana').val();
	var pattern1 = /[0-9]/;	
	var pattern2 = /[a-zA-Z]/;
	
	if( userid.length < 3 || userid.length > 10){
		alert("IDは3桁～10桁を入力してください。");
		document.getElementById("userid").focus();
		return false;
	}
	else if(userpwd.length==0){
		alert("パスワードを入力してください。");
		document.getElementById("userpwd").focus();
		return false;
	}
	else if(userpwd2.length==0){
		alert("パスワードをもう一度入力してください。");
		document.getElementById("userpwd2").focus();
		return false;
	}
	
	else if( !pattern1.test(userpwd) || !pattern2.test(userpwd) || userpwd.length < 8 || userpwd.length >= 16){ 
		alert("パスワードは8桁～16桁の英数記号混在にしてください。");
		return false;
	}

	else if(userpwd!=userpwd2){
		alert('パスワードが一致しません。');
		document.getElementById("userpwd").value="";
		document.getElementById("userpwd2").value="";
		document.getElementById("userpwd2").focus();
		return false;
	}
	
	else if(email.length==0){
		alert("メールアドレスを入力してください。");
		email.focus();
		return false;
	}

	else if(name.length==0){
		alert("氏名を入力してください。");
		document.getElementById("name").focus();
		return false;
	}
	else if(namekana.length==0){
		alert("氏名（ふりがな）を入力してください。");
		document.getElementById("namekana").focus();
		return false;
	}

	else if(phone.length!=0&&(phone.length!=11||isNaN(tel2))){
		alert("電話番号はハイフンなしの半角数字11桁で入力してください。");
    	document.getElementById("phone").value="";
    	document.getElementById("phone").focus();
    	return false;

	}
	else{
		return true;	
	}
	}