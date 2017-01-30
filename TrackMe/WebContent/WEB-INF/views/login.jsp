<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
	<title>Login form</title>

	<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="html/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="html/css/styles.css" />
	   <link href="html/css/custom.css" rel="stylesheet">
	<style>
@CHARSET "UTF-8";

* {
	-webkit-box-sizing: border-box;
	   -moz-box-sizing: border-box;
	        box-sizing: border-box;
	outline: none;
}
body {
	background: url(html/images/bg.jpg) no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
	
.login-form {
	text-align: center;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 200px;
	max-width: 480px;
}
	.login-form > section {
		background: rgba(255,255,255,.9);
		padding:  15px 15px 15px 15px;
		height: 332px;
		width: 420px;
		
	}
	.login-form a {
		color: #054185;
	}
	.login-form img {
		display: block;
		margin: 0 auto;
		margin-bottom:4px;
	}

form[role=login] {
	font: 13px/2.2em Lato, serif;
	color: #999;
}	
	form[role=login] input,
	form[role=login] > button {
		font-size: 15px;
	}
	form[role=login] input {
	
	width: 100%;
font-size: 20px;
border: 0;
padding: 0;
background-color: transparent;
height: 28px;
line-height: 2rem;
border-bottom: 1px solid #eee;
color: #777;
transition: all .2s ease-in;
border-bottom: 1px solid #B2B3B4;


		
	}
	
	.field {
    position: relative;
    margin-bottom: 2em;
}

.input:focus {
    outline: 0;
    border-color: #ccc;
}
	


	form[role=login] > div {
		margin: 15px 0;
	}
	form[role=login] > div button {
		font-weight: bold;
		font-size: 16px;
		line-height: 1.25em !important;
		border: 1px solid #c1c1c1;
		background: #efefef; /* Old browsers */
		background: -moz-linear-gradient(top,  #efefef 0%, #d1d1d1 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#efefef), color-stop(100%,#d1d1d1)); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  #efefef 0%,#d1d1d1 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  #efefef 0%,#d1d1d1 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  #efefef 0%,#d1d1d1 100%); /* IE10+ */
		background: linear-gradient(to bottom,  #efefef 0%,#d1d1d1 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#efefef', endColorstr='#d1d1d1',GradientType=0 ); /* IE6-9 */
	}
	form[role=login] > button {
		padding: 5px 40px;	
		margin-top: 15px;
			
		background: #054185;
	}
	
	.remember_me_align
	{
	margin-right: 71% !important;
	margin-top: 0px !important;
	}
	
	#msgTxt{
	color:#b30000;
	}

</style>
	

</head>
<body>
	<c:url var="loginUrl" value="/j_spring_security_check"></c:url>
  
	<section class="container login-form">
		<section>
			<form method="post" action="${loginUrl}" role="login">
				<img src="html/images/adhata.png" style="height:90px;" alt="" class="img-responsive" />
				<c:if test="${not empty message}">
                <div id="msgTxt" style="margin-top: 2px;margin-bottom: 2px;">* ${message} </div>
                 </c:if>	
				<div class=" field">
					<input type="text" name="username" required class="" placeholder="Username" />
					
				</div>
			
				<div class=" field">
					<input type="password" name="password" required 	 placeholder="Password" />
					<a style="padding-left:60%;" href="#">Trouble logging in?</a>
					
					
				</div>
		
				<button type="submit" name="go"  style="background-color:#2196F5" class="btn btn-primary btn-block">Login</button>
				
						<lbel style="padding-right:50px;margin-bottom: 20px;">By Logging in your agree to our <a href="#">T&C</a> and <a href="#">privacy policy</a></label>
					
			</form>
				
		</section>
	</section>
	 <jsp:directive.include file="footer.jsp" />
<script type="text/javascript" src="html/js/jquery-1.12.4.js"></script>
	<script src="html/js/bootstrap.min.js"></script>
	
	<script>
	<!--
	$( document ).ready(function() {
	    $('#tooltip').tooltip();
	});
	-->
	</script>

</body>
</html>


