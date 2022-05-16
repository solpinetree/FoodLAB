package dto;

public class MemberBean implements java.io.Serializable {

    private int id;
    private String password;
    private String email;
    private String username;
    private boolean userEmailChecked;
    public MemberBean() { 
    	this(1,"", "","",false); 
	}

    public MemberBean(int id, String password, String email, String username,boolean userEmailChecked) {
    	this.id = id;
        this.password = password;
        this.email = email;
        this.username = username;
        this.userEmailChecked = userEmailChecked;
    }
    
    public void setId(int id) { 
		this.id = id; 
	}

    
	public void setEmail(String email) { 
		this.email = email; 
	}
    
	public void setPassword(String password) { 
		this.password = password; 
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setuserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	
	public int getId() { 
		return id; 
	}
    
	
    public String getPassword() { 
		return password; 
	}

    public String getEmail() { 
		return email; 
	}
    
    public String getusername() { 
		return username; 
	}
    
    public boolean getuserEmailChecked() {
    	return userEmailChecked;
    }

    public void print() { 
		System.out.println(this); 
	}
    
  

    @Override public String toString() { 
		return "id="+id+"Password=" + password + " Email=" + email
				+ "Member username =" + username; 
	}
}
