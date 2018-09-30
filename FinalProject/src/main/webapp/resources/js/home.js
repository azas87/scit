var listMode = "allBuyList";
var refreshInterver = 600000; // 1000 = 1초
var isSeasonInfoLoad = false;
var isHomeListLoad=false;
var isBestSellerLoad=false;
var userMode;

$(document).ready(function() {
	
	$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
	
	
	$("#jqGridbestSeller").closest("div.ui-jqgrid-view")
    .children("div.ui-jqgrid-titlebar")
    .css("text-align", "center")
    .children("span.ui-jqgrid-title")
    .css("float", "none");
	
	
	$('.popdown').popdown();
	 
	userMode = $('#userMode').val();
	console.log(userMode);
	if(userMode!='buyer' && userMode !='manager')
	{
		
	  $(".item").mouseenter(function(){
		  
		  

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
	/*		      $(this).css('background-color',"powderblue");
	*/	/*	      $('input').css('line-height', '60px');
		      $('input').css('width', '200px');*/
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
	      /*$(this).css('background-color',"white");*/
	    });
	  
	}   
	else
	{
		$('.item:nth-child(1)').css('font-size','2em');
	}
	  
});


function tab(e, num){
    var num = num || 0;
    var menu = $(e).children();
    var con = $(e+'_con').children();
    var select = $(menu).eq(num);
    var i = num;

    select.addClass('on');
    con.eq(num).show();

    menu.click(function(){
        if(select!==null){
            select.removeClass("on");
            con.eq(i).hide();
        }

        select = $(this);	
        i = $(this).index();

        select.addClass('on');
        con.eq(i).show();
    });
}

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

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function homeList() {
	console.log("homeList");
	$.jgrid.gridUnload('#jqGrid');
	$("#jqGrid").jqGrid({
		url : "allBuyList",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
 				label : 'buyNum',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			}, {
 				label : 'saleStatus',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, {
				label : '締切',
				name : 'deadline',
				width : 230,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'	
			}, {
				label : '購買者ID',//구매자ID,판매자:販売者
				name : 'buyerId',
				width : 120,
				height : 200,
				align:'center'
			}, 

		],
		viewrecords : true,
		scrollOffset : 0,
		//altRows:true,
		width : 1100,
		height : 510,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			isHomeListLoad=true;
			helper();
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
			console.log(rowid);
    	}
		
	});
}


//판매자 선호리스트
function sellerWishList() {
	console.log("sellerWishList");
	$.jgrid.gridUnload('#jqGrid');
	$("#jqGrid").jqGrid({
		url : "sellerWishList",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
 				label : 'buyNum',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			}, {
 				label : 'saleStatus',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, {
				label : '締切',
				name : 'deadline',
				width : 250,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 60,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '購買者ID',//구매자,판매자:販売者    
				name : 'buyerId',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '販売要望',//구매자선택, 판매자가 구매자 선택(딜을 넣는다),전체리스트에서는 if로 구매자 판매자 구분해서 넣어야하나?,글자크기커서 넓이를 조정해야함
				name : 'buyerSelect',
				width : 80,
				height : 200,
				formatter: buyerSelect,
				cellattr:mouseCursor,
				align:'center'
			}, {
				label : 'successSellerId',//판매자 참여여부
				name : 'successSellerId',
				width : 80,
				height : 200,				
				align:'center',
				hidden:true					
			}, 

		],
		viewrecords : true,
		//altRows:true,
		width : 1100,
		height : 505,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			helper();
			
			$(".jqGridghead_0").css('font-size','1.5em');
		}, 
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "buyerSelect")
    		{	
    			console.log(rowid);
    			console.log(jQuery("#jqGrid").getRowData(rowid));
				var obj = $("#jqGrid").getRowData(rowid);
    			
				if(obj.buyerSelect != ""){
					var con = confirm('販売要請を送りますか？');
    				if(con==true){           		 		
           		 		$.ajax({
           				url:"selectBuyer",
           				type:"get",
           				data:{"buyNum":obj.buyNum
           				},
           				success:function(data){
           					ResetBuyList('sellerWishList');
           				},
           				error:function(){
           					alert("통신실패");
           				}
           		 		});
    				}else{
    					return;
    				}	           		 		
    			}else{
    				return;
    			}    				 	    			
    		}
    	},   
	});
};	



