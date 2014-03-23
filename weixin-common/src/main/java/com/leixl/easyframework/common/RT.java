/**
 * Project: easyframework-common
 * 
 * File Created at 2014年1月21日
 * $Id$
 * 
 * Copyright 2013 leixl.com Croporation Limited.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 */
package com.leixl.easyframework.common;



/**
 *  
 * @author leixl
 * @date   2014年1月21日 上午10:59:22
 * @version v1.0
 */
public class RT {
	
	

	 public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		 T t = (T) Class.forName("com.leixl.easyframework.common.T").newInstance();
		 t.test();;
	 }
}
