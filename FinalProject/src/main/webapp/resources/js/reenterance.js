
$(function(){
	$("#email").keyup(function (){
		var userid =$('#userid').val();
		var email =$('#email').val();
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
						
				}else{
		
					var temp='재등록 가능한 사용자 정보 입니다.';
					$('#result').html(temp);
				}
			},
			
			error:function(){
				alert("통신실패")
			}
		});
	});
});
