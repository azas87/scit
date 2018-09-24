<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/materialize.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

<!-- 로그인 폼이랑 슬라이드 높이가 높이 -->

  <style media="screen">
    * {
      margin: 0;
      padding: 0;
    }


    .tooltip {
      display: none;
      position: absolute;
      border: 1px solid #333;
      background-color: #161616;
      border-radius: 5px;
      padding: 10px;
      color: #fff;
      font-size: 3.5em Arial;
    }

    .slide {
      width: 1200px;
      height: 600px;
      overflow: hidden;
      position: relative;
      margin: 0 auto;
    }

    .slide ul {
      width: 5000px;
      position: absolute;
      top: 0;
      left: 0;
    }

    .slide ul li {
      display: inline-block;
      width: 1200px;
      height:650px;

    }

    #back {
      position: absolute;
      top: 250px;
      left: 0;
      cursor: pointer;
      z-index: 1;
      font-size:8rem;
    }

    #next {
      position: absolute;
      top: 250px;
      right: 0;
      cursor: pointer;
      z-index: 1;
      font-size:8rem;
    }
    
    
    /**/
    
    .input_size
    {
    	width:640px !important;
    	height:50px !important;
    	padding-top:40px !important;
    	font-size:3em !important;
    }
    
    body{
    
    display: table-cell;
    vertical-align: middle;
    //background-color: #e0f2f1 !important; 
    background:url(./resources/img/bg.png) repeat;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
	font-weight:300;
	text-align: left;
	text-decoration: none;
}

html {
    display: table;
    margin: auto;
}

html, body {
    height: 100%;
}

.medium-small {
    font-size: 1.6rem;
    margin: 0;
    padding: 0;
}

.login-form {
    width: 780px;
    height:600px;
    
}

.login-form-text {
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 1.5rem;
}

.login-text {
    margin-top: -6px;
    margin-left: -6px !important;
}

.margin {
    margin: 0 !important;
}

.pointer-events {
    pointer-events: auto !important;
}

.input-field >.material-icons  {
    padding-top:10px;
}

.input-field div.error{
    position: relative;
    top: -1rem;
    left: 3rem;
    font-size: 0.8rem;
    color:#FF4081;
    -webkit-transform: translateY(0%);
    -ms-transform: translateY(0%);
    -o-transform: translateY(0%);
    transform: translateY(0%);
}

