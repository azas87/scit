$(function(){
	$("input:button.confirm").click(confirm);
});


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
//리뷰등록 여부
function confirm() {
	alert('여기오니?');
	var buyNum = $(this).attr("data");
	alert(buyNum);
		$.ajax({
			url:"confirm",
			type:"get",
			data:{"buyNum":buyNum,
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
			window.open("reviewForm", "join", "width=400px,height=300px,left=500px,top=200px");
		} else {
			alertify.error("You've clicked Cancel");
		}
	});
	return false;
	
}