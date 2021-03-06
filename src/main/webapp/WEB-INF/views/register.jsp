<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Baby Natural/Organic Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="<c:url value="/resources/assets/css/bootstrap.css"/>" rel="stylesheet"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Customize styles -->
    <link href="<c:url value="/resources/style.css"/>" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="<c:url value="/resources/assets/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	<!-- Favicons -->
    <link rel="shortcut icon" href="<c:url value="/resources/assets/ico/favicon.ico"/>">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script>
     $( function() {
       $( "#datepicker" ).datepicker();
     } );
   
      </script>
      <script>
      
      function Validate(qty)
      {
    	  var str = /^\d+$/;
    	  if(!qty.match(str)){
    		  alert("Please enter Product Quantity in numbers");
    		  //document.form.intProdQty.focus();
    		  return false;		  
    	  }
    	 
      }
   </script>
   
  </head>
<body>
<!--
	Upper Header Section
-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
				<!--
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
					-->
				</div>
				<a href="<c:url value="/"/>"> <span class="icon-home"></span> Home</a>
				<div class="dropdown">
				<a href="#"><span  class="icon-user" ></span> My Account</a>
				<div class="dropdown-content">
					<a href="<c:url value="/OrderHistory"/>">Order History</a>
					<a href="<c:url value="/Account"/>">Account Details</a>
				</div>
  				</div>
				<a class="active" href="#"><span class="icon-edit"></span> Free Register </a>
				<a href="<c:url value="/contact"/>"><span class="icon-envelope"></span> Contact us</a>
				<a href="<c:url value="/cart"/>"><span class="icon-shopping-cart"></span> ${sessionScope.CartCount} Item(s) - <span class="badge badge-warning"> $${sessionScope.Amount}</span></a>
			</div>
		</div>
	</div>
</div>

<!--
Lower Header Section
-->
<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="products.html"><span>Twitter Bootstrap ecommerce template</span>
		<img src="<c:url value="/resources/assets/img/logo-bootstrap-shoping-cart.png"/>" alt="bootstrap sexy shop">
	</a>
	</h1>
	</div>
	<div class="span4">
	<!--
	<div class="offerNoteWrapper">

	<h1 class="dotmark">
	<i class="icon-cut"></i>
	Twitter Bootstrap shopping cart HTML template is available @ $14
	</h1>

	</div>
	-->
	</div>
	<div class="span4 alignR">
	<!--
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<span class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span>
	<span class="btn btn-warning btn-mini">$</span>
	<span class="btn btn-mini">&pound;</span>
	<span class="btn btn-mini">&euro;</span>
	-->
	</div>
</div>
</header>

<!--
Navigation Bar Section
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
			<ul class="nav">
			  <li class=""><a href="<c:url value="/"/>">Home	</a></li>
			  <!--
			  <li class=""><a href="list-view.html">List View</a></li>
			  <li class=""><a href="grid-view.html">Grid View</a></li>
			  <li class=""><a href="three-col.html">Three Column</a></li>
			  <li class=""><a href="four-col.html">Four Column</a></li>
			  <li class=""><a href="general.html">General Content</a></li>
			  -->
			</ul>
			
			<c:set var="user"  value="${sessionScope.UserName}"/>
			<c:if test = "${empty user}">
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Login <b class="caret"></b></a>
				<div class="dropdown-menu">
				<form:form action="login" method="post" modelAttribute="User">
					 <div class="control-group">
					<form:input type="text" path="stremail" placeholder="Email" required="true" onblur = "return emailValidate(this.value)"/>
				  </div>
				  <div class="control-group">
					<form:input type="password" placeholder="Password"  path = "strPassword" required="true" onblur="return passValidate(this.value)"/>
				  </div>
				  <div class="control-group">
				  <!-- 
					<label class="checkbox">
					<input type="checkbox"> Remember me
					</label>
					-->
					<button type="submit" class="shopBtn btn-block">Sign in</button>
					
				  </div>
				  
				</form:form>
				</div>
			</li>
			</ul>
			</c:if>
			<c:if test = "${not empty user}">
			<ul class="nav pull-right">
			<li> <label class="control-label" style="padding-top:8px"><B> Hi ${sessionScope.UserName}!</B></label> </li>
			<li><a class="control-label" style="padding-top:8px" href="<c:url value="/signout"/>"><u>Sign Out</u></a> </li>
			</ul>
			</c:if>
		  </div>
		</div>
	  </div>
	</div>
<!--
Body Section
-->
	<div class="row">
