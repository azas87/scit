$(document).ready(function() {

	$('#jqGridBoard').jqGrid('navGrid',"#jqGridPager", {                
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
			$("#jqGridBoard").jqGrid('filterInput', self.value);
		},0);
	});
	
	$('#jqGridPager_left').css('display','none');
	$('#jqGridPager_center').css('width','570px');
	$('#jqGridPager_right').css('padding-right','26px');
	
	
	$('#input_jqGridPager').css('width','310px');
	$('#input_jqGridPager').css('font-size','1.5em');	
	
});

function writeBoardForm(action) {
	$('#f_main', parent.document).attr('height', '820px');
	$('#f_main', parent.document).attr('src', action);
}