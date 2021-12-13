package proviso.service.dao;

import proviso.model.Customer;
import proviso.service.GenericDao;

/*
 Keegan Jones
 */

public interface CustomerDao extends GenericDao<Customer, Long> {

	public void addLoyaltyPoints(String userName, int numberPoints);

}