<div id="sidebar" class="span3">
<div class="well well-small">
	<ul class="nav nav-list">
		<c:forEach items="${Category}" var="Category">
		<li><a href="<c:url value="/product/${Category.intCatgId}"/>"><span class="icon-chevron-right"></span><c:out value="${Category.strCategory}" /></a></li>
		</c:forEach>
		<!-- 
		<li><a href="products.html"><span class="icon-chevron-right"></span>Lotions/Creams</a></li>
		<li><a href="products.html"><span class="icon-chevron-right"></span>Body Wash & Shampoo</a></li>
		<li><a href="products.html"><span class="icon-chevron-right"></span>See All Products</a></li>
		-->
		<li style="border:0"> &nbsp;</li>
		<li> <a class="totalInCart" href="<c:url value="/cart"/>"><strong>Total Amount  <span class="badge badge-warning pull-right" style="line-height:18px;">$${sessionScope.Amount}</span></strong></a></li>
	</ul>
</div>
			<!--
			  <div class="well well-small alert alert-warning cntr">
				  <h2>50% Discount</h2>
				  <p>
					 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
				  </p>
			  </div>
			  -->
			  <div class="well well-small" ><a href="#"><img src="<c:url value="/resources/assets/img/paypal.jpg"/>" alt="payment method paypal"></a></div>
			<!--
			<a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="/resources/assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="/resources/assets/img/shopping-cart-template.png" alt="shopping cart template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="/resources/assets/img/bootstrap-template.png" alt="bootstrap template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
		  </ul>
-->
	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="<c:url value="/"/>">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
    </ul>
	<h3> Registration</h3>
	<hr class="soft"/>
	<div class="well">
	<form:form class="form-horizontal" name="register" action="Create" method="post" onSubmit = "return userValidate()"  modelAttribute="User">
		<h3>Your Personal Details</h3>
		
		<div class="control-group">
			<label class="control-label" for="inputFname">First name <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text" path="strFirstName" placeholder="First Name" required="true"/>
			  <form:hidden path="intUserId"/>
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLname">Last name <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text" path="strLastName" placeholder="Last Name" required="true" />
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="inputEmail">Email <sup>*</sup></label>
		<div class="controls">
		  <form:input type="text" path="stremail" placeholder="Email" required="true" onblur = "return emailValidate(this.value)"/>
		</div>
	  </div>
		<div class="control-group">
		<label class="control-label">Password <sup>*</sup></label>
		<div class="controls">
		  <form:input type="password" placeholder="Password"  path = "strPassword" required="true" onblur="return passValidate(this.value)"/>
		</div>
	  </div>
		<div class="control-group">
		<label class="control-label">Date of Birth <sup>*</sup></label>
		<div class="controls">
		
		<form:input path="strDOB"  id="datepicker" class="form-control input-md" required="true" type="text"></form:input>
		</div>
		
		  </div>
	  <!--
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Register" class="exclusive shopBtn">
		</div>
	</div>
	
	
</div>

<div class="well">
	 <form class="form-horizontal" > -->
		<h3>Your Billing Details</h3>
		<div class="control-group">
			<label class="control-label">Billing Address 1 <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text" path="objBilling.straddress1" placeholder=" Billing Address 1" required="true"/>
			  <form:hidden path="objBilling.intBillingId"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Billing Address 2 </label>
			<div class="controls">
			  <form:input type="text" path="objBilling.straddress2" placeholder=" Billing Address 2" />
			</div>
		</div>
		 <div class="control-group">
			<label class="control-label">City <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text" path="objBilling.strCity" placeholder=" City" required="true" />
			</div>
		</div>
		 <div class="control-group">
		<label class="control-label">State <sup>*</sup></label>
		<div class="controls">
		  <form:input type="text" path="objBilling.strState" placeholder=" State" required="true" />
		</div>
		</div>
		<div class="control-group">
		<label class="control-label">Zip Code <sup>*</sup></label>
		<div class="controls">
		  <form:input type="text" placeholder=" Zip Code" required="true" path="objBilling.strZipCode" />
		</div>
		</div>
		<!--
		<div class="control-group">
			<label class="control-label">Fiels label <sup>*</sup></label>
			<div class="controls">
			  <textarea></textarea>
			</div>
		</div>
		-->
		<!--
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Register" class="shopBtn exclusive">
		</div>
	</div>
	
	 
</div>


<div class="well"> 
	-->
		<h3>Your Account Details</h3>
		<div class="control-group">
			<label class="control-label">Card Number <sup>*</sup></label>
			<div class="controls">
			  <form:input path = "objPay.strCardNum" type="text" placeholder="Card Number" required="true" />
			  <form:hidden path="objPay.intPaymentId"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">CVV Code <sup>*</sup></label>
			<div class="controls">
			  <form:input path="objPay.intCvvCode" type="text" placeholder="CVV Code" required="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Expiry <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text" placeholder="MM/YR" path="objPay.strExpiryDate" required="true" />
			</div>
		</div>

	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="${label}" class="exclusive shopBtn">
		</div>
	</div>
