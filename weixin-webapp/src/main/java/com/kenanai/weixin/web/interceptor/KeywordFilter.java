/*
 * @(#)KeywordFilter.java 2011-10-26上午09:22:30
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.web.interceptor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.easyframework.core.ConstantsUtil;

import com.juncsoft.framework.util.text.StringUtils;

/**
 * 关键字过滤（过滤禁止言论的敏感词）
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2011-10-26上午09:22:30 TODO</li>
 * </ul> 
 */

public class KeywordFilter {
	private static Pattern pattern = null;
	 
	/**
	 * 初始化正则表达式字符串
	 * @author sunju
	 * @creationDate. 2011-10-26 上午09:29:33
	 * @throws IOException 
	 */
	private static void initPattern() throws IOException {
		InputStream in = null;
		BufferedReader bf = null;
		in = KeywordFilter.class.getClassLoader().getResourceAsStream("wordCensor.properties");
		bf = new BufferedReader(new InputStreamReader(in, ConstantsUtil.SYSTEM_DEFAULT_ENCODING));
		Properties pro = new Properties();
		pro.load(bf);
		Enumeration<?> enu = pro.propertyNames();
		StringBuilder patternBuf = new StringBuilder("");
		patternBuf.append("(");
		while (enu.hasMoreElements()) {
			patternBuf.append((String)enu.nextElement()).append("|");
		}
		patternBuf.deleteCharAt(patternBuf.length() - 1);
		patternBuf.append(")");
		pattern = Pattern.compile(patternBuf.toString());
		if (in != null)in.close();  
		if (bf != null)bf.close();
	}
	/**
	 * 调用过滤
	 * @author sunju
	 * @creationDate. 2011-10-26 上午09:29:41 
	 * @param str 字符串
	 * @return 过滤后的字符串
	 * @throws IOException 
	 */
	public static String doFilter(String str) throws IOException {
		if (StringUtils.isEmpty(str)) return str;
		initPattern();
		Matcher m = pattern.matcher(str);
		str = m.replaceAll("***");
		return str;
	}
	/**
	 * 调用是否存在判断
	 * @author sunju
	 * @creationDate. 2011-10-26 上午09:30:37 
	 * @param str 字符串
	 * @return 布尔
	 * @throws IOException 
	 */
	public static boolean doBoolFilter(String str) throws IOException {
		if (StringUtils.isEmpty(str)) return false;
		initPattern();
		Matcher m = pattern.matcher(str);
		Boolean b = m.find();
		return b;
	}

	/**
	 * 测试
	 * @author sunju
	 * @creationDate. 2011-10-26 上午09:35:50 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			String str = "测试008李洪志、胡锦涛是的放大师傅";
			System.out.println("str:" + str);
			Date d1 = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss:SSS Z");
			System.out.println("start:" + formatter.format(d1));
			System.out.println("共" + str.length() + "个字符，过滤后的字符串为：\r\n" + doFilter(str));
			Date d2 = new Date();
			System.out.println("end:" + formatter.format(d2));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
