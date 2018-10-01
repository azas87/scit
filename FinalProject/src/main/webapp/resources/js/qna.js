

$(document).ready(function() {

	getQnaTable();
	
	$('#jqGridBoard').jqGrid('navGrid',"#jqGridPager", {                
	       search: false, // show search button on the toolbar
	       add: false,
	       edit: false,
	       del: false,
	       refresh: true
	   });
});

function writeBoardForm() {
	$('#f_main', parent.document).attr('height', '820px');
	$('#f_main', parent.document).attr('src', 'writeBoardForm?');
}
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

function helper()
{
	userMode = $('#userMode').val();
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
