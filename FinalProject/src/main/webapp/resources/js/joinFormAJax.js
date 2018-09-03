
$(function(){
	$("#userid").keyup(function (){
		var userid =$('#userid').val();
		$.ajax({
			url:"checkId",
			type:"get",
			data:{"userid":userid},
			
			success:function(data){
			
				if(data.length==0){
					alert("使用可能なIDです。");
					
					if(confirm("このIDを使用しますか")==true){
					
						var temp='<input type="text" id="userid" name="userid" value='+userid+' readonly>';
						$('#userid').remove();
						$('#inputBox').append(temp);
	
					}else{
						$('#userid').focus();
					}
						
				}else{
					alert("登録済みのIDです。")
					
				}
			},
			
			error:function(){
				alert("통신실패")
			}
		});
	});
});
