package com.aj22.foodlab.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("foodLAB1357@gmail.com", "foodlab123kk!");
	}
}
