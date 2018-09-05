<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<style>

.tooltip
{
	display:none;
	position:absolute;
	border:1px solid #333;
	background-color:#161616;
	border-radius:5px;
	padding:10px;
	color:#fff;
	font-size:3.5em;
	text-align: center;
	z-index: 1000;
}

#contain
{
	width:1000px;
	margin: 0 auto;
	overflow: hidden;
}

#header
{
	width:1000px;

	line-height:100px;

	color:#666;
	font-size:100px;
	text-align:center;
}

#nav
{
	width:780px;
	height:200px;
}
.items 
{
	display: flex;
	flex-direction: row;
	height:150px;
	line-height:150px;
	width:200px;
}

.item{
	margin:0px;
	text-align: left;
	display: flex;
	border:1px solid #cccccc;
	text-align: center;
}

.itemSub
{
	list-style: none;
	margin:0px;
	text-align: left;
	border:1px solid #cccccc;
	margin: 1px;
	text-align: center;
	font-size:1.5em;
	width:200px;
}



</style>
<head>
	<title>Home</title>



<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

<script type="text/javascript" src="./resources/js/buyListHistory.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.js"></script>


 <!-- The jQuery library is a prerequisite for all jqSuite products -->
 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <!-- This is the Javascript file of jqGrid -->   


 <!-- This is the localization file of the grid controlling messages, labels, etc.
 <!-- We support more than 40 localizations -->
 <script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>
 
 <script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>


<script type='text/javascript'>
	$(document).ready(function() {
		
		

	google.charts.load('current', {'packages' : [ 'annotationchart' ]});
	google.charts.setOnLoadCallback(drawChart);

	});
	
	function drawChart() 
	{
		var data = new google.visualization.DataTable();
		data.addColumn('date', 'Date');
		data.addColumn('number', 'Kepler-22b mission');
		data.addColumn('string', 'Kepler title');
		data.addColumn('string', 'Kepler text');
		data.addColumn('number', 'Gliese 163 mission');
		data.addColumn('string', 'Gliese title');
		data.addColumn('string', 'Gliese text');
		data.addRows([
				[ new Date(2314, 2, 15), 12400, undefined, undefined, 10645,
						undefined, undefined ],
				[ new Date(2314, 2, 16), 24045, 'Lalibertines',
						'First encounter', 12374, undefined, undefined ],
				[ new Date(2314, 2, 17), 35022, 'Lalibertines',
						'They are very tall', 15766, 'Gallantors',
						'First Encounter' ],
				[ new Date(2314, 2, 18), 12284, 'Lalibertines',
						'Attack on our crew!', 34334, 'Gallantors',
						'Statement of shared principles' ],
				[ new Date(2314, 2, 19), 8476, 'Lalibertines',
						'Heavy casualties', 66467, 'Gallantors',
						'Mysteries revealed' ],
				[ new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost',
						79463, 'Gallantors', 'Omniscience achieved' ] ]);

		var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));
		var options = {	displayAnnotations : true };
		chart.draw(data, options);
	}
</script>

<body>
<div id="contain">
	<div id="header">
		<div id="chart_div"></div>
	</div>
	
	<div><br></div>
	
	<input id="search_cells" type="search"/>
	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>
	
	<div><br></div>
	
	<div style = "margin-top : 20px; margin-left : 15px; font-size : 12px;">
    <select class = "form-control" style = "width : 10%; float : left;" id = "searchType">
        <option value = "All" selected>전체 검색</option>
        <option value = "user_status">회원상태</option>
      	<option value = "user_sex">성별</option>
        <option value = "user_name">이름</option>
        <option value = "user_email">이메일</option>
    </select>
    <input type ="text" id = "searchData" class ="form-control" style = "width : 30%; float : left; margin-bottom : 50px; margin-left : 10px;">
    <button class = "btn btn-info btn-fill" id = "search" value = "검색 " style = "width : 10%; float : left; margin-left : 10px;">
      검색
    </button>
</div>

	<script type="text/javascript">
	$(document).ready(
			function() {
				$(document).ready(function() {
					$("#jqGrid").jqGrid({
						url : 'jqgrid_R',
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
					})
					
					
					
				});
	
	
	</script>
</body>
</html>