//구매자 진행중인 리스트
function myList_ing_buyer() {
	
	console.log("myList_ing_buyer");
	$.jgrid.gridUnload('#jqGrid');
	$("#jqGrid").jqGrid({
		url : "myList_ing_buyer",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
 				label : 'buyNum',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			}, {
 				label : 'saleStatus',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, {
				label : '締切',
				name : 'deadline',
				width : 250,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 60,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '販売者ID',//판매자ID,  구매자:購買者   
				name : 'successSellerId',
				width : 100,
				height : 200,
				cellattr:mouseCursor,
				align:'center'
			}, {
				label : '再購入1',
				name : '再購入2',
				width : 100,
				height : 200,
				formatter: rebuy,
				cellattr:mouseCursor,
				align:'center'
			}, {
				label : '販売者選択',//구매자가 판매자 선택
				name : 'sellerSelect',
				width : 100,
				height : 200,
				formatter: sellerSelect,
				cellattr:mouseCursor,
				align:'center'
			}, 

		],
		viewrecords : true,
		//altRows:true,
		width : 1100,
		height : 505,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: true,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			helper();
			
			$(".jqGridghead_0").css('font-size','1.5em');
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	var con = confirm('再購入しますか?');
    				if(con==true){
    					console.log(jQuery("#jqGrid").getRowData(rowid));
           		 		location.href="writeBuyBoardForm";
    				}else{
    					return;
    				}    			
    		}else if(cm[index].name == "sellerSelect"){
    			
    			var con = confirm('販売者を選択しますか');
    				if(con == true){
    					console.log(jQuery("#jqGrid").getRowData(rowid));
    					var obj = $("#jqGrid").getRowData(rowid);
    				
       		 			$.ajax({
           				//url:"selectSeller?SellerId="+obj.successSellerId+"&buyNum="+obj.buyNum,
       		 			url : "selectSeller",
           				type:"get",
           				data:{"SellerId":obj.successSellerId, "buyNum":obj.buyNum
           				},
           				success:function(data){
           					ResetBuyList('myList_ing_buyer');
           				},
           				error:function(){
           					alert("통신실패");
           				}
           		 		});  
       		 			
    				}else{
    					return;
    				}
    		} else if(cm[index].name == "successSellerId"){
    			alert('이벤트');
     			sellerDetail($("#jqGrid").getRowData(rowid).successSellerId);
     		}
    	},   
	});
};

//판매자 참여리스트
function myList_ing_seller() {
	console.log("myList_ing_seller");
	$.jgrid.gridUnload('#jqGrid');
	$("#jqGrid").jqGrid({
		url : "myList_ing_seller",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
 				label : 'buyNum',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			}, {
 				label : 'saleStatus',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, {
				label : '締切',
				name : 'deadline',
				width : 250,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 60,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '購買者ID',//구매자ID
				name : 'buyerId',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '取り消し',//취소
				name : 'selectCancel',
				width : 100,
				height : 200,
				formatter: selectCancel,
				cellattr:mouseCursor,
				align:'center'
			},

		],
		viewrecords : true,
		//altRows:true,
		width : 1100,
		height : 505,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			helper();
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "selectCancel")
    		{	var con = confirm('取り消ししますか?');
    				if(con == true){
    					console.log(jQuery("#jqGrid").getRowData(rowid));
    	    			var obj = $("#jqGrid").getRowData(rowid);
    	       		       		 		
           		 		$.ajax({
           				url:"deleteMyList_seller",
           				type:"get",
           				data:{"buyNum":obj.buyNum
           				},
           				success:function(data){
           					ResetBuyList('myList_ing_seller');
           				},
           				error:function(){
           					alert("통신실패");
           				}
           		 		});
           		 		
    				}else{
    					return;
    				}       		 
    		}
    	},   
	});
}

//구매자 내글 목록
function myAllList_buyer() {
	console.log("myAllList_buyer");
	$.jgrid.gridUnload('#jqGrid');
	$("#jqGrid").jqGrid({
		url : "myAllList_buyer",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
 				label : 'buyNum',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			}, {
 				label : 'saleStatus',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, {
				label : '締切',
				name : 'deadline',
				width : 250,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 60,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '販売者ID',//구매자,판매자:販売者
				name : 'successSellerId',
				width : 100,
				height : 200,
				cellattr:mouseCursor,
				align:'center'
			}, {
				label : '再購入1',
				name : '再購入2',
				width : 100,
				height : 200,
				formatter: rebuy,
				cellattr:mouseCursor,
				align:'center'
			}, {
				label : '削除',
				name : 'deletee',
				width : 100,
				height : 200,
				formatter: deletee,
				cellattr:mouseCursor,
				align:'center'
			},

		],
		viewrecords : true,
		//altRows:true,
		width : 1100,
		height : 505,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			helper();
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")    			
    		{	var con = confirm('再購入しますか?');
				if(con==true){
					console.log(jQuery("#jqGrid").getRowData(rowid));
   		 			location.href="writeBuyBoardForm";
				}else{
					return;
				}    			
    		}else if(cm[index].name == "deletee"){ 				
				console.log(jQuery("#jqGrid").getRowData(rowid));
    			var obj = $("#jqGrid").getRowData(rowid);
       		 	
    			if(obj.deletee != ""){
       		 		var con = confirm('削除しますか?');    			
       		 		if(con==true){       		 		
	       		 		$.ajax({
	    				url:"deleteMyList_buyer",
	    				type:"get",
	    				data:{"buyNum":obj.buyNum
	    				},
	    				success:function(data){
	    					ResetBuyList('myAllList_buyer');
	    				},
	    				error:function(){
	    					alert("통신실패");
	    				}
	    		 		});  
       		 		}else{
           		 		return;
           		 	}           	
       		 	}else{
       		 		return;
       		 	}	 	
			  		    				
    		}else if(cm[index].name == "successSellerId"){
    			console.log(jQuery("#jqGrid").getRowData(rowid));
    			var obj = $("#jqGrid").getRowData(rowid);
    			if(obj.successSellerId != ""){//판매자ID가 비어있지 않으면
    				alert('이벤트');
         			sellerDetail($("#jqGrid").getRowData(rowid).successSellerId);
    			}else{
    				return;
    			}
     		}    		    		
    	},   
	});
}


