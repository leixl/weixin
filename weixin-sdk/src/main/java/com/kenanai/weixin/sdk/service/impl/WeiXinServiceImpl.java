package com.kenanai.weixin.sdk.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.kenanai.weixin.sdk.service.WeiXinService;

public class WeiXinServiceImpl implements WeiXinService {

	@Override
	public String findMoive() {
		// TODO Auto-generated method stub
		return "查询电影接口开发中";
	}

	@Override
	public String findBusStation() {
		// TODO Auto-generated method stub

		return "http://m.46644.com/tool/transit/?width=320&tpltype=weixin";
	}

	@Override
	public String findBusLine(String lineNum) {
		String result = "";
		try {
			URL uAddr = new URL(
					"http://m.46644.com/tool/transit/?act=num&transitno="
							+ lineNum + "&transitcity="
							+ java.net.URLEncoder.encode("湖州", "UTF-8"));
			URLConnection conn = uAddr.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(false);
			conn.setConnectTimeout(2000);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null)
				result = inputLine;
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject json = JSONObject.fromObject(result);
		String code = json.get("error").toString();
		StringBuffer sb = new StringBuffer();
		if (code.equals("0")) {
			JSONObject j = JSONObject.fromObject(json.get("data"));
			JSONObject temp = null;
			String flag = null;
			JSONArray obj = j.getJSONArray("son");
			for (int i = 0; i < obj.size(); i++) {
				temp = obj.getJSONObject(i);
				flag = temp.get("seqno").toString();
				if (flag.startsWith("-")) {
					sb.append(i + ":" + temp.get("station") + "\n");
				}

			}
			return sb.toString();
		} else {
			return "查无信息";
		}

	}

	@Override
	public String findPhoneNum(String n) {
		StringBuffer sb = new StringBuffer();

		try {
			StringBuffer result = new StringBuffer();
			URL uAddr = new URL(
					"http://api.map.baidu.com/place/v2/search?ak=YWfdbiL7FKHM6S7jTcMiBktv&output=json&query="
							+ n + "&page_size=10&page_num=0&scope=1&region=湖州");
			URLConnection conn = uAddr.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(false);
			conn.setConnectTimeout(2000);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null)
				result.append(inputLine);

			JSONObject json = JSONObject.fromObject(result.toString());
			JSONObject temp = null;
			JSONArray obj = json.getJSONArray("results");

			for (int i = 0; i < obj.size(); i++) {
				temp = obj.getJSONObject(i);
				String name = temp.get("name").toString();
				String address = temp.get("address").toString();
				String telephone = temp.get("telephone") == null ? "无" : temp
						.get("telephone").toString();
				if (name.indexOf(n) != -1 && address.split(";").length < 2) {
					sb.append("名称：" + name + " 地址：" + address + " 电话："
							+ telephone + "\n");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (sb.toString().equals("")) {
			sb.append("无此信息");
		}
		return sb.toString();
	}

	@Override
	public String findWeather() {
		String result = "";
		try {
			URL uAddr = new URL(
					"http://www.weather.com.cn/data/cityinfo/101210201.html");
			URLConnection conn = uAddr.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(false);
			conn.setConnectTimeout(2000);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null)
				result = inputLine;
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject json = JSONObject.fromObject(result);
		json = JSONObject.fromObject(json.get("weatherinfo"));
		StringBuffer sb = new StringBuffer();
		if (json != null) {
			sb.append("今日气温" + json.get("temp1") + "——" + json.get("temp2")
					+ "," + json.get("weather"));
			return sb.toString();
		} else {
			return "自己看窗外吧~系统崩溃了";
		}

	}

	@Override
	public String findHighSpeedRail() {
		// TODO Auto-generated method stub
		return "查询高铁接口开发中";
	}

	@Override
	public String findBus(String start, String end)
			throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		return "http://m.46644.com/tool/bus/?start="
				+ java.net.URLEncoder.encode(start, "UTF-8") + "&end="
				+ java.net.URLEncoder.encode(end, "UTF-8") + "&tpltype=weixin";
	}

	@Override
	public String findViolateregulations() {
		// TODO Auto-generated method stub
		return "http://www.hzgaj.gov.cn/weixinPublicPlatform/index.html?from=singlemessage&isappinstalled=0";
	}

	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer();
		String n = "嘉乐迪";
		try {
			StringBuffer result = new StringBuffer();
			URL uAddr = new URL(
					"http://api.map.baidu.com/place/v2/search?ak=YWfdbiL7FKHM6S7jTcMiBktv&output=json&query="
							+ n + "&page_size=10&page_num=0&scope=1&region=湖州");
			URLConnection conn = uAddr.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(false);
			conn.setConnectTimeout(2000);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null)
				result.append(inputLine);

			JSONObject json = JSONObject.fromObject(result.toString());
			JSONObject temp = null;
			JSONArray obj = json.getJSONArray("results");

			for (int i = 0; i < obj.size(); i++) {
				temp = obj.getJSONObject(i);
				String name = temp.get("name").toString();
				String address = temp.get("address") == null ? "无" : temp.get(
						"address").toString();
				String telephone = temp.get("telephone") == null ? "无" : temp
						.get("telephone").toString();
				if (name.indexOf(n) != -1 && address.split(";").length < 2) {
					sb.append("名称：" + name + " 地址：" + address + " 电话："
							+ telephone + "\n");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (sb.toString().equals("")) {
			sb.append("无此信息");
		}
		System.out.println(sb.toString());
	}
}
