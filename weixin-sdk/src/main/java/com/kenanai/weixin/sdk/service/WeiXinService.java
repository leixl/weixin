package com.kenanai.weixin.sdk.service;

import java.io.UnsupportedEncodingException;

public interface WeiXinService {

	/**
	 * 查电影
	 * 
	 * @return
	 */
	public String findMoive();

	/**
	 * 查公交站
	 * 
	 * @return
	 */
	public String findBusStation();

	/**
	 * 查公交线路
	 * 
	 * @return
	 */
	public String findBusLine(String lineNum);

	/**
	 * 查号码
	 * 
	 * @return
	 */
	public String findPhoneNum(String n);

	/**
	 * 查天气
	 * 
	 * @return
	 */
	public String findWeather();

	/**
	 * 查高铁
	 * 
	 * @return
	 */
	public String findHighSpeedRail();

	/**
	 * 查汽车
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String findBus(String start,String end) throws UnsupportedEncodingException;

	/**
	 * 查违章
	 * 
	 * @return
	 */
	public String findViolateregulations();
}
