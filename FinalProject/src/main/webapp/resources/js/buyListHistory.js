


//date타입 string 형식으로 변환
function date(deadline){
	   
    var date = new Date(deadline);

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length == 1) { day = "0" + day; }
    return year +"/" + month +"/"+ day; 
       
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
//수취확인&리뷰등록 여부
function confirm(obj) {
	//리뷰등록을 위해 buyNum 저장해두기
	$('#buyNum').val(obj.buyNum);
	//수취확인
	$.ajax({
			url:"confirm",
			type:"get",
			data:{"buyNum":obj.buyNum,
				  },
			success:function(data){
		
			},
			error:function(){
				alert("통신실패");
			}
		});
	
	
	reset();
	alertify.set({ buttonReverse: true });
	alertify.confirm("レビューを登録されますか", function (e) {
		if (e) {
			alertify.success("You've clicked OK");
			window.open("reviewForm", "reviewForm", "width=400px,height=300px,left=500px,top=200px");
		} else {
			alertify.error("You've clicked Cancel");
		}
	});
	return false;
	
}
//환불여부
function refund() {

	var buyNum = $(this).attr("data");
	$('#buyNum').val(buyNum);

	reset();
	alertify.set({ buttonReverse: true });
	alertify.confirm("払い戻しされますか", function (e) {
		if (e) {
			alertify.success("You've clicked OK");
			
			$.ajax({
				url:"refund",
				type:"get",
				data:{"buyNum":buyNum,
					  },
				success:function(data){
			
				},
				error:function(){
					alert("통신실패");
				}
			});
		
		} else {
			alertify.error("You've clicked Cancel");
		}
	});
	return false;
	
	}

