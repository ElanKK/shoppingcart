<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  
      <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="STYLESHEET"/>
  <script type="text/javascript">
  
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
 

 function LoginSubmit()
  {
	  if(document.Login.username.value == ""){
		  alert("Please Enter UserName"); 
		  document.Login.username.focus(); 
		  return false;
	  }
	  else if(document.Login.password.value == ""){
		  alert("Please Enter password"); 
		  document.Login.password.focus(); 
		  return false;
	  }

 }
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
   
</head>

<body>
<div>
<img src="<c:url value="/resources/Images/logo.jpg" />" width="30%" height="30%" />
</div>
  <div class="login-page">
  <div class="form">
    <form:form  class="register-form" name="register" action="Create" method="post" onSubmit = "return userValidate()"  modelAttribute="User">
      <form:input type="text" path="strUserName" placeholder="username"/>
      <form:input type="password" path="strPassword" placeholder="password" onblur="return passValidate(this.value)"/>
      <form:input type="text" path="stremail" placeholder="email address" onblur = "return emailValidate(this.value)"/>
      <form:input type="text" path="strAddress1" placeholder="Address Line 1"/>
      <form:input type="text" path="strAddress2" placeholder="Address Line 2"/>
      <form:input type="text" path="strCity" placeholder="City"/>
      <form:input type="text" path="strState" placeholder="State"/>
      <form:input type="text" path="strZipCode" placeholder="Zipcode"/>
      <form:button type="submit" name="Create" value="Create" >Create</form:button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form:form>
    <form:form name = "Login" action= "login" method="post" onSubmit = "return LoginSubmit()" modelAttribute="User">
      <form:input type="text" path="strUserName" placeholder="username"/>
      <form:input type="password" path="strPassword" placeholder="password"/>
      <form:button type="submit" name="Login" value="Login">Login</form:button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
    </form:form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="<c:url value="/resources/JS/index.js"/>"></script>

</body>
</html>
