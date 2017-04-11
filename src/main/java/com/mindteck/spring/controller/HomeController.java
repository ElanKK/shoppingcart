package com.mindteck.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mindteck.spring.model.SearchProduct;
import com.mindteck.spring.model.ShoppingCart;
import com.mindteck.spring.model.User;
import com.mindteck.spring.service.HomeService;

@Controller
@ComponentScan(basePackages = "com.mindteck.spring")
public class HomeController {

	@Autowired
	HomeService objHomeServ;

	@ModelAttribute("Cart")
	public HashMap<Integer, Integer> createShoppingCart() {
		return new HashMap<>();
	}

	public void cartCount(HttpSession objSession, int intProdId,int intQty) {

		HashMap<Integer, Integer> objCart = (HashMap<Integer, Integer>) objSession.getAttribute("Cart");

			if (objCart.containsKey(intProdId)) {
				int count = objCart.get(intProdId);
				objCart.put(intProdId, (count + intQty));
			} else {
				objCart.put(intProdId, intQty);
			}
			
			objSession.setAttribute("Cart", objCart);
			objSession.setAttribute("CartCount", objCart.keySet().size());
			objSession.setAttribute("Amount", objHomeServ.getTotalAmount(objCart));

		
	}

	@RequestMapping(value = "/")
	public String initialPage(Model model,HttpSession objSession) throws IOException {

		model.addAttribute("Category", objHomeServ.getCategories());
		model.addAttribute("Product", objHomeServ.getAllProducts());
		model.addAttribute("User", new User());
		model.addAttribute("SearchProduct", new SearchProduct());
		if(objSession.getAttribute("Cart") == null){
		 objSession.setAttribute("Cart", createShoppingCart());
		}

		return "products";
	}

	@RequestMapping(value = "/product/{intCatgId}")
	public String getByCategory(@PathVariable("intCatgId") int intCatId, Model model,HttpSession objSession) throws IOException {

		model.addAttribute("Category", objHomeServ.getCategories());
		model.addAttribute("SearchProduct", new SearchProduct());
		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
		System.out.println(model.asMap().get("CartCount"));
		if (intCatId != 5) {
			model.addAttribute("Product", objHomeServ.getByCategory(intCatId));
		} else {
			model.addAttribute("Product", objHomeServ.getAllProducts());
		}

		return "products";
	}

	@RequestMapping(value = "/productdetails/{intProdID}")
	public String getProductDetail(@PathVariable("intProdID") int intProdId, Model model,HttpSession objSession) throws IOException {

		model.addAttribute("Category", objHomeServ.getCategories());

		model.addAttribute("Product", objHomeServ.getProduct(intProdId));
		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}

