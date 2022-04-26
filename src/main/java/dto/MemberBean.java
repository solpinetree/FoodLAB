package dto;

public class MemberBean implements java.io.Serializable {

    private String id;
    private String password;
    private String email;
    private String nickname;
    
    public MemberBean() { 
    	this("a", "b","c","d"); 
	}

    public MemberBean(String id, String password, String email, String nickname) {
        this.id = id;
        this.password = password;
        this.email = email;
        this.nickname = nickname;
    }

    public void setId(String id) { 
		this.id = id; 
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
    
	public String getId() { 
		return id; 
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
    
    public boolean validate() {
    	if(password.equals("aaa")&&(id.equals("aaa")))
    		return true;
    	else
    		return false;
    }

    @Override public String toString() { 
		return "Member Id=" + id + " Password=" + password + " Email=" + email
				+ "Member Nickname =" + nickname; 
	}
}
