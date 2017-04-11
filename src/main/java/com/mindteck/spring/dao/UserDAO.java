/**
 * 
 */
package com.mindteck.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import com.mindteck.spring.model.User;
import com.mindteck.spring.model.UserOld;


/**
 * @author Geetha Subramanian
 *
 */
@Repository("UserDAO")
@ComponentScan(basePackages="com.mindteck.spring")
public class UserDAO {
	
	private SessionFactory sessionFactory;
	 
	public SessionFactory getSessionFactory() {
	return sessionFactory;
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
	}
		
	public void insertUser(User objUser) 
	{
		Session session = getSessionFactory().getCurrentSession();
		session.saveOrUpdate(objUser);
		
			
	}
	public void updateUser(User objUser) 
	{
		Session session = getSessionFactory().getCurrentSession();
		session.update(objUser);
		
			
	}
	public User auntheticate(User objUser)
	{
		Session session = getSessionFactory().getCurrentSession();
		User user = null;
		
		@SuppressWarnings("unchecked")
		List<User> userList = session.createCriteria(User.class)
				.add(Restrictions.eq("stremail", objUser.getStremail()))
				.add(Restrictions.eq("strPassword", objUser.getStrPassword())).list();
		
		if (userList.isEmpty()) 
			return user;
		else {
			user = userList.get(0);
			return user;
		}
		
		
	}
	public User getUserDetails(int intUserId){
		Session session = getSessionFactory().getCurrentSession();
		return (User)session.get(User.class, intUserId);
	}
}
