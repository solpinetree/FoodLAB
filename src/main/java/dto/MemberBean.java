package dto;

public class MemberBean implements java.io.Serializable {

    
    private String password;
    private String email;
    private String nickname;
    
    public MemberBean() { 
    	this("a", "b","c"); 
	}

    public MemberBean(String password, String email, String nickname) {
        this.password = password;
        this.email = email;
        this.nickname = nickname;
    }

    
	public void setEmail(String email) { 
		this.email = email; 
	}
    
	public void setPassword(String password) { 
		this.password = password; 
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
    
	
    public String getPassword() { 
		return password; 
	}

    public String getEmail() { 
		return email; 
	}
    
    public String getNickname() { 
		return nickname; 
	}

    public void print() { 
		System.out.println(this); 
	}
    
  

    @Override public String toString() { 
		return "Password=" + password + " Email=" + email
				+ "Member Nickname =" + nickname; 
	}
}
