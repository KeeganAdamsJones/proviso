package proviso.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import proviso.model.Customer;
//import proviso.service.impl.JdbcManager;
import proviso.service.JdbcManager;
import proviso.service.dao.CustomerDao;

/*
 Keegan Jones
 */

// --------------------------
// | CLASS                  |
// |   - member variables   |
// |   - member functions   |
// --------------------------


public class JdbcCustomerDao implements CustomerDao
{
    // declare class member variable
	JdbcManager db;  
	
    //constructor
	public JdbcCustomerDao()
	{
		// creating new db manager instance
		db = new JdbcManager();
	}
	
	@Override
	public long add(Customer entity) 
	{
		Connection conn = db.getConn(); 
		Customer newCustomer = entity;
		
		if (conn != null) 
		{
			try 
			{
				// TODO: Password needs hashed
				
				Statement s = conn.createStatement(); 
				String sql = "INSERT INTO customer(first_name, last_name, user_name, password) VALUES('" + 
						newCustomer.getFirst_name() + "', '" + 
						newCustomer.getLast_name() + "', '" + 
						newCustomer.getUser_name() + "', '" + 
						newCustomer.getPassword()+ "');" +
						"SELECT MAX(customer_id) FROM customer;";
				
				System.out.println(sql);
				
				long customer_id = 0;
				try
				{
					ResultSet output = s.executeQuery(sql);
					customer_id = output.getLong(0);
				}
				finally { s.close(); }
				
				// TODO: Get the craeted customer_id from the insert
				return customer_id;
			}
			catch(SQLException ex)
			{
				System.out.println("Sorry, we are unable to insert new customer: {First Name = " + 
						newCustomer.getFirst_name() + ";Last Name = " + newCustomer.getLast_name() + "}"); 
				System.out.println(ex.getMessage());
			}
		}
		return 0;
	}

	@Override
	public List<Customer> list() {
		Connection conn = db.getConn();
		ArrayList<Customer> customers = new ArrayList<Customer>();
		
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
							customer.setCustomer_id(rs.getLong(1));
							customer.setFirst_name(rs.getString(2));
							customer.setLast_name(rs.getString(3));
							customer.setUser_name(rs.getString(4));
							customer.setPassword(rs.getString(5));
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
				String sql = "UPDATE customer SET first_name = '" + entity.getFirst_name() + 
						"', last_name = '" + entity.getLast_name() + 
						"' WHERE customer_id = " + entity.getCustomer_id();
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