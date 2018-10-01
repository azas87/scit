
//$(document).ready(function() {
window.onload = function() { //실행될 코드 }
		var period = $('#period').val();
		var startDay = $('#startDay').val();
		var endDay = $('#endDay').val();
		var userMode = $('#userMode').val();
		
		if(userMode=='buyer'){
		buyList(period, startDay, endDay);
		}
		else{
		sellerBuyList(period, startDay, endDay);
		}
		sumList(period, startDay, endDay);
		
		
		$('#jqGridPager_left').css('display','none');
		$('#jqGridPager_center').css('width','600px');
		$('#jqGridPager_right').css('padding-right','26px');
		
		
		$('#input_jqGridPager').css('width','600px');
		$('#input_jqGrid2Pager').css('width','600px');
		
		$('.ui-pg-input').css('width','60px');
		
		$('#input_jqGridPager').css('font-size','1.5em');
		$('#input_jqGrid2Pager').css('font-size','1.5em');
		
		$('#jqGrid2Pager_left').css('display','none');
		$('#jqGrid2Pager_center').css('width','530px');
		$('#jqGrid2Pager_center').css('padding-left','50px');
		$('#jqGrid2Pager_right').css('padding-right','26px');
		
		$('#jqGrid2Pager').css('height','50px');
		
		var timer;
		$("#search_cells").on("keyup", function() {
			var self = this;
			if(timer) { clearTimeout(timer); }
			timer = setTimeout(function(){
				//timer = null;
				$("#jqGrid").jqGrid('filterInput', self.value);
			},0);
		});
		
		$("#search").on("click",function(){
			 var data = $("#searchData").val()
			 var searchType = $("#searchType").val();
			 var rows = $("[title ='Records per Page']").val();
			 var postData  = {'data' : data , 'searchType' : searchType, 'rows' :  rows }

			 rowData = null;
			
			 $("#jqGrid").jqGrid("clearGridData", true);
			
			 $("#jqGrid").setGridParam({
			 datatype	: "json",
				 postData	: postData,
				 loadComplete	: function(data) {
					 console.log(data);
				 }
			 }).trigger("reloadGrid");
		});
		 
		 $(window).resize(function() {

				$("jqGrid").setGridWidth($(this).width() * .100);

			});
}
//	});


function rebuy (cellvalue, options, rowObject) {
	 //console.log(rowObject);
	 return '再購入'; 
};

function rebuy2 (cellvalue, options, rowObject) {

	/*alert(rowObject.saleStatus);*/

	if(rowObject.saleStatus=='saleComplete')
		return '確認';
	else
		return"";

};
 
