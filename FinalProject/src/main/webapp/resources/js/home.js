var listMode = "allBuyList";
var refreshInterver = 600000; // 1000 = 1초


$(document).ready(function() {
	
	$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
	
	
	$('.popdown').popdown();
	 
	
	    
	  $(".item").mouseenter(function(){
		  if($(this).attr('class') != "item search")
		  {
			  $(this).css('flex-grow',1);
		      $(this).css('font-size',"3.5em");
		      $(this).css('background-color',"powderblue");
	/*	      $('input').css('line-height', '60px');
		      $('input').css('width', '200px');*/
		  }
	     
	    });
	    
	  $(".item").mouseleave(function(){
	      $(this).css('flex-grow',1);
	      $(this).css('font-size',"1em");
	      $(this).css('background-color',"white");
	    });
	  

	    
	  
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
	//$("#f_main").src=action;*/
	$('#f_main').attr('src', action);
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
				label : '購買日付',
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
			}, 

		],
		viewrecords : true,
		scrollOffset : 0,
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
		
	});
}



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
				label : '購買日付',
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
	});
}



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
				label : '購買日付',
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
				label : '販売者選択',
				name : 'sellerSelect',
				width : 100,
				height : 200,
				formatter: select,
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
			
			$(".jqGridghead_0").css('font-size','1.5em');
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	var con = confirm('재구입하시겠습니까?');
    				if(con==true){
    					console.log(jQuery("#jqGrid").getRowData(rowid));
           		 		location.href="writeBuyBoardForm";
    				}else{
    					return;
    				}    			
    		}else if(cm[index].name == "sellerSelect"){
    			
    			var con = confirm('정말 선택하시겠습니까?');
    				if(con == true){
    					console.log(jQuery("#jqGrid").getRowData(rowid));
    					var obj = $("#jqGrid").getRowData(rowid);
       		 			location.href="selectSeller?SellerId="+obj.successSellerId+"&buyNum="+obj.buyNum;    			
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
				label : '購買日付',
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
				label : '購買者ID',
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
    		if(cm[index].name == "selectCancel")
    		{	var con = confirm('정말 취소하시겠습니까?');
    				if(con == true){
    					console.log(jQuery("#jqGrid").getRowData(rowid));
    	    			var obj = $("#jqGrid").getRowData(rowid);
    	       		 		location.href="deleteMyList_seller?buyNum="+obj.buyNum; 
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
				label : '購買日付',
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
    		{	var con = confirm('재구입하시겠습니까?');
				if(con==true){
					console.log(jQuery("#jqGrid").getRowData(rowid));
   		 			location.href="writeBuyBoardForm";
				}else{
					return;
				}    			
    		}else if(cm[index].name == "deletee"){ 
    			var con = confirm('정말삭제하시겠습니까?');
    			if(con==true){
    				console.log(jQuery("#jqGrid").getRowData(rowid));
        			var obj = $("#jqGrid").getRowData(rowid);
           		 	location.href="deleteMyList_buyer?buyNum="+obj.buyNum;
    			}else{
    				return;
    			}    			
    		}else if(cm[index].name == "successSellerId"){
    			alert('이벤트');
     			sellerDetail($("#jqGrid").getRowData(rowid).successSellerId);
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
				label : '購買日付',
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
				name : 'total',
				width : 130,
				align:'center'
			}, 
		],
		caption:"bestSeller",
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
			$('.bigSize').hover(function(){
				console.log("test");
				var title = $(this).attr('title');
				$(this).data('tipText', title).removeAttr('title');
				$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
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
				name : 'total',
				width : 130,
				align:'center'
			}, 
		],
		caption:"seasonInfo",
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
			$('.bigSize').hover(function(){
				console.log("test");
				var title = $(this).attr('title');
				$(this).data('tipText', title).removeAttr('title');
				$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
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
function select (cellvalue, options, rowObject) {
//console.log(rowObject);	
   return '選択';
};	
function deletee (cellvalue, options, rowObject) {//rowObject는 테이블의 1줄을 읽는것,jgride함수에 적혀있음
//console.log(rowObject);	
	if(rowObject.successSellerId==null){
		return '削除';
	}else{	
		return "";
	}
};	

function mouseCursor(rowid, cellValue, rawData, colModel, rowData){   
	return "style='cursor:pointer'";
};		 
function sellerDetail (seller) {
	$('#sellerInfo').val(seller);
	window.open("sellerDetail", "sellerDetail", "width=400px,height=300px,left=500px,top=200px");
};
	

function mouseCursor(rowid, cellValue, rawData, colModel, rowData){   
	return "style='cursor:pointer'";
};

function myList() {		
	console.log("myBuylist");
	
	var userMode = $("#userMode").val();
	console.log(userMode);
	if(userMode==1)
	{
		listMode = "myBuyList";
	}
	else
	{
		listMode = "mySaleList";
	}
	
	
	ListRefresh();
}


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


