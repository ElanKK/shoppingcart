/**
 * 
 */
package com.mindteck.spring.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * utility class based on dates
 * @author Geetha Subramanian
 *
 */
@Component
public class DateUtil {
	
	public Date getSystemDate(){
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date parsed = null;
		try {
			parsed = format.parse(format.format(new Date()));
						
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return parsed;
	}

}
