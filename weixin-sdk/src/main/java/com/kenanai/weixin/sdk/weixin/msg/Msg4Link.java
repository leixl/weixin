package com.kenanai.weixin.sdk.weixin.msg;

import org.w3c.dom.Document;

import com.kenanai.weixin.sdk.weixin.WXXmlElementName;

/**
 * 链接消息
 * @author marker
 * */
public class Msg4Link extends Msg {

	//消息标题
	private String title;	 
	//消息描述
	private String description;	 
	//消息链接
	private String url;	 
	//消息id，64位整型
	private String msgId;
	
	
	/**
	 * 开发者调用创建实例
	 * */
	public Msg4Link() {
		this.head = new Msg4Head();
		this.head.setMsgType(Msg.MSG_TYPE_LINK);
	}
	
	/**
	 * 推送来的消息采用此构造
	 * @param head
	 */
	public Msg4Link(Msg4Head head) {
		this.head = head; 
	}

	@Override
	public void write(Document document) { }
	
	@Override
	public void read(Document document) {
		this.title = document.getElementsByTagName(WXXmlElementName.TITLE).item(0).getTextContent();
		this.description = document.getElementsByTagName(WXXmlElementName.DESCRITION).item(0).getTextContent();
		this.url = document.getElementsByTagName(WXXmlElementName.URL).item(0).getTextContent();
		this.msgId = document.getElementsByTagName(WXXmlElementName.MSG_ID).item(0).getTextContent();
	} 
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

}
