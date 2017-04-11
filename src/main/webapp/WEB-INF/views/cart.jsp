<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
  <head>
 
    <meta charset="utf-8">
    <title>Baby Natural/Organic Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="<c:url value="/resources/assets/css/bootstrap.css"/>" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Customize styles -->
    <link href="<c:url value="/resources/style.css"/>" rel="stylesheet"/>
    <!-- font awesome styles -->
    <link href="<c:url value="/resources/assets/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="<c:url value="http://html5shim.googlecode.com/svn/trunk/html5.js"/>"></script>
		<![endif]-->

	<!-- Favicons -->
     <link rel="shortcut icon" href="<c:url value="resources/assets/ico/favicon.ico"/>">
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
				<a href="<c:url value="/register"/>"><span class="icon-edit"></span> Free Register </a>
				<a href="<c:url value="/contact"/>"><span class="icon-envelope"></span> Contact us</a>
				<a class="active" href="<c:url value="/cart"/>"><span class="icon-shopping-cart"></span> ${sessionScope.CartCount} Item(s) <!-- <span class="badge badge-warning"> ${sessionScope.Amount}</span>--></a>
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
	<a class="logo" href="<c:url value="/"/>"><span>Twitter Bootstrap ecommerce template</span>
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
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="<c:url value="/"/>">Home</a> <span class="divider">/</span></li>
		<li class="active">Check Out</li>
    </ul>
	<div class="well well-small">
		<h1>Check Out <small class="pull-right"> ${sessionScope.CartCount} Items are in the cart </small></h1>
	<hr class="soften"/>
	<form:form action="confirmCart" method="post" modelAttribute = "ShoppingCart">
	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Description</th>
                  <!--
				  <th>	Ref. </th>

                  <th>Avail.</th> -->
                  <th>Unit price</th>

                  <th>Qty </th>
                  <th>Total</th>
				</tr>
              </thead>
              <c:set var="totalAmount" value="${0}" />
              <c:forEach items="${ShoppingCart.objLineItemList}" var="lineItem" varStatus="lineItemidx">
              <spring:nestedPath path="objLineItemList[${lineItemidx.index}].">
              <tbody>
                <tr>
                  <td><img width="100" src="<c:url value="/resources/assets/img/${lineItem.strImageName}.jpg"/>" alt=""></td>
                  <form:hidden path="strImageName"></form:hidden>
                  <td>
                  ${lineItem.strProdName}<br>Brand: ${lineItem.strBrand}<br>Available Quantity: ${lineItem.intQty}<br>${lineItem.strDesc}
				  <form:hidden path="intProdId"/> 
				  <form:hidden path="strProdName"/>   
				  <form:hidden path="strDesc"/>             
                  </td>
                  
                  <!--
                  <td> - </td>
                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
                  -->
                  <td>$${lineItem.dblPrice}</td>
                  <form:hidden path="dblPrice"/>
                  <td>
					<form:input data-unit-price="${lineItem.dblPrice}" data-lineItemIdx="${lineItemidx.index}" 
						path="intInputQty" name="intInputQty" data-cur-qty="${lineItem.intInputQty}"
						class="span1 inpQty${lineItemidx.index}" onblur="updateQty(this);" 
						style="max-width:34px" placeholder="1" size="16"/>
					
					<div class="input-append">
					<form:hidden name="intQty" path = "intQty" value="${lineItem.intQty}"/>
					<button class="btn btn-mini" data-lineItemIdx="${lineItemidx.index}" onclick="delQty(this);" type="button">-</button>
					<button class="btn btn-mini" data-lineItemIdx="${lineItemidx.index}" onclick="addQty(this);" type="button"> + </button>
					<button onclick="location.href='<c:url value="/delete/${lineItem.intProdId}"/>'" class="btn btn-mini btn-danger" type="button" ><span class="icon-remove"></span></button>
				</div>
				</td>
                  <td>$<span id="lnItmTotal${lineItemidx.index}">${lineItem.dblTotal}</span></td>
                  <form:hidden class="lnItmTotal" name="dblTotal" path="dblTotal"/>
                  <c:set var="totalAmount" value="${totalAmount + lineItem.dblTotal}" />
                </tr>
                </spring:nestedPath>
                </c:forEach>
                <!-- 
				<tr>
                  <td><img width="100" src="<c:url value="/resources/assets/img/Size3Diaper.jpg"/>" alt=""></td>
                  <td>Item names and brief details<br>Count:33 <br>Brand: Earth's Best</td>
                  <!--
                  <td> - </td>
                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
                  
                  <td>$348.42</td>
                  <td>
				  <input class="span1" style="max-width:34px" placeholder="1" size="16" type="text">
				  <div class="input-append">
					<button class="btn btn-mini" type="button">-</button><button class="btn btn-mini" type="button">+</button><button class="btn btn-mini btn-danger" type="button"><span class="icon-remove"></span></button>
				</div>
				  </td>
                  <td>$34.42</td>
                </tr>
                -->
                <tr>
                  <td colspan="4" class="alignR">Total products price:	</td>
                  <td> $<span id="cartTotal">${ShoppingCart.dblTotalProducts}</span></td>
                  <form:hidden name="dblTotalProducts" path="dblTotalProducts"/>
                </tr>
                 <tr>
                  <td colspan="4" class="alignR">Tax:	</td>
                  <td> $<span id="cartTax">${ShoppingCart.dblTax}</span></td>
                  <form:hidden name="dblTax" path="dblTax"/>
                </tr>
				 <tr>
                  <td colspan="4" class="alignR">Shipping cost:	</td>
                  <td> $0.0</td>
                </tr>
				 <tr>
                  <td colspan="4" class="alignR">Total:	</td>
                  <td class="label label-primary"> $<span id="cartFullTotal">${ShoppingCart.dblTotalCart}</span></td>
                  <form:hidden name="dblTotalCart" path="dblTotalCart"/>
                </tr>
                
				</tbody>
            </table><br/>

			<!--
            <table class="table table-bordered">
			<tbody>
				 <tr>
                  <td>

				<form class="form-inline">
				  <label style="min-width:159px"> VOUCHERS Code: </label>
				<input type="text" class="input-medium" placeholder="CODE">
				<button type="submit" class="shopBtn"> ADD</button>
				</form>

				</td>
                </tr>

			</tbody>
				</table>
			<table class="table table-bordered">
			<tbody>
                <tr><td>ESTIMATE YOUR SHIPPING & TAXES</td></tr>
                 <tr>
				 <td>
					<form class="form-horizontal">
					  <div class="control-group">
						<label class="span2 control-label" for="inputEmail">Country</label>
						<div class="controls">
						  <input type="text" placeholder="Country">
						</div>
					  </div>
					  <div class="control-group">
						<label class="span2 control-label" for="inputPassword">Post Code/ Zipcode</label>
						<div class="controls">
						  <input type="password" placeholder="Password">
						</div>
					  </div>
					  <div class="control-group">
						<div class="controls">
						  <button type="submit" class="shopBtn">Click to check the price</button>
						</div>
					  </div>
					</form>
				  </td>
				  </tr>
              </tbody>
            </table>
            -->
	<a href="<c:url value="/"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Continue Shopping </a>
	<button type="submit" class="shopBtn btn-large pull-right">Checkout <span class="icon-arrow-right"></span></button>
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
			<a href="#"><img alt="" src="<c:url value="/resources/assets/img/1.png"/>"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="<c:url value="/resources/assets/img/2.png"/>"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="<c:url value="/resources/assets/img/3.png"/>"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="<c:url value="/resources/assets/img/4.png"/>"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="<c:url value="/resources/assets/img/5.png"/>"></a>
		</div>
		<div class="span2">
			<a href="#"><img alt="" src="<c:url value="/resources/assets/img/6.png"/>"></a>
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
	<script src="<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/jquery.easing-1.3.min.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/jquery.scrollTo-1.4.3.1-min.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/shop.js"/>"></script>
    <script>
    
    function roundAmt(val) {
    	return Math.round((val + 0.00001) * 100) / 100;
    }
    
    function updateCartTotal() {
    	var total = 0.0;
    	$(".lnItmTotal").each(function(idx, el){
    		total += parseFloat($(el).val());
    	});
    
    	$("#cartTotal").text(Math.round((total + 0.00001) * 100) / 100);
    	var tax = total * 0.06;
    	$("#cartTax").text(Math.round((tax + 0.00001) * 100) / 100);
    	var carttotal = total+tax;
    	$("#cartFullTotal").text(Math.round((carttotal + 0.00001) * 100) / 100);
    }
    
    function updateSessionAndQuantity(prodId, inpQty, el, lnItmIdx) {
    	var path = '${pageContext.request.contextPath}/update';
    	$.ajax({
    		url: path,
    		data: {
    			"prodId" : prodId, 
    			"inputQty" : inpQty,
    		},
    		success: function(result) {
    			console.log("update item qty success");
    			$(el).val(inpQty); 
    			$(el).attr('data-cur-qty', inpQty);
    	  		var unitPrice = $(el).attr("data-unit-price");
    	  		var lnItemTotal = inpQty*unitPrice;
    	   		$("#lnItmTotal"+lnItmIdx).text(roundAmt(lnItemTotal));
    	   		$("#objLineItemList" + lnItmIdx + "\\.dblTotal").val(roundAmt(lnItemTotal));
    	   		updateCartTotal(prodId, inpQty);
    		},
    		error: function(err) {
    			console.log("update item qty failed");
    		}
    	});
    }
    
    function updateQty(el) {
    	var inpQty = 0;
   		var lnItmIdx = $(el).attr("data-lineItemIdx");
    	var avlQty = $("#objLineItemList" + lnItmIdx + "\\.intQty");
    	if ($(el).val() > 0) {
    		 inpQty = $(el).val();
	   		 inpQty = parseInt(inpQty);
	   		 if(inpQty >= parseInt(avlQty.val())){
	   			alert ("Input Quantity more than available stock");
	   			$(el).val($(el).attr('data-cur-qty'));
	   			return;
	   		}
    	} else {
    		inpQty = 0;
    	}
   	    // get prod id
   		var prodId = $("#objLineItemList" + lnItmIdx + "\\.intProdId").val();
   		updateSessionAndQuantity(prodId, inpQty, el, lnItmIdx);
   	 }
     
 	 function addQty(btnEl) {
  		 var lnItmIdx = $(btnEl).attr("data-lineItemIdx");
 		 var el = $("#objLineItemList" + lnItmIdx + "\\.intInputQty");
 		 var avlQty = $("#objLineItemList" + lnItmIdx + "\\.intQty");
 		 var inpQty = 0;
	   	 if ($(el).val() >= 0) {
	   		inpQty = $(el).val();
	   		inpQty = parseInt(inpQty);
	   		if(inpQty >= parseInt(avlQty.val())){
	   			alert ("Input Quantity more than available stock");
	   			return;
	   		}
	  		inpQty = inpQty + 1;
	   	} else {
	   		inpQty = 0; 
	   	}	   	 
   		// get prod id
   		var prodId = $("#objLineItemList" + lnItmIdx + "\\.intProdId").val();
   		updateSessionAndQuantity(prodId, inpQty, el, lnItmIdx);
 	 }
 	 
 	 function delQty(btnEl) {
 		 var lnItmIdx = $(btnEl).attr("data-lineItemIdx");
 		 var el = $("#objLineItemList" + lnItmIdx + "\\.intInputQty");
		 var inpQty = 0;
	   	 if ($(el).val() > 0) {
	   		 inpQty = $(el).val();
	  		 inpQty = parseInt(inpQty);
	  		 inpQty = inpQty - 1;
	   	 } else {
	   		inpQty = 0;
	   	 }
   	     // get prod id
   		 var prodId = $("#objLineItemList" + lnItmIdx + "\\.intProdId").val();
   		 updateSessionAndQuantity(prodId, inpQty, el, lnItmIdx);
 	 }
  	</script>
  </body>
</html>
