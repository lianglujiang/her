package shopping.service.impl;

import java.util.List;

import com.company.shopping.bean.Order;
import com.company.shopping.dao.OrderDao;
import com.company.shopping.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void addOrder(Order order) {
		// TODO Auto-generated method stub
		orderDao.insert(order);		
	}

	public List<?> findAll() {
		// TODO Auto-generated method stub
	/*	List<?> list =orderDao.selectAll();*/
	/*	Order l;
		for(Object nl:list){
			 l =(Order) nl;
			if(l.getStatus()=="1"){
				l.setStatus("�ѷ���");
			}else{
				l.setStatus("δ����");
			}
		}*/
		return orderDao.selectAll();
	}

	public void changeState(int id) {
		// TODO Auto-generated method stub
		orderDao.updateOrder(id);
	}

	public List<?> findOrderById(int uid) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderById("user.id",uid);
	}
	

}
