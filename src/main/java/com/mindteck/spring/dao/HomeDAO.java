/**
 * 
 */
package com.mindteck.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import com.mindteck.spring.model.Category;
import com.mindteck.spring.model.Order;
import com.mindteck.spring.model.Product;
import com.mindteck.spring.model.SearchProduct;
import com.mindteck.spring.util.DateUtil;

/**
 * 
 * @author Geetha Subramanian
 *
 */
@Repository("HomeDAO")
@ComponentScan(basePackages="com.mindteck.spring")
public class HomeDAO {
	
	@Autowired
	DateUtil objDate;
	
	private SessionFactory sessionFactory;
	 
	public SessionFactory getSessionFactory() {
	return sessionFactory;
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getCategories()
	{
		Session objSess = getSessionFactory().getCurrentSession();
		List<Category> objCatList = objSess.createCriteria(Category.class).list();
		/*objSess.createCriteria(Category.class)
		.createAlias("objProdList", "prod")
		.add(Restrictions.ge("prod.dExpiryDate", objDate.getSystemDate()))
		.add(Restrictions.gt("prod.intQty", 0))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.list();*/
		return objCatList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getAllProducts()
	{
		Session objSess = getSessionFactory().getCurrentSession();
		
		List<Product> objProdList = objSess.createCriteria(Product.class)
				.add(Restrictions.ge("dExpiryDate", objDate.getSystemDate()))
				.add(Restrictions.gt("intQty", 0))
				.list();
		return objProdList;
	}
	
	public Category getByCategory(int intCatId)
	{
		Session objSess = getSessionFactory().getCurrentSession();
		Category objCat = (Category) objSess.get(Category.class, intCatId);
		return objCat;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getProductsByCategoryId(int intCatId) {
		Session objSess = getSessionFactory().getCurrentSession();
		List<Product> objProdList = objSess.createCriteria(Product.class)
				.createAlias("category", "c")
				.add(Restrictions.eq("c.intCatgId", intCatId))
				.add(Restrictions.ge("dExpiryDate", objDate.getSystemDate()))
				.add(Restrictions.gt("intQty", 0))
				.list();
		return objProdList;
	}
	
	public Product getProduct(int intProdID){
		Session objSess = getSessionFactory().getCurrentSession();
		Product objProd = (Product)objSess.get(Product.class, intProdID);
		return objProd;
		
	}
	@SuppressWarnings("unchecked")
	public List<SearchProduct> searchProducts(String strSearch)
	{
		Session objSess = getSessionFactory().getCurrentSession();
		
		List<Product> objProdList = objSess.createCriteria(Product.class)
				.add(Restrictions.like("strProdName", strSearch, MatchMode.START))
				.add(Restrictions.ge("dExpiryDate", objDate.getSystemDate()))
				.add(Restrictions.gt("intQty", 0))
				.list();
		List<SearchProduct> objSearchList = new ArrayList<SearchProduct>();
		SearchProduct objSearch;
		for(Product objProd: objProdList){
			objSearch = new SearchProduct();
			objSearch.setIntProdID(objProd.getIntProdID());
			objSearch.setStrProdName(objProd.getStrProdName());
			objSearchList.add(objSearch);
		}
		
		return objSearchList;
	}
	@SuppressWarnings("unchecked")
	public List<Product> getProdSearch(SearchProduct objSearch){
		
		Session objSess = getSessionFactory().getCurrentSession();
		List<Product> objProdList = objSess.createCriteria(Product.class)
									.add(Restrictions.ge("dExpiryDate", objDate.getSystemDate()))
									.add(Restrictions.gt("intQty", 0))
									.add(Restrictions.like("strProdName", "%"+objSearch.getStrProdName()+"%", MatchMode.START)).list();
		return objProdList;
		
	}
	public int cartCheckOut(Order objOrder){
		int orderid = 0;
		Session objSess = getSessionFactory().getCurrentSession();
		orderid =  (int) objSess.save(objOrder);
		return orderid;
		
	}
	public void updateProduct(Product objProd){
		Session objSess = getSessionFactory().getCurrentSession();
		objSess.saveOrUpdate(objProd);
		
	}
	@SuppressWarnings("unchecked")
	public List<Order> getHistory(int intUserId){
		Session objSess = getSessionFactory().getCurrentSession();
		return objSess.createCriteria(Order.class).add(Restrictions.eq("intUserId", intUserId)).list();
		
	}

}
