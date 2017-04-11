/**
 * 
 */
package com.mindteck.spring.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Class to hold the order details
 * @author Geetha Subramanian
 *
 */
@Entity
@Table(name="order_table")
public class Order {
	
	@Id
    @GeneratedValue
    @Column(name = "order_id", unique = true, nullable = false)
	private int intOrderId;
	
	@Column(name = "user_id", nullable = false)
	private int intUserId;
	 
	@Column(name = "order_date", nullable = false)
	private Date dOrderDate;
	 
	@Column(name = "order_amount", nullable = false)
	private double dblOrderAmt;
	 
	@Column(name = "status", nullable = false)
	private String strOrderStatus;
	
	@OneToMany(mappedBy="objOrder",fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	List<OrderLineItem> objLineItemList = new ArrayList<OrderLineItem>();

	/**
	 * @return the intOrderId
	 */
	public int getIntOrderId() {
		return intOrderId;
	}

	/**
	 * @param intOrderId the intOrderId to set
	 */
	public void setIntOrderId(int intOrderId) {
		this.intOrderId = intOrderId;
	}

	/**
	 * @return the intUserId
	 */
	public int getIntUserId() {
		return intUserId;
	}

	/**
	 * @param intUserId the intUserId to set
	 */
	public void setIntUserId(int intUserId) {
		this.intUserId = intUserId;
	}

	/**
	 * @return the dblOrderAmt
	 */
	public double getDblOrderAmt() {
		return dblOrderAmt;
	}

	/**
	 * @return the dOrderDate
	 */
	public Date getdOrderDate() {
		return dOrderDate;
	}

	/**
	 * @param dOrderDate the dOrderDate to set
	 */
	public void setdOrderDate(Date dOrderDate) {
		this.dOrderDate = dOrderDate;
	}

	/**
	 * @param dblOrderAmt the dblOrderAmt to set
	 */
	public void setDblOrderAmt(double dblOrderAmt) {
		this.dblOrderAmt = dblOrderAmt;
	}

	/**
	 * @return the strOrderStatus
	 */
	public String getStrOrderStatus() {
		return strOrderStatus;
	}

	/**
	 * @param strOrderStatus the strOrderStatus to set
	 */
	public void setStrOrderStatus(String strOrderStatus) {
		this.strOrderStatus = strOrderStatus;
	}

	/**
	 * @return the objLineItemList
	 */
	public List<OrderLineItem> getObjLineItemList() {
		return objLineItemList;
	}

	/**
	 * @param objLineItemList the objLineItemList to set
	 */
	public void setObjLineItemList(List<OrderLineItem> objLineItemList) {
		this.objLineItemList = objLineItemList;
	}
	
	

}