#submit_btn
{
	height:80px;
	font-size:3em;
}




	
.breadcrumb-counter-nav {
  margin: 0 auto;
  margin-bottom:10px;
  padding: 0;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  width: 800px;
  list-style: none;
  background: #2C3E50;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item {
  position: relative;
  -webkit-flex: 1 0 auto;
      -ms-flex: 1 0 auto;
          flex: 1 0 auto;
  padding: 1rem 2rem;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item:hover {
  background: #1a252f;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item::before {
  counter-increment: section;
  content: counter(section);
  position: relative;
  background: #507192;
  color: #fff;
  right: 0.8rem;
  border-radius: 50%;
  padding: 0.2em 0.55em;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item.current {
  background: #1a252f;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item.current::after {
  content: '';
  position: absolute;
  top: 0;
  right: -1rem;
  width: 0;
  height: 0;
  border-top: 1.75rem solid transparent;
  border-bottom: 1.75rem solid transparent;
  border-left: 1rem solid #1a252f;
  z-index: 300;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item.current::before {
  background-color: #88a4bf;
}

.breadcrumb-counter-nav .breadcrumb-counter-nav-item a {
  color: #fff;
  font-size: 0.875rem;
}

@media only screen and (max-width: 52em) {
  .breadcrumb-counter-nav {
    -webkit-flex-direction: column;
        -ms-flex-direction: column;
            flex-direction: column;
  }
}



    
  </style>
  <script>

    
  
  
  
  </script>
</head>

<body>
<!-- <ul class="breadcrumb-counter-nav">
  <li class="breadcrumb-counter-nav-item"><a href="#">Setup</a></li>
  <li class="breadcrumb-counter-nav-item current"><a href="#">Sample Analysis</a></li>
  <li class="breadcrumb-counter-nav-item"><a href="#">Sort Layout</a></li>
</ul> -->


  <div class="slide" style="border:0">
    <i id="back" class="material-icons prefix" >arrow_back</i>
    <ul>
      <li>
      	<div class="join_body" style="width:800px; margin:0 auto;">
        <div id="login-page" class="row">
		  <div class="col s12 z-depth-4 card-panel">
		    <form class="login-form">
		      <div class="row">
		        <div class="input-field col s12 center">
			          <h2>Register</h2>
			          <p class="center">Join to our community now !</p>
			        </div>
			    </div>
			
			      <div class="row margin">
			        <div class="input-field col s12">
			          <!-- <i class="mdi-social-person-outline prefix"></i> -->
			          <i class="material-icons prefix">account_box</i>
			          <input id="usernid" name="userid" class="input_size" type="text"/>
			          <label for="usernid">UserId</label>
			        </div>
			      </div>
			
			      <div class="row margin">
			        <div class="input-field col s12">
			          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
			          <i class="material-icons prefix">vpn_key</i>
			          <input id="password" name="password" class="input_size" type="password" />
			          <label for="password">Password</label>
			        </div>
			      </div>
			
			      <div class="row margin">
			        <div class="input-field col s12">
			          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
			          <i class="material-icons prefix">vpn_key</i>
			          <input id="password_a" name="cpassword" class="input_size" type="password" />
			          <label for="password_a">Password again</label>
			        </div>
			      </div>
			      
			    </form>
			  </div>
			</div>
		</div>
      </li>
       <li>
      	<div style="width:800px; margin:0 auto;">
        <div id="login-page" class="row">
		  <div class="col s12 z-depth-4 card-panel">
		    <form class="login-form">
		      <div class="row">
		        <!-- <div class="input-field col s12 center">
			          <h2>Register</h2>
			          <p class="center">Join to our community now !</p>
			        </div>
			    </div> -->
			
			      <div class="row margin">
			        <div class="input-field col s12">
			          <!-- <i class="mdi-social-person-outline prefix"></i> -->
			          <i class="material-icons prefix">account_circle</i>
			          <input id="username" name="username" class="input_size" type="text"/>
			          <label for="username">Username</label>
			        </div>
			      </div>
			
			      <div class="row margin">
			        <div class="input-field col s12">
			          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
			          <i class="material-icons prefix">assignment_ind</i>
			          <input id="name_kana" name="name_kana" class="input_size" type="password" />
			          <label for="name_kana">name_kana</label>
			        </div>
			      </div>
			
			      <div class="row margin">
			        <div class="input-field col s12">
			          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
			          <i class="material-icons prefix">account_balance</i>
			          <input id="address" name="address" class="input_size" type="text" />
			          <label for="address">address</label>
			        </div>
			      </div>
			      <div class="input-field col s12">
			          <button type="submit" id="submit_btn" class="btn waves-effect waves-light col s12" >REGISTER NOW</button>
		        </div>
			    </form>
			  </div>
			</div>
		</div>
      </li>
		</ul>
	          <i id="next" class="material-icons prefix" style="">arrow_forward</i>
        </div>       
    
</body>

<script type="text/javascript">
  $(document).ready(function() {
    var imgs;
    var img_count;
    var img_position = 1;

    imgs = $(".slide ul");
    img_count = imgs.children().length;

    //버튼을 클릭했을 때 함수 실행
    $('#back').click(function() {
      back();
    });
    $('#next').click(function() {
      next();
    });

    function back() {
      if (1 < img_position) {
        imgs.animate({
          left: '+=1200px'
        });
        img_position--;
      }
    }

    function next() {
      if (img_count > img_position) {
        imgs.animate({
          left: '-=1200px'
        });
        img_position++;
      }
    }
    
    $('.breadcrumb-counter-nav-item').click(function () {
  	  $('.breadcrumb-counter-nav-item').removeClass('current');
  	  $(this).addClass('current');
  	});
    
   /*  $(".login-form").validate({
  	  rules: {
  	    username: {
  	      required: true,
  	      minlength: 4
  	    },     
  	    email: {
  	      required: true,
  	      email:true
  	    },
  	    password: {
  	      required: true,
  	      minlength: 5
  	    },
  	    cpassword: {
  	      required: true,
  	      minlength: 5,
  	      equalTo: "#password"
  	    }
  	  },
  	  //For custom messages
  	  messages: {
  	    username:{
  	      required: "Enter a username",
  	      minlength: "Enter at least 4 characters"
  	    }
  	  },
  	  errorElement : 'div',
  	  errorPlacement: function(error, element) {
  	    var placement = $(element).data('error');
  	    if (placement) {
  	      $(placement).append(error)
  	    } else {
  	      error.insertAfter(element);
  	    }
  	  }
  	}); */

  });
 
</script>


</body>

</html>
