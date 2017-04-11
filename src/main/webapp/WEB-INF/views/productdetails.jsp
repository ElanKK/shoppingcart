<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Baby Natural/Organic Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="<c:url value="/resources/assets/css/bootstrap.css"/>" type="text/css" rel="stylesheet"/>
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
				<a href="<c:url value="/cart"/>"><span class="icon-shopping-cart"></span>  ${sessionScope.CartCount} Item(s) - <span class="badge badge-warning"> ${sessionScope.Amount}</span></a>
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
	<a class="logo" href="<c:url value="/products"/>"><span>Twitter Bootstrap ecommerce template</span>
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
	<!--
	<div class="span4 alignR">
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<span class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span>
	<span class="btn btn-warning btn-mini">$</span>
	<span class="btn btn-mini">&pound;</span>
	<span class="btn btn-mini">&euro;</span>
	</div>
	-->
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
			  <li class="active"><a href="<c:url value="/"/>">Home	</a></li>
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
		<li><a href="products"><span class="icon-chevron-right"></span>Lotions/Creams</a></li>
		<li><a href="products"><span class="icon-chevron-right"></span>Body Wash & Shampoo</a></li>
		<li><a href="products"><span class="icon-chevron-right"></span>See All Products</a></li>
		-->
		<li style="border:0"> &nbsp;</li>
		<li> <a class="totalInCart" href="<c:url value="/cart"/>"><strong>Total Amount  <span class="badge badge-warning pull-right" style="line-height:18px;">${sessionScope.Amount}</span></strong></a></li>
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
    <!--
    <li><a href="products.html">Items</a> <span class="divider">/</span></li>
    -->
    <li class="active">Preview</li>
    </ul>
	<div class="well well-small">
	<div class="row-fluid">
			<div class="span5">
			<div id="myCarousel" class="carousel slide cntr">
                <div class="carousel-inner">
                  <div class="item active">
                   <a href="#"> <img src="<c:url value="/resources/assets/img/${Product.strImageName}.jpg"/>" alt="" style="width:100%"></a>
                  </div>
                  <!--
                  <div class="item">
                     <a href="#"> <img src="/resources/assets/img/b.jpg" alt="" style="width:100%"></a>
                  </div>
                  <div class="item">
                    <a href="#"> <img src="/resources/assets/img/e.jpg" alt="" style="width:100%"></a>
                  </div>
                  -->
                  </div>
                  <!--
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                -->
            </div>
			</div>
			<div class="span7">
				<h3>${Product.strProdName}</h3>
				<hr class="soft"/>

				<form:form class="form-horizontal qtyFrm" action="AddToCart" method="GET">
				  <div class="control-group">
					<label class="control-label"><span>${Product.dblPrice}</span></label>
					<div class="controls">
					<input type="number" class="span6" placeholder="Qty." name="inputQty" onBlur="return checkQuantity(this.value,${Product.intQty})">
					<input type="hidden" name="prodId" value="${Product.intProdID}"/>
					</div>
				  </div>
				<!--
				  <div class="control-group">
					<label class="control-label"><span>Color</span></label>
					<div class="controls">
					  <select class="span11">
						  <option>Red</option>
						  <option>Purple</option>
						  <option>Pink</option>
						  <option>Red</option>
						</select>
					</div>
				  </div>
				  <div class="control-group">
					<label class="control-label"><span>Materials</span></label>
					<div class="controls">
					  <select class="span11">
						  <option>Material 1</option>
						  <option>Material 2</option>
						  <option>Material 3</option>
						  <option>Material 4</option>
						</select>
					</div>
				  </div>
				  -->
				  <h4>${Product.intQty} items in stock</h4>

				  <button type="submit" class="shopBtn"><span class=" icon-shopping-cart"></span> Add to cart</button>
				</form:form>
			</div>
			</div>
				<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
              <!--
              <li class=""><a href="#profile" data-toggle="tab">Related Products </a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Acceseries <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#cat1" data-toggle="tab">Category one</a></li>
                  <li><a href="#cat2" data-toggle="tab">Category two</a></li>
                </ul>
              </li>
              -->
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
			  <h4>Product Information</h4>

                <table class="table table-striped">
				<tbody>
				<fmt:formatDate value="${Product.dExpiryDate}" var="startFormat" pattern="yyyy-MM-dd"/>
				<tr class="techSpecRow"><td class="techSpecTD1">Expiry Date:</td><td class="techSpecTD2"><c:out value="${startFormat}" /></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Brand:</td><td class="techSpecTD2">${Product.strBrand}</td></tr>
				<!--
				<tr class="techSpecRow"><td class="techSpecTD1">Season:</td><td class="techSpecTD2">spring/summer</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Usage:</td><td class="techSpecTD2">fitness</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Sport:</td><td class="techSpecTD2">122855031</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Brand:</td><td class="techSpecTD2">Shock Absorber</td></tr>
				-->
				</tbody>
				</table>

				<p>${Product.strProdDesc}</p>
				<!--
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				-->
			</div>
			<div class="tab-pane fade" id="profile">
			<div class="row-fluid">
			<div class="span2">
				<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
			</div>
			<div class="span6">
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.
				We always stay in touch with the latest fashion tendencies -
				that is why our goods are so popular..
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> $140.00</h3>
			<label class="checkbox">
				<input type="checkbox">  Adds product to compair
			</label><br>
			<div class="btn-group">
			  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
			  <a href="product_details.html" class="shopBtn">VIEW</a>
			 </div>
				</form>
			</div>
		</div>
			<hr class="soft">
			<div class="row-fluid">
			<div class="span2">
				<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
			</div>
			<div class="span6">
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.
				We always stay in touch with the latest fashion tendencies -
				that is why our goods are so popular..
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> $140.00</h3>
			<label class="checkbox">
				<input type="checkbox">  Adds product to compair
			</label><br>
			<div class="btn-group">
			  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
			  <a href="product_details.html" class="shopBtn">VIEW</a>
			 </div>
				</form>
			</div>
	</div>
			<hr class="soft"/>
			<div class="row-fluid">
			<div class="span2">
				<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
			</div>
			<div class="span6">
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.
				We always stay in touch with the latest fashion tendencies -
				that is why our goods are so popular..
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> $140.00</h3>
			<label class="checkbox">
				<input type="checkbox">  Adds product to compair
			</label><br>
			<div class="btn-group">
			  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
			  <a href="product_details.html" class="shopBtn">VIEW</a>
			 </div>
				</form>
			</div>
	</div>
			<hr class="soft"/>
			<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>
			<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			</div>
              <div class="tab-pane fade" id="cat1">
                <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
              <br>
              <br>
			  <div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/b.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>
			<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/a.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>
			  </div>
              <div class="tab-pane fade" id="cat2">

				<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>
			<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>
			<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>
			<div class="row-fluid">
					<div class="span2">
						<img src="<c:url value="/resources/assets/img/d.jpg"/>" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies -
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soften"/>

				</div>
            </div>

</div>
</div>
</div> <!-- Body wrapper -->
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
	<script src="<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/jquery.easing-1.3.min.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/jquery.scrollTo-1.4.3.1-min.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/shop.js"/>"></script>
    <script type="text/javascript">
    function checkQuantity(inputQty,avlQty){
    	if(inputQty == 0){
    		alert("Please enter the quantity greater than 0");
    	}
    	else if(inputQty > avlQty){
    		alert("Please enter the quantity based on the available stock");
    	}
    	
    }
    </script>
  </body>
</html>