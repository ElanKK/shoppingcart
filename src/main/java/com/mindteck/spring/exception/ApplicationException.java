package com.mindteck.spring.exception;

public class ApplicationException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6415313397286423417L;
	Exception objException;

	/**
	 * @return the objException
	 */
	public Exception getObjException() {
		return objException;
	}

	/**
	 * @param objException
	 *            the objException to set
	 */
	public void setObjException(Exception objException) {
		this.objException = objException;
	}

	/**
	 * @param objException
	 */
	public ApplicationException(Exception objException) {
		super();
		this.objException = objException;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ApplicationException [objException=" + objException + "]";
	}

}
