package proviso.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import proviso.model.Customer;
import proviso.service.impl.JdbcManager;

/*
 Keegan Jones
 */


JdbcManager db;  
	
	public JdbcCustomerDao() 
	{
		// constructor
		db = new JdbcManager();
	}
	
	@Override
	public void add(Customer entity) 
	{
		Connection conn = db.getConn(); 
		Customer newCustomer = entity;
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement(); 
				String sql = "INSERT INTO customer(customer_id, first_name, last_name, user_name, password) VALUES('" + newCustomer.getcustomer_id() + "', '" + newCustomer.getfirst_name() + "', '" + newCustomer.getlast_name() + "', '" + newCustomer.getuser_name() + "', '" + newCustomer.getpassword()");
				
				System.out.println(sql);
				
				try
				{
					s.executeUpdate(sql);
				}
				finally { s.close(); }
			}
			catch(SQLException ex)
			{
				System.out.println("Sorry, we are unable to insert new customer: {First Name = " + newCustomer.getfirst_name() + ";Last Name = " + newCustomer.getlast_name() + "}"); 
				System.out.println(ex.getMessage());
			}
		}
	}

	@Override
	public List<Customer> list() {
		Connection conn = db.getConn();
		ArrayList<Customer> customers = new ArrayList<Artist>();
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement();
				String sql = "select customer_id, first_name, last_name, user_name, password from customer";
				
				try 
				{
					ResultSet rs = s.executeQuery(sql);
					
					try 
					{
						while (rs.next()) 
						{
							Customer customer = new Customer();
							customer.setcustomer_id(rs.getLong(1));
							customer.setfirst_name(rs.getString(2));
							customer.setlast_name(rs.getString(3));
							customer.setuser_name(rs.getString(4));
							customer.setpassword(rs.getString(5));
							customers.add(customer);
						}
					}
					finally { rs.close(); }
				}
				finally { s.close(); }
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we could not get customers: " + ex.getMessage());
			}
			finally 
			{
				db.closeConn(conn);
			}
		}
		
		return customers;
	}

	@Override
	public Customer find(Long key) {
		Connection conn = db.getConn(); 
		
		Customer customer = null;
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement(); 
				String sql = "select customer_id, first_name, last_name, user_name, password from customer where customer_id =" + key;
				
				try 
				{
					ResultSet rs = s.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							customer = new Customer(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
						}
					}
					finally { rs.close();}
				}
				finally { s.close(); }				
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we could not get customer: " + ex.getMessage());
			}
		}
		
		return customer;
	}

	@Override
	public void update(Customer entity) 
	{
		Connection conn = db.getConn();
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement();
				String sql = "UPDATE customer SET first_name = '" + entity.getfirst_name() + "', last_name = '" + entity.getlast_name() + "' WHERE customer_id = " + entity.getcustomer_id();
				System.out.println(sql);
				
				try 
				{
					s.executeUpdate(sql);
				}
				finally { s.close(); }
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we could not update customer: " + ex.getMessage());
			}
		}
		
		
	}

	@Override
	public void remove(Long key) 
	{
		Connection conn = db.getConn(); 
		
		if (conn != null) 
		{
			try
			{
				Statement s = conn.createStatement(); 
				String sql = "DELETE FROM customer WHERE customer_id = " + key;
				System.out.println(sql);
				
				try 
				{
					s.executeUpdate(sql);
				}
				finally { s.close(); }
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we could not delete customer: " + ex.getMessage());
			}
		}
	}
}