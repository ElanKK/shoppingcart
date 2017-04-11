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
@Table(name="payment")
public class Payment {
	@Id
    @GeneratedValue
    @Column(name = "payment_id", unique = true, nullable = false)
	private int intPaymentId;
	
	/*@Column(name = "user_id", nullable = false)
	private int intUserid;*/
	
	@Column(name = "card_number", nullable = false)
	private String strCardNum;
	
	@Column(name = "cvv_code", nullable = false)
	private int intCvvCode;
	
	@Column(name = "expiry_date", nullable = false)
	private String strExpiryDate;
	
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
	 * @return the intPaymentId
	 */
	public int getIntPaymentId() {
		return intPaymentId;
	}

	/**
	 * @param intPaymentId the intPaymentId to set
	 */
	public void setIntPaymentId(int intPaymentId) {
		this.intPaymentId = intPaymentId;
	}

	/**
	 * @return the intUserid
	 */
	/*public int getIntUserid() {
		return intUserid;
	}*/

	/**
	 * @param intUserid the intUserid to set
	 */
	/*public void setIntUserid(int intUserid) {
		this.intUserid = intUserid;
	}*/



	/**
	 * @return the intCvvCode
	 */
	public int getIntCvvCode() {
		return intCvvCode;
	}

	

	/**
	 * @return the strCardNum
	 */
	public String getStrCardNum() {
		return strCardNum;
	}

	/**
	 * @param strCardNum the strCardNum to set
	 */
	public void setStrCardNum(String strCardNum) {
		this.strCardNum = strCardNum;
	}

	/**
	 * @param intCvvCode the intCvvCode to set
	 */
	public void setIntCvvCode(int intCvvCode) {
		this.intCvvCode = intCvvCode;
	}

	/**
	 * @return the strExpiryDate
	 */
	public String getStrExpiryDate() {
		return strExpiryDate;
	}

	/**
	 * @param strExpiryDate the strExpiryDate to set
	 */
	public void setStrExpiryDate(String strExpiryDate) {
		this.strExpiryDate = strExpiryDate;
	}

	
	

}
