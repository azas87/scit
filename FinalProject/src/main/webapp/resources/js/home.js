$(document).ready(function() {
	 homeList('allBuyList');
});

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function homeList(url2) {
	$("#jqGrid").jqGrid({
		url : url2,
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
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
    	},
    	
	});
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

$(document).ready(function()
{
	printClock();
	
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
    
}); 

function rebuy (cellvalue, options, rowObject) {
 //console.log(rowObject);
   return '<a href="#">再購入</a>'; 
};
	 
	 
 $("#search").on("click",function(){
	 var data = $("#searchData").val()
	 var searchType = $("#searchType").val();
	 var rows = $("[title ='Records per Page']").val();
	 var postData  = {'data' : data , 'searchType' : searchType, 'rows' :  rows }
	
	 rowData = null
	
	 $("#jqGrid").jqGrid("clearGridData", true);
	
	 $("#jqGrid").setGridParam({
		 datatype	: "json",
		 postData	: postData,
		 loadComplete	: function(data) {
			 console.log(data);
		 }
	 }).trigger("reloadGrid");
});
	

function allBuyList() {	
	$("#jqGrid").jqGrid().setGridParam({url:'allBuyList',datatype:'json'}).trigger('reloadGrid');
}

function myBuyList() {		
	$("#jqGrid").jqGrid().setGridParam({url:'myBuyList',datatype:'json'}).trigger('reloadGrid');
}

