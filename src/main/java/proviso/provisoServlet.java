package proviso;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import proviso.model.customer;
import proviso.model.reservation;
import proviso.service.impl.JdbccCustomerDao;
import proviso.service.impl.JdbcReservationDao;
*/


/*
 Keegan Jones
 
  Servlet implementation class provisoServlet
*/

//*** TO DO should I change the url pattern???
@WebServlet(name = "ProvisoServlet", urlPatterns = { "/store/*" })

public class provisoServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public provisoServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		String base = "/jsp/"; // Set the base folder name to jsp.
		String url = base + "index.jsp"; // set the default url to /jsp/index.jsp.
		String action = request.getParameter("action"); // get the parameter action value.

		System.out.println("Action value from the doPost method: " + action);
		System.out.println("URL value from the doPost method: " + url);

		if (action != null) 
		{
			switch (action) 
			{
				case "showHome":
					url = base;
					break;
				case "showContactUs":
					url = base + "Contact.jsp";
					break;
				case "showAboutUs":
					url = base + "About.jsp";
					break;
				case "showBooking":
					url = base + "reservations/new.jsp";
					break;
				case "showReservations":
					url = base + "reservations/details.jsp";
					break;
				
				case "newReservation":
					url = base + "reservation/new.jsp";
					break;
					/*
				case "artistDetails":
					url = base + "artists/Details.jsp";
					break;
				case "updateArtist":
					updateArtist(request, response);
					url = base + "artists/List.jsp";
					break;
				case "deleteArtist": 
					deleteArtist(request, response);
					url = base + "artists/List.jsp";
					break;
				case "createArtist":
					createArtist(request, response);
					url = base + "artists/List.jsp";
					break;
				case "newAlbum":
					url = base + "albums/New.jsp";
					break;
				case "albumDetails":
					url = base + "albums/Details.jsp";
					break;
				*/
				case "confirmReservation":
					// This is coming from /reservations/new.jsp
					// We want to forward this request to the /confirm.jsp
					
					url = base + "reservations/confirm.jsp";
					break;
				case "createReservation":
					// This is coming from the /reservations/confirm.jsp
					// Take the request data and put it in the database
					createReservation(request, response);
					url = base;
					break;
				/*
				case "updateAlbum":
					updateAlbum(request, response);
					url = base + "index.jsp";
					break;
				case "showAlbums":
					url = base + "index.jsp";
					break;
				case "deleteAlbum":
					deleteAlbum(request, response);
					url = base + "index.jsp";
					break;
					*/
			}
		}

		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);

		requestDispatcher.forward(request, response);
	}
	
	private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String first_name = request.getParameter("firstName");
		String last_name = request.getParameter("lastName");
		String user_name = request.getParameter("userName");
		String password = request.getParameter("password");
		String customer_id = request.getParameter("customerId"); 
/*		
		Customer customerToUpdate = new Customer(); 
		customerToUpdate.setcustomer_id(Long.parseLong(customer_id));
		customerToUpdate.setfirst_name(first_name);
		customerToUpdate.setlast_name(last_name);
		customerToUpdate.setuser_name(user_name);
		customerToUpdate.setpassword(password);
		
		JdbcCustomerDao customerDao = new JdbcCustomerDao(); 
		customerDao.update(customerToUpdate);
		
		System.out.println("Customer Id: " + customer_id + "; First name: " + first_name + "; Last name: " + last_name + "; User Name: " + user_name + "; Password: " + password);
		System.out.println("Updated customer: " + customer_id);
	*/
	}
	
	
/*
	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String customer_id = request.getParameter("customer_id");
		
		JdbcCustomerDao customerDao = new JdbcCustomerDao();
		customerDao.remove(Long.parseLong(customer_id));
		
		System.out.println("Removed customer: " + customer_id);

	}
	
	private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
	
		JdbcCustomerDao artistDao = new JdbcCustomerDao(); 
		customerDao.add(new Customer(first_name, last_name, user_name, password));
	
		System.out.println("Added customer: {First Name: '" + first_name + "'; Last Name: '" + last_name + "'; User Name: '" + user_name + "'; Password: '" + password + "'}");
	}
	
	*/
	private void createReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String reservation_id = request.getParameter("reservation");
		String roomSize = request.getParameter("room size");
		String amenities = request.getParameter("amenities");
		String guests = request.getParameter("guests");
		String loyaltyPoints = request.getParameter("points");
		String customer_id = request.getParameter("customer");
	/*
		
		Reservation newReservation = new Reservation(); 
		newReservation.setreservation_id(reservation_id);
		newReservation.setroomSize(roomSize);
		newReservation.setamenities(amenities);
		newReservation.setguests(guests);
		newReservation.setloyaltyPoints(loyaltyPoints);
		newReservation.setcustomer_id(customer_id);
		
		JdbcReservationDao albumDao = new JdbcReservationDao(); 
		albumDao.add(newReservation);
	
		System.out.println(newReservation.toString());
		System.out.println(String.format("Reservation{roomSize=%s, amenities=%s, guests=%s, loyaltyPoints=%s, customer_id=%s}", roomSize, amenities, guests, loyaltyPoints, customer_id));
	*/
	}
	
	private void updateReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String reservation_id = request.getParameter("reservation_id");
		String roomSize = request.getParameter("roomSize");
		String amenities = request.getParameter("amenities");
		String guests = request.getParameter("guests");
		String loyaltyPoints = request.getParameter("loyaltyPoints");
		String customer_id = request.getParameter("customer");
		
		/*Reservation updatedReservation = new Reservation();
		updatedReservation.setreservation_id(reservation_id);
		updatedReservation.setroomSize(roomSize);
		updatedReservation.setamenities(amenities));
		updatedReservation.setguests(guests);
		updatedReservation.setloyaltyPoints(loyaltyPoints);
		updatedReservation.setcustomer_id(customer_id);
		
		//System.out.println(loyaltyPoints);
		
		JdbcReservationDao reservationDao = new JdbcReservationDao(); 
		reservationDao.update(updatedReservation);
		
		System.out.println(updatedReservation.toString());
*/
	}
	
	/*
	private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String reservation_id = request.getParameter("reservation_id");
	
		JdbcReservationDao albumDao = new JdbcReservationDao(); 
		reservationDao.remove(reservation_id);
				
		System.out.println("Canceled reservation: " + reservation_id);
	
	}*/
}
