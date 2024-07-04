package shopping.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.company.shopping.bean.Order;
import com.company.shopping.dao.OrderDao;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	public void insert(Order order) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(order);
		//System.out.println("�ѽ�ִ���˲������");
	}

	public List<?> selectAll() {
		List<?> list = getHibernateTemplate().find("from Order");
		return list;
	}

	public void updateOrder(int id) {
		// TODO Auto-generated method stub
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("update Order o set o.status ='�ѷ���' where o.id ="+id);
	
		query.executeUpdate();
		
		
		session.getTransaction().commit();
	}

	public List<?> selectOrderById(String field,int uid) {
		String hql = "from Order as o where o."+field+"=?";
		return getHibernateTemplate().find(hql,uid);
	}

	

}
