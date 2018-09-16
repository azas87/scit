

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
				height : 200,
				align:'center'
			}, {
				label : '件名',
				name : 'title',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '作成者',
				name : 'id',
				height : 200,
				align:'center'
			}, {
				label : '登録日付',
				name : 'writeBoardDate',
				height : 200,
				align:'center'
			}, 
			 {
				label : '閲覧数',
				name : 'hitcount',
				height : 200,
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
    		
    	},   
	});
}


