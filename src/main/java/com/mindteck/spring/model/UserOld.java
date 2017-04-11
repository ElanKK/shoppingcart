package com.mindteck.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_table")
public class UserOld{
	
	@Id
    @GeneratedValue
    @Column(name = "user_id", unique = true, nullable = false)
	private int intUserId; 
	
	@Column(name = "user_name", nullable = false)
	private String strUserName;
	
	@Column(name = "password", nullable = false)
	private String strPassword;
	
	@Column(name = "email", nullable = false)
	private String stremail;
	
	@Column(name = "address_line_1", nullable = false)
	private String strAddress1;
	
	@Column(name = "address_line_2", nullable = true)
	private String strAddress2;
	
	@Column(name = "city", nullable = false)
	private String strCity;
	
	@Column(name = "state", nullable = false)
	private String strState;
	
	@Column(name = "zip_code", nullable = false)
	private String strZipCode;
	
	
	public int getIntUserId() {
		return intUserId;
	}
	public void setIntUserId(int intUserId) {
		this.intUserId = intUserId;
	}
	
	public String getStrUserName() {
		return strUserName;
	}
	public void setStrUserName(String strUserName) {
		this.strUserName = strUserName;
	}
	
	
	public String getStrPassword() {
		return strPassword;
	}
	public void setStrPassword(String strPassword) {
		this.strPassword = strPassword;
	}
	
	public String getStremail() {
		return stremail;
	}
	public void setStremail(String stremail) {
		this.stremail = stremail;
	}
	
	public String getStrAddress1() {
		return strAddress1;
	}
	public void setStrAddress1(String strAddress1) {
		this.strAddress1 = strAddress1;
	}
	
	public String getStrAddress2() {
		return strAddress2;
	}
	public void setStrAddress2(String strAddress2) {
		this.strAddress2 = strAddress2;
	}
	
	public String getStrCity() {
		return strCity;
	}
	public void setStrCity(String strCity) {
		this.strCity = strCity;
	}
	
	public String getStrState() {
		return strState;
	}
	public void setStrState(String strState) {
		this.strState = strState;
	}
	
	public String getStrZipCode() {
		return strZipCode;
	}
	public void setStrZipCode(String strZipCode) {
		this.strZipCode = strZipCode;
	}
	
	
	
	

}
