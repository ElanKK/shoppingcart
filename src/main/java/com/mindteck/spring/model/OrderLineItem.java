/**
 * 
 */
package com.mindteck.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Class to hold the order line items.
 * @author Geetha Subramanian
 *
 */

@Entity
@Table(name="order_line_item")
public class OrderLineItem {
	
	@Id
    @GeneratedValue
    @Column(name = "line_item_id", unique = true, nullable = false)
	private int intlineItemId;
	
	@Column(name = "product_id", nullable = false)
	private int intProdId;
	
	@Column(name = "product_desc", nullable = false)
	private String strProdDesc;
	
	@Column(name = "unit_price", nullable = false)
	private double dblUnitPrice;
	
	@Column(name = "image_name", nullable = false)
	private String strImageName;
	
	@Column(name = "order_quantity", nullable = false)
	private int intOrderQty;
	
	@Column(name = "total_amount", nullable = false)
	private double dblLineTotal;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", nullable = false)
	Order objOrder;

	/**
	 * @return the intlineItemId
	 */
	public int getIntlineItemId() {
		return intlineItemId;
	}

	/**
	 * @param intlineItemId the intlineItemId to set
	 */
	public void setIntlineItemId(int intlineItemId) {
		this.intlineItemId = intlineItemId;
	}

	/**
	 * @return the intProdId
	 */
	public int getIntProdId() {
		return intProdId;
	}

	/**
	 * @param intProdId the intProdId to set
	 */
	public void setIntProdId(int intProdId) {
		this.intProdId = intProdId;
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
	 * @return the dblUnitPrice
	 */
	public double getDblUnitPrice() {
		return dblUnitPrice;
	}

	/**
	 * @param dblUnitPrice the dblUnitPrice to set
	 */
	public void setDblUnitPrice(double dblUnitPrice) {
		this.dblUnitPrice = dblUnitPrice;
	}

	/**
	 * @return the strImageName
	 */
	public String getStrImageName() {
		return strImageName;
	}

	/**
	 * @param strImageName the strImageName to set
	 */
	public void setStrImageName(String strImageName) {
		this.strImageName = strImageName;
	}

	/**
	 * @return the intOrderQty
	 */
	public int getIntOrderQty() {
		return intOrderQty;
	}

	/**
	 * @param intOrderQty the intOrderQty to set
	 */
	public void setIntOrderQty(int intOrderQty) {
		this.intOrderQty = intOrderQty;
	}

	/**
	 * @return the dblLineTotal
	 */
	public double getDblLineTotal() {
		return dblLineTotal;
	}

	/**
	 * @param dblLineTotal the dblLineTotal to set
	 */
	public void setDblLineTotal(double dblLineTotal) {
		this.dblLineTotal = dblLineTotal;
	}

	/**
	 * @return the objOrder
	 */
	public Order getObjOrder() {
		return objOrder;
	}

	/**
	 * @param objOrder the objOrder to set
	 */
	public void setObjOrder(Order objOrder) {
		this.objOrder = objOrder;
	}
	

}
