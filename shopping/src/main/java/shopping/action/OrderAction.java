package shopping.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.company.shopping.bean.Goods;
import com.company.shopping.bean.Order;
import com.company.shopping.bean.User;
import com.company.shopping.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private int gid;//��ҳ�洫�ݹ�����goods.id��Ϊ�˴�
	private int orderid;//��ҳ�洫�ݹ�����order.id��Ϊ�˴�
	private OrderService orderService;
	private List<?> orderList;
	private Order order = new Order();
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}



	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public List<?> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<?> orderList) {
		this.orderList = orderList;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}



	//������Ʒ����
	public String addOrder() {
		Order order = new Order();
		User user = new User();
		User sessionUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		user.setId(sessionUser.getId());
		Goods goods = new Goods();
		goods.setId(gid);
		order.setUser(user);
		order.setGoods(goods);
		order.setBuytime(new Date());
		//���ֵӦ���Ǵӹ��ﳵ��������
		order.setTotal(1);
		order.setStatus("δ����");
		
		orderService.addOrder(order);
		return SUCCESS;
	
	}
	//��̨��������չʾ
	public String orderList() {
		orderList=orderService.findAll();
		return SUCCESS ;
	}
	//�ı䷢��״̬
	public String orderState() {
		//System.out.println(orderid+"orderStateorderStateorderStateorderState");
		/*order.setId(orderid);
		System.out.println(order.getId()+"order.getId()+order.getId()+order.getId()+");*/
		orderService.changeState(orderid);
		
		return SUCCESS ;
	}
	
	/*
	 * �û������鿴
	 * Ҫ�����û�ʶ��
	 */
	public String showOrder() {
		User sessionUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(null==sessionUser){
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("���ȵ�¼", "���ȵ�¼");
			return ERROR;
		}
		int uid = sessionUser.getId();
		orderList=orderService.findOrderById(uid);
		return SUCCESS ;
	}
	

}
