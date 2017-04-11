package com.mindteck.spring.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="user")
public class User{
	
	@Id
    @GeneratedValue
    @Column(name = "user_id", unique = true, nullable = false)
	private int intUserId; 
	
	@Column(name = "first_name", nullable = false)
	private String strFirstName;
	
	@Column(name = "last_name", nullable = false)
	private String strLastName;
	
	@Column(name = "password", nullable = false)
	private String strPassword;
	
	@Column(name = "email", nullable = false)
	private String stremail;
	
	@Column(name = "DOB", nullable = false)
	private Date dDOB;
	
	@Transient
	private String strDOB;
	
	/**
	 * @return the strDOB
	 */
	public String getStrDOB() {
		return strDOB;
	}

	/**
	 * @param strDOB the strDOB to set
	 */
	public void setStrDOB(String strDOB) {
		this.strDOB = strDOB;
	}

	@OneToOne(mappedBy="user",fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private Billing objBilling = new Billing();
	
	@OneToOne(mappedBy="user",fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private Payment objPay = new Payment();

	
	/**
	 * @return the objBilling
	 */
	public Billing getObjBilling() {
		return objBilling;
	}

	/**
	 * @param objBilling the objBilling to set
	 */
	public void setObjBilling(Billing objBilling) {
		this.objBilling = objBilling;
	}

	/**
	 * @return the objPay
	 */
	public Payment getObjPay() {
		return objPay;
	}

	/**
	 * @param objPay the objPay to set
	 */
	public void setObjPay(Payment objPay) {
		this.objPay = objPay;
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
	 * @return the strFirstName
	 */
	public String getStrFirstName() {
		return strFirstName;
	}

	/**
	 * @param strFirstName the strFirstName to set
	 */
	public void setStrFirstName(String strFirstName) {
		this.strFirstName = strFirstName;
	}

	/**
	 * @return the strLastName
	 */
	public String getStrLastName() {
		return strLastName;
	}

	/**
	 * @param strLastName the strLastName to set
	 */
	public void setStrLastName(String strLastName) {
		this.strLastName = strLastName;
	}

	/**
	 * @return the strPassword
	 */
	public String getStrPassword() {
		return strPassword;
	}

	/**
	 * @param strPassword the strPassword to set
	 */
	public void setStrPassword(String strPassword) {
		this.strPassword = strPassword;
	}

	/**
	 * @return the stremail
	 */
	public String getStremail() {
		return stremail;
	}

	/**
	 * @param stremail the stremail to set
	 */
	public void setStremail(String stremail) {
		this.stremail = stremail;
	}

	/**
	 * @return the dDOB
	 */
	public Date getdDOB() {
		return dDOB;
	}

	/**
	 * @param dDOB the dDOB to set
	 */
	public void setdDOB(Date dDOB) {
		this.dDOB = dDOB;
	}
	
	
	

}
