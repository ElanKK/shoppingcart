package com.mindteck.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import com.mindteck.spring.model.Products;

@Repository("ProductDAO")
@ComponentScan(basePackages="com.mindteck.spring")
public class ProductDAO {
	private SessionFactory sessionFactory;
	 
	public SessionFactory getSessionFactory() {
	return sessionFactory;
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
	}
	
	public List<Products> getProductList(){
		Session session = getSessionFactory().getCurrentSession();
		
		@SuppressWarnings("unchecked")
		List<Products> objProds = session.createCriteria(Products.class).list();
		return objProds;
	}
	
	public void updateProduct(Products objProd)
	{
		Session session = getSessionFactory().getCurrentSession();
		session.update(objProd);
		
	}
	public Products getProduct(int intProdid)
	{
		Session session = getSessionFactory().getCurrentSession();
		
		Products objProd =  (Products)session.get(Products.class, intProdid);
		return objProd;
		
	}
	public void addProduct(Products objProd)
	{
		Session session = getSessionFactory().getCurrentSession();
		session.save(objProd);
		
	}
	public void deletProduct(Products objProd)
	{
		Session session = getSessionFactory().getCurrentSession();
		session.delete(objProd);
		
	}
	

}
