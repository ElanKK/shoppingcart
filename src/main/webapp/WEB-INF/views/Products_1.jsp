<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Javascript goes in the document HEAD -->
<script type="text/javascript">
function altRows(id){
	if(document.getElementsByTagName){  
		
		var table = document.getElementById(id);  
		var rows = table.getElementsByTagName("tr"); 
		 
		for(i = 0; i < rows.length; i++){          
			if(i % 2 == 0){
				rows[i].className = "evenrowcolor";
			}else{
				rows[i].className = "oddrowcolor";
			}      
		}
	}
}
window.onload=function(){
	altRows('alternatecolor');
}
</script>

<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">
table.altrowstable {
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
.evenrowcolor{
	background-color:#c3dde0;
}
</style>
<title>Products Inventory</title>
</head>
<body>
<h1 align="center"> INVENTORY - PRODUCTS </h1>
<!-- Table goes in the document BODY -->
<table class="altrowstable" id="alternatecolor">
<tr>
	<th>Product ID</th><th>Product Name</th><th>Description</th><th>Quantity</th><th>Expiration Date</th><th>Edit</th><th>Delete</th>
</tr>
	<c:forEach items="${Products}" var="Products">
<tr>
	<td><c:out value="${Products.intProdid}" /></td>
	<td><c:out value="${Products.strProdName}" /></td>
	<td><c:out value="${Products.strProdDesc}" /></td>
	<td><c:out value="${Products.intProdQty}" /></td>
	<td>
		<fmt:formatDate value="${Products.dProdExp}" var="startFormat" pattern="yyyy-MM-dd"/>
		<c:out value="${startFormat}" />
	</td>
	
	<td><a href="<c:url value="/edit/${Products.intProdid}"/>"/>Edit</td>
	<td><a href="<c:url value="/delete/${Products.intProdid}"/>"/>Delete</td>
	
</tr>
</c:forEach>
</table>
<a href="<c:url value="/Add"/>"/>Add Products

</body>
</html>