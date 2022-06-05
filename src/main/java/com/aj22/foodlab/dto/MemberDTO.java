package com.aj22.foodlab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	
@AllArgsConstructor	
@NoArgsConstructor
public class MemberDTO implements java.io.Serializable {

	 	private int id;
	 	private String username;
	 	private String email;
	    private String password;
	    private String profile_img_origin_name;
		private String profile_img_saved_name;
		private String profile_img_saved_path;
		private String profile_img;
		private int userEmailChecked;

    public void print() { 
		System.out.println(this); 
	}
    

    @Override public String toString() { 
		return "Member Id=" + id + " Password=" + password + " Email=" + email
				+ "Member Nickname =" + username; 
	}
}
