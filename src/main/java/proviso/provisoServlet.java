package proviso;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proviso.model.Reservation;
import proviso.model.Customer;
import proviso.model.Reservation;
import proviso.service.impl.JdbcCustomerDao;
import proviso.service.impl.JdbcReservationDao;
import proviso.service.dao.CustomerDao;


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
		System.out.println("Requested URL: " + request.getRequestURL());

		if (action != null) 
		{
			switch (action) 
			{
				case "showHome":
					url = base;
					break;
				case "showContactUs":
					url = base + "contact.jsp";
					break;
				case "showAboutUs":
					url = base + "about.jsp";
					break;
				case "showBooking":
					url = base + "reservations/new.jsp";
					break;
				case "showReservations":
					url = base + "reservations/details.jsp";
					break;
				case "searchReservation":
					url = base + "reservations/showReservation.jsp";
					break;
				case "showNewReservation":
					url = base + "reservations/new.jsp";
					break;
				case "showLoyaltyPoints":
					url = base + "loyaltypoints.jsp";
					break;
				case "showLoginPage":
					url = base + "login/login.jsp";
					break;
				case "showRegistrationPage":
					url = base + "login/registration.jsp";
					break;
				case "logoutUser":
					url = base + "login/logout.jsp";
					break;
				//TODO do I need this for later?	
				//case "customerDetails":
				//	url = base + "customers/Details.jsp";
				//	break;
			
				//case "updateCustomer":
				//	updateCustomer(request, response);
				//	url = base + "customers/List.jsp";
				//	break;
		
				//case "deleteCustomer": 
				//	deleteCustomer(request, response);
				//	url = base + "customers/List.jsp";
				//	break;
				case "createCustomer":
					createCustomer(request, response);
					url = base + "customers/List.jsp";
					break;			
				case "confirmReservation":
					// This is coming from /reservations/new.jsp
					// We want to forward this request to the /confirm.jsp
					url = base + "reservations/confirm.jsp";
					break;
				case "createReservation":
					// This is coming from the /reservations/confirm.jsp
					// Forward this to the /complete.jsp
					url = base + "reservations/complete.jsp";
					break;
				case "updateReservation":
					updateReservation(request, response);
					url = base + "index.jsp";
					break;
				case "showReservation":
					url = base + "index.jsp";
					break;
				case "deleteReservation":
					deleteReservation(request, response);
					url = base + "index.jsp";
					break;
				
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
		
		Customer customerToUpdate = new Customer(); 
		customerToUpdate.setCustomer_id(Long.parseLong(customer_id));
		customerToUpdate.setFirst_name(first_name);
		customerToUpdate.setLast_name(last_name);
		customerToUpdate.setUser_name(user_name);
		customerToUpdate.setPassword(password);
		
		JdbcCustomerDao customerDao = new JdbcCustomerDao(); 
		customerDao.update(customerToUpdate);
		
		System.out.println("Customer Id: " + customer_id + "; First name: " + first_name + "; Last name: " + last_name + "; User Name: " + user_name + "; Password: " + password);
		System.out.println("Updated customer: " + customer_id);

	}
	
	

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
	
		JdbcCustomerDao customerDao = new JdbcCustomerDao();
	
		customerDao.add(new Customer(first_name, last_name, user_name, password));
	
		System.out.println("Added customer: {First Name: '" + first_name + "'; Last Name: '" + last_name + "'; User Name: '" + user_name + "'; Password: '" + password + "'}");
	}
	
	
	
	private void updateReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Long reservation_id = Long.parseLong(request.getParameter("reservation_id"));
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");		
		String roomSize = request.getParameter("roomSize");
		String amenities = request.getParameter("amenities");
		String guests = request.getParameter("guests");
		Integer loyaltyPoints = Integer.parseInt(request.getParameter("loyaltyPoints"));
		String customer_id = request.getParameter("customer");
		
		Reservation updatedReservation = new Reservation();
		updatedReservation.setCheckIn(checkIn);
		updatedReservation.setCheckOut(checkOut);
		updatedReservation.setReservation_id(reservation_id);
		updatedReservation.setRoomSize(roomSize);
		updatedReservation.setAmenities(amenities);
		updatedReservation.setGuests(guests);
		updatedReservation.setLoyaltyPoints(loyaltyPoints);
		updatedReservation.setCustomer_id(customer_id);
		
		System.out.println(loyaltyPoints);
		
		JdbcReservationDao reservationDao = new JdbcReservationDao(); 
		reservationDao.update(updatedReservation);
		
		System.out.println(updatedReservation.toString());

	}
	

	private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Long reservation_id = Long.parseLong(request.getParameter("reservation_id"));
	
		JdbcReservationDao reservationDao = new JdbcReservationDao(); 
		reservationDao.remove(reservation_id);
				
		System.out.println("Canceled reservation: " + reservation_id);
	
	}
}
