package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("이메일 ID", "이매일 password");
	}
}
