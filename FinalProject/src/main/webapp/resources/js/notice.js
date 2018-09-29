

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

function writeNoticeForm() {
	$('#f_main', parent.document).attr('height', '820px');
	$('#f_main', parent.document).attr('src', 'writeNoticeForm?');
}


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
				height : 200,
				align:'center'
			}, {
				label : '件名',
				name : 'title',
				width : 80,
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
		/*pager : "#jqGridPager",*/
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['noticeNum'],
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
        		var obj = $("#jqGridBoard").getRowData(rowid);
        		location.href="noticeDetail?noticeNum="+obj.noticeNum;

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


