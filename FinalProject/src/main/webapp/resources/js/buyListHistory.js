
//$(document).ready(function() {
window.onload = function() { //실행될 코드 }
		var period = $('#period').val();
		var startDay = $('#startDay').val();
		var endDay = $('#endDay').val();
		
		buyList(period, startDay, endDay);
		sumList(period, startDay, endDay);
		
		$('#jqGrid').jqGrid('navGrid',"#jqGridPager", {                
		    search: false, // show search button on the toolbar
		    add: false,
		    edit: false,
		    del: false,
		    refresh: true
		});
		
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
	//console.log(rowObject);
	return '確認'; 
};
 
function rebuy3 (cellvalue, options, rowObject) {
	//console.log(rowObject);
	return '返金'; 
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
 			},
 			{
 				label : '購買日付',
 				name : 'deadline',
 				width:'200',
 				align:'center'
 			}, {
 				label : '品種',
 				name : 'fishName',
 				align:'center'
 			}, {
 				label : '産地',
 				name : 'location',
 				align:'center'
 			}, {
 				label : '重量',
 				name : 'weight',
 				align:'center'
 			}, {
 				label : '価格',
 				name : 'price',
 				align:'center'
 			}, {
 				label : '販売者ID',
 				name : 'successSellerId',
 				align:'center'
 			}, {
 				label : '再購入1',
 				name : '再購入2',
 				formatter: rebuy,
 				align:'center'
 			},{
 				label : '受け取り確認',
 				name : '確認',
 				formatter: rebuy2,
 				align:'center'
 			},
 			{
 				label : '返金',
 				name : '払い戻し',
 				width : 100,
 				height : 200,
 				formatter: rebuy3,
 				align:'center'
 			},

 		],
 		viewrecords : true,
 		rowNum : 10,
 		rowList:[10,20,30],
 		height:400,
 		pager : "#jqGridPager",
 		loadonce: true,
 		shrinkToFit : false,
 		footerrow:true,
 		userDataOnFooter : true,
 		loadComplete:function(data)
 		{
 			

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
 			
 			var moneySum = $("#jqGrid").jqGrid('getCol','price', false, 'sum'); 
 			$('#jqGrid').jqGrid('footerData', 'set', { deadline:'합계', price:moneySum });
 			
 			/*var widthSum = $('#grid tr:first td:eq(0)').width(); 
 			widthSum += $('#grid tr:first td:eq(1)').width();
 			widthSum += $('#grid tr:first td:eq(2)').width();
 			widthSum += $('#grid tr:first td:eq(3)').width();
 			*/
 			
 			$('table.ui-jqgrid-ftable td:eq(2)').hide(); 
 			$('table.ui-jqgrid-ftable td:eq(3)').hide();
 			$('table.ui-jqgrid-ftable td:eq(4)').hide();
 			$('table.ui-jqgrid-ftable td:eq(6)').hide();
 			$('table.ui-jqgrid-ftable td:eq(7)').hide();
 			$('table.ui-jqgrid-ftable td:eq(8)').hide();
 			
 			
 			var footer = $("table.ui-jqgrid-ftable tr:first td:eq(0)");	
 			footer.css("color", "#2e6e9e"); 
 			//footer.css("text-align", "left");
 			//footer.css("width", widthSum); 
 			
 			$('table.ui-jqgrid-ftable tr:first').children("td").css("background-color", "#dfeffc");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1)').css("width","13px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(5)').css("text-align", "right");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1), table.ui-jqgrid-ftable tr:first td:eq(5)').css("padding-bottom","8px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1), table.ui-jqgrid-ftable tr:first td:eq(5)').css("padding-top","8px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(5)').append(" \u00A0");

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
     		if(cm[index].name == "再購入2")
     		{	
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
	//수취확인
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
	$( "#jqGrid").jqGrid().setGridParam({url:'jqgrid_R',datatype:'json'}).trigger('reloadGrid');
}

//날짜지정해서 구매내역검사
function searchByDate() {
	var startDay = $('#startDay').val();
	var endDay = $('#endDay').val();
	location.href="buyListHistory?startDay="+startDay+"&endDay="+endDay;
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
 				label : '品種',
 				name : 'fishName',
 				align:'center'
 			}, {
 				label : '価格',
 				name : 'price',
 				align:'center'
 			},

 		],
 		viewrecords : true,
 		rowNum : 10,
 		rowList:[10,20,30],
 		height:400,
 		pager : "#jqGridPager",
 		loadonce: true,
 		shrinkToFit : false,
 		footerrow:true,
 		userDataOnFooter : true,
 		loadComplete:function(data)
 		{
 	

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
 			
 			var moneySum = $("#jqGrid").jqGrid('getCol','price', false, 'sum'); 
 			$('#jqGrid').jqGrid('footerData', 'set', { deadline:'합계', price:moneySum });
 			
 			
 			$('table.ui-jqgrid-ftable td:eq(2)').hide(); 
 			$('table.ui-jqgrid-ftable td:eq(3)').hide();
 			$('table.ui-jqgrid-ftable td:eq(4)').hide();
 			$('table.ui-jqgrid-ftable td:eq(6)').hide();
 			$('table.ui-jqgrid-ftable td:eq(7)').hide();
 			$('table.ui-jqgrid-ftable td:eq(8)').hide();
 			
 			
 			var footer = $("table.ui-jqgrid-ftable tr:first td:eq(0)");	
 			footer.css("color", "#2e6e9e"); 
 			//footer.css("text-align", "left");
 			//footer.css("width", widthSum); 
 			
 			$('table.ui-jqgrid-ftable tr:first').children("td").css("background-color", "#dfeffc");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1)').css("width","13px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(5)').css("text-align", "right");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1), table.ui-jqgrid-ftable tr:first td:eq(5)').css("padding-bottom","8px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(1), table.ui-jqgrid-ftable tr:first td:eq(5)').css("padding-top","8px");
 			$('table.ui-jqgrid-ftable tr:first td:eq(5)').append(" \u00A0");

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
     		/*if(cm[index].name == "再購入2")
     		{	
        		 	//console.log(jQuery("#jqGrid").getRowData(rowid));
     		}*/
     		
     	},
     	
 	});
 };			


