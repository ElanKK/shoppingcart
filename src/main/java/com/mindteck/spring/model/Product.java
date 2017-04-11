/**
 * 
 */
package com.mindteck.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * POJO class to get the product details
 * 
 * @author Geetha Subramanian
 *
 */

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue
	@Column(name = "product_id", unique = true, nullable = false)
	Integer intProdID;
	//@Column(name = "category_id", nullable = false)
	//Integer intCateID;
	@Column(name = "product_name", nullable = false)
	String strProdName;
	@Column(name = "description", nullable = false)
	String strProdDesc;
	@Column(name = "quantity", nullable = false)
	Integer intQty;
	@Column(name = "price", nullable = false)
	Double dblPrice;
	@Column(name = "expiry_date", nullable = false)
	Date dExpiryDate;
	@Column(name = "Brand", nullable = false)
	String strBrand;
	@Column(name = "image_name", nullable = false)
	String strImageName;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	Category category;
	
	

	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}

	/**
	 * @return the intProdID
	 */
	public Integer getIntProdID() {
		return intProdID;
	}

	/**
	 * @param intProdID
	 *            the intProdID to set
	 */
	public void setIntProdID(Integer intProdID) {
		this.intProdID = intProdID;
	}

	
	/**
	 * @return the strProdName
	 */
	public String getStrProdName() {
		return strProdName;
	}

	/**
	 * @param strProdName
	 *            the strProdName to set
	 */
	public void setStrProdName(String strProdName) {
		this.strProdName = strProdName;
	}

	/**
	 * @return the strProdDesc
	 */
	public String getStrProdDesc() {
		return strProdDesc;
	}

	/**
	 * @param strProdDesc
	 *            the strProdDesc to set
	 */
	public void setStrProdDesc(String strProdDesc) {
		this.strProdDesc = strProdDesc;
	}

	/**
	 * @return the intQty
	 */
	public Integer getIntQty() {
		return intQty;
	}

	/**
	 * @param intQty
	 *            the intQty to set
	 */
	public void setIntQty(Integer intQty) {
		this.intQty = intQty;
	}

	/**
	 * @return the dblPrice
	 */
	public Double getDblPrice() {
		return dblPrice;
	}

	/**
	 * @param dblPrice
	 *            the dblPrice to set
	 */
	public void setDblPrice(Double dblPrice) {
		this.dblPrice = dblPrice;
	}

	/**
	 * @return the dExpiryDate
	 */
	public Date getdExpiryDate() {
		return dExpiryDate;
	}

	/**
	 * @param dExpiryDate
	 *            the dExpiryDate to set
	 */
	public void setdExpiryDate(Date dExpiryDate) {
		this.dExpiryDate = dExpiryDate;
	}

	/**
	 * @return the strBrand
	 */
	public String getStrBrand() {
		return strBrand;
	}

	/**
	 * @param strBrand
	 *            the strBrand to set
	 */
	public void setStrBrand(String strBrand) {
		this.strBrand = strBrand;
	}

	/**
	 * @return the strImageName
	 */
	public String getStrImageName() {
		return strImageName;
	}

	/**
	 * @param strImageName
	 *            the strImageName to set
	 */
	public void setStrImageName(String strImageName) {
		this.strImageName = strImageName;
	}

}
