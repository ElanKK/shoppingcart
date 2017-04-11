package com.mindteck.spring.service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mindteck.spring.dao.HomeDAO;
import com.mindteck.spring.model.Category;
import com.mindteck.spring.model.LineItem;
import com.mindteck.spring.model.Order;
import com.mindteck.spring.model.OrderLineItem;
import com.mindteck.spring.model.Product;
import com.mindteck.spring.model.SearchProduct;
import com.mindteck.spring.model.ShoppingCart;

@Service("HomeService")
@ComponentScan(basePackages = "com.mindteck.spring")
@Transactional
public class HomeService {
	@Autowired
	private HomeDAO objHomeDao;
	
	
	public List<Category> getCategories() {
		List<Category> objCategories = objHomeDao.getCategories();
		return objCategories;
	}

	public List<Product> getAllProducts() {
		List<Product> objProducts = objHomeDao.getAllProducts();
		return objProducts;
	}

	public List<Product> getByCategory(int intCatId) {
		Category category = objHomeDao.getCategory(intCatId);
		Hibernate.initialize(category.getObjProdList());
		List<Product> objProducts = category.getObjProdList();
		return objProducts;
	}
	public Product getProduct(int intProdID){
		Product objProd = objHomeDao.getProduct(intProdID);
		return objProd;
	}
	public Double getTotalAmount(HashMap objMap){
		Set<Integer> keys = objMap.keySet();
		Double dblTotalAmount = 0.0;
        for(Integer key: keys){
        	Product objProd = objHomeDao.getProduct(key);
        	Integer count = (Integer)objMap.get(key);
        	dblTotalAmount = dblTotalAmount+(objProd.getDblPrice() * count);
        	
        }
        DecimalFormat df = new DecimalFormat("#.##");
		return Double.valueOf(df.format(dblTotalAmount));

	}
	public ShoppingCart getCartDetails(HashMap objMap){
		ShoppingCart objShopCart = new ShoppingCart();
		Product objProd;
		LineItem objLine;
		DecimalFormat df = new DecimalFormat("#.##");
		double dblTotalProducts = 0;
		Set<Integer> keys = objMap.keySet();
		for(Integer key: keys){
			objLine = new LineItem();
			objProd = getProduct(key);
			objLine.setIntProdId(objProd.getIntProdID());
			objLine.setDblPrice(objProd.getDblPrice());
			objLine.setIntQty(objProd.getIntQty());
			objLine.setStrBrand(objProd.getStrBrand());
			objLine.setStrDesc(objProd.getStrProdDesc());
			objLine.setStrImageName(objProd.getStrImageName());
			objLine.setStrProdName(objProd.getStrProdName());
			objLine.setIntInputQty((Integer)objMap.get(key));
			objLine.setDblTotal(objProd.getDblPrice() * (Integer)objMap.get(key));
			dblTotalProducts = dblTotalProducts + objLine.getDblTotal();
			objShopCart.getObjLineItemList().add(objLine);
		}
		objShopCart.setDblTotalProducts(Double.valueOf(df.format(dblTotalProducts)));
		objShopCart.setDblTax(Double.valueOf(df.format(dblTotalProducts*0.06)));
		objShopCart.setDblTotalCart(Double.valueOf(df.format(dblTotalProducts + objShopCart.getDblTax())));
		return objShopCart;
		
	}
	
	public List<SearchProduct> simulateSearchResult(String strSearch) {
		
		return objHomeDao.searchProducts("%"+strSearch+'%');
	}
	
	public List<Product> getProdSearch(SearchProduct objSearch){
		
		return objHomeDao.getProdSearch(objSearch);
		
	}
	public HashMap<Integer,Integer> deleteFromCart( HashMap<Integer,Integer> objMap,Integer intProdID){
		
		objMap.remove(intProdID);
		return objMap;
	}
	public int cartCheckOut(ShoppingCart objCart,int intUserId){
		Order objOrder = new Order();
		OrderLineItem objLineItem;
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date parsed = null;
		try {
			parsed = format.parse(format.format(new Date()));
			objOrder.setdOrderDate(parsed);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		objOrder.setDblOrderAmt(objCart.getDblTotalCart());
		objOrder.setIntUserId(intUserId);
		objOrder.setStrOrderStatus("Delivered");
		for(LineItem objLine : objCart.getObjLineItemList()){
			objLineItem = new OrderLineItem();
			objLineItem.setIntProdId(objLine.getIntProdId());
			objLineItem.setDblUnitPrice(objLine.getDblPrice());
			objLineItem.setIntOrderQty(objLine.getIntInputQty());
			objLineItem.setStrImageName(objLine.getStrImageName());
			objLineItem.setStrProdDesc(objLine.getStrDesc());	
			objOrder.getObjLineItemList().add(objLineItem);
			objLineItem.setObjOrder(objOrder);
			
			Product objProd = objHomeDao.getProduct(objLine.getIntProdId());
			objProd.setIntQty(objProd.getIntQty() - objLine.getIntInputQty());
			objHomeDao.updateProduct(objProd);
		}
		int orderId = objHomeDao.cartCheckOut(objOrder);
		return orderId;
		
	}
	public List<Order> getHistory(int intUserId){
		
		return objHomeDao.getHistory(intUserId);
	}

}
