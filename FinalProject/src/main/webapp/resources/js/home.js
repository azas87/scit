var listMode = "allBuyList";
var refreshInterver = 60000; // 1000 = 1초
var userMode;

$(document).ready(function() {
	/* 민아씨 팝업 평범한 스타일 */
	$(".trigger_popup_fricc").click(function(){
	       $('.hover_bkgr_fricc').show();
	    });
	   
	    /* $('#close, .popupCloseButton').click(function(){ */
	    $('#close').click(function(){
	    	$('#memberStatus_page').css('display','block');
	    	$('#grade_page').css('display','none');
	    	$('input[class=radio]').attr('checked',false);
	        $('.hover_bkgr_fricc').hide();
	    }); 
	    
	    // 민아씨 팝업창 초기화
	    $('.popdown').popdown();
	    
	    // 회원가입 선택관련
	    $('#radio1, #radio2').click(function(){
	    	$('#grade_page').css('display','block');
	    	$('#memberStatus_page').css('display','none');
	    });
	    
	    $('#radio3, #radio4').click(function(){
	    	$('#outForm').submit();
	    });
	
	/* 상단 네비 바 관련 */
	$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
	
	/* 상단 네비바 버튼 커지는 기능 관련*/
	userMode = $('#userMode').val();
	console.log(userMode);
	if(userMode!='buyer' && userMode !='manager')
	{
		
	  $(".item").mouseenter(function()
	{
		  
		  if( ($(this).attr('class') == "item search_title") || ($(this).attr('class') == "item search_text"))
		  {
			  $('.search_title').css('flex-grow',1);
		      $('.search_title').css('font-size',"3em");
		      $('.search_title').css('font-weight','bold');
		  }
		  else
		  {
			  $(this).css('flex-grow',1);
		      $(this).css('font-size',"3em");
		      $(this).css('font-weight','bold');
		  }
		  
	     
	    });
	    
	  $(".item").mouseleave(function(){
		  
		  if( ($(this).attr('class') == "item search_text"))
		  {
			  $('.search_title').css('flex-grow',1);
		      $('.search_title').css('font-size',"2em");
		      $('.search_title').css('font-weight','normal');
		  }
		  
	      $(this).css('flex-grow',1);
	      $(this).css('font-size',"2em");
	      $(this).css('font-weight','normal');
	    });
	  
	}   
	else
	{
		$('.item:nth-child(1)').css('font-size','2em');
	}
	  
});

/*민아씨 경고창 */
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

/*민아씨 경고창 */
function cancel() {
	
	reset();
	alertify.prompt("パスワードをもう一度入力してください。", function (e, str) {
		if (e) {
			alertify.success("You've clicked OK and typed: " + str);
			
			$.ajax({
				url:"cancel",
				type:"post",
				data:{"password":str,
					  },
				success:function(data){
					console.log('성공');
				},
				error:function(){
					
	alert("통신실패");
					}
				});

			} else {
				alertify.error("You've clicked Cancel");
			}
		}, "");
		return false;
	}


/*민아씨 경고창 */
function confirm(title, obj, rowid) {
	//리뷰등록을 위해 buyNum 저장해두기
	
	reset();
	alertify.set({ buttonReverse: true });
	var result = null;
		alertify.confirm(title, function (e) {
		if (e) {
			alertify.success("You've clicked OK");
			confirmFunction(obj, rowid);
		} else {
			alertify.error("You've clicked Cancel");
		}
	});
}

/*민아씨 경고창에서 쓸 내가 만든 함수 */
function confirmFunction(obj, rowid)
{
	var rowData = null;
	if(rowid != null)
	{
		rowData = $("#jqGrid").getRowData(rowid);
	}
	console.log(rowData);
	
	switch(obj)
	{
	case 'buyerSelect':
		//var con = confirm('販売要請を送りますか？');
		$.ajax({
			url:"selectBuyer",
			type:"get",
			data:{"buyNum":rowData.buyNum
			},
			success:function(data){
				ResetBuyList('sellerWishList');
			},
			error:function(){
				alert("통신실패");
			}
		});
		break;
	case '再購入2':
		//var con = confirm('再購入しますか?');
 		location.href="writeBuyBoardForm?buyNum="+rowData.buyNum;
 		break;
	case 'sellerSelect':
		//var con = confirm('販売者を選択しますか');
		
		$.ajax({
			//url:"selectSeller?SellerId="+rowData.successSellerId+"&buyNum="+rowData.buyNum,
 			url : "selectSeller",
			type:"get",
			data:{"SellerId":rowData.successSellerId, "buyNum":rowData.buyNum
			},
			success:function(data){
				ResetBuyList('myList_ing_buyer');
			},
			error:function(){
				alert("통신실패");
			}
 		});  
		break;
	case 'selectCancel':
		//var con = confirm('取り消ししますか?');
		var rowData = $("#jqGrid").getRowData(rowid);
 		$.ajax({
			url:"deleteMyList_seller",
			type:"get",
			data:{"buyNum":rowData.buyNum
			},
			success:function(data){
				ResetBuyList('myList_ing_seller');
			},
			error:function(){
				alert("통신실패");
			}
 		});
 		break;
	case 'deletee':
		//var con = confirm('削除しますか?');
 		$.ajax({
			url:"deleteMyList_buyer",
			type:"get",
			data:{"buyNum":rowData.buyNum
			},
			success:function(data){
				ResetBuyList('myAllList_buyer');
			},
			error:function(){
				alert("통신실패");
			}
 		});  
 		break;
	}
}


/* iframe 페이지 전환 용 */
function newPage(action)
{
 	console.log("newPage");
 	console.log(action);
 	var height='';
 	switch(action)
 	{
 	case "main?":
 		height='1600px';
 		break;
 	case "writeBuyBoardForm?":
 		height='800px';
 		break;
 	case "updateWishList?":
 		height='900px';
 		break;
 	case "buyListHistory?":
 		height='2000px';
 		break;
 	case "marketPrice?":
 	case "noticeForm?":
 	case "qnaForm?":
 	case "faqForm?":
 		height='800px';
 		break;
 	case "fishInfoList?":
 		height='3000px';
 		break;	
 	}
	//$("#f_main").src=action;*/
 	$('#f_main').attr('height', height);
	$('#f_main').attr('src', action);
	
	/*$('#page-wrapper').attr('height','1000px');*/
}

var audio = new Audio('./resources/alram.wav');
audio.play();