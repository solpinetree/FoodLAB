package com.aj22.foodlab.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	// Account to perform email authentication
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("ksi020506@naver.com", "aaaa!");
	}
}
