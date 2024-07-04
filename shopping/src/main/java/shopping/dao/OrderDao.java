package shopping.dao;

import java.util.List;

import com.company.shopping.bean.Order;

public interface OrderDao {

	void insert(Order order);

	List<?> selectAll();

	void updateOrder(int id);

	List<?> selectOrderById(String string, int uid);

}
