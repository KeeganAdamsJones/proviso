package proviso.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import proviso.model.Reservation;
import proviso.service.JdbcManager;
import proviso.service.dao.ReservationDao;

/*
Keegan Jones
*/


public class JdbcReservationDao implements ReservationDao {

	JdbcManager db; 
	
	public JdbcReservationDao() 
	{
		// constructor
		db = new JdbcManager(); 
	}
	
	
	@Override
	public void add(Reservation entity) // create
	{
		Connection conn = db.getConn(); 
		Reservation newReservation = entity; 
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement(); 
				
				String sql = String.format("INSERT INTO reservation(reservation_id, roomSize, customer_id, amenities, guests, loyaltyPoints) values('%s', %s, '%s', '%s', %s);", 
						newReservation.getreservation_id(), newReservation.getroomSize(), newReservation.getcustomer_id(), newReservation.amenities(), newReservation.getguests(), newReservation.getloyaltyPoints());
				
				System.out.println(sql);
				
				try 
				{
					s.executeUpdate(sql);
				}
				finally { s.close(); }
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we are unable to insert new reservation: " + newReservation.toString()); 
				System.out.println(ex.getMessage());
			}
		}
	}

	@Override
	public List<Reservation> list() 
	{
		Connection conn = db.getConn(); 
		ArrayList<Reservation> reservations = new ArrayList<Reservation>();
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement();
				
				String sql = "select reservation_id, roomSize, customer_id, amenities, guests, loyaltyPoints from reservation";
				
				System.out.println(sql);
				
				try 
				{
					ResultSet rs = s.executeQuery(sql);
					
					try 
					{
						while (rs.next()) 
						{
							Reservation reservation = new Reservation();
							reservation.setreservation_id(rs.getLong(1));
							reservation.setroomSize(rs.getString(2));
							reservation.setcustomer_id(rs.getString(3));
							reservation.setamenities(rs.getString(4));
							reservation.setguests(rs.getString(5));
							reservation.setloyaltyPoints(rs.getInt(6));
							reservations.add(reservation);
						}
					}
					finally { rs.close(); }
				}
				finally { s.close(); }
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we could not get reservations: " + ex.getMessage()); 
			}
			finally
			{
				db.closeConn(conn);
			}
		}
		
		return reservations;
	}

	@Override
	public Reservation find(Long key) 
	{
		Connection conn = db.getConn(); 
		
		Reservation reservation = null; 
		
		if (conn != null) 
		{
			try 
			{
				Statement s = conn.createStatement(); 
				
				String sql = "select reservation_id, roomSize, customer_id, amenities, guests, loyaltyPoints from reservation where reservation_id = " + key;
				
				System.out.println(sql);
				
				try 
				{
					ResultSet rs = s.executeQuery(sql);
					
					try 
					{
						if (rs.next()) 
						{
							reservation = new Reservation(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)); 
						}
					}
					finally { rs.close(); }
				}
				finally { s.close(); }
				
			}
			catch (SQLException ex)
			{
				System.out.println("Sorry, we could not get reservation: " + ex.getMessage());
			}
		}
		return reservation;
	}

	@Override
	public void update(Reservation entity) {
		Connection conn = db.getConn(); 
		
		Reservation updatedReservation = entity; 
		
		if (conn != null) 
		{
			try {
				Statement s = conn.createStatement(); 
				
				String sql = String.format("UPDATE reservation SET reservation_id = '%s', roomSize = %s, customer_id = '%s', amenities = '%s', guests = %s WHERE loyaltyPoints = %s;", 
						updatedReservation.getreservation_id(), updatedReservation.getroomSize(), updatedReservation.getcustomer_id(), updatedReservation.getamenities(), updatedReservation.getguests(), updatedReservation.getloyaltyPoints());
				
				System.out.println(sql);
				
				try {
					s.executeUpdate(sql);
				} finally { s.close(); }
			}
			catch (SQLException ex) {
				System.out.println("Sorry we could not update reservation: " + updatedReservation.toString());
				System.out.println(ex.getMessage());
			}
		}
	}

	@Override
	public void remove(Long key) {
		Connection conn = db.getConn(); 
		
		if (conn != null) 
		{	
			try 
			{	
				Statement s = conn.createStatement(); 
				
				String sql = String.format("DELETE FROM reservation WHERE reservation_id = %s", key);
				
				System.out.println(sql);
				
				try 
				{
					s.executeUpdate(sql);
				} 
				finally { s.close(); }
			} 
			catch (SQLException ex) 
			{
				System.out.println("Sorry we could not delete reservation: " + key);
				System.out.println(ex.getMessage());
			}
		}
	}
}