/*function myAllList_seller() {
	console.log("myAllList_seller");
	$.jgrid.gridUnload('#jqGrid');
	$("#jqGrid").jqGrid({
		url : "myAllList_seller",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
 				label : 'buyNum',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			}, {
 				label : 'saleStatus',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, {
				label : '締切',
				name : 'deadline',
				width : 250,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 60,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '販売者ID',
				name : 'successSellerId',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '再購入1',
				name : '再購入2',
				width : 100,
				height : 200,
				formatter: rebuy,
				align:'center'
			}, {
				label : '削除',
				name : 'deletee',
				width : 100,
				height : 200,
				formatter: deletee,
				align:'center'
			},

		],
		viewrecords : true,
		//altRows:true,
		width : 1100,
		height : 505,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			$('.bigSize').hover(function(){
				var title = $(this).attr('title');
				if(title!="")
				{
					$(this).data('tipText', title).removeAttr('title');
					$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
				}
			},
			function() {
				$(this).attr('title',$(this).data('tipText'));
				$('.tooltip').remove();
			}).mousemove(function(e) {
				var mousex = e.pageX + 20;
				var mousey = e.pageY + 10;
				$('.tooltip').css({top : mousey,left : mousex});
			});
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	alert('구입')
       		 	console.log(jQuery("#jqGrid").getRowData(rowid));
       		 	location.href="writeBuyBoardForm";
    			
    		}else if(cm[index].name == "deletee"){    			
    			alert('정말삭제하시겠습니까?')
    			console.log(jQuery("#jqGrid").getRowData(rowid));
    			var obj = $("#jqGrid").getRowData(rowid);
       		 	location.href="deleteMyList?buyNum="+obj.buyNum;
    			
    		}    		    		
    	},   
	});
}*/


function bestSeller() {
	console.log("bestSeller");
	$("#jqGridbestSeller").jqGrid({
		url : "bestSeller",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '品種',
				name : 'fishName',
				width : 180,
				align:'center'
			}, {
				label : '産地',
				width : 80,
				name : 'location',
				align:'center'
			}, {
				label : '単位',
				name : 'unit',
				align:'center'
			}, {
				label : '市価',
				name : 'price',
				width : 130,
				align:'center'
			}, 
		],
		caption:"今、売れている魚",
		scrollOffset : 0,
		hidegrid : false,
		hidden:false,
		viewrecords : true,
		height : 152,
		rowNum : 3,
		rowList:[10,20,30],
		pager : "#jqGridPagerbestSeller",
		loadonce: true,
		grouping: false,
		//shrinkToFit:true,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			isBestSellerLoad=true;
			helper();
		},
		gridComplete: function(){
		},
		/*onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	alert('구입')
       		 	console.log(jQuery("#jqGrid").getRowData(rowid));
       		 	location.href="writeBuyBoardForm";
    			
    		}else if(cm[index].name == "sellerSelect"){    			
    			alert('이벤트')
    			console.log(jQuery("#jqGrid").getRowData(rowid));
    			var obj = $("#jqGrid").getRowData(rowid);
       		 	location.href="selectSeller?SellerId="+obj.successSellerId+"&buyNum="+obj.buyNum;
    			
    		}    		
    	},    	*/
	});
}


