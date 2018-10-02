$(document).ready(function() {

	getQnaTable();
});

function getQnaTable() {
	
	$("#jqGridBoard").jqGrid({
		url : "getQnaList",
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '番号',
				name : 'qnaNum',
				width : 70,
				align:'center'
			}, {
				label : '件名',
				name : 'title',
				width : 450,
				align:'center'
			}, {
				label : '作成者',
				name : 'id',
				width : 150,
				align:'center'
			}, {
				label : '登録日付',
				name : 'writeBoardDate',
				align:'center'
			}, 
			 {
				label : '閲覧数',
				name : 'hitcount',
				width : 70,
				align:'center'
			}, 
			 {
				label : '状態',
				name : 'content',
				width : 100,
				align:'center'
			},
		],
		viewrecords : true,
		width : 1200,
		height : 400,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['qnaNum'],
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
        	if(cm[index].name == "title")
        	{
        		console.log(rowid);
        		var obj = $("#jqGridBoard").getRowData(rowid);
        		console.log(JSON.stringify(obj));
           		$('#f_main', parent.document).attr('height', '1050px');
        		location.href="boardDetail?qnaNum="+obj.qnaNum;

        	}
    		
    	},   
	});
}

