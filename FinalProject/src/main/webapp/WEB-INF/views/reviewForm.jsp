<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<style type="text/css">
    #star ul.star { LIST-STYLE: none; MARGIN: 0; PADDING: 0; WIDTH: 85px; HEIGHT: 20px; LEFT: 10px; TOP: -5px; POSITION: relative; FLOAT: left; BACKGROUND: url('stars.gif') repeat-x; CURSOR: pointer; }
    #star li { PADDING: 0; MARGIN: 0; FLOAT: left; DISPLAY: block; WIDTH: 85px; HEIGHT: 20px; TEXT-DECORATION: none; text-indent: -9000px; Z-INDEX: 20; POSITION: absolute; PADDING: 0; }
    #star li.curr { BACKGROUND: url('./resources/images/stars.gif') left 25px; FONT-SIZE: 1px; }
    #star div.user { LEFT: 15px; POSITION: relative; FLOAT: left; FONT-SIZE: 13px; FONT-FAMILY: Arial; COLOR: #888; }
</style>
<script type="text/javascript">

/* AJAX Star Rating : v1.0.3 : 2008/05/06 */
/* http://www.nofunc.com/AJAX_Star_Rating/ */

    function $(v,o) { return((typeof(o)=='object'?o:document).getElementById(v)); }
    function $S(o) { return((typeof(o)=='object'?o:$(o)).style); }
    function agent(v) { return(Math.max(navigator.userAgent.toLowerCase().indexOf(v),0)); }
    function abPos(o) { var o=(typeof(o)=='object'?o:$(o)), z={X:0,Y:0}; while(o!=null) { z.X+=o.offsetLeft; z.Y+=o.offsetTop; o=o.offsetParent; }; return(z); }
    function XY(e,v) { var o=agent('msie')?{'X':event.clientX+document.body.scrollLeft,'Y':event.clientY+document.body.scrollTop}:{'X':e.pageX,'Y':e.pageY}; return(v?o[v]:o); }

    star={};

    star.mouse = function(e, o) {
        if (star.stop || isNaN(star.stop)) { 
            star.stop=0;
            document.onmousemove = function(e) { 
    	        var n = star.num;
    	        var p = abPos($('star'+n)), x=XY(e), oX=x.X-p.X, oY=x.Y-p.Y; star.num=o.id.substr(4);
    	        if (oX < 1 || oX > 84 || oY < 0 || oY > 19) {
    	            star.stop = 1; star.revert(); 
    		    } else {
			        $S('starCur'+n).width=oX+'px';
			        $S('starUser'+n).color='#111';
			        $('starUser'+n).innerHTML = Math.round(oX/84*100)+'%';
		        }
	        };
	    } 
    };

    //onmousedown
    star.update = function(e, o) {
        var n = star.num;                                                                      // n = star's number
        var v = parseInt($('starUser' + n).innerHTML);                               // v = value

        n = o.id.substr(4);                                                                    // ex) star4 -> 4
        $('starCur' + n).title = v;                                                            // change stars title

        //req=new XMLHttpRequest();
        //req.open('GET','/AJAX_Star_Vote.php?vote='+(v/100),false); 
        //req.send(null);
    };

    //onmousemove
    star.revert = function() {
        var n = star.num;                                                                      // n = star's number
        var v = parseInt($('starCur' + n).title);                                          // pixed value

        $S('starCur' + n).width = Math.round(v * 84 / 100) + 'px';               // change star's width 
        $('starUser' + n).innerHTML = (v > 0 ? Math.round(v) + '%' : '');      // change text value
        $('starUser' + n).style.color = '#888';                                          // change text color

        document.onmousemove = '';
    };

    star.num=0;

</script>
</head>
<body>
    <div id="star">
        <ul id="star3" class="star" onmousedown="star.update(event,this)" onmousemove="star.mouse(event,this)" title="Rate This!">
            <li id="starCur3" class="curr" title="70" style="width: 59px;"></li>
        </ul>
        <div style="color: rgb(136, 136, 136);" id="starUser3" class="user">70%</div>

        <br style="clear: both;">    

        <ul id="star4" class="star" onmousedown="star.update(event,this)" onmousemove="star.mouse(event,this)" title="Rate This!">
            <li id="starCur4" class="curr" title="30" style="width: 25px;"></li>
        </ul>
        <div style="color: rgb(136, 136, 136);" id="starUser4" class="user">30%</div>
    </div>
</body>
</html>