function seasonInfo() {
	var currentDate = new Date()
	var year = currentDate.getFullYear();
	var month = currentDate.getMonth() + 1;
    var day = currentDate.getDate();
    var my_date = year+"-"+month+"-"+day;	
	console.log(my_date);
	
	
	var season = ""; 
	if((month==3)|| (month==4)|| (month==5)){
		season = "春";
	}else if((month==6)|| (month==7)|| (month==8)){
		season = "夏";
	}else if((month==9)|| (month==10)|| (month==11)){
		season = "秋";
	}else if((month==12)|| (month==1)|| (month==2)){
		season = "冬";
	}
	console.log(season);
	
	
	console.log("seasonInfo");
	$("#jqGridseasonInfo").jqGrid({
		url : "seasonInfo?season="+season,
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '品種',
				name : 'fishName',
				width : 180,
				align:'center'
			}, {
				label : '産地',
				width : 80,
				name : 'location',
				align:'center'
			}, {
				label : '単位', 
				name : 'unit',
				align:'center'
			}, {
				label : '市価',
				name : 'price',
				width : 130,
				align:'center'
			}, 
		],
		caption:"旬の魚",
		scrollOffset : 0,
		hidegrid : false,
		viewrecords : true,
		height : 152,
		rowNum : 3,
		rowList:[10,20,30],
		pager : "#jqGridPagerseasonInfo",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['buyNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("loadComplete");
			isSeasonInfoLoad=true;
			helper();
		},
		gridComplete: function(){
		},
		/*onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	alert('구입')
       		 	console.log(jQuery("#jqGrid").getRowData(rowid));
       		 	location.href="writeBuyBoardForm";
    			
    		}else if(cm[index].name == "sellerSelect"){    			
    			alert('이벤트')
    			console.log(jQuery("#jqGrid").getRowData(rowid));
    			var obj = $("#jqGrid").getRowData(rowid);
       		 	location.href="selectSeller?SellerId="+obj.successSellerId+"&buyNum="+obj.buyNum;
    			
    		}    		
    	},    	*/
	});
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}
function selectCancel (cellvalue, options, rowObject) {
 //console.log(rowObject);
   return '取り消し'; 
};
function rebuy (cellvalue, options, rowObject) {
   return '再購入'; 
};
function sellerSelect (cellvalue, options, rowObject) {
//console.log(rowObject);	
   return '選択';
};	
function buyerSelect (cellvalue, options, rowObject) {
//console.log(rowObject)
	if(rowObject.successSellerId==null){
		return '選択';
	}else{	
		return "";
	}	
};	
function deletee (cellvalue, options, rowObject) {//rowObject는 테이블의 1줄을 읽는것,jgride함수에 적혀있음
//console.log(rowObject);	
	if(rowObject.successSellerId==null){
		return '削除';
	}else{	
		return "";
	}
};	

function ResetBuyList(urlReset) {	
	$( "#jqGrid").jqGrid('clearGridData');
	$( "#jqGrid").jqGrid().setGridParam({url:urlReset,datatype:'json'}).trigger('reloadGrid');
}

function mouseCursor(rowid, cellValue, rawData, colModel, rowData){
	if(cellValue!=""){
		return "style='cursor:pointer'";
	}else{	
		return "";
	}
};		 
function sellerDetail (seller) {
	$('#sellerInfo').val(seller);
	window.open("sellerDetail", "sellerDetail", "width=400px,height=300px,left=500px,top=200px");
};
	

function autoWriteTest()
{
	console.log("autoWriteTest " + today());
	//location.href="writeBuyBoard?fishName=クマエビ&buyerId=id2&weight=100&saleStatus=onSale&price=12345&registDate=Sep 10 2018 4:18:17 PM&uploadDate=Sep 10 2018 4:18:18 PM&deadline=+Sep 11 2018 4:18:23&successSellerId=id1&buyListComment=auto_write&location=인천"
	location.href="writeBuyBoard?fishName=クマエビ&buyerId=id2&weight=100&saleStatus=onSale&price=12345&registDate=Sep 10 2018 4:18:17 PM&uploadDate=Sep 10 2018 4:18:18 PM&deadline="+today()+"&successSellerId=id1&buyListComment=auto_write&location=인천";
}



//오늘날짜 구하기
function today(){
	   
    var date = new Date();

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length == 1) { day = "0" + day; }
    return year +"/" + month +"/"+ day; 
       
}

/* 커밋 테스트용 */


function helper()
{
	console.log("helper");
	console.log(userMode);
	if(userMode!='buyer' && userMode !='manager')
	{
		if(isSeasonInfoLoad && isHomeListLoad && isBestSellerLoad)
		{
			$('.bigSize').hover(function(){
				var title = $(this).attr('title');
				console.log(title);
				if(title!=" " && title!="" && title!=null)
				{
					$(this).data('tipText', title).removeAttr('title');
					$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
				}
			},
			function() {
				$(this).attr('title',$(this).data('tipText'));
				$('.tooltip').remove();
			}).mousemove(function(e) {
				var mousex = e.pageX + 20;
				var mousey = e.pageY + 10;
				$('.tooltip').css({top : mousey,left : mousex});
			});
		}
	}
	else
	{
		$('.bigSize').hover(function(){
			var title = $(this).attr('title');
			$(this).attr('title', "");
		});
	}
} 