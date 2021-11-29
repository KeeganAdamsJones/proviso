package proviso.model;

/*
 Keegan Jones
 */

public class Customer 
{
	private long customer_id; 
	private String first_name;
	private String last_name;
	private String user_name;
	private String password;
	
	public Customer(long customer_id, String first_name, String last_name, String user_name, String password)
	{
		this.customer_id = customer_id; 
		this.first_name = first_name; 
		this.last_name = last_name;
		this.user_name = user_name;
		this.password = password;
	}
	
	public Customer(String first_name, String last_name, String user_name, String password)
	{
		this.first_name = first_name; 
		this.last_name = last_name;
		this.user_name = user_name;
		this.password = password;
	}
	
	
	// Getters and Setters
	public Customer() {}
	
	public void setCustomer_id(long customer_id) 
	{
		this.customer_id = customer_id; 
	}
	
	public long getCustomer_id()
	{
		return customer_id;
	}
	
	public void setFirst_name(String first_name) 
	{
		this.first_name = first_name;
	}
	
	public String getFirst_name()
	{
		return first_name;
	}
	
	public void setLast_name(String last_name)
	{
		this.last_name = last_name;
	}
	
	public String getLast_name()
	{
		return last_name;
	}
	
	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}
	
	public String getUser_name()
	{
		return user_name;
	}
	
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	public String getPassword()
	{
		return password;
	}
	
	// Override toString
	@Override
	public String toString()
	{
		return String.format("Customer{customer_id=%s, first_name=%s, last_name=%s, user_name=%s, password=%s}", customer_id, first_name, last_name, user_name, password);
	}
}