package shopping.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.company.shopping.bean.Goods;
import com.company.shopping.dao.GoodsDAO;

public class GoodsDAOImpl extends HibernateDaoSupport implements GoodsDAO {

	public List<?> findAll() {		
		List<?> list = this.getHibernateTemplate().find("from Goods");
		
		return list;
	}

	public void save(Goods goods) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(goods);
	}

	public List<?> findByProperty(String propertyName, Object value) {
		
		String queryString = "from Goods as model where model."	+ propertyName + "= ? order by model.id desc";
		return getHibernateTemplate().find(queryString, value);
	}
	
	public List<?> findByPropertyName(String propertyName, Object value) {
		/*goodstype.typename*/
		String queryString = "from Goods o where o."+propertyName+" like ?";
		/*String queryString = "from Goods as model where model."	+ propertyName + "='%'+?+'%' order by model.id desc";
		*/
		return getHibernateTemplate().find(queryString, "%"+value+"%");
		
	}
	
	
	public int getTotalPage(int pageSize){
		int rowTotal = getHibernateTemplate().find("from Goods").size();
		int total = rowTotal / pageSize;
		if(rowTotal%pageSize>0){
			total++;
		}
		
		return total ;
	}
	
	public List<?> getPage(int currentPage){
//		HibernateTemplate template = this.getHibernateTemplate();
//		template.setMaxResults(10);
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from Goods");
		query.setMaxResults(10);
		query.setFirstResult((currentPage-1)*10);
		return query.list();
	}

	public void updateGoodsById(Goods goods, Integer productid) {
		// TODO Auto-generated method stub
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("update Goods g set g.goodsname =?,g.goodstype=?,g.count=?,g.price=?,g.goodspic=?,g.goodsdesc=? where g.id = ?");
		
		query.setParameter(0, goods.getGoodsname());
		query.setParameter(1, goods.getGoodstype());
		query.setParameter(2, goods.getCount());
		query.setParameter(3, goods.getPrice());
		query.setParameter(4, goods.getGoodspic());
		query.setParameter(5, goods.getGoodsdesc());
		query.setParameter(6, productid);
		
		query.executeUpdate();
		
		
		session.getTransaction().commit();
	}

	public void deleteGoodsById(Integer productid) {
		// TODO Auto-generated method stub
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		session.beginTransaction();
		session.delete(session.get(Goods.class,productid));
		session.getTransaction().commit();
	}

}
