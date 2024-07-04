package shopping.dao;

import java.util.List;

import com.company.shopping.bean.Goods;

public interface GoodsDAO {
	List<?> findAll();

	void save(Goods goods);

	List<?> findByProperty(String string, Object o);
	
	int getTotalPage(int pageSize);
	List<?> getPage(int currentPage);

	void updateGoodsById(Goods goods, Integer productid);

	void deleteGoodsById(Integer productid);

	List<?> findByPropertyName(String string, Object o);
}
