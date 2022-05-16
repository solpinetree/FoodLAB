package com.aj22.foodlab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	// 이게 getter, setter 입니다
@AllArgsConstructor	// 모든 필드가 있는 constructor
@NoArgsConstructor
public class MemberDTO implements java.io.Serializable {

    private int memberId;
    private String password;
    private String email;
    private String username;
    
    

    public void print() { 
		System.out.println(this); 
	}
    
    public boolean validate() {
    	if(password.equals("aaa")&&(username.equals("aaa")))
    		return true;
    	else
    		return false;
    }

    @Override public String toString() { 
		return "Member Id=" + memberId + " Password=" + password + " Email=" + email
				+ "Member Nickname =" + username; 
	}
}
