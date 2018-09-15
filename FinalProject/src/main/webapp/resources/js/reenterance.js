
$(function(){
	
	
	$("#usermail").keyup(function (){
		var userid =$('#userid').val();
		var email =$('#usermail').val();
		$.ajax({
			url:"checkingEmail",
			type:"post",
			data:{"id":userid,
				  "email":email},
			
			success:function(data){
				alert(data);
				if(data.length==0){
				
					var temp='잘못된 사용자 정보 입니다.';
					$('#result').html(temp);
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
	var userid = $('#userid').val();
	var email =  $('#usermail').val();
	var userpwd = $('#userpwd').val();
	var userpwd2 = $('#userpwd2').val();
	var pattern1 = /[0-9]/;	
	var pattern2 = /[a-zA-Z]/;
	var grade = $('#grade').val();
	var temp2 =$('#result').attr("data");

	if( userid.length == 0 ){
		reset();
		alertify.alert("ニックネームを入力してください。");
		document.getElementById("userid").focus();
		return false;
	}
	else if(userpwd.length==0){
		reset();
		alertify.alert("パスワードを入力してください。");
		document.getElementById("userpwd").focus();
		return false;
	}
	else if(userpwd2.length==0){
		reset();
		alertify.alert("パスワードをもう一度入力してください。");
		document.getElementById("userpwd2").focus();
		return false;
	}

	else if(email.length==0){
		reset();
		alertify.alert("メールを入力してください。");
		document.getElementById("userpwd2").focus();
		return false;
	}

	else if(temp2=="miss"){
		reset();
		alertify.alert("使用者情報が確認できません");
		document.getElementById("userpwd2").focus();
		return false;
		
	}
	if(grade=='seller'){
		if(userpwd.length!=6){ 
			reset();
			alertify.alert("パスワードは6桁の数字にしてください。");
		
		return false;
	}

		else if(userpwd!=userpwd2){
			reset();
			alertify.alert('パスワードが一致しません。');
			document.getElementById("userpwd").value="";
			document.getElementById("userpwd2").value="";
			document.getElementById("userpwd2").focus();
			return false;
		}
		

	}
	if(grade=='buyer'){	
		if( !pattern1.test(userpwd) || !pattern2.test(userpwd) || userpwd.length < 8 || userpwd.length >= 16){ 
			reset();
			alertify.alert("パスワードは8桁～16桁の英数記号混在にしてください。");
	
		return false;
	}
		else if(userpwd!=userpwd2){
			reset();
			alertify.alert('パスワードが一致しません。');
			document.getElementById("userpwd").value="";
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