</form:form>	
</div>


</div>
</div>
<!--
Clients

<section class="our_client">
	<hr class="soften"/>
	<h4 class="title cntr"><span class="text">Manufactures</span></h4>
	<hr class="soften"/>
	<div class="row">
		<div class="span2">
			<a href="#"><img alt="" src="/resources/assets/img/1.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="/resources/assets/img/2.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="/resources/assets/img/3.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="/resources/assets/img/4.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="/resources/assets/img/5.png"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="/resources/assets/img/6.png"></a>
		</div>
	</div>
</section>
-->
<!--
Footer

<footer class="footer">
<div class="row-fluid">
<div class="span2">
<h5>Your Account</h5>
<a href="#">YOUR ACCOUNT</a><br>
<a href="#">PERSONAL INFORMATION</a><br>
<a href="#">ADDRESSES</a><br>
<a href="#">DISCOUNT</a><br>
<a href="#">ORDER HISTORY</a><br>
 </div>
<div class="span2">
<h5>Iinformation</h5>
<a href="contact.html">CONTACT</a><br>
<a href="#">SITEMAP</a><br>
<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>
<div class="span2">
<h5>Our Offer</h5>
<a href="#">NEW PRODUCTS</a> <br>
<a href="#">TOP SELLERS</a><br>
<a href="#">SPECIALS</a><br>
<a href="#">MANUFACTURERS</a><br>
<a href="#">SUPPLIERS</a> <br/>
 </div>
 <div class="span6">
<h5>The standard chunk of Lorem</h5>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et
 Malorum" by Cicero are also reproduced in their exact original form,
accompanied by English versions from the 1914 translation by H. Rackham.
 </div>
 </div>
</footer>
</div><!-- /container -->

<div class="copyright">
<div class="container">
	<p class="pull-right">
		<a href="#"><img src="<c:url value="/resources/assets/img/maestro.png"/>" alt="payment"></a>
		<a href="#"><img src="<c:url value="/resources/assets/img/mc.png"/>" alt="payment"></a>
		<a href="#"><img src="<c:url value="/resources/assets/img/pp.png"/>" alt="payment"></a>
		<a href="#"><img src="<c:url value="/resources/assets/img/visa.png"/>" alt="payment"></a>

	</p>
	<span>Copyright &copy; 2017<br> Baby Natural/Organic Products</span>
</div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="<c:url value="/resources/assets/js/jquery.js"/>"></script> 
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/jquery.easing-1.3.min.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/jquery.scrollTo-1.4.3.1-min.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/shop.js"/>"></script>
    <script type="text/javascript">
    
    function userValidate()
    {
  	  if(document.register.Name.value == ""){
  		  alert("Please Enter UserName"); 
  		  document.Login.username.focus(); 
  		  return false;
  	  }
  	  else if(document.register.Address_Line_1.value == ""){
  		  alert("Please Enter Address Line 1"); 
  		  document.Login.Address_Line_1.focus(); 
  		  return false;
  	  }
  	  else if(document.register.City.value == ""){
  		  alert("Please Enter City"); 
  		  document.register.City.focus(); 
  		  return false;
  	  }
  	  else if(document.register.State.value == ""){
  		  alert("Please Enter State"); 
  		  document.register.State.focus(); 
  		  return false;
  	  }
  	  else if(document.register.Zipcode.value == ""){
  		  alert("Please Enter Zipcode"); 
  		  document.register.Zipcode.focus(); 
  		  return false;
  	  }
    }
    
     function passValidate(pass)
 {
	
	 

	 if (pass == ""){
		  alert("Please enter password"); 
		  document.Login.password.focus(); 
		  return false;
		  }
	  else if(pass != null){
		   
		  var str = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/;
		  if(pass.match(str)){
			 
			 return true;
	  		}
		  else {
			  alert("Password should have atleast one capital letter, one number and greater than 8 characters "); 
			  return false;
		  }
	 }
 }
     function emailValidate(email)
     {
      
     if (email == ""){
    	  alert("Please enter email"); 
    	  document.Login.email_address.focus(); 
    	  return false;
    	  }
      else if(email != null){
    	   
    	  var str = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
    	       
    	  if(email.match(str)){
    		 
    		 return true;
      		}
    	  else {
    		  alert("Enter valid email"); 
    		  return false;
    	  }
    		  
      }
        
    }
     
     	
     </script>
     <script>
  
   </script>
  </body>
</html>
