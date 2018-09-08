
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
					
 function buyList(period) 
 {
	 console.log(period);
 	$("#jqGrid").jqGrid({
 		/* 환불 url:'refundList'*/
 		url : 'jqgrid_R?period='+period,
 		mtype : "GET",
 		datatype : "json",
 		colModel : 
 		[ 
 			{
 				label : '히든',
 				name : 'buyNum',
 				width : 150,
 				height : 200,
 				align:'center',
 				hidden:true
 			},
 			{
 				label : '購買日付',
 				name : 'deadline',
 				width : 150,
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
 				width : 100,
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
 			},{
 				label : '受け取り確認',
 				name : '確認',
 				width : 100,
 				height : 200,
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
 		width : 950,
 		height : 400,
 		rowNum : 10,
 		rowList:[10,20,30],
 		pager : "#jqGridPager",
 		loadonce: true,
 		shrinkToFit : false,
 		
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
