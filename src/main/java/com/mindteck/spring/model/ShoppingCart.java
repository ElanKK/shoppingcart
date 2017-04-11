/**
 * 
 */
package com.mindteck.spring.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Class to hold the list of items in the shopping cart
 * @author Geetha Subramanian
 *
 */
public class ShoppingCart {
	
	public List<LineItem> objLineItemList = new ArrayList<>();
	public double dblTotalProducts;
	public double dblTax;
	public double dblTotalCart;

	/**
	 * @return the objLineItemList
	 */
	public List<LineItem> getObjLineItemList() {
		return objLineItemList;
	}

	/**
	 * @param objLineItemList the objLineItemList to set
	 */
	public void setObjLineItemList(List<LineItem> objLineItemList) {
		this.objLineItemList = objLineItemList;
	}

	/**
	 * @return the dblTotalProducts
	 */
	public double getDblTotalProducts() {
		return dblTotalProducts;
	}

	/**
	 * @param dblTotalProducts the dblTotalProducts to set
	 */
	public void setDblTotalProducts(double dblTotalProducts) {
		this.dblTotalProducts = dblTotalProducts;
	}

	/**
	 * @return the dblTax
	 */
	public double getDblTax() {
		return dblTax;
	}

	/**
	 * @param dblTax the dblTax to set
	 */
	public void setDblTax(double dblTax) {
		this.dblTax = dblTax;
	}

	/**
	 * @return the dblTotalCart
	 */
	public double getDblTotalCart() {
		return dblTotalCart;
	}

	/**
	 * @param dblTotalCart the dblTotalCart to set
	 */
	public void setDblTotalCart(double dblTotalCart) {
		this.dblTotalCart = dblTotalCart;
	}
	

}