function rebuy3 (cellvalue, options, rowObject) {
	//console.log(rowObject);
	if(rowObject.saleStatus=='saleComplete')
		return '返金';
	else
		return"";
};
function sellerDetail (seller) {
	
	$('#sellerInfo').val(seller);
	window.open("sellerDetail", "sellerDetail", "width=400px,height=300px,left=500px,top=200px");
};
 
 
 
 function buyList(period, startDay, endDay) {
	
 	$("#jqGrid").jqGrid({
 		/* 환불 url:'refundList'*/
 		
 		url : 'jqgrid_R?period='+period+"&startDay="+startDay+"&endDay="+endDay,
 		mtype : "GET",
 		datatype : "json",
 		colModel : 
 		[ 
 			{
 				label : '히든',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			},{
 				label : '수취히든',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			},  {
 				label : '再購入',
 				width:100,
 				name : '再購入',
 				formatter: rebuy,
 				cellattr:mouseCursor,
 				align:'center'
 			}, 
 			{
 				label : '取引日付',
 				name : 'deadline',
 				width:290,
 				align:'center'
 			
 			}, {
 				label : '魚種',
 				name : 'fishName',
 				width:200,
 				align:'center' 				
 			}, {
 				label : '産地',
 				name : 'location',
 				width:130,
 				align:'center'
 			}, {
 				label : '重量',
 				name : 'weight',
 				width:80,
 				align:'center'
 			},  {
 				label : '取引者',
 				name : 'successSellerId',
 				width: 120,
 				cellattr:mouseCursor,
 				align:'center'
 			},{
 				label : '価格',
 				name : 'price',
 				width:130,
 				align:'center'
 			},{
 				label : '受取',
 				width:100,
 				name : '確認',
 				formatter: rebuy2,
 				cellattr:mouseCursor,
 				align:'center'
 			},{
 				label : '返金',
 				name : '払い戻し',
 				width : 100,
 				formatter: rebuy3,
 				cellattr:mouseCursor,
 				align:'center'
 			},

 		],
 		viewrecords : true,
 		width:1295,
 		rowNum : 10,
 		rowList:[10,20,30],
 		height:505,
 		pager : "#jqGridPager",
 		loadonce: true,
 		shrinkToFit : false,	// true는 컬럼 폭을 같은 크기로 맞춤. 폭 조절이 안 먹힘.
 		footerrow:true,
 		userDataOnFooter : true,
 		loadComplete:function(data)
 		{
 			
 			// 나중에 생긴 테이블에 한번만 적용해야 함.
/* 			$('.bigSize').hover(function(){
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
 			*/
 			
 			var moneySum = $("#jqGrid").jqGrid('getCol','price', false, 'sum'); 
 			$('#jqGrid').jqGrid('footerData', 'set', { deadline:'합계', price:moneySum });
 			$('.footrow').css('fontSize','1.5em');

 			$('table.ui-jqgrid-ftable td:eq(2)').hide();
 			$('table.ui-jqgrid-ftable td:eq(4)').hide();
 			$('table.ui-jqgrid-ftable td:eq(5)').hide();
 			$('table.ui-jqgrid-ftable td:eq(6)').hide();
 			$('table.ui-jqgrid-ftable td:eq(7)').hide();
 			$('table.ui-jqgrid-ftable td:eq(9)').hide();
 			$('table.ui-jqgrid-ftable td:eq(10)').hide();
 			
 			
 			
 			/*var footer = $("table.ui-jqgrid-ftable tr:first td:eq(0)");	
 			footer.css("color", "#2e6e9e"); */
 			//footer.css("text-align", "left");
 			//footer.css("width", widthSum); 
 			
 			/*
 			$('table.ui-jqgrid-ftable tr:first').children("td").css("background-color", "#dfeffc");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1)').css("width","13px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(5)').css("text-align", "right");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1), table.ui-jqgrid-ftable tr:first td:eq(5)').css("padding-bottom","8px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1), table.ui-jqgrid-ftable tr:first td:eq(5)').css("padding-top","8px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(5)').append(" \u00A0");*/

 			
 			/*var widthSum = $('#grid tr:first td:eq(0)').width(); 
 			widthSum += $('#grid tr:first td:eq(1)').width();
 			widthSum += $('#grid tr:first td:eq(2)').width();
 			widthSum += $('#grid tr:first td:eq(3)').width();
 			*/
 			
 			
/* 			var $grid = $(this);
 	        var columns = $grid.jqGrid('getGridParam', 'colModel');

 	        var colsTotalWidth = 0;
 	        for (var i = 0; columns[i]; i++) {
 	            colsTotalWidth += columns[i].width;
 	            $grid.setColProp(columns[i].name, { width: columns[i].width, widthOrg: columns[i].width });
 	        }

 	        colsTotalWidth += 50;
 	        $(this).jqGrid('setGridWidth', colsTotalWidth, true);*/
 	        
 	       //resizeJqGridWidth('grid_container', $('#grid_container').width(), true);
 				

 		},
 		gridComplete: function(){
 		},
 		onCellSelect: function(rowid, index, contents, event) 
     	{    
     		var cm = $(this).jqGrid('getGridParam','colModel');    
     		if(cm[index].name == "再購入")
     		{	
     			var buyNum =$("#jqGrid").getRowData(rowid).buyNum;
     			location.href="writeBuyBoardForm?buyNum="+buyNum;
        		 	//console.log(jQuery("#jqGrid").getRowData(rowid));
     		}
     		else if(cm[index].name == "確認") {
     			confirm($("#jqGrid").getRowData(rowid));
     			//console.log($("#jqGrid").getRowData(rowid));
     			
     		}
     		else if(cm[index].name == "払い戻し") {
     			refund($("#jqGrid").getRowData(rowid));
     			
     		}
     		else if(cm[index].name == "successSellerId") {
     			sellerDetail($("#jqGrid").getRowData(rowid).successSellerId);
     			
     		}
     	},
     	
 	});
 };					
					
	

 function sellerBuyList(period, startDay, endDay) {
	
 	$("#jqGrid").jqGrid({
 		/* 환불 url:'refundList'*/
 		
 		url : 'sellerHistory?period='+period+"&startDay="+startDay+"&endDay="+endDay,
 		mtype : "GET",
 		datatype : "json",
 		colModel : 
 		[ 
 			{
 				label : '히든',
 				name : 'buyNum',
 				align:'center',
 				hidden:true
 			},{
 				label : '수취히든',
 				name : 'saleStatus',
 				align:'center',
 				hidden:true
 			}, 
 			{
 				label : '取引日付',
 				name : 'deadline',
 				width:370,
 				align:'center'
 			
 			}, {
 				label : '魚種',
 				name : 'fishName',
 				width:350,
 				align:'center' 				
 			}, {
 				label : '重量',
 				name : 'weight',
 				width:150,
 				align:'center'
 			},  {
 				label : '取引者',
 				name : 'buyerId',
 				width: 200,
 				cellattr:mouseCursor,
 				align:'center'
 			},{
 				label : '価格',
 				name : 'price',
 				width:200,
 				align:'center'
 			},

 		],
 		viewrecords : true,
 		width:1295,
 		rowNum : 10,
 		rowList:[10,20,30],
 		height:505,
 		pager : "#jqGridPager",
 		loadonce: true,
 		shrinkToFit : false,	// true는 컬럼 폭을 같은 크기로 맞춤. 폭 조절이 안 먹힘.
 		footerrow:true,
 		userDataOnFooter : true,
 		loadComplete:function(data)
 		{
 			
 			var moneySum = $("#jqGrid").jqGrid('getCol','price', false, 'sum'); 
 			$('#jqGrid').jqGrid('footerData', 'set', { deadline:'합계', price:moneySum });
 			$('.footrow').css('fontSize','1.5em');
 			$('table.ui-jqgrid-ftable td:eq(1)').hide();
 			$('table.ui-jqgrid-ftable td:eq(3)').hide();
 			$('table.ui-jqgrid-ftable td:eq(4)').hide();
 			$('table.ui-jqgrid-ftable td:eq(5)').hide();

 		},
 		gridComplete: function(){
 		},
 		onCellSelect: function(rowid, index, contents, event) 
     	{    
     		
     	},
     	
 	});
 };					
					
 
 
 
 
 function resizeJqGridWidth(div_id, width, tf){
	 console.log("Test");
     // window에 resize 이벤트를 바인딩 한다. 
     $(window).bind('resize', function() {

     var resizeWidth = $('#grid_container').width()-33; //jQuery-ui의 padding 설정 및 border-width값때문에 넘치는 걸 빼줌.

         // 그리드의 width 초기화
         $("#jqGrid").setGridWidth( resizeWidth, tf);

         // 그리드의 width를 div 에 맞춰서 적용
         $("#jqGrid").setGridWidth( resizeWidth , tf); //Resized to new width as per window. 

      }).trigger('resize');
  }



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
	$('#sellerId').val(obj.successSellerId);
	
	
	reset();
	alertify.set({ buttonReverse: true });
	alertify.confirm("レビューを登録されますか", function (e) {
		if (e) {
			alertify.success("You've clicked OK");
			window.open("reviewForm", "reviewForm", "width=400px,height=300px,left=500px,top=200px");
			console.log("ok");
			//수취확인
			$.ajax({
				url:"confirm",
				type:"get",
				data:{"buyNum":obj.buyNum,
					  },
				success:function(data){
					ResetBuyList();
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
//환불여부
function refund(obj) {

	reset();
	alertify.set({ buttonReverse: true });
	alertify.confirm("払い戻しされますか", function (e) {
		if (e) {
			alertify.success("You've clicked OK");
			
			$.ajax({
				url:"refund",
				type:"get",
				data:{"buyNum":obj.buyNum,
					  },
				success:function(data){
					ResetBuyList();
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

function ResetBuyList() {	
	console.log("ResetBuyList");
	//$( "#jqGrid").jqGrid().setGridParam({url:'jqgrid_R',datatype:'json'}).trigger('reloadGrid');
	var period = $('#period').val();
	var startDay = $('#startDay').val();
	var endDay = $('#endDay').val();
	
	
	$("#jqGrid").jqGrid().setGridParam({url:'jqgrid_R?period='+period+"&startDay="+startDay+"&endDay="+endDay, datatype:'json'}).trigger('reloadGrid'); //url 안 넣어주면 한번만 함.
}

//날짜지정해서 구매내역검사
function searchByDate() {
	var startDay = $('#startDay').val();
	var endDay = $('#endDay').val();
	location.href="buyListHistory?startDay="+startDay+"&endDay="+endDay;
}

function mouseCursor(rowid, cellValue, rawData, colModel, rowData){   
	if(cellValue!=""){
		return "style='cursor:pointer'";
	}else{	
		return "";
	}
}

//sumList
function sumList(period, startDay, endDay) {
	
 	$("#jqGrid2").jqGrid({
 		url : 'sumList?period='+period+"&startDay="+startDay+"&endDay="+endDay,
 		mtype : "GET",
 		datatype : "json",
 		colModel : 
 		[ 
 			{
 				label : '魚種',
 				name : 'fishName',
 				autowidth:true,
 				align:'center'
 			}, {
 				label : '合計',
 				autowidth:true,
 				name : 'price',
 				align:'center'
 			},

 		],
 		viewrecords : true,
 		scrollOffset : 0,
 		autowidth:true,
 		//altRows:true,	// tooltip 나오는 기능인데 차이가 없네? 이미 title에 값이 적혀 있어서 그런가?
 		width:1100,
 		height:400,
 		pager : "#jqGrid2Pager",
 		loadonce: true,
 		shrinkToFit : true,
 		loadComplete:function(data)
 		{
 	
 			helper();
 			
 		}     	
 	});
 };			

 
 
 function helper()
 {
 	console.log("helper");
 	console.log(userMode);
 	if(userMode!='buyer' && userMode !='manager')
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
 	else
 	{
 		$('.bigSize').hover(function(){
 			var title = $(this).attr('title');
 			$(this).attr('title', "");
 		});
 	}
 } 

