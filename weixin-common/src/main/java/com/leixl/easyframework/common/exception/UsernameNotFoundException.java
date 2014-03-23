package com.leixl.easyframework.common.exception;

/**
 * 用户名没有找到异常
 */
@SuppressWarnings("serial")
public class UsernameNotFoundException extends AuthenticationException {
	public UsernameNotFoundException() {
	}

	public UsernameNotFoundException(String msg) {
		super(msg);
	}
}