package com.leixl.easyframework;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        
        int count = 0;
        
        for(int i = 0 ; i < 20 ; i ++){
        	
        	if(count > 3){
        		System.out.println("退出循环！");
        		break;
        	}
        	
        	System.out.println("继续走……"+count);
        	
        	count ++;
        }
    }
}
