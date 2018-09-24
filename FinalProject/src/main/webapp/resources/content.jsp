
<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>

<div class="popdown-content">
<input type="hidden" id="userMode" value="${sessionScope.userMode}">
	<header>
		<h2>신규 글 알림</h2>


	</header>
	
	<section class="body">
		<table id="jqGrid_pop"></table>			
		<div id="jqGridPager_pop" style="height: 50px;"></div>
	</section>
	
	<footer>
		<button class="close-popdown">Close</button>
	</footer>
	
	<script>
	$(document).ready(function() {
		console.log("132");
		//jqGridmyBuyList();
		if($('#userMode').val() == 1)
		{
			myList_ing_buyer_pop();
		}
		else
		{
			sellerWishList_pop();
		}
	});
	
	//구매자 진행중인 리스트
	function myList_ing_buyer_pop() {
		console.log("myList_ing_buyer_pop");
		
		$.jgrid.gridUnload("#jqGrid_pop");
		$("#jqGrid_pop").jqGrid({
			url : "myList_ing_buyer",
			mtype : "GET",
			datatype : "json",
			colModel : 
			[ 
				{
	 				label : 'buyNum',
	 				name : 'buyNum',
	 				align:'center',
	 				hidden:true
	 			}, {
	 				label : 'saleStatus',
	 				name : 'saleStatus',
	 				align:'center',
	 				hidden:true
	 			}, {
					label : '購買日付',
					name : 'deadline',
					width : 250,
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
					width : 80,
					height : 200,
					align:'center'
				}, {
					label : '重量',
					name : 'weight',
					width : 60,
					height : 200,
					align:'center'
				}, {
					label : '価格',
					name : 'price',
					width : 80,
					height : 200,
					align:'center'
				}, {
					label : '販売者ID',//구매자,판매자:販売者
					name : 'successSellerId',
					width : 100,
					height : 200,
					cellattr:mouseCursor,
					align:'center'
				}, {
					label : '再購入1',
					name : '再購入2',
					width : 100,
					height : 200,
					formatter: rebuy,
					cellattr:mouseCursor,
					align:'center'
				}, {
					label : '販売者選択',
					name : 'sellerSelect',
					width : 100,
					height : 200,
					formatter: select,
					cellattr:mouseCursor,
					align:'center'
				}, 

			],
			viewrecords : true,
			
			//shrinkToFit:true,
			//altRows:true,
			width : 1100,
			height : 505,
			rowNum : 10,
			rowList:[10,20,30],
			pager : "#jqGridPager_pop",
			loadonce: true,
			grouping: true,
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
				
				$(".jqGrid_popghead_0").css('font-size','1.5em');
			},
			gridComplete: function(){
			},
			onCellSelect: function(rowid, index, contents, event) 
	    	{    
	    		var cm = $(this).jqGrid('getGridParam','colModel');    
	    		if(cm[index].name == "再購入2")
	    		{	var con = confirm('재구입하시겠습니까?');
	    				if(con==true){
	    					console.log(jQuery("#jqGrid").getRowData(rowid));
	           		 		location.href="writeBuyBoardForm";
	    				}else{
	    					return;
	    				}    			
	    		}else if(cm[index].name == "sellerSelect"){
	    			var con = confirm('정말 선택하시겠습니까?');
	    				if(con == true){
	    					console.log(jQuery("#jqGrid").getRowData(rowid));
	    					var obj = $("#jqGrid").getRowData(rowid);
	       		 			location.href="selectSeller?SellerId="+obj.successSellerId+"&buyNum="+obj.buyNum;    			
	    				}else{
	    					return;
	    				}
	    		}
	    	},   
		});
	}

	
	function sellerWishList_pop() {
		console.log("sellerWishList_pop");
		$.jgrid.gridUnload('#jqGrid_pop');
		$("#jqGrid_pop").jqGrid({
			url : "sellerWishList",
			mtype : "GET",
			datatype : "json",
			colModel : 
			[ 
				{
	 				label : 'buyNum',
	 				name : 'buyNum',
	 				align:'center',
	 				hidden:true
	 			}, {
	 				label : 'saleStatus',
	 				name : 'saleStatus',
	 				align:'center',
	 				hidden:true
	 			}, {
					label : '購買日付',
					name : 'deadline',
					width : 250,
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
					width : 80,
					height : 200,
					align:'center'
				}, {
					label : '重量',
					name : 'weight',
					width : 60,
					height : 200,
					align:'center'
				}, {
					label : '価格',
					name : 'price',
					width : 80,
					height : 200,
					align:'center'
				}, 
			],
			viewrecords : true,
			//altRows:true,
			width : 1100,
			height : 505,
			rowNum : 10,
			rowList:[10,20,30],
			pager : "#jqGridPager_pop",
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
		});
	}
	</script>
	
</div>