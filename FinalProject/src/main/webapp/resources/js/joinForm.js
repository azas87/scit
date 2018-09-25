/*$(function() {
	$("#btn").on("click",check());
});*/

function check() {

	var userid = $('#id').val();
	var email =  $('#email').val();
	var userpwd = $('#password').val();
	var userpwd2 = $('#userpwd2').val();
	var name = $('#name').val();
	var namekana = $('#namekana').val();
	var pattern1 = /[0-9]/;	
	var pattern2 = /[a-zA-Z]/;
	alert(userid);
	alert(name);
	if( userid.length < 3 || userid.length > 10){
	
		alert("IDは3桁～10桁を入力してください。");
		document.getElementById("id").focus();
		return false;
	}
	else if(userpwd.length==0){
		alert("パスワードを入力してください。");
		document.getElementById("password").focus();
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
		document.getElementById("password").value="";
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


	else{
		return true;	
	}
	}

function goHome() {
	location.href="/team/?";
}