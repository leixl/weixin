/**
 * Project: easyframework-core
 * 
 * File Created at 2014年3月18日
 * $Id$
 * 
 * Copyright 2008 6677bank.com Croporation Limited.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 */
package org.easyframework.core.taobao.items;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkItemsDetailGetRequest;
import com.taobao.api.response.TbkItemsDetailGetResponse;

/**
 *  
 * @author leixl
 * @email  leixl0324@163.com
 * @date   2014年3月18日 上午12:38:11
 * @version v1.0
 */
public class ItemsTest {

	public static void main(String[] args){
		
		TaobaoClient client=new DefaultTaobaoClient("http://item.taobao.com/item.htm?spm=a1z10.1.w5003-5248687655.1.PqMQF4&id=37544074580&scene=taobao_shop", "21754647", "ee311e3a4964798434ecc64245d50014");
		TbkItemsDetailGetRequest req=new TbkItemsDetailGetRequest();
//		req.setTrackIids("value1,value2,value3");
		req.setFields("num_iid,seller_id,nick,title,price,volume,pic_url,item_url,shop_url");
//		req.setNumIids("1,2,3");
		try {
			TbkItemsDetailGetResponse response = client.execute(req);
			System.out.println(response);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
