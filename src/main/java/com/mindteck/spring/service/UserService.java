package com.mindteck.spring.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mindteck.spring.dao.UserDAO;
import com.mindteck.spring.model.Billing;
import com.mindteck.spring.model.Payment;
import com.mindteck.spring.model.User;
import com.mindteck.spring.model.UserOld;


/**
 * Login Service
 */
@Service("LoginService")
@ComponentScan(basePackages="com.mindteck.spring")
@Transactional

public class UserService {
	
    @Autowired
    private UserDAO objUserdao;

	public User authenticateUser(User objUser)
	{
		return objUserdao.auntheticate(objUser);
	}
	public void createUser(User objUser)
	{
		 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy"); 
			Date parsed;
			try {
				
				parsed = format.parse(objUser.getStrDOB());
				objUser.setdDOB(parsed);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Billing billing = objUser.getObjBilling();
			billing.setUser(objUser);
			Payment payment = objUser.getObjPay();
			payment.setUser(objUser);
		objUserdao.insertUser(objUser);
	}
	public void updateUser(User objUser)
	{
		 SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy"); 
			Date parsed;
			try {
				
				parsed = format.parse(objUser.getStrDOB());
				objUser.setdDOB(parsed);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Billing billing = objUser.getObjBilling();
			billing.setUser(objUser);
			Payment payment = objUser.getObjPay();
			payment.setUser(objUser);
		objUserdao.updateUser(objUser);
	}
	public User getUserDetails(int intUserId)
	{
		User objUser = null;
		objUser = objUserdao.getUserDetails(intUserId);
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy"); 
		try {
			objUser.setStrDOB(format.format((objUser.getdDOB())));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return objUser;
	}

}
