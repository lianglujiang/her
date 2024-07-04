package shopping.service;

import java.util.List;

import com.company.shopping.bean.Order;

public interface OrderService {

	 void addOrder(Order order) ;

	List<?> findAll();

	void changeState(int id);

	List<?> findOrderById(int uid);

	

}
