/**
 * Project: easyframework-core
 * 
 * File Created at 2014年1月15日
 * $Id$
 * 
 * Copyright 2013 leixl.com Croporation Limited.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 */
package org.easyframework.core;

/**
 *  
 * @author leixl
 * @date   2014年1月15日 下午2:34:08
 * @version v1.0
 */
public class ProducerConsumer {  
    public static void main(String[] args) {  
        ShareData sd = new ShareData();  
        new Producer(sd).start();  
        new Consumer(sd).start();  
    }  
}  
   
class Producer extends Thread{  
       
    private ShareData sd;  
    public Producer(ShareData sd){  
        this.sd = sd;  
    }  
       
    @Override 
    public void run() {  
        for(int i = 0; i < 20; i++){  
            int product = (int)(Math.random()*1000);  
            sd.setArray(product);  
            try {  
                Thread.sleep((int)(Math.random()*200));  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}  
   
class Consumer extends Thread{  
    private ShareData sd;  
    public Consumer(ShareData sd){  
        this.sd = sd;  
    }  
    @Override 
    public void run() {  
        for(int i = 0; i < 20; i++){  
            sd.getArray();  
            try {  
                Thread.sleep((int)(Math.random()*200));  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}  
   
class ShareData{  
    private static int shareArray[] = new int[10];  
    private int count;  
    private int in;  
    private int out;  
       
    ShareData(){  
        this.count = 0;  
        this.in = 0;  
        this.out = 0;  
    }  
       
    public synchronized void setArray(int product){  
        try{  
            while(count >= shareArray.length){  
                System.out.println("array full.");  
                this.wait();  
            }  
            this.notify();  
        }catch (Exception e) {  
            e.printStackTrace();  
        }  
        shareArray[in] = product;  
        count++;  
        System.out.println("produce: " + product);  
        in = (in + 1) % shareArray.length;  
    }  
       
    public synchronized int getArray(){  
        try{  
            while(count <= 0){  
                System.out.println("array empty.");  
                this.wait();  
            }  
            this.notify();  
        }catch(Exception e){  
            e.printStackTrace();  
        }  
        int consume = shareArray[out];  
        count--;  
        System.out.println("consume: " + consume);  
        out = (out + 1) % shareArray.length;  
        notify();  
        return consume;  
    }  
} 
