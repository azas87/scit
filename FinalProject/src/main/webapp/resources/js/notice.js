$(document).ready(function() {
	getQnaTable();
});


function getQnaTable() {
	
	$("#jqGridBoard").jqGrid({
		url : "getNoticeList",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '番号',
				name : 'noticeNum',
				width : 70,
				align:'center'
			}, {
				label : '件名',
				name : 'title',
				width : 450,
				align:'center'
			}, {
				label : '登録日付',
				name : 'writeBoardDate',
				width : 150,
				align:'center'
			}, 
			 {
				label : '閲覧数',
				name : 'hitcount',
				width : 100,
				align:'center'
			}, 
		],
		viewrecords : true,
		width : 900,
		height : 400,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['noticeNum'],
		    groupColumnShow : [false],
		},
		loadComplete:function(data)
		{
			console.log("getNoticeList loadComplete");
			helper();
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    	
        	var cm = $(this).jqGrid('getGridParam','colModel');    
        	if(cm[index].name == "title")
        	{
        		var obj = $("#jqGridBoard").getRowData(rowid);
        		location.href="noticeDetail?noticeNum="+obj.noticeNum;

        	}
    	},   
	});
}