		return "productdetails";
	}
	

	@RequestMapping(value = "/contact")
	public String ContactPage(Model model,HttpSession objSession) throws IOException {
		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
		return "contact";
	}

	@RequestMapping(value = "/AddToCart/{intProdID}")
	public String AddToCart(@PathVariable("intProdID") int intProdId, Model model, HttpSession objSession)
			throws IOException {
		/*if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
		model.addAttribute("Category", objHomeServ.getCategory());
		model.addAttribute("Product", objHomeServ.getAllProducts());
		model.addAttribute("SearchProduct", new SearchProduct()); */
		cartCount(objSession, intProdId,1);
		return "redirect:/";
	}
	@RequestMapping(value = "/productdetails/AddToCart")
	public String AddToCartFromDetails(@RequestParam("prodId") int prodId,@RequestParam("inputQty") int inputQty, Model model, HttpSession objSession)
			throws IOException {

		
		cartCount(objSession, prodId,inputQty);
		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
		model.addAttribute("Category", objHomeServ.getCategories());
		model.addAttribute("Product", objHomeServ.getProduct(prodId));
		return "productdetails";
		
	}
	@RequestMapping(value = "/cart")
	public String showCart(Model model,HttpSession objSession) throws IOException {
		ShoppingCart objShopCart = objHomeServ.getCartDetails((HashMap<Integer,Integer>)objSession.getAttribute("Cart"));
		model.addAttribute("ShoppingCart", objShopCart);
		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
			return "cart";
	}

	@RequestMapping(value = "/delete/{intProdID}")
	public String deleteFromCart(@ModelAttribute("ShoppingCart") ShoppingCart objCart,
			@PathVariable("intProdID") int intProdID, Model model, HttpSession objSession) throws IOException {
		
		HashMap<Integer, Integer> objSessionCart = (HashMap<Integer, Integer>)objSession.getAttribute("Cart");
		objSessionCart = objHomeServ.deleteFromCart(objSessionCart, intProdID);
		ShoppingCart objShopCart = objHomeServ
				.getCartDetails(objSessionCart);
		model.addAttribute("ShoppingCart", objShopCart);
		objSession.setAttribute("CartCount", objSessionCart.keySet().size());
		objSession.setAttribute("Amount", objHomeServ.getTotalAmount(objSessionCart));
		objSession.setAttribute("Cart", objSessionCart);
		if (objSession.getAttribute("UserName") == null) {
			model.addAttribute("User", new User());
		}
		return "redirect:/cart";
	}
	@RequestMapping(value = "/update")
	@ResponseBody
	public void update(@RequestParam("prodId") int prodId,@RequestParam("inputQty") int inputQty,HttpSession objSession)
			throws IOException {		
		HashMap<Integer, Integer> objCart = (HashMap<Integer, Integer>) objSession.getAttribute("Cart");

		if (objCart.containsKey(prodId)) {
			objCart.put(prodId, inputQty );
		} 
		
		objSession.setAttribute("Cart", objCart);
		objSession.setAttribute("CartCount", objCart.keySet().size());
		objSession.setAttribute("Amount", objHomeServ.getTotalAmount(objCart));
		
		
	}
	
	@RequestMapping(value="/confirmCart", method = RequestMethod.POST)
	public String cartCheckOut(@ModelAttribute("ShoppingCart") ShoppingCart objCart,Model model, HttpSession objSession){
		
		String strReturn = null;
		if (objSession.getAttribute("UserName") == null) {
			strReturn = "redirect:/login";
		}
		else{
			System.out.println("Test"+objCart.getDblTotalCart());
			int orderid = objHomeServ.cartCheckOut(objCart, (int) objSession.getAttribute("UserId"));
			objSession.removeAttribute("Cart");
			objSession.removeAttribute("CartCount");
			objSession.removeAttribute("Amount");
			model.addAttribute("Order", orderid);
			strReturn = "OrderConfirmation";
		}
		return strReturn;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody
	List<SearchProduct> getProds(@RequestParam("prodName") String prodName) {

		return objHomeServ.simulateSearchResult(prodName);

	}
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String getProdSearch(@ModelAttribute("SearchProduct")SearchProduct objSearch,Model model,HttpSession objSession) {

		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
		model.addAttribute("Category", objHomeServ.getCategories());
		model.addAttribute("Product", objHomeServ.getProdSearch(objSearch));
		model.addAttribute("SearchProduct", objSearch);
		return "products";

	}
	@RequestMapping(value="/OrderHistory")
	public String getHistory(Model model,HttpSession objSession){
		
		String strReturn = null;
		if (objSession.getAttribute("UserName") == null) {
			strReturn = "redirect:/login";
		}
		else{
			model.addAttribute("Category", objHomeServ.getCategories());
			model.addAttribute("Order", objHomeServ.getHistory((int)objSession.getAttribute("UserId")));
			strReturn = "OrderHistory";
		}
		return strReturn;
		
	}
	/*
	@RequestMapping(value = "/AddToCart/search")
	public String getSearch(@ModelAttribute("SearchProduct")SearchProduct objSearch,Model model,HttpSession objSession) {

		if(objSession.getAttribute("UserName") == null){
			model.addAttribute("User", new User());
		}
		model.addAttribute("Category", objHomeServ.getCategory());
		model.addAttribute("Product", objHomeServ.getProdSearch(objSearch));
		model.addAttribute("SearchProduct", objSearch);
		return "products";

	}*/

}
