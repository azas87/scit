
$(function(){

	$("#email").keyup(function (){
		
		var id =$('#id').val();
		var email =$('#email').val();
		$.ajax({
			url:"checkingEmail",
			type:"post",
			data:{"id":id,
				  "email":email},
			
			success:function(data){
				console.log(data);
				if(data.length==0){
				/*
					var temp='잘못된 사용자 정보 입니다.';
					$('#result').html(temp);*/
					$('#result').attr("data","miss");
					
				}else{
		
					var temp='재등록 가능한 사용자 정보 입니다.';
					$('#result').html(temp);
					$('#result').attr("data","ok");
					
				}
			},
			
			error:function(){
				alert("통신실패")
			}
		});
	});
});


function check() {
	console.log('check');
	var id = $('#id').val();
	var email =  $('#email').val();
	var password = $('#password').val();
	var userpwd2 = $('#userpwd2').val();
	var pattern1 = /[0-9]/;	
	var pattern2 = /[a-zA-Z]/;
	var grade = $('#grade').val();
	var temp2 =$('#result').attr("data");

	if( id.length == 0 ){
		alert("ニックネームを入力してください。");
		document.getElementById("id").focus();
		return false;
	}
	else if(password.length==0){
		alert("パスワードを入力してください。");
		document.getElementById("password").focus();
		return false;
	}
	else if(userpwd2.length==0){
		alert("パスワードをもう一度入力してください。");
		document.getElementById("userpwd2").focus();
		return false;
	}

	else if(email.length==0){
		alert("メールを入力してください。");
		document.getElementById("email").focus();
		return false;
	}

	else if(temp2=="miss"){
		alert("使用者情報が確認できません");
		return false;
		
	}
	if(grade=='seller'){
		if(!pattern1.test(userpwd) || userpwd.length < 4 || userpwd.length > 8){ 
			alert("パスワードは4桁～8桁の数字にしてください。");
		
		return false;
	}

		else if(password!=userpwd2){
			alert('パスワードが一致しません。');
			document.getElementById("password").value="";
			document.getElementById("userpwd2").value="";
			document.getElementById("userpwd2").focus();
			return false;
		}
		

	}
	if(grade=='buyer'){	
		console.log('buyer');
		if( !pattern1.test(password) || !pattern2.test(password) || password.length < 8 || password.length >= 16){ 
			alert("パスワードは8桁～16桁の英数記号混在にしてください。");
	
		return false;
	}
		else if(password!=userpwd2){
			alert('パスワードが一致しません。');
			document.getElementById("password").value="";
			document.getElementById("userpwd2").value="";
			document.getElementById("userpwd2").focus();
			return false;
		}
		
	}
	else{	
		return true;	
	}
	}


function reset () {
	$("#toggleCSS").attr("href", "./resources/css/alertify.default.css");
	alertify.set({
		labels : {
			ok     : "OK",
			cancel : "Cancel"
		},
		delay : 5000,
		buttonReverse : false,
		buttonFocus   : "ok"
	});
}



