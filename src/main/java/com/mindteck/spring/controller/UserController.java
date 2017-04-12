package com.mindteck.spring.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mindteck.spring.exception.ApplicationException;
import com.mindteck.spring.model.SearchProduct;
import com.mindteck.spring.model.User;
import com.mindteck.spring.service.HomeService;
import com.mindteck.spring.service.ProductService;
import com.mindteck.spring.service.UserService;

@Controller
@ComponentScan(basePackages="com.mindteck.spring")
public class UserController {
	
	@Autowired
	UserService objService;
	
	@Autowired
	HomeService objHomeServ;
	
	@Autowired
	ProductService objProdService;

	@RequestMapping(value="/register")
	public String register(HttpSession objSession, Model model) throws ApplicationException{
		
		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
			model.addAttribute("label", "Register");
		}
		else{
			model.addAttribute("User", objService.getUserDetails((Integer)objSession.getAttribute("UserId")));
			model.addAttribute("label", "Edit User");
		}
		model.addAttribute("Category", objHomeServ.getCategories());
		return "register";
		
	}
	public String aunthenticate(User objUser,Model model,HttpSession objSession,RedirectAttributes redir){
		String strReturn;
		User user = objService.authenticateUser(objUser);
		
		if(user != null)
		{
			model.addAttribute("Category", objHomeServ.getCategories());
			model.addAttribute("Product", objHomeServ.getAllProducts());
			objSession.setAttribute("UserName", user.getStrFirstName());
			objSession.setAttribute("UserId", user.getIntUserId());
			model.addAttribute("SearchProduct", new SearchProduct());
			model.addAttribute("Message", "Login successful");
			strReturn= "products";
			
		}
		else
		{
			redir.addFlashAttribute("Message", "Invalid Credentials. Please try again");
			strReturn = "redirect:/login";
			
		}
		return strReturn;
	}
	
	@RequestMapping(value="/login")
	public String login(Model model) {
		model.addAttribute("User", new User());
		model.addAttribute("Category", objHomeServ.getCategories());
		return "login";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(@ModelAttribute("User")User objUser,BindingResult result, Model model,HttpSession objSession,RedirectAttributes redir) throws ApplicationException{
		
		return aunthenticate(objUser,model,objSession,redir);
		
	}
	@RequestMapping(value = "/productdetails/login")
	public String productDetailLogin(@ModelAttribute("User")User objUser,Model model,HttpSession objSession,RedirectAttributes redir) throws ApplicationException {

		return aunthenticate(objUser,model,objSession,redir);
	}
	@RequestMapping(value = "/product/login")
	public String productLogin(@ModelAttribute("User")User objUser,Model model,HttpSession objSession,RedirectAttributes redir) throws ApplicationException {

		return aunthenticate(objUser,model,objSession,redir);
	}
	
	@RequestMapping(value="/Create",method = RequestMethod.POST)
	public String createUser(@ModelAttribute("User")User objUser,HttpSession objSession,RedirectAttributes redir) throws ApplicationException{
		
		
		String strReturn;
		if(objSession.getAttribute("UserId") != null){
			objService.createUser(objUser);
			strReturn = "redirect:/";
		}
		else{
			objService.createUser(objUser);
			redir.addFlashAttribute("Message", "Registration successful. Please login");
			strReturn = "redirect:/login";
		}
		
		
		return strReturn;
	}
	@RequestMapping(value="/Account")
	public String accountDetails(@ModelAttribute("User")User objUser,HttpSession objSession,Model model) throws ApplicationException{
		
		String strReturn;
		
		if(objSession.getAttribute("UserId") == null){
			model.addAttribute("User", new User());
			strReturn = "login";
		}
		else{
			model.addAttribute("User", objService.getUserDetails((Integer)objSession.getAttribute("UserId")));
			model.addAttribute("label", "Edit User");
			strReturn = "register";
		}
				
		model.addAttribute("Category", objHomeServ.getCategories());
		return strReturn;
	}
	
	
	@RequestMapping(value="/signout")
	public String signOut(Model model,HttpSession objSession) {
		objSession.removeAttribute("UserName");
		objSession.removeAttribute("UserId");
		return "redirect:/";
	}
	/*
	@RequestMapping(value="/productList")
	public String listProducts(Model model) {
		model.addAttribute("Products", objProdService.getProductList());
		return "Products_1";
	}
	
	
	
	
	@RequestMapping(value="/edit/{intProdid}")
	public String editProduct(@PathVariable("intProdid") int intProdId,Model model) throws IOException{
		
		model.addAttribute("label", "SAVE");
		model.addAttribute("Products",objProdService.getProduct(intProdId));
		return "AddProducts";
		
	}
	@RequestMapping(value="/delete/{intProdid}")
	public String deleteProduct(@PathVariable("intProdid") int intProdId,Model model) throws IOException{
		objProdService.deleteProduct(intProdId);
		return "redirect:/productList";
	}
	@RequestMapping(value="/Add")
	public String addProduct(Model model) throws IOException{
		
		model.addAttribute("label", "ADD");
		model.addAttribute("Products",new Products());
		return "AddProducts";
		
	}
	@RequestMapping(value="/Add",method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("Products")Products objProd,BindingResult result) throws IOException{
		objProdService.addProduct(objProd);
		return "redirect:/productList";
		
	}
	@RequestMapping(value="/edit/{intProdid}", method = RequestMethod.POST)
	public String editProduct(@ModelAttribute("Products")Products objProd,BindingResult result) throws IOException{
		objProdService.updateProduct(objProd);
		return "redirect:/productList";
	}
	
	*/
}
