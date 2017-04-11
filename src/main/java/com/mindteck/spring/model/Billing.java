package com.mindteck.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="billing")
public class Billing {
	@Id
    @GeneratedValue
    @Column(name = "billing_id", unique = true, nullable = false)
	private int intBillingId;
	
	/*@Column(name = "user_id", nullable = false)
	private int intUserId;*/
	
	@Column(name = "address_1", nullable = false)
	private String straddress1;
	
	@Column(name = "address_2")
	private String straddress2;
	
	@Column(name = "city", nullable = false)
	private String strCity;
	
	@Column(name = "state", nullable = false)
	private String strState;
	
	@Column(name = "zipcode", nullable = false)
	private String strZipCode;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the intBillingId
	 */
	public int getIntBillingId() {
		return intBillingId;
	}

	/**
	 * @param intBillingId the intBillingId to set
	 */
	public void setIntBillingId(int intBillingId) {
		this.intBillingId = intBillingId;
	}

	/**
	 * @return the intUserId
	 */
	/*public int getIntUserId() {
		return intUserId;
	}*/

	/**
	 * @param intUserId the intUserId to set
	 */
	/*public void setIntUserId(int intUserId) {
		this.intUserId = intUserId;
	}*/

	/**
	 * @return the straddress1
	 */
	public String getStraddress1() {
		return straddress1;
	}

	/**
	 * @param straddress1 the straddress1 to set
	 */
	public void setStraddress1(String straddress1) {
		this.straddress1 = straddress1;
	}

	/**
	 * @return the straddress2
	 */
	public String getStraddress2() {
		return straddress2;
	}

	/**
	 * @param straddress2 the straddress2 to set
	 */
	public void setStraddress2(String straddress2) {
		this.straddress2 = straddress2;
	}

	/**
	 * @return the strCity
	 */
	public String getStrCity() {
		return strCity;
	}

	/**
	 * @param strCity the strCity to set
	 */
	public void setStrCity(String strCity) {
		this.strCity = strCity;
	}

	/**
	 * @return the strState
	 */
	public String getStrState() {
		return strState;
	}

	/**
	 * @param strState the strState to set
	 */
	public void setStrState(String strState) {
		this.strState = strState;
	}

	/**
	 * @return the strZipCode
	 */
	public String getStrZipCode() {
		return strZipCode;
	}

	/**
	 * @param strZipCode the strZipCode to set
	 */
	public void setStrZipCode(String strZipCode) {
		this.strZipCode = strZipCode;
	}
	
	


}
