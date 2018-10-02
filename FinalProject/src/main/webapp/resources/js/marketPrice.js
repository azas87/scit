

$(document).ready(function() {
	getMarketPrice();	
});


function getMarketPrice() {
	
	$("#jqGridBoard").jqGrid({
		url : "getMarketPrice",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '魚種',
				name : 'fishName',
				height : 200,
				align:'center'
			}, {
				label : '市価',
				name : 'avgPrice',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '日付',
				name : 'dates',
				height : 200,
				align:'center'
			},
		],
		viewrecords : true,
		width : 900,
		height : 510,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
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
        	
    	},   
	});
}

