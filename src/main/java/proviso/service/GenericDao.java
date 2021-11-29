package proviso.service;

import java.util.List;

/* 
Keegan Jones

This is an interface file with 4 operations (CRUD, create, read, updatd, delete):
add(E entity), List<E> list(), E find(K key), update(E entity), and remove(K key). 
For the interface's signature, use Generics. For example, “GenericDao<E, K>”. 
This will allow us to extend this interface by supplying our own entities. 
For example, “ArtistDao extends GenericDao<Artist, Long> {}”
*/


public interface GenericDao<E, K> 
{
	long add (E entity); // create 
	
	List<E> list(); // read 
	
	E find(K key); // read 
	
	void update (E entity); // update
	
	void remove(K key); // delete 
}