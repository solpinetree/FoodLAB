package dto;

public class MemberBean implements java.io.Serializable {

    private int id;
    private String password;
    private String email;
    private String username;
    
    public MemberBean() { 
    	this(1,"", "",""); 
	}

    public MemberBean(int id, String password, String email, String username) {
    	this.id = id;
        this.password = password;
        this.email = email;
        this.username = username;
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

    public void print() { 
		System.out.println(this); 
	}
    
  

    @Override public String toString() { 
		return "id="+id+"Password=" + password + " Email=" + email
				+ "Member username =" + username; 
	}
}
