/**
 * 
 */
package com.mindteck.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author Geetha Subramanian
 *
 */
@Entity
@Table(name="products")
public class Products {
	@Id
    @GeneratedValue
    @Column(name = "Product_id", unique = true, nullable = false)
	Integer intProdid ; 
	@Column(name = "Product_Name", unique = true, nullable = false)
	String strProdName;
	@Column(name = "Product_Description")
	String strProdDesc;
	@Column(name = "Quantity")
	Integer intProdQty;
	@Column(name = "Exp_Date")
	Date dProdExp;
	@Transient
	String strProdExp;
	
	/**
	 * @param intProdid
	 * @param strProdName
	 * @param strProdDesc
	 * @param intProdQty
	 * @param dProdExp
	 * @param strProdExp
	 */
	public Products(Integer intProdid, String strProdName, String strProdDesc, Integer intProdQty, Date dProdExp,
			String strProdExp) {
		super();
		this.intProdid = intProdid;
		this.strProdName = strProdName;
		this.strProdDesc = strProdDesc;
		this.intProdQty = intProdQty;
		this.dProdExp = dProdExp;
		this.strProdExp = strProdExp;
	}
	/**
	 * 
	 */
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the intProdid
	 */
	public Integer getIntProdid() {
		return intProdid;
	}
	/**
	 * @param intProdid the intProdid to set
	 */
	public void setIntProdid(Integer intProdid) {
		this.intProdid = intProdid;
	}
	/**
	 * @return the strProdName
	 */
	public String getStrProdName() {
		return strProdName;
	}
	/**
	 * @param strProdName the strProdName to set
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
	 * @param strProdDesc the strProdDesc to set
	 */
	public void setStrProdDesc(String strProdDesc) {
		this.strProdDesc = strProdDesc;
	}
	/**
	 * @return the intProdQty
	 */
	public Integer getIntProdQty() {
		return intProdQty;
	}
	/**
	 * @param intProdQty the intProdQty to set
	 */
	public void setIntProdQty(Integer intProdQty) {
		this.intProdQty = intProdQty;
	}
	/**
	 * @return the dProdExp
	 */
	public Date getdProdExp() {
		return dProdExp;
	}
	/**
	 * @param dProdExp the dProdExp to set
	 */
	public void setdProdExp(Date dProdExp) {
		this.dProdExp = dProdExp;
	}
	/**
	 * @return the strProdExp
	 */
	public String getStrProdExp() {
		return strProdExp;
	}
	/**
	 * @param strProdExp the strProdExp to set
	 */
	public void setStrProdExp(String strProdExp) {
		this.strProdExp = strProdExp;
	}
	
	
	
	
	
	

}
