/*$(function() {
	$("#btn").on("click",check());
});*/

function check() {

	var userid = $('#id').val();
	var userpwd = $('#password').val();
	var userpwd2 = $('#userpwd2').val();
	var name = $('#name').val();
	var namekana = $('#nameKana').val();
	var address = $('#address').val();
	var pattern1 = /[0-9]/;	
	var pattern2 = /[a-zA-Z]/;

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
	
	else if( !pattern1.test(userpwd) || userpwd.length < 4 || userpwd.length > 8){ 
		alert("パスワードは4桁～8桁の数字にしてください。");
		return false;
	}

	else if(userpwd!=userpwd2){
		alert('パスワードが一致しません。');
		document.getElementById("password").value="";
		document.getElementById("userpwd2").value="";
		document.getElementById("userpwd2").focus();
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
	else if(address.length==0){
		alert("都道府県を入力してください。");
		document.getElementById("address").focus();
		return false;
	}

	else{
		return true;	
	}
	}