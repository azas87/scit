

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

function writeFaqForm() {
	location.href="writeFaqForm?";
}


function getQnaTable() {
	
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
		height : 400,
		rowNum : 10,
		rowList:[10,20,30],
		/*pager : "#jqGridPager",*/
		loadonce: true,
		grouping: false,
		groupingView: {
		    groupField: ['FAQNum'],
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


