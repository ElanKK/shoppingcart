<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<title>ADD PRODUCTS</title>
<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">
Input.text {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #a9c6c9;
	border-collapse: collapse;
}
table.altrowstable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.altrowstable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
.oddrowcolor{
	background-color:#d4e3e5;
}
table{
	align: center;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
	background-color:#c3dde0;
}
.centered-table {
   margin-left: auto;
   margin-right: auto;
}

</style>
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
<h1 align="center"> INVENTORY - ADD / EDIT PRODUCT DETAIL </h1>
<form:form method="post" modelAttribute="Products" >
<!-- Text input-->
<table class="centered-table" >
<tr>
  	<td><form:label class="col-md-4 control-label" path="strProdName">PRODUCT NAME</form:label>  </td>
  	<td><form:input path="strProdName"  placeholder="PRODUCT NAME" required="" type="text"></form:input></td>
</tr>
<tr>
  	<td><form:hidden path="intProdid"  ></form:hidden></td>
</tr>
<!-- Text input-->
<tr>
   <td><form:label class="col-md-4 control-label" path="strProdDesc">PRODUCT DESCRIPTION</form:label> </td> 
   <td><form:input path="strProdDesc" placeholder="PRODUCT DESC" class="form-control input-md" type="text"></form:input></td>
</tr>

<!-- Text input-->
<tr>
  <td><form:label class="col-md-4 control-label" path="intProdQty">AVAILABLE QUANTITY</form:label></td>  
  <td><form:input path="intProdQty" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required="" type="text" onblur = "return Validate(this.value)"></form:input></td>
</tr>
<!-- Text input-->
<tr>
  <td><form:label class="col-md-4 control-label" path="dProdExp">EXPIRY DATE</form:label></td>  
   <td> <form:input path="strProdExp"  id="datepicker" class="form-control input-md" required="" type="date"></form:input></td>
  
</tr>
<!-- Button -->
<tr>
   <td> <form:button type="submit"> ${label}</form:button><td>
</tr>
</table>
</form:form>


</body>
</html>