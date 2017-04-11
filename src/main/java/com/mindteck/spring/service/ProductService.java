package com.mindteck.spring.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mindteck.spring.dao.ProductDAO;
import com.mindteck.spring.model.Products;

@Service("ProductService")
@ComponentScan(basePackages="com.mindteck.spring")
@Transactional
public class ProductService {
	
	 @Autowired
	    private ProductDAO objProductdao;
	 
	 public List<Products> getProductList()
	 {
		 return objProductdao.getProductList();
	 }
	 public void deleteProduct(int intProdId)
	 {
		 
		 objProductdao.deletProduct(getProduct(intProdId));
	 }
	 public Products getProduct(int intProdId)
	 {
		Products objProd = objProductdao.getProduct(intProdId);
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy"); 
			try {
				objProd.setStrProdExp(format.format((objProd.getdProdExp())));
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return objProd;
	 }
	 public void addProduct(Products objProd){
		 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy"); 
			Date parsed;
			try {
				parsed = format.parse(objProd.getStrProdExp());
				objProd.setdProdExp(parsed);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		 objProductdao.addProduct(objProd);
	 }
	 public void updateProduct(Products objProd){
		 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy"); 
			Date parsed;
			try {
				parsed = format.parse(objProd.getStrProdExp());
				objProd.setdProdExp(parsed);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		 objProductdao.updateProduct(objProd);
	 }

}
