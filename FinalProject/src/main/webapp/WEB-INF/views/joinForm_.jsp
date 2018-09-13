<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

      <link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
      <link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

      <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
      
      <script type="text/javascript" src="./resources/js/i18n/grid.locale-ja.js"></script>
      <script type="text/javascript" src="./resources/js/jquery.jqgrid.min.js"></script>

      <meta charset="utf-8" />
      <title>jqGrid Example</title>
  </head>
<body>
  <table id="jqGrid"></table>
  <div id="jqGridPager"></div>
  

  <script type="text/javascript">
        $(document).ready(function () {
        	console.log($('.bigSize').attr('title'));
        	console.log($('.bigSize'));
        	$('.bigSize').hover(function(){
                // Hover over code
                console.log("test");
                var title = $(this).attr('title');
                $(this).data('tipText', title).removeAttr('title');
                $('<p class="tooltip"></p>')
                .text(title)
                .appendTo('body')
                .fadeIn('slow');
        }, function() {
                // Hover out code
                $(this).attr('title', $(this).data('tipText'));
                $('.tooltip').remove();
        }).mousemove(function(e) {
                var mousex = e.pageX + 20; //Get X coordinates
                var mousey = e.pageY + 10; //Get Y coordinates
                $('.tooltip').css({ top: mousey, left: mousex })
        });
            
            
            $(document).ready(function () {
                $("#jqGrid").jqGrid({
                    //url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
                	url: 'jqgrid_R',
                    mtype: "GET",
                    datatype: "json",
                    colModel: [
                        { label: 'fishName', name: 'fishName', width: 150 },
                        { label: 'buyer', name: 'buyerId', width: 80 },
                        { label: 'registDate', name: 'registDate', width: 150 },
                        { label:'uploadDate', name: 'uploadDate', width: 150 },
                        { label:'deadline', name: 'deadline', width: 150 },
                        { label:'weight', name: 'weight', width: 80 },
                        { label:'sale', name: 'saleStatus', width: 50 },
                        { label:'price', name: 'price', width: 80 },
                        { label:'Seller', name: 'successSellerId', width: 100 },
                        { label:'location', name: 'location', width: 100 }
                    ],
                    viewrecords: true,
                    height: 250,
                    rowNum: 10,
                    pager: "#jqGridPager"
                });
            });
            
           
        });
</script>


 
 <!--  <script type="text/javascript">
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                //url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
            	url: 'jqgrid_R',
                mtype: "GET",
                datatype: "json",
                colModel: [
                    { label: 'buyNum', name: 'buyNum', key: true, width: 75 },
                    { label: 'fishName ID', name: 'fishName', width: 150 },
                    { label: 'buyerId', name: 'buyerId', width: 150 },
                    { label: 'registDate', name: 'registDate', width: 150 },
                    { label:'uploadDate', name: 'uploadDate', width: 150 },
                    { label:'deadline', name: 'deadline', width: 150 },
                    { label:'weight', name: 'weight', width: 150 },
                    { label:'saleStatus', name: 'saleStatus', width: 150 },
                    { label:'price', name: 'price', width: 150 },
                    { label:'successSellerId', name: 'successSellerId', width: 150 },
                    { label:'location', name: 'location', width: 150 }
                ],
                viewrecords: true,
                height: 250,
                rowNum: 10,
                pager: "#jqGridPager"
            });
        });
         $.ajax({
        		method   : 'get',
        		url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
        		dataType : 'json',
        		success: function(resp) {
        			console.log(resp);
        		} 
        	});
            
            $.ajax({
        		method   : 'get',
        		url: 'jqgrid_R',
        		dataType : 'json',
        		success: function(resp) {
        			alert(resp.rows[0].fishName);
        		},
        		error:function(test)
        		{
        			console.log(test);	
        		}
        	});
</script> -->

<!-- $("#jqGrid").jqGrid({
                url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
                mtype: "GET",
                datatype: "jsonp",
                colModel: [
                    { label: 'OrderID1', name: 'OrderID', key: true, width: 75 },
                    { label: 'Customer ID', name: 'CustomerID', width: 150 },
                    { label: 'Order Date', name: 'OrderDate', width: 150 },
                    { label: 'Freight', name: 'Freight', width: 150 },
                ],
                viewrecords: true,
                height: 250,
                rowNum: 101,
                pager: "#jqGridPager"
            }); -->
</body>

</html>