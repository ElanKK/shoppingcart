/**
 * 
 */
package com.mindteck.spring.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * POJO Class for holding the categories
 * @author Geetha Subramanian
 *
 */
@Entity
@Table(name="category")
public class Category {
	
	@Id
    @GeneratedValue
    @Column(name = "category_id", unique = true, nullable = false)
	Integer intCatgId;
	@Column(name = "category", nullable = false)
	String strCategory;
	
	
	@OneToMany(mappedBy="category",fetch=FetchType.LAZY)
	List<Product> objProdList = new ArrayList<Product>();
	
	
	/**
	 * @return the objProdList
	 */
	public List<Product> getObjProdList() {
		return objProdList;
	}
	/**
	 * @param objProdList the objProdList to set
	 */
	public void setObjProdList(List<Product> objProdList) {
		this.objProdList = objProdList;
	}
	/**
	 * @return the intCatgId
	 */
	public Integer getIntCatgId() {
		return intCatgId;
	}
	/**
	 * @param intCatgId the intCatgId to set
	 */
	public void setIntCatgId(Integer intCatgId) {
		this.intCatgId = intCatgId;
	}
	/**
	 * @return the strCategory
	 */
	public String getStrCategory() {
		return strCategory;
	}
	/**
	 * @param strCategory the strCategory to set
	 */
	public void setStrCategory(String strCategory) {
		this.strCategory = strCategory;
	}
	

}
